using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditCategory : System.Web.UI.Page
    {
        public int CurrentCategory
        {
            get
            {
                if (Session["CurrentCategory"] != null && !string.IsNullOrEmpty(Session["CurrentCategory"].ToString()) && Session["CurrentCategory"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentCategory"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentCategory"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CurrentCategory != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetCategory(CurrentCategory);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnTitle"].ToString();
                        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArTitle"].ToString();
                    }
                    uiPanelCurrentClassType.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    uiPanelCurrentClassType.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindData();
                }
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllCategory();
            uiGridViewCategory.DataSource = ds;
            uiGridViewCategory.DataBind();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentClassType.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        protected void uiGridViewCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCategory.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCategory")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentCategory = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetCategory(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnTitle"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArTitle"].ToString();
                }
                uiPanelCurrentClassType.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteCategory")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentCategory = id;
                DBLayer db = new DBLayer();
                db.DeleteCategory(id);
                uiPanelCurrentClassType.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentCategory != 0)
            {
                db.UpdateCategory(CurrentCategory, uiTextBoxEnName.Text, uiTextBoxArName.Text);
            }
            else
            {
                db.AddCategory(uiTextBoxEnName.Text, uiTextBoxArName.Text);
            }
            uiPanelCurrentClassType.Visible = true;
            uiPanelCurrent.Visible = false;
            ClearFields();
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentClassType.Visible = true;
            uiPanelCurrent.Visible = false;
        }

        private void ClearFields()
        {
            CurrentCategory = 0;
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
        }
    }
}