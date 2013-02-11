using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

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
                    BindData();
                }
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetScheduleByClassRoomAndDay(Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), Convert.ToInt32(uiDropDownListDay.SelectedValue));
            uiGridViewSchedule.DataSource = ds;
            uiGridViewSchedule.DataBind();      
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
    }
}