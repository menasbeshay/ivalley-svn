using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pricing.BLL;
using System.Data;
using System.Net.Mail;
using System.Configuration;
using System.IO;
using System.Drawing;
using BLL;
using System.Threading;
using Pricing_GUI;


namespace WebGUI
{
    public partial class ListPrices : System.Web.UI.Page
    {
        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            Master.ChildPageTitle = "Pricing Requests Search";
            
            if (!IsPostBack)
            {
                BindCompanies();
                BindCommitteeTypes();
                BindFileTypes();
                BindStatus();
                BindAssignedUser();
                ui_lblDone.Text = "";
                //tb_export.Visible = false;
            }
        }
                
        protected void ui_btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt_Result = SearchCases();
            //if (dt_Result.Rows.Count > 0)
            //{
            //    tb_export.Visible = true;
            //}
            ui_lblDone.Text = "";
        }

        protected void ui_gvSearchResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ui_gvSearchResults.PageIndex = e.NewPageIndex;
            SearchCases();
        }
        
        protected void ui_LB_Details_Click(object sender, EventArgs e)
        {
            uiPopupExtenderEdit1.Show();

            LinkButton lnBtn = (LinkButton)sender;
            v_PriceSchedual objData = new v_PriceSchedual();
            objData.SearchByTradeID(Int32.Parse(lnBtn.CommandArgument));

            ui_lb_TradeName.Text = objData.TradeName;
            ui_lb_CompPrice.Text = objData.CompanyPrice.ToString();
            ui_lb_SubmissionDate.Text = objData.SubmissionDate;
            ui_lb_Pack.Text = objData.Pack;
            ui_lb_FileNo.Text = objData.FileNo;
            ui_lb_GenericStr.Text = objData.GenericStrength;
            if (objData.FilePath != null)
            {
                ui_HL_File.Text = "  here";
                ui_HL_File.NavigateUrl = "~/Attachments/" + objData.TradePricingID.ToString() + "_" + objData.FilePath;
            }
            else
            {
                ui_HL_File.Text = "  No File Uploaded";
            }
            ui_lb_Generic.Text = objData.Generic;
            ui_lb_DosageForm.Text = objData.Dosage_form;
            ui_lb_CompName.Text = objData.CompNameEng;
            ui_lb_Status.Text = objData.Status;
            ui_lb_CommType.Text = objData.CommitteType;
            ui_lb_FileType.Text = objData.FileType;
            ui_lb_ManufactureName.Text = objData.ManufactureName;
        }

        protected void ui_btn_Cancel_Click(object sender, EventArgs e)
        {

        }

        protected void ui_btnCloseMailPopup_Click(object sender, EventArgs e)
        {
          //  ModalPopupExtender1.Hide();

        }

        protected void ui_LB_Excel_Click(object sender, EventArgs e)
        {
            DateTime dtime = DateTime.Now;
            string fileName = "ExportList_" + dtime.Day.ToString() + "_" + dtime.Month.ToString() + "_" + dtime.Year.ToString() + "_"
                + dtime.Hour.ToString() + "_" + dtime.Minute.ToString() + "_" + dtime.Second.ToString() + ".xls";
            //string filepath = Server.MapPath(ConfigurationManager.AppSettings["AttachementPath"].ToString()) + fileName;
            
            DataTable dt = SearchCases();
            //CreateExcelFile.CreateExcelDocument(dt, filepath);
            //ui_lblDone.Text = "To open the Excel Sheet  .. " + "<a href='../Attachments/" + fileName + "'> click here </a>";

            ExportDataToExcel(dt, fileName);
        }

        protected void ui_LB_Assign_Click(object sender, EventArgs e)
        {
            LinkButton lnBtn = (LinkButton)sender;
            TradePricing objData = new TradePricing();
            objData.LoadByPrimaryKey(Int32.Parse(lnBtn.CommandArgument));

            foreach (GridViewRow row in ui_gvSearchResults.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    LinkButton lnBtn2 = (LinkButton)row.FindControl("ui_LB_Assign");
                    if (lnBtn.CommandArgument == lnBtn2.CommandArgument)
                    {
                        objData.AssignedUserID = int.Parse(((DropDownList)row.FindControl("ui_ddlAssignedTo")).SelectedValue);
                        objData.Save();
                        ui_lblDone.Text = "Assignation Done";
                    }
                }
            }        
            SearchCases();
        }

        protected void ui_gvSearchResults_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DropDownList ddl = (DropDownList)e.Row.FindControl("ui_ddlAssignedTo");

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ListItem item = new ListItem(" --- Not Assigned ----", "-1");
                userLogin objUsers = new userLogin();
                objUsers.LoadAll();
                
                ddl.DataSource = objUsers.DefaultView;
                ddl.DataTextField = userLogin.ColumnNames.UserName;
                ddl.DataValueField = userLogin.ColumnNames.AdminID;
                ddl.DataBind();
                ddl.Items.Insert(0, item);

                HiddenField hd = (HiddenField)e.Row.FindControl("ui_hdnUserID");
                int _userID = -1;
                if (hd.Value != "")
                {
                    _userID = int.Parse(hd.Value);
                }

                ddl.SelectedIndex = ddl.Items.IndexOf(ddl.Items.FindByValue(_userID.ToString()));
            }
            
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        } 

        #endregion

        #region Methods

        private void BindCompanies()
        {
            ListItem item = new ListItem(" --- Select ----", "-1");
            Companies objCompany = new Companies();
            objCompany.LoadAll();
            ui_drpCompanies.DataSource = objCompany.DefaultView;
            ui_drpCompanies.DataTextField = Companies.ColumnNames.CompNameEng;
            ui_drpCompanies.DataValueField = Companies.ColumnNames.CompanyID;
            ui_drpCompanies.DataBind();
            ui_drpCompanies.Items.Insert(0, item);
        }

        private void BindCommitteeTypes()
        {
            ListItem item = new ListItem(" --- Select ----", "-1");
            Registeration_Committee_Type objCompany = new Registeration_Committee_Type();
            objCompany.LoadAll();
            ui_drpCommitteType.DataSource = objCompany.DefaultView;
            ui_drpCommitteType.DataTextField = Registeration_Committee_Type.ColumnNames.CommitteType;
            ui_drpCommitteType.DataValueField = Registeration_Committee_Type.ColumnNames.ID;
            ui_drpCommitteType.DataBind();
            ui_drpCommitteType.Items.Insert(0, item);
        }

        private void BindFileTypes()
        {
            ListItem item = new ListItem(" --- Select ----", "-1");
            FileType objCompany = new FileType();
            objCompany.LoadAll();
            ui_drpFileType.DataSource = objCompany.DefaultView;
            ui_drpFileType.DataTextField = FileType.ColumnNames.FileType;
            ui_drpFileType.DataValueField = FileType.ColumnNames.FileTypeID;
            ui_drpFileType.DataBind();
            ui_drpFileType.Items.Insert(0, item);
        }

        private void BindStatus()
        {
           
            PricingStatus objCompany = new PricingStatus();
            objCompany.LoadAll();
            ui_drpStatus.DataSource = objCompany.DefaultView;
            ui_drpStatus.DataTextField = PricingStatus.ColumnNames.Status;
            ui_drpStatus.DataValueField = PricingStatus.ColumnNames.PricingStatusID;
            ui_drpStatus.DataBind();
            ListItem item_status = new ListItem("-- All Status -- ", "-1");
            ui_drpStatus.Items.Insert(0, item_status);
           
        }

        private DataTable SearchCases()
        {
            System.Data.DataTable dtResult = new System.Data.DataTable();

            dtResult = Database.SearchCases(ui_txtSubmissionFromDate.Text, ui_txtSubmissionToDate.Text, ui_txtTradeName.Text
                , int.Parse(ui_drpCompanies.SelectedValue), int.Parse(ui_drpCommitteType.SelectedValue), ui_txtFileNo.Text, int.Parse(ui_drpFileType.SelectedValue), int.Parse(ui_drpStatus.SelectedValue)
                , ui_txtGeneric1.Text, ui_txtGeneric2.Text, ui_txtGeneric3.Text, ui_txtGeneric4.Text, ui_txtGeneric5.Text, ui_drpAssignedUser.SelectedValue);
                
            ui_gvSearchResults.DataSource = dtResult;
            ui_gvSearchResults.DataBind();

            DataTable dt_Result = dtResult;
            DataTable dt_Generic;
            string Generics;
            DataColumn dc = new DataColumn("Generics");
            dt_Result.Columns.Add(dc);
            
            foreach (DataRow dr in dt_Result.Rows)
            {
                v_GetAllGenericInfoByDrugID objData = new Pricing.BLL.v_GetAllGenericInfoByDrugID();
                Generics = "";
                objData.GetGenericsInfo(int.Parse(dr["TradePricingID"].ToString()));
                dt_Generic = objData.DefaultView.Table;
                foreach (DataRow drGeneric in dt_Generic.Rows)
                {
                    Generics += @" "" " + drGeneric["Active"] + @" "" ";
                }
                dr["Generics"] = Generics;
            }
            ui_gv_Export.DataSource = dt_Result;
            ui_gv_Export.DataBind();
            return dt_Result;
           
            
        }

        private string PrepareMailBody(string _body,string _companyName,string _tradeName,string _dosageForm)
        {
            string resultBody="";

           // string committeeDateTime = ui_DatePickerForCommittee.Text + " " + ui_txtTimeHours.Text + ":" + ui_txtTimeMinutes.Text +
           //                            " " + ui_drpTimeZone.SelectedItem.Text;
            
            switch (ui_drpStatus.SelectedValue)
            {
                case "1": // Initiated Case
                    resultBody = _body.Replace("(CompanyName)", _companyName);
                    resultBody = resultBody.Replace("(TradeName)", _tradeName + " " + _dosageForm);
                 //   resultBody = resultBody.Replace("(CommitteeDateTime)", committeeDateTime);
                break;

            }   

            return resultBody;
        }

        private void SendEmail()
        {
            // getting template mail text for the selected status ID

            //_progress.AddMessageLine("Started");

            MailTemplates obj = new MailTemplates();
            obj.Where.PricingStatusID.Value = int.Parse(ui_drpStatus.SelectedValue.ToString());
            obj.Where.PricingStatusID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            obj.Query.Load();

            string _mailSubject =obj.s_MailSubject;

            string _mailBody = "";

            int progressCount = 0;

            foreach (GridViewRow row in ui_gvSearchResults.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                   // _progress.SetProgress(progressCount / ui_gvSearchResults.Rows.Count);

                    CheckBox chk = (CheckBox)row.FindControl("chRow1");
                    if (chk.Checked)
                    {
                        HiddenField hf_mail1 = (HiddenField)row.FindControl("ui_HF_Mail1");
                        HiddenField hf_mail2 = (HiddenField)row.FindControl("ui_HF_Mail2");
                        HiddenField hf_mail3 = (HiddenField)row.FindControl("ui_HF_Mail3");

                        HiddenField hf_compName = (HiddenField)row.FindControl("ui_HF_CompName");
                        HiddenField hf_TradeName = (HiddenField)row.FindControl("ui_HF_TradeName");
                        HiddenField hf_DosageForm = (HiddenField)row.FindControl("ui_HF_DosageForm");

                        HiddenField hf_PricingTradeID = (HiddenField)row.FindControl("ui_hdf_ManufactureID1");
                        HiddenField hf_PricingStatus = (HiddenField)row.FindControl("ui_HF_PricingStatus");

                        _mailBody = PrepareMailBody(obj.s_TemplateText, hf_compName.Value, hf_TradeName.Value, hf_DosageForm.Value);
                      //  _progress.AddMessageLine("Sending mail to" + hf_compName.Value);

                        ProcessSendMail(hf_mail1.Value, hf_mail2.Value, hf_mail3.Value, _mailBody, _mailSubject, int.Parse(hf_PricingTradeID.Value),int.Parse(hf_PricingStatus.Value));


                      
                    }
                }
                progressCount++;
            }
            //_progress.AddMessageLine("Finished");
            //_progress.SetProgress(1);
        }

        private bool ProcessSendMail(string _mailAddress1,string _mailAddress2, string _mailAddress3, string _mailBody,string _mailSubject,int _pricingTradeID,int _statusID)
        {
       
            //TODO : send actual mail using these information .

            try
            {

                MailMessage msg = new MailMessage();
                string mailfrom = ConfigurationManager.AppSettings["mailFromAddress"];
               string mailPass = ConfigurationManager.AppSettings["mailFrompass"];
               if (_mailAddress1 != "")
                   msg.To.Add(_mailAddress1);
               if (_mailAddress2 != "")
                   msg.To.Add(_mailAddress2);
               if (_mailAddress3 != "")
                   msg.To.Add(_mailAddress3);

               msg.Bcc.Add("pricing@capa-egypt.org");

               msg.From = new MailAddress("pricing@capa-egypt.org"); //new MailAddress(mailfrom);
                msg.Subject = _mailSubject;
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = _mailBody ;
               

               //SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 110);
                SmtpClient client = new SmtpClient("smtp.capa-egypt.org", 25);
               // client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential("pricing@capa-egypt.org", "0128889603");
                client.Send(msg);
               // Response.Redirect("services/success.aspx");
                UpdatePricingStatus(_pricingTradeID, _statusID);
                return true;
            }
            catch (Exception ex)
            {
                //return false;
                lblMailResult.Text = ex.Message;
                return false;
            }


        }

        private void UpdatePricingStatus(int _PricingTradeID, int _currentStatus)
        {
            TradePricing obj = new TradePricing();
            obj.LoadByPrimaryKey(_PricingTradeID);

            switch (_currentStatus)
            {
                case 1:
                    // in case of we are in initial status 
                    obj.PricingStatusID = 2;
                    obj.Save();
                    break;
                case 2:
                // in case of we are in Appointed Informed
                    obj.PricingStatusID = 3;
                    obj.Save();
                    break;
                case 3:
                    // in case of we are in Price Informed
                    obj.PricingStatusID = 4;
                    obj.Save();
                    break;
            }
        }

        private void BindAssignedUser()
        {
            ListItem item = new ListItem(" --- Select ----", "-1");
            userLogin objCompany = new userLogin();
            objCompany.LoadAll();
            ui_drpAssignedUser.DataSource = objCompany.DefaultView;
            ui_drpAssignedUser.DataTextField = userLogin.ColumnNames.UserName;
            ui_drpAssignedUser.DataValueField = userLogin.ColumnNames.AdminID;
            ui_drpAssignedUser.DataBind();
            ui_drpAssignedUser.Items.Insert(0, item);


            if (CodeGlobal.LogedInUser.Privaledge == "user")
            {
                ui_drpAssignedUser.SelectedValue = CodeGlobal.LogedInUser.s_AdminID;
                ui_drpAssignedUser.Enabled = false;
            }
            else if (CodeGlobal.LogedInUser.Privaledge == "admin")
            {
                ui_drpAssignedUser.SelectedValue = "-1";
                ui_drpAssignedUser.Enabled = true;
            }

        }

        private void ExportDataToExcel(DataTable dt,string fileName)
        {

            if (dt.Rows.Count > 0)
            {
               // string filename = "DownloadMobileNoExcel.xls";
                System.IO.StringWriter tw = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
                //DataGrid dgGrid = new DataGrid();
                //dgGrid.DataSource = dt;
                //dgGrid.DataBind();

                ////Get the HTML for the control.
                ui_gv_Export.RenderControl(hw);
                //Write the HTML back to the browser.
                //Response.ContentType = application/vnd.ms-excel;
                Response.ContentType = "application/vnd.ms-excel";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName + "");
                this.EnableViewState = false;
                Response.Write(tw.ToString());
                Response.End();
                Response.Flush();
            }
        }

        #endregion


    }
}