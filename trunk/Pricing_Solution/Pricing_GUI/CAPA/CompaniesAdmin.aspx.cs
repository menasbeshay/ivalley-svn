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
    public partial class CompaniesAdmin : System.Web.UI.Page
    {
        #region Properties

        public Companies SavedCompaniesObj
        {
            get
            {
                if (Session["SavedCompaniesObj"] != null)
                    return (Companies)Session["SavedCompaniesObj"];
                else
                    return null;
            }
            set
            {
                Session["SavedCompaniesObj"] = value;
            }
        }


        #endregion

        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            Master.ChildPageTitle = "Companies Management";
            if (!Page.IsPostBack)
            {
                ui_lb_msg.Text = "";
                BindAllCompanies();
                ui_GvData.EmptyDataText = "Sorry, No Available Data";
            }
        }


        protected void ui_btnSave_Click(object sender, EventArgs e)
        {
            if (SavedCompaniesObj != null)
            {
                SaveCompanyInfo();
            }
            else
            {
                AddCompanyInfo();
            }
            ui_btnSave.Text = "Add";
            ResetFields();
            BindAllCompanies();
        }

        protected void ui_BtnSearch_Click(object sender, EventArgs e)
        {
            Companies objData = new Companies();
            objData.SearchByName(ui_TxtSearch.Text);
            ui_GvData.DataSource = objData.DefaultView;
            ui_GvData.DataBind();
        }

        protected void ui_BtnEdit_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;

            Companies objData = new Companies();
            objData.LoadByPrimaryKey(Int32.Parse(btn.CommandArgument));
            ui_txtCompNameEn.Text = objData.CompNameEng;
            ui_txtCompNameAr.Text = objData.CompNameAr;
            ui_txtCompCode.Text = objData.Comp_Code;
            ui_txtOldEmail.Text = objData.OLD_EMAIL;
            ui_txtName1.Text = objData.Doctor_Name;
            ui_txtNewEmail1.Text = objData.New_Email;
            ui_txtNumber1.Text = objData.Phone_Number;
            ui_txtName2.Text = objData.Doctor_Name_2;
            ui_txtNewEmail2.Text = objData.New_Email_2;
            ui_txtNumber2.Text = objData.Phone_Number2;

            ui_btnSave.Text = "Save";
            SavedCompaniesObj = objData;
        }

        protected void ui_BtnDelete_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            Companies objData = new Companies();
            objData.LoadByPrimaryKey(Int32.Parse(btn.CommandArgument));
            objData.MarkAsDeleted();
            objData.Save();
            BindAllCompanies();
        }

        protected void ui_GvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ui_GvData.PageIndex = e.NewPageIndex;
            BindAllCompanies();
        }

        protected void ui_btn_Click_Click(object sender, EventArgs e)
        {
            ResetFields();
            ui_btnSave.Text = "Add";
            SavedCompaniesObj = null;
        }

        #endregion 

        #region Methods

        /// <summary>
        /// Add Company Info
        /// </summary>
        private void AddCompanyInfo()
        {
            try
            {
                Companies objData = new Companies();

                objData.AddNew();

                objData.CompNameEng = ui_txtCompNameEn.Text;
                objData.CompNameAr = ui_txtCompNameAr.Text;
                objData.Comp_Code = ui_txtCompCode.Text;
                objData.OLD_EMAIL = ui_txtOldEmail.Text;
                objData.Doctor_Name = ui_txtName1.Text;
                objData.New_Email = ui_txtNewEmail1.Text;
                objData.Phone_Number = ui_txtNumber1.Text;
                objData.Doctor_Name_2 = ui_txtName2.Text;
                objData.New_Email_2 = ui_txtNewEmail2.Text;
                objData.Phone_Number2 = ui_txtNumber2.Text;
                objData.Checked = true;

                objData.Save();

                ui_lb_msg.ForeColor = System.Drawing.Color.Green;
                ui_lb_msg.Text = "The new record saved successfully";

                ResetFields();
            }
            catch
            {
                ui_lb_msg.ForeColor = System.Drawing.Color.Red;
                ui_lb_msg.Text = "Problem while saving the new record";
            }
        }

        /// <summary>
        /// Save Company Info
        /// </summary>
        private void SaveCompanyInfo()
        {
            try
            {
                if (SavedCompaniesObj != null)
                {
                    SavedCompaniesObj.CompNameEng = ui_txtCompNameEn.Text;
                    SavedCompaniesObj.CompNameAr = ui_txtCompNameAr.Text;
                    SavedCompaniesObj.Comp_Code = ui_txtCompCode.Text;
                    SavedCompaniesObj.OLD_EMAIL = ui_txtOldEmail.Text;
                    SavedCompaniesObj.Doctor_Name = ui_txtName1.Text;
                    SavedCompaniesObj.New_Email = ui_txtNewEmail1.Text;
                    SavedCompaniesObj.Phone_Number = ui_txtNumber1.Text;
                    SavedCompaniesObj.Doctor_Name_2 = ui_txtName2.Text;
                    SavedCompaniesObj.New_Email_2 = ui_txtNewEmail2.Text;
                    SavedCompaniesObj.Phone_Number2 = ui_txtNumber2.Text;
                    SavedCompaniesObj.Checked = true;
                }

                SavedCompaniesObj.Save();
                SavedCompaniesObj = null;
                
                ui_lb_msg.ForeColor = System.Drawing.Color.Green;
                ui_lb_msg.Text = "The record saved successfully";
            }
            catch
            {
                ui_lb_msg.ForeColor = System.Drawing.Color.Red;
                ui_lb_msg.Text = "Problem while saving the record";
            }
        }

        private void ResetFields()
        {
            ui_txtCompNameEn.Text = "";
            ui_txtCompNameAr.Text = "";
            ui_txtCompCode.Text = "";
            ui_txtOldEmail.Text = "";
            ui_txtName1.Text = "";
            ui_txtNewEmail1.Text = "";
            ui_txtNumber1.Text = "";
            ui_txtName2.Text = "";
            ui_txtNewEmail2.Text = "";
            ui_txtNumber2.Text = "";
        }

        private void BindAllCompanies()
        {
            Companies objData = new Companies();
            objData.LoadAll();
            ui_GvData.DataSource = objData.DefaultView;
            ui_GvData.DataBind();
        }

        #endregion

        

        

    }
}