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
                    loadAdminTable();
                    if (!IsEdit)
                    {
                        uiPanelCreateRoom.Visible = true;
                        uiPanelEditRoom.Visible = false;
                    }
                    else
                    {
                        uiPanelCreateRoom.Visible = false;
                        uiPanelEditRoom.Visible = true;
                        LoadRoomInfo();
                    }
                }
                
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }

        private void LoadRoomInfo()
        {
            Room room = new Room();
            room.LoadByPrimaryKey(CurrentRoom);

            uiLabelCreatedDate_Edit.Text = room.CreatedDate.ToString("dd/MM/yyyy");
            uiLabelOwnerName.Text = Member.CurrentMember.Name;
            uiLabelRoomName.Text = room.Name;
            if (!room.IsColumnNull("CategoryID"))
            {
                uiDropDownListEdit_Category.SelectedValue = room.CategoryID.ToString();
                BindSubCatsForEdit();
            }
            if (!room.IsColumnNull("SubCategoryID"))
                uiDropDownListEditSubCat.SelectedValue = room.SubCategoryID.ToString();

            BindAdmins();
        }


        protected void uiDropDownListADD_Category_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubCats();
        }

        protected void uiDropDownListEdit_Category_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubCatsForEdit();
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
                if (!IsEdit)
                    room.AddNew();
                else
                    room.LoadByPrimaryKey(CurrentRoom);
                room.Name = uiTextBoxADD_Name.Text;
                if (!IsEdit)
                {
                    room.CreatedDate = DateTime.Now;
                    room.CreatedBy = member.MemberID;
                }

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

                room.WelcomeText = uiTextBoxADD_Welcome.Text;
                room.RoomPassword = uiTextBoxPassword.Text;
                room.RoomAdminPassword = uiTextBoxAdminPass.Text;
                room.RoomPasswordenabled = uiCheckBoxPasswordEnable.Checked;
                room.EnableCam = uiCheckBoxEnableCam.Checked;
                room.EnableOneMic = uiCheckBoxEnableOneMic.Checked;
                room.EnableTwoMic = uiCheckBoxEnableTwoMic.Checked;
                room.EnableThreeMic = uiCheckBoxEnableThreeMic.Checked;
                room.RowStatusID = 1;
                room.Save();

                // log 
                BLL.MemberLog log = new BLL.MemberLog();
                log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.CreateRoom() { RoomID = room.RoomID, RoomName = room.Name }, null, room.RoomID);

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
                        roommember.RoomMemberLevelID = Convert.ToInt32(AdminsTable.Rows[i]["AdminTypeID"].ToString());
                    }

                    roommember.Save();
                }

            }
        }

        protected void uiLinkButton_Click(object sender, EventArgs e)
        {
            Member currentMember = new Member();
            currentMember.LoadByPrimaryKey(Convert.ToInt32(uiHiddenFieldAdminID.Value));
            Helper.Enums.RoomMemberLevel currentType = Helper.EnumUtil.ParseEnum<Helper.Enums.RoomMemberLevel>(Convert.ToInt32(uiDropDownListAdminType.SelectedValue));

            for (int i = 0; i < AdminsTable.Rows.Count; i++)
            {
                if (Convert.ToInt32(AdminsTable.Rows[i]["MemberID"].ToString()) == currentMember.MemberID)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "viewalert", "viewAdminError();", true);
                    return;
                }
            }

            AdminsTable.Rows.Add(currentMember.MemberID, currentMember.Name, (int)currentType, Helper.StringEnum.GetStringValue(currentType));
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
            AdminsTable.Clear();
            RoomMember currentadmins = new RoomMember();
            if (IsEdit)
                currentadmins.GetAllAdminMembersByRoomID(CurrentRoom);
            Helper.Enums.RoomMemberLevel adminType;
            for (int i = 0; i < currentadmins.RowCount; i++)
            {
                adminType = Helper.EnumUtil.ParseEnum<Helper.Enums.RoomMemberLevel>(currentadmins.RoomMemberLevelID);
                AdminsTable.Rows.Add(currentadmins.MemberID, currentadmins.GetColumn("MemberName"), currentadmins.RoomMemberLevelID, Helper.StringEnum.GetStringValue(adminType));
                currentadmins.MoveNext();
            }
        }
        private void LoadDDLs()
        {
            Category cats = new Category();
            cats.LoadAll();
            uiDropDownListADD_Category.DataSource = cats.DefaultView;
            uiDropDownListADD_Category.DataTextField = "Name";
            uiDropDownListADD_Category.DataValueField = "CategoryID";
            uiDropDownListADD_Category.DataBind();

            uiDropDownListEdit_Category.DataSource = cats.DefaultView;
            uiDropDownListEdit_Category.DataTextField = "Name";
            uiDropDownListEdit_Category.DataValueField = "CategoryID";
            uiDropDownListEdit_Category.DataBind();

            var adminTypes = Helper.EnumUtil.GetValues<Helper.Enums.RoomMemberLevel>().Where(l => (int)l > 1).Select(r => new
            {
                AdminTypeID = (int)r,
                Name = Helper.StringEnum.GetStringValue(r)
            }).ToList();
            uiDropDownListAdminType.DataSource = adminTypes;
            uiDropDownListAdminType.DataTextField = "Name";
            uiDropDownListAdminType.DataValueField = "AdminTypeID";
            uiDropDownListAdminType.DataBind();

            BindSubCats();

            Room myrooms = new Room();
            myrooms.GetRoomsByCreatorID(Member.CurrentMemberID);
            uiDropDownListMyRooms.DataSource = myrooms.DefaultView;
            uiDropDownListMyRooms.DataTextField = "Name";
            uiDropDownListMyRooms.DataValueField = "RoomID";
            uiDropDownListMyRooms.DataBind();
            uiDropDownListMyRooms.Items.Insert(0, new ListItem("إختر غرفة. . . ."));
            if (CurrentRoom != 0)
                uiDropDownListMyRooms.SelectedValue = CurrentRoom.ToString();
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


        private void BindSubCatsForEdit()
        {
            SubCategory subcats = new SubCategory();
            if (uiDropDownListEdit_Category.SelectedIndex != -1)
                subcats.GetSubCategoryByCategoryID(Convert.ToInt32(uiDropDownListEdit_Category.SelectedValue));
            uiDropDownListEditSubCat.DataSource = subcats.DefaultView;
            uiDropDownListEditSubCat.DataTextField = "Name";
            uiDropDownListEditSubCat.DataValueField = "SubCategoryID";
            uiDropDownListEditSubCat.DataBind();
            uiDropDownListEditSubCat.Items.Insert(0, new ListItem("إختر قسم فرعى. . . ."));
        }


        private void BindAdmins()
        {
            uiGridViewAdmins.DataSource = AdminsTable;
            uiGridViewAdmins.DataBind();
        }
        #endregion

        protected void uiDropDownListMyRooms_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (uiDropDownListMyRooms.SelectedIndex != -1 && uiDropDownListMyRooms.SelectedIndex != 0)
            {
                if (!string.IsNullOrEmpty(uiDropDownListMyRooms.SelectedValue))
                {
                    CurrentRoom = Convert.ToInt32(uiDropDownListMyRooms.SelectedValue);
                    Response.Redirect("createRoom.aspx?IsEdit=true");
                }
            }
        }

        protected void uiGridViewAdmins_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteAdmin") 
            {
                RoomMember mem = new RoomMember();
                mem.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()), CurrentRoom);
                mem.RoomMemberLevelID = 1; //Helper.Enums.RoomMemberLevel.Visitor;
                mem.Save();
                loadAdminTable();
                BindAdmins();
            }
        }






    }
}