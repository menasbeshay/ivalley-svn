using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Web.Security;

namespace Chat2Connect.Admin
{
    public partial class VIPRoom : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_AddVIPRoom.ToString());
                return lstRoles;
            }
        }

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    if (!Helper.Admin.HasAnyOfRoles(PageRoles))
                        Response.Redirect("~/default.aspx");

                    if (Request.QueryString["status"] == "1")
                        uiPanelSuccess.Visible = true;
                    hdnCreatorID.Value = BLL.Member.CurrentMember.MemberID.ToString();
                    txtCreator.Text = BLL.Member.CurrentMember.Name;
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "sendmsg", "$(document).ready(function (){  $('#" + txtCreator.ClientID + "').tokenInput('add', { id: " + Helper.TypeConverter.ToString(BLL.Member.CurrentMemberID) + ", name: '" + Helper.TypeConverter.ToString(BLL.Member.CurrentMember.Name) + "' }); });", true);
                    LoadDDLs();

                    nameValidator.Visible = false;
                    BLL.RoomTypeSpecDuration bllMemberTypes = new RoomTypeSpecDuration();
                    bllMemberTypes.LoadByRoomTypeSpecID((int)Helper.Enums.MemberTypeSpec.VIP);
                    var lstDurations = bllMemberTypes.DefaultView.Table.AsEnumerable().Select(m => new
                    {
                        ID = m[BLL.MemberTypeSpecDuration.ColumnNames.ID],
                        Value = String.Format("{0} ({1})", m["DurationName"], m[BLL.MemberTypeSpecDuration.ColumnNames.Points])
                    }).ToList();
                    lstTypeDuration.DataSource = lstDurations;
                    lstTypeDuration.DataValueField = "ID";
                    lstTypeDuration.DataTextField = "Value";
                    lstTypeDuration.DataBind();

                    dvVIPRoom.Visible = true;
                }

            }
            else
            {
                Response.Redirect("VIPRoom.aspx");
            }
        }

        protected void uiDropDownListADD_Category_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubCats();
        }

       protected void uiLinkButtonSaveRoom_Click(object sender, EventArgs e)
        {
            // check member type 
            // check number of created rooms
            string querystring = "";
            if (Request.IsAuthenticated)
            {
                Member member = BLL.Member.CurrentMember;
                Room room = new Room();
                BLL.RoomTypeSpecDuration bllTypeSpecDuration = new RoomTypeSpecDuration();
                room.AddNew();
                room.Name = uiTextBoxADD_Name.Text;
                querystring = "c=true";

                int typeDuratoinID = Convert.ToInt32(lstTypeDuration.SelectedValue);
                bllTypeSpecDuration.LoadByPrimaryKey(typeDuratoinID);

                if (member.Credit_Point < bllTypeSpecDuration.Points)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . رصيدك الحالى لا يسمح لإتمام العملية.'); });", true);
                    return;
                }

                room.CreatedDate = DateTime.Now;
                room.CreatedBy = Convert.ToInt32(hdnCreatorID.Value);

                if (uiDropDownListADD_Category.SelectedIndex != -1)
                    room.CategoryID = Convert.ToInt32(uiDropDownListADD_Category.SelectedValue);
                if (uiDropDownListADD_SubCategory.SelectedIndex != 0)
                    room.SubCategoryID = Convert.ToInt32(uiDropDownListADD_SubCategory.SelectedValue);

                if (uiFileUploadRoomPic.HasFile)
                {
                    string path = "~/" + ConfigurationManager.AppSettings["roomspics"].ToString();
                    DirectoryInfo dir = new DirectoryInfo(Server.MapPath(path + "/" + Membership.GetUser().ProviderUserKey.ToString()));
                    if (!dir.Exists)
                        dir.Create();
                    path += "/" + Membership.GetUser().ProviderUserKey.ToString() + "/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + uiFileUploadRoomPic.FileName;
                    uiFileUploadRoomPic.SaveAs(Server.MapPath(path));
                    room.IconPath = path;
                }

                room.RoomPasswordenabled = false;
                room.EnableCam = true;
                room.EnableMic = true;
                room.RowStatusID = 1;
                room.Save();


                uiPanelSuccess.Visible = true;
                uiTextBoxADD_Name.Text = "";
                uiDropDownListADD_Category.SelectedIndex = 0;
                uiDropDownListADD_SubCategory.SelectedIndex = 0;
                
                // log 
                BLL.MemberLog log = new BLL.MemberLog();
                BLL.Member.CurrentMember.Credit_Point -= bllTypeSpecDuration.Points;
                BLL.Member.CurrentMember.Save();

                //upgrademember.MemberTypeID = type;
                room.RoomType.RoomTypeSpecDurationID = bllTypeSpecDuration.ID;
                room.RoomType.CreateBy = BLL.Member.CurrentMember.MemberID;
                room.RoomType.StartDate = DateTime.Now;
                room.RoomType.EndDate = DateTime.Now.AddMonths(bllTypeSpecDuration.TypeDuration.MonthesNumber);
                room.RoomType.Save();

                log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.CreateRoom() { RoomID = room.RoomID, RoomName = room.Name, RoomTypeName = bllTypeSpecDuration.RoomTypeSpec.Name, Points = bllTypeSpecDuration.Points }, null, room.RoomID);
                
                Response.Redirect("VIPRoom.aspx?status=1");
            }
        }

        #endregion

        #region methods

        private void LoadDDLs()
        {
            Category cats = new Category();
            cats.LoadAll();
            uiDropDownListADD_Category.DataSource = cats.DefaultView;
            uiDropDownListADD_Category.DataTextField = "Name";
            uiDropDownListADD_Category.DataValueField = "CategoryID";
            uiDropDownListADD_Category.DataBind();

            BindSubCats();

        }

        private void BindSubCats()
        {
            SubCategory subcats = new SubCategory();
            if (uiDropDownListADD_Category.SelectedIndex != -1)
                subcats.GetSubCategoryByCategoryID(Convert.ToInt32(uiDropDownListADD_Category.SelectedValue));
            uiDropDownListADD_SubCategory.DataSource = subcats.DefaultView;
            uiDropDownListADD_SubCategory.DataTextField = "Name";
            uiDropDownListADD_SubCategory.DataValueField = "SubCategoryID";
            uiDropDownListADD_SubCategory.DataBind();
            uiDropDownListADD_SubCategory.Items.Insert(0, new ListItem("إختر قسم فرعى. . . ."));
        }


        #endregion
    }
}