using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;
using System.Collections;

namespace Taqwa.Website.Admin
{
    public partial class EditSchedule : System.Web.UI.Page
    {
        public int CurrentSchedule
        {
            get
            {
                if (Session["CurrentSchedule"] != null && !string.IsNullOrEmpty(Session["CurrentSchedule"].ToString()) && Session["CurrentSchedule"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentSchedule"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentSchedule"] = value;
            }
        }

        public int DayCode { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (CurrentSchedule != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetSchedule(CurrentSchedule);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiDropDownListSection.SelectedValue = ds.Tables[0].Rows[0]["SectionID"].ToString();
                        uiTextBoxArDetails.Text = ds.Tables[0].Rows[0]["ARDetails"].ToString();
                        uiTextBoxEnDetails.Text = ds.Tables[0].Rows[0]["ENDetails"].ToString();
                    }
                    uiPanelCurrentSchedule.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    uiPanelCurrentSchedule.Visible = true;
                    uiPanelCurrent.Visible = false;
                    LoadDDLs();
                  //  DrawGrid();
                    BindData();
                }
            }
        }

        private void DrawGrid()
        {
            DBLayer db = new DBLayer();            
            DataSet dsSections = new DataSet();
            dsSections = db.GetAllSections();
            ArrayList days = new ArrayList();
            
            days.Add("الأحد#0");
            days.Add("الأثنين#1");
            days.Add("الثلاثاء#2");
            days.Add("الأربعاء#3");
            days.Add("الخميس#4");
            days.Add("الجمعة#5");
            days.Add("السبت#6");

            uiRepeaterDays.DataSource = days;
            uiRepeaterDays.DataBind();
            


            /**/
           /* DataTable dt = new DataTable();
            dt.Columns.Add("اليوم/ الحصة", typeof(string));
            foreach (DataRow item in dsSections.Tables[0].Rows)
            {
                dt.Columns.Add(item["ArName"].ToString());
            }

            foreach (string item in days)
            {
                DataRow row = dt.NewRow();
                row[0] = item;
                foreach (DataRow section in dsSections.Tables[0].Rows)
                {
                    row[section["ArName"].ToString()] = section["SectionID"].ToString();
                }
                dt.Rows.Add(row);
            }*/


           // uiGridViewScheduleFinal.DataSource = dt;
           // uiGridViewScheduleFinal.DataBind();
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            DataSet dsSections = new DataSet();
            //ds = db.GetScheduleByClassRoomAndDay(Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), Convert.ToInt32(uiDropDownListDay.SelectedValue));
            dsSections = db.GetAllSections();
            /*uiGridViewSchedule.DataSource = ds;
            uiGridViewSchedule.DataBind();*/

            /**/
           
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

            uiDropDownListSection.DataSource = db.GetAllSections();
            uiDropDownListSection.DataTextField = "ARName";
            uiDropDownListSection.DataValueField = "SectionID";
            uiDropDownListSection.DataBind();
            uiDropDownListSection.SelectedIndex = 0;
        }

