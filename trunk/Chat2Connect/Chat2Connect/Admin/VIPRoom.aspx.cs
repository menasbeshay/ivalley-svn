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

                    for (int i = 1; i <= 12; i++)
                    {
                        lstTypeDuration.Items.Add(new ListItem(i.ToString(), i.ToString()));
                    }

                    var lstRoomTypes = Helper.EnumUtil.GetValues<Helper.Enums.TypeSpec>().Where(r => (int)r > 1).Select(r => new
                    {
                        ID = (int)r,
                        Name = Helper.StringEnum.GetStringValue(r)
                    }).ToList();
                    lstTypes.DataValueField = "ID";
                    lstTypes.DataTextField = "Name";
                    lstTypes.DataSource = lstRoomTypes;
                    lstTypes.DataBind();
                }

            }
            else
            {
                Response.Redirect("VIPRoom.aspx");
            }
        }

       protected void uiLinkButtonSaveRoom_Click(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                Member member = BLL.Member.CurrentMember;
                Room room = new Room();
                if (!room.LoadByPrimaryKey(Convert.ToInt32(hdnRoomID.Value)))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Error3", @"$(document).ready(function () { notify('error', 'حدث خطأ . لا توجد غرفة بهذا الإسم.'); });", true);
                    return;
                }

                room.Name = txtNewName.Text;
                room.Save();

                //delete old records
                BLL.RoomType bllRoomType = new RoomType();
                bllRoomType.DeleteOldType(room.RoomID);

                BLL.RoomTypeSpecDuration bllTypeSpecDuration = new RoomTypeSpecDuration();
                bllTypeSpecDuration.LoadByRoomTypeSpecID(Convert.ToInt32(lstTypes.SelectedValue));
                room.RoomType.RoomTypeSpecDurationID = bllTypeSpecDuration.ID;
                room.RoomType.CreateBy = BLL.Member.CurrentMember.MemberID;
                room.RoomType.StartDate = DateTime.Now;
                room.RoomType.EndDate = DateTime.Now.AddMonths(Convert.ToInt32(lstTypeDuration.SelectedValue));
                room.RoomType.OldName = txtRoomName.Text;
                room.RoomType.Save();

                uiPanelSuccess.Visible = true;
                txtRoomName.Text = "";
                txtNewName.Text = "";
                
                // log 
                BLL.MemberLog log = new BLL.MemberLog();
                log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.ChangeRoomType() { RoomName = room.Name, NewTypeName = room.RoomType.RoomTypeSpecDuration.RoomTypeSpec.Name, NewTypeExpiryDate = room.RoomType.EndDate, Points = 0 }, null, room.RoomID);
                Chat2Connect.usercontrols.RoomTypes.NotifyRoom(room, bllTypeSpecDuration);
            }
        }

        #endregion

    }
}