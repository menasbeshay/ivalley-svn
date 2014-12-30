﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditCourses : System.Web.UI.Page
    {
        public int CurrentCourse
        {
            get
            {
                if (Session["CurrentCourse"] != null && !string.IsNullOrEmpty(Session["CurrentCourse"].ToString()) && Session["CurrentCourse"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentCourse"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentCourse"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               /* if (CurrentCourse != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetCourse(CurrentCourse);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENName"].ToString();
                        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ARName"].ToString();
                        uiTextBoxMaxGrade.Text = ds.Tables[0].Rows[0]["MinGrade"].ToString();
                        uiTextBoxMinGrade.Text = ds.Tables[0].Rows[0]["MaxGrade"].ToString();
                        uiCheckBoxInTotal.Checked = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["InTotal"].ToString()) ? false : (bool)ds.Tables[0].Rows[0]["InTotal"];
                    }
                    uiPanelCurrentCourses.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {*/
                    uiPanelCurrentCourses.Visible = true;
                    uiPanelCurrent.Visible = false;
                    LoadDDLs();
                    BindData();
              //  }
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllCoursesByClass(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiGridViewCourses.DataSource = ds;
            uiGridViewCourses.DataBind();       
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListClasses.DataSource = db.GetAllClass();
            uiDropDownListClasses.DataTextField = "ArName";
            uiDropDownListClasses.DataValueField = "ClassID";
            uiDropDownListClasses.DataBind();
            uiDropDownListClasses.SelectedIndex = 0;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentCourses.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentCourse != 0)
            {
                db.UpdateCourse(CurrentCourse, Convert.ToInt32(uiTextBoxMaxGradeFMT.Text), Convert.ToInt32(uiTextBoxMinGradeFMT.Text), Convert.ToInt32(uiTextBoxMaxGradeFT.Text), Convert.ToInt32(uiTextBoxMinGradeFT.Text), Convert.ToInt32(uiTextBoxMaxGradeSMT.Text), Convert.ToInt32(uiTextBoxMinGradeSMT.Text), Convert.ToInt32(uiTextBoxMaxGradeST.Text), Convert.ToInt32(uiTextBoxMinGradeST.Text), uiTextBoxEnName.Text, uiTextBoxArName.Text, Convert.ToInt32(uiDropDownListClasses.SelectedValue), uiCheckBoxInTotal.Checked);
            }
            else
            {
                db.AddCourse(Convert.ToInt32(uiTextBoxMaxGradeFMT.Text), Convert.ToInt32(uiTextBoxMinGradeFMT.Text), Convert.ToInt32(uiTextBoxMaxGradeFT.Text), Convert.ToInt32(uiTextBoxMinGradeFT.Text), Convert.ToInt32(uiTextBoxMaxGradeSMT.Text), Convert.ToInt32(uiTextBoxMinGradeSMT.Text), Convert.ToInt32(uiTextBoxMaxGradeST.Text), Convert.ToInt32(uiTextBoxMinGradeST.Text), uiTextBoxEnName.Text, uiTextBoxArName.Text, Convert.ToInt32(uiDropDownListClasses.SelectedValue), uiCheckBoxInTotal.Checked);
            }
            CurrentCourse = 0;
            uiPanelCurrentCourses.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentCourses.Visible = true;
            uiPanelCurrent.Visible = false;
        }

        protected void uiGridViewCourses_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCourses.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewCourses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCourse")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentCourse = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetCourse(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ARName"].ToString();
                    if (ds.Tables[0].Rows[0]["MinGradeFMT"] != null)
                        uiTextBoxMaxGradeFMT.Text = ds.Tables[0].Rows[0]["MinGradeFMT"].ToString();
                    if (ds.Tables[0].Rows[0]["MaxGradeFMT"] != null)
                        uiTextBoxMinGradeFMT.Text = ds.Tables[0].Rows[0]["MaxGradeFMT"].ToString();
                    if (ds.Tables[0].Rows[0]["MinGradeFT"] != null)
                        uiTextBoxMaxGradeFT.Text = ds.Tables[0].Rows[0]["MinGradeFT"].ToString();
                    if (ds.Tables[0].Rows[0]["MaxGradeFT"] != null)
                        uiTextBoxMinGradeFT.Text = ds.Tables[0].Rows[0]["MaxGradeFT"].ToString();
                    if (ds.Tables[0].Rows[0]["MinGradeSMT"] != null)
                        uiTextBoxMaxGradeSMT.Text = ds.Tables[0].Rows[0]["MinGradeSMT"].ToString();
                    if (ds.Tables[0].Rows[0]["MaxGradeSMT"] != null)
                        uiTextBoxMinGradeSMT.Text = ds.Tables[0].Rows[0]["MaxGradeSMT"].ToString();
                    if (ds.Tables[0].Rows[0]["MinGradeST"] != null)
                        uiTextBoxMaxGradeST.Text = ds.Tables[0].Rows[0]["MinGradeST"].ToString();
                    if (ds.Tables[0].Rows[0]["MaxGradeST"] != null)
                        uiTextBoxMinGradeST.Text = ds.Tables[0].Rows[0]["MaxGradeST"].ToString();
                    uiCheckBoxInTotal.Checked = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["InTotal"].ToString()) ? false : (bool)ds.Tables[0].Rows[0]["InTotal"];
                }
                uiPanelCurrentCourses.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteCourse")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentCourse = id;
                DBLayer db = new DBLayer();
                db.DeleteCourse(id);
                uiPanelCurrentCourses.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        private void ClearFields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxMaxGradeFMT.Text = "";
            uiTextBoxMinGradeFMT.Text = "";
            uiTextBoxMaxGradeFT.Text = "";
            uiTextBoxMinGradeFT.Text = "";
            uiTextBoxMaxGradeSMT.Text = "";
            uiTextBoxMinGradeSMT.Text = "";
            uiTextBoxMaxGradeST.Text = "";
            uiTextBoxMinGradeST.Text = "";
            uiCheckBoxInTotal.Checked = false;
        }

        protected void uiDropDownListClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

    }
}