        protected void uiDropDownListClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListClassRooms.DataTextField = "ArName";
            uiDropDownListClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListClassRooms.DataBind();
            BindData(); 
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BindData();  
        }

        protected void uiGridViewSchedule_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSchedule.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewSchedule_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSchedule")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentSchedule = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetSchedule(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiDropDownListSection.SelectedValue = ds.Tables[0].Rows[0]["SectionID"].ToString();
                    uiTextBoxArDetails.Text = ds.Tables[0].Rows[0]["ARDetails"].ToString();
                    uiTextBoxEnDetails.Text = ds.Tables[0].Rows[0]["ENDetails"].ToString();
                }
                uiPanelCurrentSchedule.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteSchedule")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentSchedule = id;
                DBLayer db = new DBLayer();
                db.DeleteSchedule(id);
                uiPanelCurrentSchedule.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentSchedule != 0)
            {
                db.UpdateSchedule(CurrentSchedule, Convert.ToInt32(uiDropDownListDay.SelectedValue), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue),Convert.ToInt32(uiDropDownListSection.SelectedValue), uiTextBoxArDetails.Text, uiTextBoxEnDetails.Text);
            }
            else
            {
                db.AddSchedule(Convert.ToInt32(uiDropDownListDay.SelectedValue), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), Convert.ToInt32(uiDropDownListSection.SelectedValue), uiTextBoxArDetails.Text, uiTextBoxEnDetails.Text);
            }
            CurrentSchedule = 0;
            uiPanelCurrentSchedule.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentSchedule.Visible = true;
            uiPanelCurrent.Visible = false;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentSchedule.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        private void ClearFields()
        {
            uiDropDownListSection.SelectedIndex = 0;
            uiTextBoxArDetails.Text = "";
            uiTextBoxEnDetails.Text = "";
        }

        /*
        protected void uiGridViewScheduleFinal_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int count = 0;
                foreach (TableCell item in e.Row.Cells)
                {
                    if (count == 0)
                    {
                        count++;
                        continue;
                    }
                    else
                    {
                        HiddenField sectionid = new HiddenField();
                        HiddenField dayid = new HiddenField();
                        HiddenField Scheduleid = new HiddenField();
                        Scheduleid.ID = "uiHiddenFieldScheduleID";
                        Scheduleid.Value = "0";
                        dayid.Value = "0";
                        dayid.ID = "uiHiddenFieldDayID";
                        sectionid.ID = "uiHiddenFieldSectionID";
                        sectionid.Value = item.Text;
                        TextBox tb = new TextBox();
                        tb.ID = "uiTextBoxArDetails";
                        tb.Width = 70;
                        item.Controls.Clear();
                        item.Controls.Add(tb);
                        item.Controls.Add(sectionid);
                        item.Controls.Add(dayid);
                        item.Controls.Add(Scheduleid);
                    }
                }
            }
        }
        protected void uiGridViewScheduleFinal_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             
            if (e.Row.RowType == DataControlRowType.DataRow )
            {
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                int Currentday = 0; 

                int count = 0;
                foreach (TableCell item in e.Row.Cells)
	            {
                    if (count == 0)
                    {
                        Currentday = Convert.ToInt32(item.Text.Substring(item.Text.LastIndexOf("#") + 1));
                        item.Text = item.Text.Substring(0, item.Text.LastIndexOf("#"));
                        count++;
                        continue;
                    }
                    HiddenField sectionid = new HiddenField();
                    HiddenField dayid = new HiddenField();
                    HiddenField Scheduleid = new HiddenField();
                    //HiddenField sectionid = (HiddenField)item.FindControl("uiHiddenFieldSectionID");
                    //HiddenField dayid = (HiddenField)item.FindControl("uiHiddenFieldDayID");
                    //HiddenField Scheduleid = (HiddenField)item.FindControl("uiHiddenFieldScheduleID");
                    //TextBox tb = (TextBox)item.FindControl("uiTextBoxArDetails");
                    Scheduleid.ID = "uiHiddenFieldScheduleID";
                    Scheduleid.Value = "0";
                    dayid.Value = Currentday.ToString();
                    dayid.ID = "uiHiddenFieldDayID";
                    sectionid.ID = "uiHiddenFieldSectionID";
                    sectionid.Value = item.Text;
		            TextBox tb = new TextBox ();
                    tb.ID = "uiTextBoxArDetails";
                    tb.Width = 70;
                    item.Controls.Clear();
                    ds = db.GetScheduleByClassRoomAndDay(Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), Currentday); 
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        if (row["SectionID"].ToString() == sectionid.Value)
                        {
                            tb.Text = row["ArDetails"].ToString();
                            Scheduleid.Value = row["ScheduleID"].ToString();
                        }
                    }
                    item.Controls.Clear();
                    item.Controls.Add(tb);
                    item.Controls.Add(sectionid);
                    item.Controls.Add(dayid);
                    item.Controls.Add(Scheduleid);
	            }
                
                    
            }
        }
        */
        protected void uiDropDownListClassRooms_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void uiButtonUpdateFinal_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            /*foreach (GridViewRow item in uiGridViewScheduleFinal.Rows)
            {
               
                int count = 0;
                foreach (TableCell cell in item.Cells)
                {
                    if (count != 0)
                    {
                        HiddenField sectionid = (HiddenField)cell.FindControl("uiHiddenFieldSectionID");
                        HiddenField dayid = (HiddenField)cell.FindControl("uiHiddenFieldDayID");
                        HiddenField Scheduleid = (HiddenField)cell.FindControl("uiHiddenFieldScheduleID");
                        TextBox tb = (TextBox)cell.FindControl("uiTextBoxArDetails");
                        if (Scheduleid.Value != "0")
                        {
                            db.UpdateSchedule(Convert.ToInt32(Scheduleid.Value), Convert.ToInt32(dayid.Value), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), Convert.ToInt32(sectionid.Value), tb.Text, "");
                        }
                        else
                        {

                            db.AddSchedule(Convert.ToInt32(dayid.Value), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), Convert.ToInt32(sectionid.Value), tb.Text, "");
                        }
                    }
                    else
                    {
                        count++;
                    }
                }
                
            }*/

            foreach (RepeaterItem item in uiRepeaterDays.Items)
            {
              //  if (item.ItemIndex != 0)
             //   {
                    Repeater sections = (Repeater)item.FindControl("uiRepeaterSections2");
                    foreach (RepeaterItem section in sections.Items)
                    {
                        TextBox course = (TextBox)section.FindControl("uiTextBoxCourse");
                        HiddenField currentsection = (HiddenField)section.FindControl("uiHiddenFieldSectionID");
                        HiddenField day = (HiddenField)section.FindControl("uiHiddenFieldDayCode");
                        HiddenField schedule = (HiddenField)section.FindControl("uiHiddenFieldScheduleID");

                        if (schedule.Value != "0")
                        {
                            db.UpdateSchedule(Convert.ToInt32(schedule.Value), Convert.ToInt32(day.Value), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), Convert.ToInt32(currentsection.Value), course.Text, "");
                        }
                        else
                        {
                            if (!string.IsNullOrEmpty(course.Text))
                                db.AddSchedule(Convert.ToInt32(day.Value), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), Convert.ToInt32(currentsection.Value), course.Text, "");
                        }
                    }
              //  }
            }
        }


        /*****************************************************************/
        
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
                TextBox course = (TextBox)e.Item.FindControl("uiTextBoxCourse");
                HiddenField section = (HiddenField)e.Item.FindControl("uiHiddenFieldSectionID");
                HiddenField day = (HiddenField)e.Item.FindControl("uiHiddenFieldDayCode");
                HiddenField schedule = (HiddenField)e.Item.FindControl("uiHiddenFieldScheduleID");
                ds = db.GetScheduleByClassRoomAndDay(Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), DayCode);
                
                DataRowView row = (DataRowView)e.Item.DataItem;
                
                section.Value = row["SectionID"].ToString();
                day.Value = DayCode.ToString();
                foreach (DataRow item in ds.Tables[0].Rows)
                {
                    if (item["SectionID"].ToString() == row["SectionID"].ToString())
                    {
                        course.Text = item["ArDetails"].ToString();
                        schedule.Value = item["ScheduleID"].ToString();        
                        break;
                    }
                }
            }

        }
         
        /*********************************************************************/
    }
}