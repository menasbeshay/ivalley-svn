using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditSections : System.Web.UI.Page
    {
        public int CurrentSection
        {
            get
            {
                if (Session["CurrentSection"] != null && !string.IsNullOrEmpty(Session["CurrentSection"].ToString()) && Session["CurrentSection"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentSection"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentSection"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
               /* if (CurrentSection != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetSection(CurrentSection);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnName"].ToString();
                        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                        uiTextBoxDuration.Text = ds.Tables[0].Rows[0]["Duration"].ToString();
                    }
                    uiPanelCurrentSections.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {*/
                    uiPanelCurrentSections.Visible = true;
                    uiPanelCurrent.Visible = false;                    
                    BindData();
               // }
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllSections();
            uiGridViewSections.DataSource = ds;
            uiGridViewSections.DataBind();
        }

        protected void uiGridViewSections_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSections.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewSections_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSection")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentSection = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetSection(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                    uiTextBoxDuration.Text = ds.Tables[0].Rows[0]["Duration"].ToString();
                }
                uiPanelCurrentSections.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteSection")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentSection = id;
                DBLayer db = new DBLayer();
                db.DeleteSection(id);
                uiPanelCurrentSections.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentSections.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentSection != 0)
            {
                db.UpdateSection(CurrentSection, uiTextBoxEnName.Text, uiTextBoxArName.Text, uiTextBoxDuration.Text);
            }
            else
            {
                db.AddSection(uiTextBoxEnName.Text, uiTextBoxArName.Text, uiTextBoxDuration.Text);
            }
            uiPanelCurrentSections.Visible = true;
            uiPanelCurrent.Visible = false;
            ClearFields();
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentSections.Visible = true;
            uiPanelCurrent.Visible = false;
        }

        private void ClearFields()
        {
            CurrentSection = 0;
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
            uiTextBoxDuration.Text = "";
        }
    }
}