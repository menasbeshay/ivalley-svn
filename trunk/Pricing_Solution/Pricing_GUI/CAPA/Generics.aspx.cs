using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pricing.BLL;
using System.Configuration;

namespace PricingGUI
{
    public partial class Generics : System.Web.UI.Page
    {


        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ui_lb_msg.Text = "";
                BindAllGenerics();
                ui_GvData.EmptyDataText = "Sorry, No Available Data";
            }
        }
        
        protected void ui_btnSave_Click(object sender, EventArgs e)
        {
            AddGeneric();
            BindAllGenerics();
        }

        protected void ui_GvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ui_GvData.PageIndex = e.NewPageIndex;
            BindAllGenerics();
        }

        protected void ui_btn_Click_Click(object sender, EventArgs e)
        {
            Substances objData = new Substances();
            objData.GetByName(ui_txtGenericName.Text);
            ui_GvData.DataSource = objData.DefaultView;
            ui_GvData.DataBind();
        }

        #endregion 

        #region Methods

        /// <summary>
        ///
        /// </summary>
        private void AddGeneric()
        {
            try
            {
                Substances objData = new Substances();
                objData.AddNew();

                objData.NAME = ui_txtGenericName.Text;
                objData.Approved = true;

                objData.Save();

                ui_lb_msg.ForeColor = System.Drawing.Color.Green;
                ui_lb_msg.Text = "The new record added successfully";

                ResetFields();
            }
            catch
            {
                ui_lb_msg.ForeColor = System.Drawing.Color.Red;
                ui_lb_msg.Text = "Problem while adding the new record";
            }
        }
      
        private void ResetFields()
        {
            ui_txtGenericName.Text = "";
        }

        private void BindAllGenerics()
        {
            //Substances objData = new Substances();
            //objData.LoadAll();
            //ui_GvData.DataSource = objData.DefaultView;
            //ui_GvData.DataBind();
        }

        #endregion

        

    }
}