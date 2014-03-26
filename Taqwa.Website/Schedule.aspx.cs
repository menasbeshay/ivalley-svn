using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class Schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                if (Session["CurrentLoggedInStudent"] != null)
                {
                    int id = Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString());
                    DBLayer db = new DBLayer ();
                    DataSet ds = new DataSet ();
                    ds = db.GetStudent(id);
                    DataSet StudentClassRoom = new DataSet();
                    StudentClassRoom = db.GetClassRoom(Convert.ToInt32(ds.Tables[0].Rows[0]["ClassRoomID"].ToString()));
                    uiDropDownListClasses.SelectedValue = StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString();

                    uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
                    uiDropDownListClassRooms.DataTextField = "ArName";
                    uiDropDownListClassRooms.DataValueField = "ClassRoomID";
                    uiDropDownListClassRooms.DataBind();
                    uiDropDownListClassRooms.SelectedValue = ds.Tables[0].Rows[0]["ClassRoomID"].ToString();
                    BindData();
                }
            }
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListClasses.DataSource = db.GetAllClass();
            uiDropDownListClasses.DataTextField = "ArName";
            uiDropDownListClasses.DataValueField = "ClassID";
            uiDropDownListClasses.DataBind();
            uiDropDownListClasses.SelectedIndex = 0;

            uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListClassRooms.DataTextField = "ArName";
            uiDropDownListClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListClassRooms.DataBind();
        }

        protected void uiDropDownListClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListClassRooms.DataTextField = "ArName";
            uiDropDownListClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListClassRooms.DataBind();
        }

        protected void uiButtonView_Click(object sender, EventArgs e)
        {
            BindData();
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiGridViewSchedule.DataSource = db.GetScheduleByClassRoomAndDay(Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), Convert.ToInt32(uiDropDownListDay.SelectedValue));
            uiGridViewSchedule.DataBind();
        }

        
        
    }
}