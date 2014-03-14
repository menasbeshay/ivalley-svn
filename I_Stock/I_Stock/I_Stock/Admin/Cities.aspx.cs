using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace I_Stock.Admin
{
    public partial class Cities : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.Cities CurrentCity
        {
            get
            {
                if (Session["CurrentCity"] != null)
                    return (IStock.BLL.Cities)Session["CurrentCity"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCity"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                loadDDLs();
                BindCities();
                uiLinkButtonAdd.Enabled = !string.IsNullOrEmpty(uiDropDownListLines.SelectedValue);
                uipanelError.Visible = false;
                uiPanelEditCities.Visible = false;
                uiPanelAllCities.Visible = true;
            }
        }


        protected void uiDropDownListLines_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCities();
            uiLinkButtonAdd.Enabled = !string.IsNullOrEmpty(uiDropDownListLines.SelectedValue);
        }

        protected void uiGridViewCities_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCities.PageIndex = e.NewPageIndex;
            BindCities();
        }

        protected void uiGridViewCities_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCity")
            {
                IStock.BLL.Cities objData = new IStock.BLL.Cities();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                uiTextBoxDesc.Text = objData.Description;
                uiDropDownListLines.SelectedValue = objData.LineID.ToString();

                uiPanelAllCities.Visible = false;
                uiPanelEditCities.Visible = true;
                CurrentCity = objData;

                BindCities();
            }
            else if (e.CommandName == "DeleteCity")
            {
                try
                {
                    IStock.BLL.Cities objData = new IStock.BLL.Cities();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentCity = null;
                    BindCities();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }

        protected void uiGridViewCities_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label LineName = (Label)e.Row.FindControl("uiLabelLine");

                IStock.BLL.Lines Line = new IStock.BLL.Lines();
                DataRowView row = (DataRowView)e.Row.DataItem;
                Line.LoadByPrimaryKey(Convert.ToInt32(row["LineID"].ToString()));
                LineName.Text = Line.Name;

            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentCity = null;
            uiPanelEditCities.Visible = true;
            uiPanelAllCities.Visible = false;
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentCity = null;
            uiPanelEditCities.Visible = false;
            uiPanelAllCities.Visible = true;
            BindCities();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(uiDropDownListLines.SelectedValue))
            {
                IStock.BLL.Cities City = new IStock.BLL.Cities();
                if (CurrentCity == null)
                    City.AddNew();
                else
                    City = CurrentCity;

                City.Name = uiTextBoxName.Text;
                City.Description = uiTextBoxDesc.Text;
                City.LineID = Convert.ToInt32(uiDropDownListLines.SelectedValue);
                City.Save();
                ClearFields();
                CurrentCity = null;
                uiPanelEditCities.Visible = false;
                uiPanelAllCities.Visible = true;
                uipanelError.Visible = false;
                BindCities();
            }
            else
            {
                uipanelError.Visible = true;
            }
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentCity = null;
            uiPanelEditCities.Visible = false;
            uiPanelAllCities.Visible = true;
        }
        #endregion

        #region methods


        private void loadDDLs()
        {
            IStock.BLL.Lines Cats = new IStock.BLL.Lines();
            Cats.LoadAll();
            Cats.Sort = "Name";
            uiDropDownListLines.DataSource = Cats.DefaultView;
            uiDropDownListLines.DataTextField = "Name";
            uiDropDownListLines.DataValueField = "LineID";
            uiDropDownListLines.DataBind();
            uiDropDownListLines.Items.Insert(0, new ListItem("إختر الخط",""));
        }


        private void BindCities()
        {
            IStock.BLL.Cities Cities = new IStock.BLL.Cities();
            if(!string.IsNullOrEmpty(uiDropDownListLines.SelectedValue))
                Cities.GetCitiesByLineID(Convert.ToInt32(uiDropDownListLines.SelectedValue));
            Cities.Sort = "Name";
            uiGridViewCities.DataSource = Cities.DefaultView;
            uiGridViewCities.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";            
        }


        #endregion
    }
}