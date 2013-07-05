using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IStock.BLL;
namespace I_Stock.Admin
{
    public partial class Lines : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.Lines CurrentLine
        {
            get
            {
                if (Session["CurrentLine"] != null)
                    return (IStock.BLL.Lines)Session["CurrentLine"];
                else
                    return null;
            }
            set
            {
                Session["CurrentLine"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                BindLines();
                uipanelError.Visible = false;
                uiPanelEditLine.Visible = false;
                uiPanelAllLines.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentLine = null;
            uiPanelEditLine.Visible = false;
            uiPanelAllLines.Visible = true;
            BindLines();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.Lines line = new IStock.BLL.Lines();
            if (CurrentLine == null)
                line.AddNew();
            else
                line = CurrentLine;

            line.Name = uiTextBoxName.Text;
            line.Description = uiTextBoxDesc.Text;
            line.Save();
            ClearFields();
            CurrentLine = null;
            uiPanelEditLine.Visible = false;
            uiPanelAllLines.Visible = true;
            BindLines();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentLine = null;
            uiPanelEditLine.Visible = false;
            uiPanelAllLines.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentLine = null;
            uiPanelEditLine.Visible = true;
            uiPanelAllLines.Visible = false;
        }

        protected void uiGridViewLines_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewLines.PageIndex = e.NewPageIndex;
            BindLines();
        }

        protected void uiGridViewLines_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditLine")
            {
                IStock.BLL.Lines objData = new IStock.BLL.Lines();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                uiTextBoxDesc.Text = objData.Description;

                uiPanelAllLines.Visible = false;
                uiPanelEditLine.Visible = true;
                CurrentLine = objData;

                BindLines();
            }
            else if (e.CommandName == "DeleteLine")
            {
                try
                {
                    IStock.BLL.Lines objData = new IStock.BLL.Lines();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentLine = null;
                    BindLines();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }
        #endregion

        #region methods

        private void BindLines()
        {
            IStock.BLL.Lines Supps = new IStock.BLL.Lines();
            Supps.LoadAll();
            Supps.Sort = "Name";
            uiGridViewLines.DataSource = Supps.DefaultView;
            uiGridViewLines.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";
        }


        #endregion
    }
}