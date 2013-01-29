using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;
using System.Text;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditSubscribers : System.Web.UI.Page
    {
        #region properties
        public BLL.Subscribers CurrentSubscriber
        {
            get
            {
                if (Session["CurrentSubscriber"] != null)
                    return (BLL.Subscribers)Session["CurrentSubscriber"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSubscriber"] = value;
            }
        }
        #endregion
        #region Events
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewSubscribers.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        

        protected void uiGridViewSubscribers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSubscriber")
            {
                Subscribers objData = new Subscribers();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEMail.Text = objData.Email;
                uiPanelViewSubscribers.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteSubscriber")
            {
                Subscribers objData = new Subscribers();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                uiPanelEdit.Visible = false;
                uiPanelViewSubscribers.Visible = true;
                BindData();
                Clearfields();
               
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            bool done =false;
            
            if (CurrentSubscriber != null)
            {
                Subscribers objData = CurrentSubscriber;
                objData.Email = uiTextBoxEMail.Text;
                objData.Save();
            }
            else
            {
                Subscribers objData = new Subscribers();
                objData.AddNew();
                objData.Email = uiTextBoxEMail.Text;
                objData.Save();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewSubscribers.Visible = true;
            BindData();
            Clearfields();
            CurrentSubscriber = null;
          
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewSubscribers.Visible = false;
        }

        protected void uiGridViewSubscribers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSubscribers.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            Subscribers objData = new Subscribers();
            objData.SearchSubscribers(uiTextBoxSearch.Text);
            uiGridViewSubscribers.DataSource = objData.DefaultView;
            uiGridViewSubscribers.DataBind();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewSubscribers.Visible = true;
        }

        protected void uiLinkButtonAskExport_Click(object sender, EventArgs e)
        {
            StringBuilder sbDocBody = new StringBuilder();            
            sbDocBody.Append("<html><body>");
            Subscribers objData = new Subscribers();
            objData.LoadAll();
            foreach (DataRowView item in objData.DefaultView)
            {
                sbDocBody.Append(item["Email"].ToString());
                sbDocBody.Append("<br />");                              
                
            }
            sbDocBody.Append("</body></html>");
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.Charset = "utf-8";

            HttpContext.Current.Response.ContentType = "application/msword";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=\"subscribers.doc\"");            
            HttpContext.Current.Response.Write(sbDocBody.ToString());
            HttpContext.Current.Response.End();
        }
        #endregion

        #region Methods
        private void BindData()
        {
            Subscribers objData = new Subscribers();
            objData.LoadAll();
            uiGridViewSubscribers.DataSource = objData.DefaultView;
            uiGridViewSubscribers.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxEMail.Text = "";            
            uiLabelError.Visible = false;
        }
        #endregion

       
    }
}