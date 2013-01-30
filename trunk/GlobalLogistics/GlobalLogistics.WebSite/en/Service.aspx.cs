using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
namespace GlobalLogistics.WebSite
{
    public partial class Service : System.Web.UI.Page
    {
        #region properties
        public string Type 
        {
            get
            {
                if (Request.QueryString["T"] != null)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["T"].ToString()))
                    {
                        return Request.QueryString["T"].ToString();
                    }
                    else
                    {
                        return null;
                    }
                }
                else
                {
                    return null;
                }
            }
            
        }

        public int ServiceID
        {
            get
            {
                if (Request.QueryString["sid"] != null)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["sid"].ToString()))
                    {
                        return Convert.ToInt32(Request.QueryString["sid"].ToString());
                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    return  0;
                }
            }

        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Type != null)
                {
                    switch (Type)
                    {
                        case "req":
                            uiPanelRequests.Visible = true;
                            uiPanelOffers.Visible = false;
                            uiPanelJobs.Visible = false;
                            uiPanelServices.Visible = false;
                            uiLabelTypeName.Text = "Requests";
                            BindRequests();
                            break;
                        case "off":
                            uiPanelRequests.Visible = false;
                            uiPanelOffers.Visible = true;
                            uiPanelJobs.Visible = false;
                            uiPanelServices.Visible = false;
                            uiLabelTypeName.Text = "Offers";
                            BindOffers();
                            break;
                        case "job":
                            uiPanelRequests.Visible = false;
                            uiPanelOffers.Visible = false;
                            uiPanelJobs.Visible = true;
                            uiPanelServices.Visible = false;
                            uiLabelTypeName.Text = "Jobs";
                            BindJobs();
                            break;
                        case "ser":
                            uiPanelRequests.Visible = false;
                            uiPanelOffers.Visible = false;
                            uiPanelJobs.Visible = false;
                            uiPanelServices.Visible = true;
                            uiLabelTypeName.Text = "Services";
                            BindServices();
                            break;
                        default:
                            break;
                    }
                }
            }
        }

        #region Methods

        private void BindServices()
        {
            if (ServiceID == 0)
            {
                Services objSer = new Services();
                objSer.GetServicesByType(7);
                uiRepeaterService.DataSource = objSer.DefaultView;
                uiRepeaterService.DataBind();
                uiRepeaterService.Visible = true;
                uiLiteralServices.Visible = false;
            }
            else
            {
                Services objSer = new Services();
                objSer.LoadByPrimaryKey(ServiceID);
                uiLiteralServices.Text = Server.HtmlDecode(objSer.EnDescription);                
                uiRepeaterService.Visible = false;
                uiLiteralServices.Visible = true;
            }
        }

        private void BindJobs()
        {
            if (ServiceID == 0)
            {
                Services objSer = new Services();
                objSer.GetServicesByType(3);
                uiRepeaterJobs.DataSource = objSer.DefaultView;
                uiRepeaterJobs.DataBind();
                uiLiteralJobs.Visible = false;
                uiRepeaterJobs.Visible = true;
            }
            else
            {
                Services objSer = new Services();
                objSer.LoadByPrimaryKey(ServiceID);
                uiLiteralJobs.Text = Server.HtmlDecode(objSer.EnDescription);
                uiRepeaterJobs.Visible = false;
                uiLiteralJobs.Visible = true;
            }
        }

        private void BindOffers()
        {
            if (ServiceID == 0)
            {
                Services objSer = new Services();
                objSer.GetServicesByType(1);
                uiRepeaterOffers.DataSource = objSer.DefaultView;
                uiRepeaterOffers.DataBind();
                uiLiteralOffers.Visible = false;
                uiRepeaterOffers.Visible = true;
            }
            else
            {
                Services objSer = new Services();
                objSer.LoadByPrimaryKey(ServiceID);
                uiLiteralOffers.Text = Server.HtmlDecode(objSer.EnDescription);
                uiRepeaterOffers.Visible = false;
                uiLiteralOffers.Visible = true;
            }
        }

        private void BindRequests()
        {
            if (ServiceID == 0)
            {
                Services objSer = new Services();
                objSer.GetServicesByType(6);
                uiRepeaterRequests.DataSource = objSer.DefaultView;
                uiRepeaterRequests.DataBind();
                uiLiteralRequests.Visible = false;
                uiRepeaterRequests.Visible = true;
            }
            else
            {
                Services objSer = new Services();
                objSer.LoadByPrimaryKey(ServiceID);
                uiLiteralRequests.Text = Server.HtmlDecode(objSer.EnDescription);
                uiRepeaterRequests.Visible = false;
                uiLiteralRequests.Visible = true;
            }
        }

       
        #endregion
    }
}