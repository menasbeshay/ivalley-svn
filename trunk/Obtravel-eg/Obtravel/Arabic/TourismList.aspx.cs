using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;  

namespace Obtravel.Arabic
{
    public partial class TourismList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["TID"] != null && !string.IsNullOrEmpty(Request.QueryString["TID"]))
                {
                    uiPanelAllLists.Visible = false;
                    uiPanelViewTourismList.Visible = true;
                    int id = Convert.ToInt32(Request.QueryString["TID"].ToString());
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetTourismlistContent(id);
                    uiImageTourismList.ImageUrl = ds.Tables[0].Rows[0]["arImagePath"].ToString();
                    uiLabelTitle.Text = ds.Tables[0].Rows[0]["arTitle"].ToString();
                    uiLiteralBrief.Text = ds.Tables[0].Rows[0]["arBrief"].ToString();
                    uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["arContent"].ToString());
                }
                else
                {
                    uiPanelAllLists.Visible = true;
                    uiPanelViewTourismList.Visible = false;
                    BindData();
                }
            }
            RegisterStartupScript("menu", "<script type='text/javascript'>$(\"#m3\").addClass(\"selected\");</script>");
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            if (Session["TopPackage"] != null && !string.IsNullOrEmpty(Session["TopPackage"].ToString()))
            {
                uiDataListCurrentLists.DataSource = db.GetArabicTourismlists(Convert.ToInt32(Session["TopPackage"].ToString()),false);
                uiDataListCurrentLists.DataBind();
            }
            else
            {

                Response.Redirect("Packages.aspx");
            }
        }

        protected void uiLinkButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(Request.QueryString["TID"].ToString());
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetTourismlistContent(id);

                MailMessage msg = new MailMessage();
                DataSet to = db.GetAllMails();
                foreach (DataRow item in to.Tables[0].Rows)
                {
                    msg.To.Add(item["Email"].ToString());
                }

                //msg.To.Add("wezamena@yahoo.com");
                msg.From = new MailAddress("info@obtravel-eg.com");
                //msg.From = new MailAddress("mena.samy@gmail.com");

                msg.Subject = " Email from booking page";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = " الإسم : " + uiDropDownListTitle.Text + " " + uiTextBoxName.Text;
                msg.Body += "<br/> البريد الإلكترونى : " + uiTextBoxEmail.Text;
                msg.Body += "<br/> الشارع : " + uiTextBoxStreet.Text;
                msg.Body += "<br/> المدينة : " + uiTextBoxCity.Text;
                msg.Body += "<br/> الرقم البريدى : " + uiTextBoxPostalCode.Text;
                msg.Body += "<br/> البلد : " + uiTextBoxCountry.Text;
                msg.Body += "<br/> التليفون : " + uiTextBoxTelephone.Text;
                msg.Body += "<br/> الموبايل : " + uiTextBoxMobile.Text;
                msg.Body += "<br/> إسم الرحلة : " + ds.Tables[0].Rows[0]["Title"].ToString();
                msg.Body += "<br/> تفاصيل  الرحلة : " + Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());

                msg.Body += "<br/> الرابط على الموقع : " + Request.Url;

                SmtpClient client = new SmtpClient("mail.obtravel-eg.com", 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                //client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential("info@obtravel-eg.com", "obtravelmail");
                //client.Credentials = new System.Net.NetworkCredential("mena.samy@gmail.com", "********");
                client.Send(msg);
                uiLabelMessage.Visible = true;          
            }
            catch (Exception ex)
            {
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = ex.Message;
            }
        }
    }
}