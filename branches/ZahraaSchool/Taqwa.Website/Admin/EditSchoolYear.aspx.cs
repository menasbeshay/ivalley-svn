using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditSchoolYear : System.Web.UI.Page
    {
        public int CurrentSchoolYear
        {
            get
            {
                if (Session["CurrentSchoolYear"] != null && !string.IsNullOrEmpty(Session["CurrentSchoolYear"].ToString()) && Session["CurrentSchoolYear"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentSchoolYear"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentSchoolYear"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CurrentSchoolYear != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetSchoolYear(CurrentSchoolYear);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnName"].ToString();
                        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                        uiCheckBoxCurrentYear.Checked = (bool)ds.Tables[0].Rows[0]["CurrentYear"]; 
                    }
                    uiPanelCurrentSchoolYear.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    uiPanelCurrentSchoolYear.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindData();
                }
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllSchoolYear();
            uiGridViewSchoolYears.DataSource = ds;
            uiGridViewSchoolYears.DataBind();
        }

        protected void uiGridViewSchoolYears_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSchoolYears.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewSchoolYears_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSchoolYear")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentSchoolYear = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetSchoolYear(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["CurrentYear"].ToString()))
                        uiCheckBoxCurrentYear.Checked = (bool)ds.Tables[0].Rows[0]["CurrentYear"];
                    else
                        uiCheckBoxCurrentYear.Checked = false;
                }
                uiPanelCurrentSchoolYear.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteSchoolYear")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentSchoolYear = id;
                DBLayer db = new DBLayer();
                db.DeleteSchoolYear(id);
                uiPanelCurrentSchoolYear.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentSchoolYear != 0)
            {
                db.UpdateSchoolYear(CurrentSchoolYear, uiTextBoxEnName.Text, uiTextBoxArName.Text);
                if (uiCheckBoxCurrentYear.Checked)
                {
                    db.SetCurrentSchoolYear(CurrentSchoolYear);
                }
            }
            else
            {
                int id = db.AddSchoolYear(uiTextBoxEnName.Text, uiTextBoxArName.Text);
                if (uiCheckBoxCurrentYear.Checked)
                {
                    db.SetCurrentSchoolYear(id);
                }
            }
            uiPanelCurrentSchoolYear.Visible = true;
            uiPanelCurrent.Visible = false;
            ClearFields();
            BindData();
        }

        private void ClearFields()
        {
            CurrentSchoolYear = 0;
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
            uiCheckBoxCurrentYear.Checked = false;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentSchoolYear.Visible = true;
            uiPanelCurrent.Visible = false;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentSchoolYear.Visible = false;
            uiPanelCurrent.Visible = true;
        }
    }
}