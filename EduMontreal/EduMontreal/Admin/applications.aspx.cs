using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;
using System.Collections;

namespace WebApplication.Admin
{
    public partial class applications : System.Web.UI.Page
    {
        public int CurrentApp 
        {
            get
            {
                if (Session["CurrentApp"] != null)
                    return (int)Session["CurrentApp"];
                else
                    return 0;
            }
            set
            {
                Session["CurrentApp"] = value;
            }        
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentAdminUser"] == null)
                {
                    Response.Redirect("adminlogin");
                }
                BindData();
                BindCheckBoxs();
                uiPanelAllApplications.Visible = true;
                uiPanelApplicationDetails.Visible = false;
            }
        }

        private void BindCheckBoxs()
        {
            TextItems docs = new TextItems();
            docs.Where.ItemType.Value = 1; // docs
            docs.Where.ItemType.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            docs.Query.Load();
            uiCheckBoxListMissingDocs.DataSource = docs.DefaultView;
            uiCheckBoxListMissingDocs.DataTextField = TextItems.ColumnNames.EnName;
            uiCheckBoxListMissingDocs.DataValueField = TextItems.ColumnNames.TextItemsID;
            uiCheckBoxListMissingDocs.DataBind();

            TextItems reasons = new TextItems();
            reasons.Where.ItemType.Value = 2; // reasons
            reasons.Where.ItemType.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            reasons.Query.Load();
            uiCheckBoxListRefusalReason.DataSource = reasons.DefaultView;
            uiCheckBoxListRefusalReason.DataTextField = TextItems.ColumnNames.EnName;
            uiCheckBoxListRefusalReason.DataValueField = TextItems.ColumnNames.TextItemsID;
            uiCheckBoxListRefusalReason.DataBind();
        }


