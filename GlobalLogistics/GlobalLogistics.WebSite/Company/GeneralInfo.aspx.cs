using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Company
{
    public partial class GeneralInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Companies currentCompany = new Companies();
                currentCompany.GetCompanyByUserName(Page.User.Identity.Name);
                CompanyEnabledOptions options = new CompanyEnabledOptions();
                options.GetCompanyEnabledOptionsByCompanyID(currentCompany.CompanyID);
                ResetAllFields();
                for (int i = 0; i < options.RowCount; i++)
                {
                    switch (options.PackageOptionID)
                    {
                        case 1:
                            if (options.Enabled)
                            {
                                CompanyLogo.Attributes.Add("style", "display:block");
                                uiImageLogo.ImageUrl = currentCompany.LogoPath;
                            }
                            else
                            {
                                CompanyLogo.Attributes.Add("style", "display:none");
                            }
                            break;
                        case 7:
                            
                            if (options.Enabled)
                            {
                                CompanyWebsite.Attributes.Add("style", "display:block");
                                uiTextBoxWebSite.Text = currentCompany.WebSite;
                            }
                            else
                            {
                                CompanyWebsite.Attributes.Add("style", "display:none");
                            }
                            break;
                        case 8:
                            if (options.Enabled)
                            {
                                CompanyBranches.Attributes.Add("style", "display:block");
                                uiFCKeditorEnBranches.Value = Server.HtmlDecode(currentCompany.EnBranches);
                                uiFCKeditorArBranches.Value = Server.HtmlDecode(currentCompany.ArBranches);
                            }
                            else
                            {
                                CompanyBranches.Attributes.Add("style", "display:none");
                            }
                            break;
                        case 9:                                                    
                            if (options.Enabled)
                            {
                                CompanyMap.Attributes.Add("style", "display:block");
                                uiTextBoxMapURL.Text = Server.HtmlDecode(currentCompany.MapPath);
                            }
                            else
                            {
                                CompanyMap.Attributes.Add("style", "display:none");
                            }
                            break;
                        case 10:
                            if (options.Enabled)
                            {
                                CompanyAbout.Attributes.Add("style", "display:block");
                                uiFCKeditorEnAbout.Value = Server.HtmlDecode(currentCompany.EnAbout);
                                uiFCKeditorArAbout.Value = Server.HtmlDecode(currentCompany.ArAbout);
                            }
                            else
                            {
                                CompanyAbout.Attributes.Add("style", "display:none");
                            }
                            break;
                        case 15:                           
                            if (options.Enabled)
                            {
                                CompanyContacts.Attributes.Add("style", "display:block") ;
                                uiFCKeditorEnContacts.Value = Server.HtmlDecode(currentCompany.EnContact);
                                uiFCKeditorArContacts.Value = Server.HtmlDecode(currentCompany.ArContact);
                            }
                            else
                            {
                                CompanyContacts.Attributes.Add("style", "display:none");
                            }
                            break;                            
                        default:
                            break;
                    }
                   
                    
                    options.MoveNext();
                }

                uiTextBoxEnName.Text = currentCompany.EnName;
                uiTextBoxArName.Text = currentCompany.ArName;
                uiTextBoxEnAddress.Text = currentCompany.EnAddress;
                uiTextBoxArAddress.Text = currentCompany.ArAddress;
                uiTextBoxTele.Text = currentCompany.Tele;
                uiTextBoxFax.Text = currentCompany.Fax;
                uiTextBoxUserName.Text = currentCompany.UserName;

            }
        }

        private void ResetAllFields()
        {
            CompanyLogo.Attributes.Add("style", "display:none");
            CompanyWebsite.Attributes.Add("style", "display:none");
            CompanyBranches.Attributes.Add("style", "display:none");
            CompanyMap.Attributes.Add("style", "display:none");
            CompanyAbout.Attributes.Add("style", "display:none");
            CompanyContacts.Attributes.Add("style", "display:none");
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            Companies currentCompany = new Companies();
            currentCompany.GetCompanyByUserName(Page.User.Identity.Name);
            CompanyEnabledOptions options = new CompanyEnabledOptions();
            options.GetCompanyEnabledOptionsByCompanyID(currentCompany.CompanyID);

            currentCompany.EnName = uiTextBoxEnName.Text ;
            currentCompany.ArName = uiTextBoxArName.Text ;
            currentCompany.EnAddress = uiTextBoxEnAddress.Text;
            currentCompany.ArAddress = uiTextBoxArAddress.Text;
            currentCompany.Tele = uiTextBoxTele.Text ;
            currentCompany.Fax = uiTextBoxFax.Text;

            for (int i = 0; i < options.RowCount; i++)
            {
                switch (options.PackageOptionID)
                {
                    case 1:
                        if (options.Enabled)
                        {
                            if (uiFileUploadLogoPath.HasFile)
                            {
                                uiFileUploadLogoPath.SaveAs(Server.MapPath("~/FileUploads/Companies" + "/" + uiFileUploadLogoPath.FileName));
                                currentCompany.LogoPath = "/FileUploads/Companies" + "/" + uiFileUploadLogoPath.FileName;
                            }
                        }
                        break;
                    case 7:
                        if (options.Enabled)
                            currentCompany.WebSite = uiTextBoxWebSite.Text;
                        break;
                    case 8:                        
                        if (options.Enabled)
                        {
                            currentCompany.EnBranches = Server.HtmlEncode(uiFCKeditorEnBranches.Value);
                            currentCompany.ArBranches  = Server.HtmlEncode(uiFCKeditorArBranches.Value);
                        }
                        break;
                    case 9:                        
                        if (options.Enabled)
                            currentCompany.MapPath = Server.HtmlEncode(uiTextBoxMapURL.Text);
                        break;
                    case 10:                        
                        if (options.Enabled)
                        {
                            currentCompany.EnAbout = Server.HtmlEncode(uiFCKeditorEnAbout.Value);
                            currentCompany.ArAbout = Server.HtmlEncode(uiFCKeditorArAbout.Value);
                        }
                        break;
                    case 15:                        
                        if (options.Enabled)
                        {
                            currentCompany.EnContact = Server.HtmlEncode(uiFCKeditorEnContacts.Value);
                            currentCompany.ArContact = Server.HtmlEncode(uiFCKeditorArContacts.Value);
                        }
                        break;
                    default:
                        break;
                }


                options.MoveNext();
            }

            currentCompany.Save();
        }
    }
}