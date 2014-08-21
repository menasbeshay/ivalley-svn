using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.DataModels;
using Data.Extensions;
using Data.Repositories;
using System.Configuration;

namespace Web.UI
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAboutUS();
                LoadProducts();
                LoadContact();
            }
        }

        private void LoadContact()
        {
            ContactRepository _conatcRepo = new ContactRepository();
            Contact _Contact = _conatcRepo.LoadById("1AD20BF6-FB40-4661-B3D3-F9FB2BB22077");
            lblContactPhone.Text = _Contact.Phone;
            lblContactFax.Text = _Contact.Fax;
            lblContactEmail.Text = _Contact.Email;
            lblContactAddress.Text = _Contact.Address;
            lblcontactWorkHours.Text = _Contact.WorkHours;

            lblemailmenu.Text = _Contact.Email;
            lblPhoneMenue.Text = _Contact.Phone;

        }

        private void LoadProducts()
        {
            ProductRepository _ProRepo = new ProductRepository();
            rptProducts.DataSource = _ProRepo.LoadByActiveState();
            rptProducts.DataBind();
        }

        private void LoadAboutUS()
        {

            PageSectionsRepository _rpoObj = new PageSectionsRepository();
            PageSection _PageSectionObjDefault = new PageSection();
            _PageSectionObjDefault = _rpoObj.LoadByLanguageIdAndIsDefault(true, "b5c66d73-b2fa-436d-817a-e5332af83934");

            lblAboutTitleDefault.Text = _PageSectionObjDefault.SectionTitle;
            lblAboutContentDefault.Text = _PageSectionObjDefault.SectionContent;
            //imgAboutDefault.ImageUrl = ConfigurationManager.AppSettings["Pages"].ToString() + _PageSectionObjDefault.ImageFile;

            //_PageSectionObjDefault = new PageSection();
            //_PageSectionObjDefault = _rpoObj.LoadById("8dd20d86-fdec-4c73-aab6-681a450d5057");
            //lblAboutTitle1.Text = _PageSectionObjDefault.SectionTitle;
            //lblAboutContent1.Text = _PageSectionObjDefault.SectionContent;

            //_PageSectionObjDefault = new PageSection();
            //_PageSectionObjDefault = _rpoObj.LoadById("f22f80bd-eb48-4dc7-b7f7-73b37ee1135c");
            //lblAboutTitle2.Text = _PageSectionObjDefault.SectionTitle;
            //lblAboutContent2.Text = _PageSectionObjDefault.SectionContent;


        }





    }
}