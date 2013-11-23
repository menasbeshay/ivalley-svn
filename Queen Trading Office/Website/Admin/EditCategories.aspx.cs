using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication.lib;
using System.Data;

namespace WebApplication.Admin
{
    public partial class EditCategories : System.Web.UI.Page
    {
        public int CurrentCat
        {
            get
            {
                if (Session["CurrentCat"] != null)
                {
                    if (!string.IsNullOrEmpty(Session["CurrentCat"].ToString()) && Session["CurrentCat"].ToString() != "0")
                    {
                        return Convert.ToInt32(Session["CurrentCat"].ToString());
                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentCat"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                /*  if (CurrentPage != 0)
                  {
                      //BindData();
                      DBLayer db = new DBLayer();
                      DataSet ds = new DataSet();
                      ds = db.GetPageContent(CurrentPage);
                      if (ds.Tables[0].Rows.Count > 0)
                      {
                          uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                          uiFCKeditorContent.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
                      }
                      uiPanelCurrentPages.Visible = false;
                      uiPanelCurrent.Visible = true;
                  }
                  else
                  {*/
                BindData();
                //  }


            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllCats();
            uiGridViewCats.DataSource = ds;
            uiGridViewCats.DataBind();
        }

        protected void uiGridViewCats_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCat")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentCat = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetCategoryContent(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxTitle.Text = ds.Tables[0].Rows[0]["CategoryName"].ToString();
                    uiTextBoxArTitle.Text = ds.Tables[0].Rows[0]["CategoryArName"].ToString();                    
                }
                uiPanelCurrentPages.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteCat")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentCat = id;
                DBLayer db = new DBLayer();
                db.DeleteCategory(id);
                BindData();
            }
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            string filepath = "";
            if (uiFileUploadPath.HasFile)
            {
                uiFileUploadPath.SaveAs(Server.MapPath("~/UploadedFiles/cats/" + uiFileUploadPath.FileName));
                filepath = "/UploadedFiles/cats/" + uiFileUploadPath.FileName;
            }

            if(CurrentCat != 0 )
                db.SetCategoryContent(CurrentCat, uiTextBoxTitle.Text, uiTextBoxArTitle.Text, "");
            else
                db.AddCategoryContent(uiTextBoxTitle.Text, uiTextBoxArTitle.Text, "");
            ClearFields();
            uiPanelCurrentPages.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelCurrentPages.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
            ClearFields();
        }

        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";            
            uiTextBoxArTitle.Text = "";            
            CurrentCat = 0;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelCurrentPages.Visible = false;
            uiPanelCurrent.Visible = true;            
            ClearFields();
        }
    }
}