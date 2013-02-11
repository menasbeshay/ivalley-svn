using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;

namespace Obtravel
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
                    uiImageTourismList.ImageUrl = ds.Tables[0].Rows[0]["ImagePath"].ToString();
                    uiLabelTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                    uiLiteralBrief.Text = ds.Tables[0].Rows[0]["Brief"].ToString();
                    uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
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
                //uiRepeaterCurrentLists.DataSource = db.GetEnglishTourismlists(Convert.ToInt32(Session["TopPackage"].ToString()));
                //uiRepeaterCurrentLists.DataBind();


                uiDataListCurrentLists.DataSource = db.GetEnglishTourismlists(Convert.ToInt32(Session["TopPackage"].ToString()),false);
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

                msg.Body = " Name : " + uiDropDownListTitle.Text + " " + uiTextBoxName.Text;
                msg.Body += "<br/> Email : " + uiTextBoxEmail.Text;
                msg.Body += "<br/> Street : " + uiTextBoxStreet.Text;
                msg.Body += "<br/> City : " + uiTextBoxCity.Text;
                msg.Body += "<br/> Postal Code : " + uiTextBoxPostalCode.Text;
                msg.Body += "<br/> Country : " + uiTextBoxCountry.Text;
                msg.Body += "<br/> Telephone : " + uiTextBoxTelephone.Text;
                msg.Body += "<br/> Mobile : " + uiTextBoxMobile.Text;
                msg.Body += "<br/> Package Name : " + ds.Tables[0].Rows[0]["Title"].ToString();
                msg.Body += "<br/> Package Details : " + Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());

                msg.Body += "<br/> URL : " + Request.Url;
                
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