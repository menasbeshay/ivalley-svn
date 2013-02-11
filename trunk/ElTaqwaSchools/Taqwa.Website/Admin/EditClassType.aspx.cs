using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class Edit_ClassType : System.Web.UI.Page
    {
        public int CurrentClassType
        {
            get
            {
                if (Session["CurrentClassType"] != null && !string.IsNullOrEmpty(Session["CurrentClassType"].ToString()) && Session["CurrentClassType"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentClassType"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentClassType"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                if (CurrentClassType != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetClassType(CurrentClassType);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnName"].ToString();
                        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();                        
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
            ds = db.GetAllClassType();
            uiGridViewClassType.DataSource = ds;
            uiGridViewClassType.DataBind();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentClassType.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        protected void uiGridViewClassType_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewClassType.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewClassType_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditClassType")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentClassType = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetClassType(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();                    
                }
                uiPanelCurrentClassType.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteClassType")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentClassType = id;
                DBLayer db = new DBLayer();
                db.DeleteClassType(id);
                uiPanelCurrentClassType.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentClassType != 0)
            {
                db.UpdateClassType(CurrentClassType, uiTextBoxEnName.Text, uiTextBoxArName.Text);
            }
            else
            {
                db.AddClassType(uiTextBoxEnName.Text, uiTextBoxArName.Text);
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
            CurrentClassType = 0;
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
        }
    }
}