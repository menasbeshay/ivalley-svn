using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Arabic
{
    public partial class CompanyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int compId = 0;
                if (Request.QueryString["cid"] != null)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["cid"].ToString()))
                    {
                        try
                        {
                            compId = Convert.ToInt32(Request.QueryString["cid"].ToString());
                        }
                        catch (Exception ex)
                        {
                            compId = 0;
                        }
                    }
                }

                if (compId == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    Companies current = new Companies();
                    current.LoadByPrimaryKey(compId);
                    
                    uiLabelCompanyName.Text = current.ArName;

                    Categories cat = new Categories();
                    cat.LoadByPrimaryKey(current.CategoryID);
                    SubCategories subcat = new SubCategories();
                    subcat.LoadByPrimaryKey(current.SubCategoryID);

                    string path = "";
                    if (cat.RowCount > 0)
                        path += cat.ArName;
                    if (subcat.RowCount > 0)
                        path += " -> " + subcat.ArName;

                    Master.Page.Title += "جلوبال لوجيستيك" + " -> " + path + " -> " + current.ArName;
                    uiLabelPath.Text = path + " ->";

                    CompanyEnabledOptions options = new CompanyEnabledOptions();
                    options.GetCompanyEnabledOptionsByCompanyID(compId);

                    for (int i = 0; i < options.RowCount; i++)
                    {
                        switch (options.PackageOptionID)
                        {

                            case 7:
                                if (options.Enabled)
                                {
                                    LIWebsite.Attributes.Add("style", "display:block");
                                    uiHyperLinkWebsite.Text = current.WebSite;
                                    uiHyperLinkWebsite.NavigateUrl = current.WebSite;
                                    CompanyTabs_12.Attributes.Add("style", "display:block");
                                }
                                else
                                {
                                    LIWebsite.Attributes.Add("style", "display:none");
                                    CompanyTabs_12.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 8:
                                if (options.Enabled)
                                {
                                    LIBranch.Attributes.Add("style", "display:block");
                                    CompanyTabs_2.Attributes.Add("style", "display:block");
                                    uiLiteralBranches.Text = Server.HtmlDecode(current.ArBranches);
                                }
                                else
                                {
                                    CompanyTabs_2.Attributes.Add("style", "display:none");
                                    LIBranch.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 9:
                                if (options.Enabled)
                                {
                                    LIMap.Attributes.Add("style", "display:block");
                                    CompanyTabs_3.Attributes.Add("style", "display:block");
                                    uiLiteralMap.Text = Server.HtmlDecode(current.MapPath);
                                }
                                else
                                {
                                    LIMap.Attributes.Add("style", "display:none");
                                    CompanyTabs_3.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 10:
                                if (options.Enabled)
                                {
                                    CompanyTabs_1.Attributes.Add("style", "display:block");
                                    LIAbout.Attributes.Add("style", "display:block");
                                    uiLiteralAbout.Text = Server.HtmlDecode(current.ArAbout);
                                }
                                else
                                {
                                    LIAbout.Attributes.Add("style", "display:none");
                                    CompanyTabs_1.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 11:
                                if (options.Enabled)
                                {
                                    CompanyTabs_5.Attributes.Add("style", "display:block");
                                    LIOffers.Attributes.Add("style", "display:block");
                                    Services offers = new Services();
                                    offers.GetServicesByCompanyIDAndTypeID(current.CompanyID, 1);
                                    if (offers.RowCount > 0)
                                    {
                                        uiRepeaterOffers.DataSource = offers.DefaultView;
                                        uiRepeaterOffers.DataBind();
                                    }
                                    else
                                    {
                                        uiLiteralOffers.Text = "لا توجد عروض.";
                                    }
                                }
                                else
                                {
                                    LIOffers.Attributes.Add("style", "display:none");
                                    CompanyTabs_5.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 12:
                                if (options.Enabled)
                                {
                                    CompanyTabs_6.Attributes.Add("style", "display:block");
                                    LIRequests.Attributes.Add("style", "display:block");
                                    Services requests = new Services();
                                    requests.GetServicesByCompanyIDAndTypeID(current.CompanyID, 6);
                                    if (requests.RowCount > 0)
                                    {
                                        uiRepeaterRequests.DataSource = requests.DefaultView;
                                        uiRepeaterRequests.DataBind();
                                    }
                                    else
                                    {
                                        uiLiteralRequests.Text = "لا توجد طلبات.";
                                    }
                                }
                                else
                                {
                                    LIRequests.Attributes.Add("style", "display:none");
                                    CompanyTabs_6.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 13:
                                if (options.Enabled)
                                {
                                    CompanyTabs_7.Attributes.Add("style", "display:block");
                                    LIJobs.Attributes.Add("style", "display:block");
                                    Services jobs = new Services();
                                    jobs.GetServicesByCompanyIDAndTypeID(current.CompanyID, 3);
                                    if (jobs.RowCount > 0)
                                    {
                                        uiRepeaterJobs.DataSource = jobs.DefaultView;
                                        uiRepeaterJobs.DataBind();
                                    }
                                    else
                                    {
                                        uiLiteralJobs.Text = "لا توجد وظائف.";
                                    }
                                }
                                else
                                {
                                    LIJobs.Attributes.Add("style", "display:none");
                                    CompanyTabs_7.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 14:
                                if (options.Enabled)
                                {
                                    CompanyTabs_4.Attributes.Add("style", "display:block");
                                    LIServices.Attributes.Add("style", "display:block");
                                    Services services = new Services();
                                    services.GetServicesByCompanyIDAndTypeID(current.CompanyID, 7);
                                    if (services.RowCount > 0)
                                    {
                                        uiRepeaterService.DataSource = services.DefaultView;
                                        uiRepeaterService.DataBind();
                                    }
                                    else
                                    {
                                        uiLiteralServices.Text = "لا توجد خدمات.";
                                    }
                                }
                                else
                                {
                                    LIServices.Attributes.Add("style", "display:none");
                                    CompanyTabs_4.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 15:
                                if (options.Enabled)
                                {
                                    LIContacts.Attributes.Add("style", "display:block");
                                    CompanyTabs_11.Attributes.Add("style", "display:block");
                                    uiLiteralContacts.Text = Server.HtmlDecode(current.ArContact);
                                }
                                else
                                {
                                    LIContacts.Attributes.Add("style", "display:none");
                                    CompanyTabs_11.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 17:
                                if (options.Enabled)
                                {
                                    LIPic.Attributes.Add("style", "display:block");
                                    CompanyTabs_8.Attributes.Add("style", "display:block");
                                    Photos pics = new Photos();
                                    pics.GetPhotosByCompanyID(current.CompanyID);
                                    uiDataListPhotos.DataSource = pics.DefaultView;
                                    uiDataListPhotos.DataBind();
                                }
                                else
                                {
                                    LIPic.Attributes.Add("style", "display:none");
                                    CompanyTabs_8.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 16:
                                if (options.Enabled)
                                {
                                    LIVideos.Attributes.Add("style", "display:block");
                                    CompanyTabs_9.Attributes.Add("style", "display:block");
                                    Vedios Videos = new Vedios();
                                    Videos.GetVedioByCompanyID(current.CompanyID);
                                    uiDataListVideos.DataSource = Videos.DefaultView;
                                    uiDataListVideos.DataBind();
                                }
                                else
                                {
                                    LIVideos.Attributes.Add("style", "display:none");
                                    CompanyTabs_9.Attributes.Add("style", "display:none");
                                }
                                break;
                            case 19:
                                if (options.Enabled)
                                {
                                    LISchedule.Attributes.Add("style", "display:block");
                                    CompanyTabs_10.Attributes.Add("style", "display:block");
                                    if (!string.IsNullOrEmpty(current.SchedulePath))
                                        uiLiteralSchedule.Text = "<a href='" + current.SchedulePath + "' >إضغط هنا لتحميل الجدول الملاحى</a>";
                                    else
                                        uiLiteralSchedule.Text = "لا يوجد جدول ملاحى.";
                                }
                                else
                                {
                                    LISchedule.Attributes.Add("style", "display:none");
                                    CompanyTabs_10.Attributes.Add("style", "display:none");
                                }
                                break;
                            default:
                                break;
                        }


                        options.MoveNext();
                    }
                }
            }
        }
    }
}