        protected void uiGridViewAllApplications_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewAllApplications.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewAllApplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditApp")
            {
                CurrentApp = Convert.ToInt32(e.CommandArgument.ToString());
                BindApplicationData();
                uiPanelApplicationDetails.Visible = true;
                uiPanelAllApplications.Visible = false;
            }
        }


        private void BindData()
        {
            ApplicationData apps = new ApplicationData();
            apps.GetAllApplications();
            uiGridViewAllApplications.DataSource = apps.DefaultView;
            uiGridViewAllApplications.DataBind();

            apps.GetNotCompletedApplications();
            uiGridViewNotCompletedApplications.DataSource = apps.DefaultView;
            uiGridViewNotCompletedApplications.DataBind();
        }

        private void BindApplicationData()
        {
            ApplicationData app = new ApplicationData();
            app.LoadByPrimaryKey(CurrentApp);

            Course course = new Course();
            CourseLangauge lang = new CourseLangauge();
            if (!app.IsColumnNull("SelectedCourseID"))
                course.LoadByPrimaryKey(app.SelectedCourseID);
            if (course.RowCount > 0 && !course.IsColumnNull("CourseLangaugeID"))
                lang.LoadByPrimaryKey(course.CourseLangaugeID);

            uiImageMain.ImageUrl = ".." + app.RecentPhotoPath;
            uiLabelName.Text = app.FirstName + " " + app.FamilyName;
            uiLabelMail.Text = app.Email;
            if (course.RowCount > 0)
                uiLabelCourse.Text = course.CourseName;
            else
                uiLabelCourse.Text = "not selected";
            if(lang.RowCount > 0)
                uiLabelLang.Text = lang.Langauge;
            else
                uiLabelLang.Text = "not selected";

            ApplicationStatusHistory history = new ApplicationStatusHistory();
            history.GetApplicationStatusHistorybyApplicationDataID(CurrentApp);

            if (history.RowCount > 0 && (history.ApplicationStatusID == 4 || history.ApplicationStatusID == 5)) // Tuition  Fees - missing docs - refusal reasons
            {
                uiPanelFees.Visible = true;
                uiPanelMissingDocs.Visible = true;
                uiPanelRefusalReasons.Visible = true;
            }
            else
            {
                uiPanelFees.Visible = false;
                uiPanelMissingDocs.Visible = false;
                uiPanelRefusalReasons.Visible = false;
            }

            BindHistory();

            ApplicationStatus status = new ApplicationStatus();
            status.GetNextApplicationStatusApplicationDataID(CurrentApp);
            if(status.RowCount > 0)
                uiDropDownListStatus.DataSource = status.DefaultView;
            else if(history.RowCount > 0)
            {                
                ApplicationStatus next = new ApplicationStatus();
               
                status.LoadByPrimaryKey(history.ApplicationStatusID);
                
                next.Where.ParentStatusID.Value = status.ParentStatusID;
                next.Where.ParentStatusID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                next.Query.Load();
                uiDropDownListStatus.DataSource = next.DefaultView;
            }
            uiDropDownListStatus.DataTextField = ApplicationStatus.ColumnNames.Status;
            uiDropDownListStatus.DataValueField = ApplicationStatus.ColumnNames.ApplicationStatusID;
            uiDropDownListStatus.DataBind();
            uiDropDownListStatus.Items.Insert(0, new ListItem("select new status ... ", "0"));



        }

        private void BindHistory()
        {
            ApplicationData app = new ApplicationData();
            app.LoadByPrimaryKey(CurrentApp);

            ApplicationStatusHistory history = new ApplicationStatusHistory();
            history.GetApplicationStatusHistorybyApplicationDataID(app.ApplicationDataID);

            uiGridViewStatusHistory.DataSource = history.DefaultView;
            uiGridViewStatusHistory.DataBind();
        }

        protected void uiGridViewStatusHistory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView) e.Row.DataItem;
                GridView gvattachments = (GridView)e.Row.FindControl("uiGridViewAttachments");
                ApplicationAttachment attachments = new ApplicationAttachment();
                attachments.Where.ApplicationStatusID.Value = Convert.ToInt32(row["ApplicationStatusID"]);
                attachments.Where.ApplicationStatusID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                attachments.Where.ApplicationDataID.Value = Convert.ToInt32(row["ApplicationDataID"]);
                attachments.Where.ApplicationDataID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                attachments.Query.Load();

                gvattachments.DataSource = attachments.DefaultView;
                gvattachments.DataBind();

                GridView gvadminattachments = (GridView)e.Row.FindControl("uiGridViewAdminAttachments");
                AdminAttachment adminattachments = new AdminAttachment();
                adminattachments.Where.ApplicationStatusID.Value = Convert.ToInt32(row["ApplicationStatusID"]);
                adminattachments.Where.ApplicationStatusID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                adminattachments.Where.ApplicationDataID.Value = Convert.ToInt32(row["ApplicationDataID"]);
                adminattachments.Where.ApplicationDataID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                adminattachments.Query.Load();

                gvadminattachments.DataSource = adminattachments.DefaultView;
                gvadminattachments.DataBind();
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            CurrentApp = 0;
            uiPanelAllApplications.Visible = true;
            uiPanelApplicationDetails.Visible = false;
        }

        protected void uiLinkButtonPrint_Click(object sender, EventArgs e)
        {
            Response.Redirect("printapplication?AppDataID=" + CurrentApp.ToString());
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            if (uiDropDownListStatus.SelectedIndex != 0 || uiDropDownListStatus.SelectedIndex != -1)
            {
                ApplicationData app = new ApplicationData();
                app.LoadByPrimaryKey(CurrentApp);

                ApplicationStatusHistory history = new ApplicationStatusHistory();
                history.AddNew();
                history.StudentID = app.StudentID;
                history.ApplicationDataID = app.ApplicationDataID;
                history.StatusDate = DateTime.Now;
                history.StatusComment = uiTextBoxComment.Text;
                history.ApplicationStatusID = Convert.ToInt32(uiDropDownListStatus.SelectedValue);
                if (uiDropDownListStatus.SelectedValue == "7") // Tuition  Fees
                {
                    decimal fees = 0;
                    decimal.TryParse(uiTextBoxFees.Text, out fees);
                    history.TuitionFees = fees;
                }
                history.Save();

                EmailTemplates template = new EmailTemplates();
                template.GetTemplateByStatusID(history.ApplicationStatusID); 

                Student student = new Student ();
                student.LoadByPrimaryKey(app.StudentID);

                Course course = new Course();
                course.LoadByPrimaryKey(app.SelectedCourseID);

                CourseLangauge lang = new CourseLangauge();
                lang.LoadByPrimaryKey(course.CourseLangaugeID);
                if (template.RowCount > 0)
                {
                    try
                    {
                        MailMessage msg = new MailMessage();
                        string mail = ConfigurationManager.AppSettings["StatusEMail"];
                        string mailto = student.Email;
                        msg.To.Add(mailto);
                        msg.From = new MailAddress(mail);
                        msg.Subject = template.Subject.Replace('\r', ' ').Replace('\n', ' '); 
                        msg.IsBodyHtml = true;
                        msg.BodyEncoding = System.Text.Encoding.UTF8;

                        string missingDocs = "";
                        for (int i = 0; i < uiCheckBoxListMissingDocs.Items.Count; i++)
                        {
                            if (uiCheckBoxListMissingDocs.Items[i].Selected)
                            {
                                missingDocs += "<li>" + uiCheckBoxListMissingDocs.Items[i].Text + "</li>";
                            }
                        }

                        string refusalReasons = "";
                        for (int i = 0; i < uiCheckBoxListRefusalReason.Items.Count; i++)
                        {
                            if (uiCheckBoxListRefusalReason.Items[i].Selected)
                            {
                                refusalReasons += "<li>" + uiCheckBoxListRefusalReason.Items[i].Text + "</li>";
                            }
                        }

                        msg.Body = string.Format(Server.HtmlDecode(template.Body.Replace('\r', ' ').Replace('\n', ' ')), student.FirstName + " " + student.FamilyName, student.Email, course.CourseName + " - " + lang.Langauge, missingDocs , refusalReasons);

                        // attachments
                        if (Session["CurrentUploadedFiles"] != null)
                        {
                            Hashtable Files;
                            Files = (Hashtable)Session["CurrentUploadedFiles"];

                            if (Files.Count > 0)
                            {
                                AdminAttachment attachment = new AdminAttachment();
                                foreach (DictionaryEntry item in Files)
                                {
                                    msg.Attachments.Add(new Attachment(Server.MapPath("~" + item.Value.ToString())));                                    
                                    attachment.AddNew();
                                    attachment.ApplicationDataID = history.ApplicationDataID;
                                    attachment.ApplicationStatusID = history.ApplicationStatusID;
                                    attachment.AttachmentPath = item.Value.ToString();
                                    
                                }
                                attachment.Save();
                                Session["CurrentUploadedFiles"] = null;
                            }

                        }

                        if (history.ApplicationStatusID == 16 || history.ApplicationStatusID == 6) // application refused - refund policy attached 
                        {
                            msg.Attachments.Add(new Attachment(Server.MapPath("~/files/Refund_Policy_Agreement.pdf")));
                        }


                        SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);

                        client.UseDefaultCredentials = false;

                        client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["StatusMailpass"]);
                        client.Send(msg);
                        
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                }
                //BindHistory();
                BindApplicationData();
                BindData();
            }

        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentApp = 0;
            uiPanelAllApplications.Visible = true;
            uiPanelApplicationDetails.Visible = false;
        }
    }
}