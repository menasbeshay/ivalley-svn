using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin.Controls
{
    public partial class ucFees : System.Web.UI.UserControl
    {
        public int CurrentFees
        {
            get
            {
                if (Session["CurrentFees"] != null && !string.IsNullOrEmpty(Session["CurrentFees"].ToString()) && Session["CurrentFees"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentFees"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentFees"] = value;
            }
        }
        public int CurrentStudentActive
        {
            get
            {
                if (Session["CurrentStudentActive"] != null && !string.IsNullOrEmpty(Session["CurrentStudentActive"].ToString()) && Session["CurrentStudentActive"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentStudentActive"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentStudentActive"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadDDLs();
        }
        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            
            uiDropDownListSchoolYear.DataSource = db.GetAllSchoolYear();
            uiDropDownListSchoolYear.DataTextField = "ArName";
            uiDropDownListSchoolYear.DataValueField = "SchoolYearID";
            uiDropDownListSchoolYear.DataBind();
            uiDropDownListSchoolYear.SelectedIndex = 0;
        }
        public void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            DataSet dsStudent = new DataSet();
            DataSet dsClassRoom = new DataSet();
            DataSet dsClass = new DataSet();
            dsStudent = db.GetStudent(CurrentStudentActive);
            uiLabelStudentName.Text = dsStudent.Tables[0].Rows[0]["ARStudentName"].ToString() + " " + dsStudent.Tables[0].Rows[0]["ArFatherName"].ToString();
            dsClassRoom = db.GetClassRoom(Convert.ToInt32(dsStudent.Tables[0].Rows[0]["ClassRoomID"].ToString()));
            dsClass = db.GetClass(Convert.ToInt32(dsClassRoom.Tables[0].Rows[0]["ClassID"].ToString()));
            uiLabelClass.Text = dsClass.Tables[0].Rows[0]["ArName"].ToString();
            ds = db.GetFeesByClassAndClassRoomAndSchoolYear(Convert.ToInt32(dsClassRoom.Tables[0].Rows[0]["ClassID"].ToString()),
                                                            Convert.ToInt32(dsStudent.Tables[0].Rows[0]["ClassRoomID"].ToString()),
                                                            Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            uiGridViewStudentsFees.DataSource = ds;
            uiGridViewStudentsFees.DataBind();
        }

        protected void uiGridViewStudentsFees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudentsFees.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewStudentsFees_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditFees")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentFees = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetFees(CurrentFees);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxRemainingFees.Text = ds.Tables[0].Rows[0]["RemainingFeesLastYear"].ToString();
                    uiTextBoxBooksFees.Text = ds.Tables[0].Rows[0]["BooksFees"].ToString();
                    uiTextBoxBusFees.Text = ds.Tables[0].Rows[0]["BusFees"].ToString();
                    uiTextBoxUniformFees.Text = ds.Tables[0].Rows[0]["UniformFees"].ToString();
                    uiTextBoxActFees.Text = ds.Tables[0].Rows[0]["ActivitiesFees"].ToString();
                    uiTextBoxOtherFees.Text = ds.Tables[0].Rows[0]["OtherFees"].ToString();
                }
                
            }
            else if (e.CommandName == "DeleteFees")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentFees = id;
                DBLayer db = new DBLayer();
                db.DeleteFees(id);                
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentFees != 0)
            {
                db.UpdateFees(CurrentFees, float.Parse(uiTextBoxRemainingFees.Text), float.Parse(uiTextBoxBooksFees.Text), float.Parse(uiTextBoxBusFees.Text), float.Parse(uiTextBoxUniformFees.Text), float.Parse(uiTextBoxOtherFees.Text), float.Parse(uiTextBoxActFees.Text), CurrentStudentActive, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            }
            else
            {
                db.AddFees(float.Parse(uiTextBoxRemainingFees.Text), float.Parse(uiTextBoxBooksFees.Text), float.Parse(uiTextBoxBusFees.Text), float.Parse(uiTextBoxUniformFees.Text), float.Parse(uiTextBoxOtherFees.Text), float.Parse(uiTextBoxActFees.Text), CurrentStudentActive, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            }            
            ClearFields();
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentStudentActive = 0;
            CurrentFees = 0;            
            BindData();
        }


        private void ClearFields()
        {
            uiTextBoxRemainingFees.Text = "0";
            uiTextBoxBooksFees.Text = "0";
            uiTextBoxBusFees.Text = "0";
            uiTextBoxUniformFees.Text = "0";
            uiTextBoxActFees.Text = "0";
            uiTextBoxOtherFees.Text = "0";

        }

        protected void uiDropDownListSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }
    }
}