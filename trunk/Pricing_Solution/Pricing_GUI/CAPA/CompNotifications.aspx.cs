using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pricing.BLL;
using System.Configuration;
using BLL;

namespace PricingGUI
{
    public partial class CompNotifications : System.Web.UI.Page
    {

        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ui_lb_msg.Text = "";
                BindCompanies();
                BindNotifications();
                ui_GvData.EmptyDataText = "Sorry, No Available Data";
            }
        }
        
        protected void ui_btnSave_Click(object sender, EventArgs e)
        {
            AddNotification();
            BindNotifications();
        }

        protected void ui_GvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ui_GvData.PageIndex = e.NewPageIndex;
            BindNotifications();
        }

        protected void ui_GvData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridViewRow row = e.Row;
            if (row.RowType == DataControlRowType.DataRow)
            {
                HiddenField hf = (HiddenField)row.FindControl("ui_hdnFilePath");
                HyperLink lnk = (HyperLink)row.FindControl("HyperLink1");
                if (hf.Value == "")
                {
                    lnk.Visible = false;
                }
                else
                {
                    lnk.Visible = true;
                }
            }
        }

        #endregion 

        #region Methods

        /// <summary>
        ///
        /// </summary>
        private void AddNotification()
        {
            try
            {
                if (Session["adminUser"] != null)
                {
                    userLogin objUser = (userLogin)Session["adminUser"];
                    
                    Notifications objData = new Notifications();
                    objData.AddNew();

                    objData.NotifierID = objUser.AdminID;
                    objData.NotificationText = ui_txtNotification.Text;
                    objData.Subject = ui_txtSubject.Text;

                    DateTime _notifyDate = ConvertDate.ConvertStringToDateCulture(ui_txtDate.Text);
                    objData.NotifyDate = _notifyDate;
                    //objData.NotifyDate = Convert.ToDateTime(ui_txtDate.Text);

                    objData.Save();

                    // Save File.
                    string savedFileName = SaveFile(objData.NotificationID);
                    objData.FilePath = savedFileName;
                    objData.Save();

                    ShowUploadedFile(savedFileName, objData.NotificationID);

                    ui_lb_msg.ForeColor = System.Drawing.Color.Green;
                    ui_lb_msg.Text = "The new record added successfully";

                    ResetFields();
                }
            }
            catch
            {
                ui_lb_msg.ForeColor = System.Drawing.Color.Red;
                ui_lb_msg.Text = "Problem while adding the new record";
            }
        }

        private string SaveFile(int NotificationID)
        {
            if (ui_fileUpload.HasFile)
            {
                string newFileName = NotificationID.ToString() + "_" + ui_fileUpload.FileName;
                string filepath = Server.MapPath(ConfigurationManager.AppSettings["NotificationsAttachementPath"].ToString()) + newFileName;
                ui_fileUpload.PostedFile.SaveAs(filepath);

                return ui_fileUpload.FileName;
            }
            return "";
        }

        private void ShowUploadedFile(string _filePath, int _notificationID)
        {
            if ((_filePath != null) && (_filePath != ""))
            {
                ui_hyprlnkUploadedFile.Visible = true;
                ui_hyprlnkUploadedFile.NavigateUrl = ConfigurationManager.AppSettings["NotificationsAttachementPath"].ToString() + _notificationID.ToString() + "_" + _filePath;
            }

        }

        private void ResetFields()
        {
            ui_drpCompanies.SelectedValue = "-1";
            ui_txtSubject.Text = "";
            ui_txtNotification.Text = "";
            ui_txtDate.Text = "";
            ui_lb_msg.Text = "";
        }

        private void BindNotifications()
        {
            if (Session["adminUser"] != null)
            {
                userLogin objUser = (userLogin)Session["adminUser"];
                v_GetAllNotifications objData = new v_GetAllNotifications();
                objData.GetNotificationsByUser(objUser.AdminID);
                ui_GvData.DataSource = objData.DefaultView;
                ui_GvData.DataBind();
            }
        }

        private void BindCompanies()
        {
            ListItem item = new ListItem(" --- Select All ----", "-1");

            // Bind Companies
            Companies objCompany = new Companies();
            objCompany.LoadAll();
            ui_drpCompanies.DataSource = objCompany.DefaultView;
            ui_drpCompanies.DataTextField = Companies.ColumnNames.CompNameEng;
            ui_drpCompanies.DataValueField = Companies.ColumnNames.CompanyID;
            ui_drpCompanies.DataBind();
            ui_drpCompanies.Items.Insert(0, item);

            ui_ddl_SearchCompany.DataSource = objCompany.DefaultView;
            ui_ddl_SearchCompany.DataTextField = Companies.ColumnNames.CompNameEng;
            ui_ddl_SearchCompany.DataValueField = Companies.ColumnNames.CompanyID;
            ui_ddl_SearchCompany.DataBind();
            ui_ddl_SearchCompany.Items.Insert(0, item);
        }

        #endregion

        protected void ui_lbtn_AddNotification_Click(object sender, EventArgs e)
        {
            uiPopupExtenderEdit1.Show();
        }

        protected void ui_ddl_SearchCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            userLogin objUser = (userLogin)Session["adminUser"];
            v_GetAllNotifications objData = new v_GetAllNotifications();
            objData.GetNotificationsByComp(objUser.AdminID, int.Parse(ui_ddl_SearchCompany.SelectedValue));
            ui_GvData.DataSource = objData.DefaultView;
            ui_GvData.DataBind();
        }

        

        

    }
}