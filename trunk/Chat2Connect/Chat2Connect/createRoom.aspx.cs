using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;
namespace Chat2Connect
{
    public partial class createRoom : System.Web.UI.Page
    {
        #region Properties
        public bool IsEdit 
        {
            get
            {
                bool result = false;
                if (Request.QueryString["isEdit"] != null)
                {
                    bool.TryParse(Request.QueryString["isEdit"], out result);
                    
                }
                return result;
            }            
        }

        public int CurrentRoom
        {
            get
            {
                if (Session["CurrentRoom"] != null)
                {
                    return Convert.ToInt32(Session["CurrentRoom"].ToString());
                }
                else
                    return 0;
            }
            set
            {
                Session["CurrentRoom"] = value;
            }
        }

        public DataTable AdminsTable 
        {
            get
            {
                if (Session["AdminsTable"] != null)
                {
                    return (DataTable)Session["AdminsTable"];
                }
                else
                    return setupAdminTable();
            }
            set
            {
                Session["AdminsTable"] = value;
            }
        }

        #endregion 

        #region Events 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    Member member = new Member();
                    member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                    uiLabelCreator.Text = member.Name;
                    uiLabelCreatedDate.Text = GetLocalResourceObject("Now").ToString();
                    LoadDDLs();
                    setupAdminTable();
                    if (!IsEdit)
                    {
                        loadAdminTable();
                    }
                    else
                    { 

                    }

                }
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }


        protected void uiDropDownListCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubCats();
        }

        protected void uiLinkButtonSaveRoom_Click(object sender, EventArgs e)
        {
            // check member type 
            // check number of created rooms 
            if (Request.IsAuthenticated)
            {
                Member member = new Member();
                member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                Room room = new Room();
                if(!IsEdit)
                    room.AddNew();
                room.Name = uiTextBoxName.Text;
                if(!IsEdit)
                {   
                    room.CreatedDate = DateTime.Now;
                    room.CreatedBy = member.MemberID;
                }

                if (uiDropDownListCategory.SelectedIndex != -1)
                    room.CategoryID = Convert.ToInt32(uiDropDownListCategory.SelectedValue);
                if (uiDropDownListSubCategory.SelectedIndex != 0)
                    room.SubCategoryID = Convert.ToInt32(uiDropDownListSubCategory.SelectedValue);

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

                room.WelcomeText = uiTextBoxWelcome.Text;
                room.RoomPassword = uiTextBoxPassword.Text;
                room.RoomAdminPassword = uiTextBoxAdminPass.Text;
                room.RoomPasswordenabled = uiCheckBoxPasswordEnable.Checked;
                room.EnableCam = uiCheckBoxEnableCam.Checked;
                room.EnableOneMic = uiCheckBoxEnableOneMic.Checked;
                room.EnableTwoMic = uiCheckBoxEnableTwoMic.Checked;
                room.EnableThreeMic = uiCheckBoxEnableThreeMic.Checked;
                room.Save();

                 if (AdminsTable.Rows.Count > 0)
                 {
                     RoomMember roommember = new RoomMember();
                     roommember.GetAllAdminMembersByRoomID(room.RoomID);
                     roommember.DeleteAll();
                     roommember.Save();
                     for (int i = 0; i < AdminsTable.Rows.Count; i++)
                     {
                        roommember.AddNew();
                        roommember.RoomID = room.RoomID;
                        roommember.MemberID = Convert.ToInt32(AdminsTable.Rows[i]["MemberID"].ToString());
                        roommember.IsAdmin = true;
                        roommember.AdminTypeID = Convert.ToInt32(AdminsTable.Rows[i]["AdminTypeID"].ToString());
                     }
                     
                     roommember.Save();
                 }

            }
        }

        protected void uiLinkButton_Click(object sender, EventArgs e)
        {
            Member currentMember = new Member();
            currentMember.LoadByPrimaryKey(Convert.ToInt32(uiHiddenFieldAdminID.Value));
            AdminType currentType = new AdminType();
            currentType.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListAdminType.SelectedValue));

            for (int i = 0; i < AdminsTable.Rows.Count; i++)
            {
                if (Convert.ToInt32(AdminsTable.Rows[i]["MemberID"].ToString()) == currentMember.MemberID)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "viewalert", "viewAdminError();", true);
                    return;
                }
            }

            AdminsTable.Rows.Add(currentMember.MemberID, currentMember.Name, currentType.AdminTypeID, currentType.Name);
            AdminsTable.AcceptChanges();
            BindAdmins();
        }
        #endregion 

        #region methods

        private DataTable setupAdminTable()
        {
            DataTable adminstable = new DataTable();
            adminstable.Columns.Add("MemberID", typeof(int));
            adminstable.Columns.Add("AdminName", typeof(string));
            adminstable.Columns.Add("AdminTypeID", typeof(int));
            adminstable.Columns.Add("AdminTypeName", typeof(string));
            adminstable.AcceptChanges();
            AdminsTable = adminstable;
            return adminstable;
        }

        private void loadAdminTable()
        {
            RoomMember currentadmins = new RoomMember();
            if (IsEdit)
                currentadmins.GetAllAdminMembersByRoomID(CurrentRoom);
            for (int i = 0; i < currentadmins.RowCount; i++)
            {
                Member currentMember = new Member();
                currentMember.LoadByPrimaryKey(currentadmins.MemberID);
                AdminType currentType = new AdminType();
                currentType.LoadByPrimaryKey(currentadmins.AdminTypeID);

                AdminsTable.Rows.Add(currentadmins.MemberID, currentMember.Name, currentadmins.AdminTypeID, currentType.Name);
                currentadmins.MoveNext();
            }
        }
        private void LoadDDLs()
        {
            Category cats = new Category();
            cats.LoadAll();
            uiDropDownListCategory.DataSource = cats.DefaultView;
            uiDropDownListCategory.DataTextField = "Name";
            uiDropDownListCategory.DataValueField = "CategoryID";
            uiDropDownListCategory.DataBind();

            AdminType adminTypes = new AdminType();
            adminTypes.LoadAll();
            uiDropDownListAdminType.DataSource = adminTypes.DefaultView;
            uiDropDownListAdminType.DataTextField = "Name";
            uiDropDownListAdminType.DataValueField = "AdminTypeID";
            uiDropDownListAdminType.DataBind();

            BindSubCats();
        }

        private void BindSubCats()
        {
            SubCategory subcats = new SubCategory();
            if (uiDropDownListCategory.SelectedIndex != -1)
                subcats.GetSubCategoryByCategoryID(Convert.ToInt32(uiDropDownListCategory.SelectedValue));
            uiDropDownListSubCategory.DataSource = subcats.DefaultView;
            uiDropDownListSubCategory.DataTextField = "Name";
            uiDropDownListSubCategory.DataValueField = "SubCategoryID";
            uiDropDownListSubCategory.DataBind();
            uiDropDownListSubCategory.Items.Insert(0, new ListItem("إختر قسم فرعى. . . ."));
        }


        private void BindAdmins()
        {
            uiGridViewAdmins.DataSource = AdminsTable;
            uiGridViewAdmins.DataBind();
        }
        #endregion






    }
}