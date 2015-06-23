using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace TouchMediaGUI.usercontrols
{
    public partial class ucEditJO : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            Clients clients = new Clients();
            clients.LoadAll();
            uiDropDownListClient.DataSource = clients.DefaultView;
            uiDropDownListClient.DataTextField = Clients.ColumnNames.ClientName;
            uiDropDownListClient.DataValueField = Clients.ColumnNames.ClientID;
            uiDropDownListClient.DataBind();

            JobOrderStatus statuses = new JobOrderStatus();
            statuses.LoadAll();
            uiDropDownListJOStatus.DataSource = statuses.DefaultView;
            uiDropDownListJOStatus.DataTextField = JobOrderStatus.ColumnNames.JobOrderStatusNameAr;
            uiDropDownListJOStatus.DataValueField = JobOrderStatus.ColumnNames.JobOrderStatusID;
            uiDropDownListJOStatus.DataBind();

            GeneralLookup digitalItem = new GeneralLookup ();
            digitalItem.LoadByCategoryID(Category.DigitalPrintingType);
            uiCheckBoxListDigitalItem.DataSource = digitalItem.DefaultView;
            uiCheckBoxListDigitalItem.DataTextField = GeneralLookup.ColumnNames.Name;
            uiCheckBoxListDigitalItem.DataValueField = GeneralLookup.ColumnNames.GeneralLookupID;
            uiCheckBoxListDigitalItem.DataBind();

            GeneralLookup serviceType = new GeneralLookup();
            serviceType.LoadByCategoryID(Category.DigitalPrintingServiceType);
            uiCheckBoxListServiceType.DataSource = serviceType.DefaultView;
            uiCheckBoxListServiceType.DataTextField = GeneralLookup.ColumnNames.Name;
            uiCheckBoxListServiceType.DataValueField = GeneralLookup.ColumnNames.GeneralLookupID;
            uiCheckBoxListServiceType.DataBind();

            GeneralLookup digitalPrintingSupplier = new GeneralLookup();
            digitalPrintingSupplier.LoadByCategoryID(Category.DigitalPrintingSupplier);
            uiDropDownListDigitalPrintingSupplier.DataSource = digitalPrintingSupplier.DefaultView;
            uiDropDownListDigitalPrintingSupplier.DataTextField = GeneralLookup.ColumnNames.Name;
            uiDropDownListDigitalPrintingSupplier.DataValueField = GeneralLookup.ColumnNames.GeneralLookupID;
            uiDropDownListDigitalPrintingSupplier.DataBind();


            GeneralLookup paperType = new GeneralLookup();
            paperType.LoadByCategoryID(Category.OffsetPrintingPaperType);
            uiRadioButtonListPaperType.DataSource = paperType.DefaultView;
            uiRadioButtonListPaperType.DataTextField = GeneralLookup.ColumnNames.Name;
            uiRadioButtonListPaperType.DataValueField = GeneralLookup.ColumnNames.GeneralLookupID;
            uiRadioButtonListPaperType.DataBind();

            GeneralLookup GSM = new GeneralLookup();
            GSM.LoadByCategoryID(Category.OffsetPrintingGSM);
            uiRadioButtonListGSM.DataSource = GSM.DefaultView;
            uiRadioButtonListGSM.DataTextField = GeneralLookup.ColumnNames.Name;
            uiRadioButtonListGSM.DataValueField = GeneralLookup.ColumnNames.GeneralLookupID;
            uiRadioButtonListGSM.DataBind();

            GeneralLookup offsetPrintHouse = new GeneralLookup();
            offsetPrintHouse.LoadByCategoryID(Category.OffsetPrintingPrintHouse);
            uiDropDownListOffsetPrintHouse.DataSource = offsetPrintHouse.DefaultView;
            uiDropDownListOffsetPrintHouse.DataTextField = GeneralLookup.ColumnNames.Name;
            uiDropDownListOffsetPrintHouse.DataValueField = GeneralLookup.ColumnNames.GeneralLookupID;
            uiDropDownListOffsetPrintHouse.DataBind();

            GeneralLookup finishBy = new GeneralLookup();
            finishBy.LoadByCategoryID(Category.OffsetPrintingFinishingSupplier);
            uiDropDownListOffsetPrintingFinishingBy.DataSource = finishBy.DefaultView;
            uiDropDownListOffsetPrintingFinishingBy.DataTextField = GeneralLookup.ColumnNames.Name;
            uiDropDownListOffsetPrintingFinishingBy.DataValueField = GeneralLookup.ColumnNames.GeneralLookupID;
            uiDropDownListOffsetPrintingFinishingBy.DataBind();

            GeneralLookup offsetFinishType = new GeneralLookup();
            offsetFinishType.LoadByCategoryID(Category.OffsetPrintingFinishType);
            uiCheckBoxListOffsetFinishType.DataSource = offsetFinishType.DefaultView;
            uiCheckBoxListOffsetFinishType.DataTextField = GeneralLookup.ColumnNames.Name;
            uiCheckBoxListOffsetFinishType.DataValueField = GeneralLookup.ColumnNames.GeneralLookupID;
            uiCheckBoxListOffsetFinishType.DataBind();

        }
    }                            
}                                
