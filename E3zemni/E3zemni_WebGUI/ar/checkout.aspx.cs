using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;
using System.Data;
using System.Net.Mail;
using System.Configuration;

namespace E3zemni_WebGUI.ar
{
    public partial class checkout : System.Web.UI.Page
    {

        public int EnverlopID
        {
            get
            {
                if (Request.QueryString["eid"] != null)
                {
                    try
                    {
                        return int.Parse(Request.QueryString["eid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        return 0;
                    }

                }
                else
                {
                    return 0;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserPayment"] != null)
                {
                    BindOrder();
                }
            }
        }

        private void BindOrder()
        {
            UserPayement order = new UserPayement();
            order = (UserPayement)Session["UserPayment"];
            uiRepeaterOrder.DataSource = order.DefaultView;
            uiRepeaterOrder.DataBind();
        }

        protected void uiRepeaterOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {                
                Image envelop = (Image)e.Item.FindControl("uiImageEnvelop");
                DataRowView row = (DataRowView)e.Item.DataItem;
                if (EnverlopID != 0)
                {
                    Envelops envelopTemp = new Envelops();
                    envelopTemp.LoadByPrimaryKey(Convert.ToInt32(row["EnvelopID"].ToString()));
                    envelop.ImageUrl = ".." + envelopTemp.ImagePath;
                }

                
            }
        }

        protected void uiLinkButtonCheckout_Click(object sender, EventArgs e)
        {
            UserPayement order = new UserPayement();
            order = (UserPayement)Session["UserPayment"];

            foreach (RepeaterItem dli in uiRepeaterOrder.Items)
            {
                if (dli.ItemType == ListItemType.Item || dli.ItemType == ListItemType.AlternatingItem)
                {                    
                    TextBox CQty = (TextBox)dli.FindControl("uiTextBoxQty");
                    TextBox EQty = (TextBox)dli.FindControl("uiTextBoxQty");

                    order.EnvelopCount =  !string.IsNullOrEmpty(EQty.Text) ? Convert.ToInt32(EQty.Text) : 0;
                    order.CardCount = !string.IsNullOrEmpty(CQty.Text) ? Convert.ToInt32(CQty.Text) : 0;                    
                }
            }

            Session["UserPayment"] = order;

            


            if (Session["CurrentUser"] != null)
            {
                UserInfo user = (UserInfo)Session["CurrentUser"];
                MailMessage msg = new MailMessage();
                if (Session["Order_Mail"] != null)
                {
                    msg = (MailMessage)Session["Order_Mail"];
                    msg.Body = " user name : " + user.UserName + " <br /> Email: " + user.Email + "<br />" + msg.Body;
                    string mail = ConfigurationManager.AppSettings["mail"];
                    string mailto = ConfigurationManager.AppSettings["mailto"];
                    msg.To.Add(mailto);
                    msg.From = new MailAddress(mail);
                    msg.Subject = " New order ";
                    SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                    client.UseDefaultCredentials = false;

                    client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                    client.Send(msg);
                    Response.Redirect("Success.aspx");
                }
                /*order.UserID = user.UserID;
                order.Save();
                Session["UserPayment"] = null;
                Response.Redirect("~/ar/browse.aspx");*/
            }
            else
            {
                Response.Redirect("~/ar/login.aspx?url=checkout.aspx");
            }
        }
    }
}