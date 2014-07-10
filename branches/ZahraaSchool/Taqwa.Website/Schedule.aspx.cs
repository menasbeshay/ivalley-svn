using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;
using System.Collections;

namespace Taqwa.Website
{
    public partial class Schedule : System.Web.UI.Page
    {
        public int DayCode { get; set; }
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
            ArrayList days = new ArrayList();
            //  days.Add("اليوم / الحصة");
            days.Add("الأحد#0");
            days.Add("الأثنين#1");
            days.Add("الثلاثاء#2");
            days.Add("الأربعاء#3");
            days.Add("الخميس#4");
            days.Add("الجمعة#5");
            days.Add("السبت#6");

            uiRepeaterDays.DataSource = days;
            uiRepeaterDays.DataBind();
            /*
            DBLayer db = new DBLayer();
            uiGridViewSchedule.DataSource = db.GetScheduleByClassRoomAndDay(Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), Convert.ToInt32(uiDropDownListDay.SelectedValue));
            uiGridViewSchedule.DataBind();*/
        }

        protected void uiRepeaterDays_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DBLayer db = new DBLayer();
                HiddenField code = (HiddenField)e.Item.FindControl("uiHiddenFieldDayCode");
                Repeater r = (Repeater)e.Item.FindControl("uiRepeaterSections2");
                DayCode = Convert.ToInt32(code.Value);
                r.DataSource = db.GetAllSections();
                r.DataBind();
            }

            if (e.Item.ItemType == ListItemType.Header)
            {
                DBLayer db = new DBLayer();
                Repeater r = (Repeater)e.Item.FindControl("uiRepeaterSectionNames");
                r.DataSource = db.GetAllSections();
                r.DataBind();
            }

        }


        protected void uiRepeaterSections2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                Label course = (Label)e.Item.FindControl("uiLabelCourse");
                
                ds = db.GetScheduleByClassRoomAndDay(Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), DayCode);

                DataRowView row = (DataRowView)e.Item.DataItem;

                foreach (DataRow item in ds.Tables[0].Rows)
                {
                    if (item["SectionID"].ToString() == row["SectionID"].ToString())
                    {
                        course.Text = item["ArDetails"].ToString();                        
                        break;
                    }
                }
            }

        }

        
        
    }
}