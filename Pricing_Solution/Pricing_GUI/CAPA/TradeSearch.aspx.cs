using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pricing.BLL;
using System.Configuration;
using System.Data;

namespace PricingGUI
{
    public partial class TradeSearch : System.Web.UI.Page
    {
        #region Properties

        public int TradePriceID
        {
            get
            {
                if (Request.QueryString["ID"] != null && Request.QueryString["ID"].ToString() != "")
                {
                    Session["TradePriceID"] = Request.QueryString["ID"].ToString();
                }

                if (Session["TradePriceID"] != null)
                {
                    return Int32.Parse(Session["TradePriceID"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["TradePriceID"] = value;
            }
        }

        public bool IsUpdateMode
        {
            get
            {
                if (Request.QueryString["ID"] != null && Request.QueryString["ID"].ToString() != "")
                {
                    return true;
                }
                return false;
            }
        }

        #endregion
        
        #region MainDataTab

        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindDropDownListsData();                
                ui_lblResult.Text = "";
                ui_TabGenericInfo.Enabled = false;
                uiTabBeforeCommitte.Enabled = false;
                uiTabPanelAfterCommitte.Enabled = false;
                uiTabPanelStatus.Enabled = false;
                Session["PopUpType"] = "AddNewGeneric";
                ui_btnSave.Text = "Add Main Data";
                RequiredFieldValidator10.Visible = true;

                if (IsUpdateMode)
                {
                    ui_TabGenericInfo.Enabled = true;
                    uiTabBeforeCommitte.Enabled = true;
                    uiTabPanelAfterCommitte.Enabled = true;
                    uiTabPanelStatus.Enabled = true;
                    BindMainData();
                    LoadQuantityUnit();
                    LoadGeneric();
                    BindStatusHistory();
                    ValidateAndBindStatus();
                    ui_btnSave.Text = "Update Main Data";
                    RequiredFieldValidator10.Visible = false;

                    if (Request.QueryString["type"] == "new")
                    {
                        ui_TabContainerSearch.ActiveTab = ui_TabGenericInfo;
                    }
                    else
                    {
                        ui_TabContainerSearch.ActiveTab = ui_MainData;
                    }

                }
            }
            
        }

        protected void ui_btnSave_Click(object sender, EventArgs e)
        {
            if (IsUpdateMode)
            {
                UpdatePricingRequest();
            }
            else
            {
                SavePricingRequest();
            }
        }

        protected void ui_drpFileType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ui_drpFileType.SelectedItem.Text == "Imported")
            {
                LocalTR.Visible = false;
                ImportedTR.Visible = true;
            }
            else
            {
                LocalTR.Visible = true;
                ImportedTR.Visible = false;
            }
        }
        
        protected void ui_btn_Click_Click(object sender, EventArgs e)
        {
            ResetFields();
        }

        #endregion 

        #region Methods

        /// <summary>
        /// Load data for all drop down lists.
        /// </summary>
        private void BindDropDownListsData()
        {
            ListItem item = new ListItem(" --- Select ----", "-1");

            // Bind Companies
            Companies objCompany = new Companies();
            objCompany.LoadAll();
            ui_drpCompanies.DataSource = objCompany.DefaultView;
            ui_drpCompanies.DataTextField = Companies.ColumnNames.CompNameEng;
            ui_drpCompanies.DataValueField = Companies.ColumnNames.CompanyID;
            ui_drpCompanies.DataBind();
            ui_drpCompanies.Items.Insert(0, item);

            // Bind Manufactures.
            ui_drpManufactures.DataSource = objCompany.DefaultView;
            ui_drpManufactures.DataTextField = Companies.ColumnNames.CompNameEng;
            ui_drpManufactures.DataValueField = Companies.ColumnNames.CompanyID;
            ui_drpManufactures.DataBind();
            ui_drpManufactures.Items.Insert(0, item);


            // Bind Dosage Forms 
            Dosage_form objDosageForm = new Dosage_form();
            objDosageForm.LoadAll();
            ui_drpDosageForm.DataSource = objDosageForm.DefaultView;
            ui_drpDosageForm.DataTextField = Dosage_form.ColumnNames.Dosage_form;
            ui_drpDosageForm.DataValueField = Dosage_form.ColumnNames.DosageFormID;
            ui_drpDosageForm.DataBind();
            ui_drpDosageForm.Items.Insert(0, item);

            // Bind Registeration_Committee_Type
            Registeration_Committee_Type objCommitteType = new Registeration_Committee_Type();
            objCommitteType.LoadAll();
            ui_drpCommitteType.DataSource = objCommitteType.DefaultView;
            ui_drpCommitteType.DataTextField = Registeration_Committee_Type.ColumnNames.CommitteType;
            ui_drpCommitteType.DataValueField = Registeration_Committee_Type.ColumnNames.ID;
            ui_drpCommitteType.DataBind();
            ui_drpCommitteType.Items.Insert(0, item);

            uiDropDownListCommitterType_Before.DataSource = objCommitteType.DefaultView;
            uiDropDownListCommitterType_Before.DataTextField = Registeration_Committee_Type.ColumnNames.CommitteType;
            uiDropDownListCommitterType_Before.DataValueField = Registeration_Committee_Type.ColumnNames.ID;
            uiDropDownListCommitterType_Before.DataBind();
            uiDropDownListCommitterType_Before.Items.Insert(0, item);

            //License Type
            TradePricingLicenseType licenseTypes = new TradePricingLicenseType();
            licenseTypes.LoadAll();
            uiDropDownListLicenseType.DataSource = licenseTypes.DefaultView;
            uiDropDownListLicenseType.DataTextField = TradePricingLicenseType.ColumnNames.Name;
            uiDropDownListLicenseType.DataValueField = TradePricingLicenseType.ColumnNames.TradePricingLicenseTypeID;
            uiDropDownListLicenseType.DataBind();
            uiDropDownListLicenseType.Items.Insert(0, item);

            //status Type
            TradePricingStatus statusTypes = new TradePricingStatus();
            statusTypes.LoadAll();
            uiDropDownListStatusType.DataSource = statusTypes.DefaultView;
            uiDropDownListStatusType.DataTextField = TradePricingStatus.ColumnNames.Name;
            uiDropDownListStatusType.DataValueField = TradePricingStatus.ColumnNames.TradePricingStatusID;
            uiDropDownListStatusType.DataBind();
            uiDropDownListStatusType.Items.Insert(0, item);

            //sector Type
            SectorType sectorTypes = new SectorType();
            sectorTypes.LoadAll();
            uiDropDownListSectorType.DataSource = sectorTypes.DefaultView;
            uiDropDownListSectorType.DataTextField = SectorType.ColumnNames.Name;
            uiDropDownListSectorType.DataValueField = SectorType.ColumnNames.SectorTypeID;
            uiDropDownListSectorType.DataBind();
            uiDropDownListSectorType.Items.Insert(0, item);

            // Bind File Types
            FileType objFileTypes = new FileType();
            objFileTypes.LoadAll();
            ui_drpFileType.DataSource = objFileTypes.DefaultView;
            ui_drpFileType.DataTextField = FileType.ColumnNames.FileType;
            ui_drpFileType.DataValueField = FileType.ColumnNames.FileTypeID;

            ui_drpFileType.DataBind();
            //ui_drpFileType.Items.Insert(0, item);

        }

        /// <summary>
        /// Saving new pricing request
        /// </summary>
        private void SavePricingRequest()
        {
            try
            {
                TradePricing objPricing = new TradePricing();

                objPricing.AddNew();

                objPricing.CompanyID = Int32.Parse(ui_drpCompanies.SelectedValue);
                objPricing.ManufactureID = Int32.Parse(ui_drpManufactures.SelectedValue);
                objPricing.TradeName = ui_txtTradeName.Text;
                objPricing.SubmissionDate = ui_txtSubmissionDate.Text;
                objPricing.CompanyPrice = float.Parse(ui_txtPrice.Text);
                objPricing.DosageFormID = Int32.Parse(ui_drpDosageForm.SelectedValue);
                objPricing.RegistrationCommitteTypeID = Int32.Parse(ui_drpCommitteType.SelectedValue);
                objPricing.Pack = ui_txtPack.Text;
                objPricing.FileNo = ui_txtFileNo.Text;
                objPricing.FileTypeID = Int32.Parse(ui_drpFileType.SelectedValue);
                objPricing.PricingStatusID = 1;
                objPricing.ImportedManufacture = ui_txtImportedManufacture.Text;
                //TODO: Save File to disk and save it's path.
                objPricing.FilePath = "";

                objPricing.Save();

                // Save File.
                string savedFileName = SaveFile(objPricing.TradePricingID);
                objPricing.FilePath = savedFileName;
                objPricing.Save();

                ShowUploadedFile(savedFileName, objPricing.TradePricingID);

                ui_lblResult.ForeColor = System.Drawing.Color.Green;
                ui_lblResult.Text = "The new record saved successfully";

                Response.Redirect("TradeSearch.aspx?ID=" + objPricing.TradePricingID + "&type=new");

            }
            catch
            {
                ui_lblResult.ForeColor = System.Drawing.Color.Red;
                ui_lblResult.Text = "Problem while saving the new record";
            }
        }

        /// <summary>
        /// Update pricing request
        /// </summary>
        private void UpdatePricingRequest()
        {
            try
            {
                TradePricing objPricing = new TradePricing();

                objPricing.LoadByPrimaryKey(TradePriceID);

                objPricing.CompanyID = Int32.Parse(ui_drpCompanies.SelectedValue);
                objPricing.ManufactureID = Int32.Parse(ui_drpManufactures.SelectedValue);
                objPricing.TradeName = ui_txtTradeName.Text;
                objPricing.SubmissionDate = ui_txtSubmissionDate.Text;
                objPricing.CompanyPrice = float.Parse(ui_txtPrice.Text);
                objPricing.DosageFormID = Int32.Parse(ui_drpDosageForm.SelectedValue);
                objPricing.RegistrationCommitteTypeID = Int32.Parse(ui_drpCommitteType.SelectedValue);
                objPricing.Pack = ui_txtPack.Text;
                objPricing.FileNo = ui_txtFileNo.Text;
                objPricing.FileTypeID = Int32.Parse(ui_drpFileType.SelectedValue);
                objPricing.PricingStatusID = 1;
                objPricing.ImportedManufacture = ui_txtImportedManufacture.Text;
                //TODO: Save File to disk and save it's path.
               

                objPricing.Save();

                // Save File.
                string savedFileName = SaveFile(objPricing.TradePricingID);
                objPricing.FilePath = savedFileName;
                objPricing.Save();

                ShowUploadedFile(savedFileName, objPricing.TradePricingID);
                

                ui_lblResult.ForeColor = System.Drawing.Color.Green;
                ui_lblResult.Text = "The record updated successfully";

            }
            catch
            {
                ui_lblResult.ForeColor = System.Drawing.Color.Red;
                ui_lblResult.Text = "Problem while saving the record";
            }
        }

        private string SaveFile(int pricingRequestID)
        {
            if (ui_fileUpload.HasFile)
            {
                string newFileName = pricingRequestID.ToString() + "_" + ui_fileUpload.FileName;
                string filepath = Server.MapPath(ConfigurationManager.AppSettings["AttachementPath"].ToString()) + newFileName;
                ui_fileUpload.PostedFile.SaveAs(filepath);

                return ui_fileUpload.FileName;
            }
            return "";
        }

        private void ShowUploadedFile(string _filePath, int _priceID)
        {
            if ((_filePath != null) && (_filePath != ""))
            {
                ui_hyprlnkUploadedFile.Visible = true;
                ui_hyprlnkUploadedFile.NavigateUrl = ConfigurationManager.AppSettings["AttachementPath"].ToString() + _priceID.ToString() + "_" + _filePath;
            }

        }

        private void ResetFields()
        {
            ui_txtTradeName.Text = "";
            ui_drpCompanies.SelectedValue = "0";
            ui_drpManufactures.SelectedValue = "0";
            ui_txtSubmissionDate.Text = "";
            ui_txtPrice.Text = "";
            ui_drpDosageForm.SelectedValue = "0";
            ui_drpCommitteType.SelectedValue = "0";
            ui_txtPack.Text = "";
            ui_txtFileNo.Text = "";
            ui_drpFileType.SelectedValue = "0";
        }

        private void BindMainData()
        {
            TradePricing objPricing = new TradePricing();

            objPricing.LoadByPrimaryKey(TradePriceID);

            ui_drpCompanies.SelectedValue = objPricing.s_CompanyID;
            ui_drpManufactures.SelectedValue = objPricing.s_ManufactureID;
            ui_txtTradeName.Text = objPricing.TradeName;
            ui_txtSubmissionDate.Text = objPricing.SubmissionDate;
            ui_txtPrice.Text = objPricing.s_CompanyPrice;
            ui_drpDosageForm.SelectedValue = objPricing.s_DosageFormID;
            ui_drpCommitteType.SelectedValue = objPricing.s_RegistrationCommitteTypeID;
            ui_txtPack.Text = objPricing.Pack;
            ui_txtFileNo.Text = objPricing.FileNo;
            ui_drpFileType.SelectedValue = objPricing.s_FileTypeID;
            ui_txtImportedManufacture.Text = objPricing.ImportedManufacture;


            // before commitee
            if (!objPricing.IsColumnNull("RegistrationCommitteTypeID"))
                uiDropDownListCommitterType_Before.SelectedValue = objPricing.RegistrationCommitteTypeID.ToString();
            if (!objPricing.IsColumnNull("TradePricingStatusID"))
                uiDropDownListStatusType.SelectedValue = objPricing.TradePricingStatusID.ToString();
            if (!objPricing.IsColumnNull("TradePricingLicenseTypeID"))
                uiDropDownListLicenseType.SelectedValue = objPricing.TradePricingLicenseTypeID.ToString();

            uiTextBoxBeforeRegNo.Text = objPricing.RegNo;
            uiTextBoxReference.Text = objPricing.Reference;
            uiTextBoxIndication.Text = objPricing.Indication;
            uiTextBoxDose.Text = objPricing.Dose;
            if(!objPricing.IsColumnNull("SubmittedToSpecialized"))
                uiCheckBoxSubmittedToSpecialized.Checked = objPricing.SubmittedToSpecialized;
            if (!objPricing.IsColumnNull("SalesTaxes"))
                uiCheckBoxSalesTaxes.Checked = objPricing.SalesTaxes;
            if (!objPricing.IsColumnNull("EssentialDrugList"))
                uiCheckBoxEssentialDrugList.Checked = objPricing.EssentialDrugList;

            // after commite
            if (!objPricing.IsColumnNull("SectorTypeID"))
                uiDropDownListSectorType.SelectedValue = objPricing.SectorTypeID.ToString();


            uiTextBoxRegNoAfter.Text = objPricing.RegNo;
            uiTextBoxCommittePrice.Text = objPricing.CommitteePrice;
            if(!objPricing.IsColumnNull("CommiteeDate"))
                uiTextBoxCommitteDate.Text = objPricing.CommiteeDate.ToString("dd/MM/yyyy");

            uiTextBoxCommittePrice.Text = objPricing.CommitteePrice ;
            uiTextBoxRationalForPricing.Text = objPricing.RationalForPricing ;
            if(!objPricing.IsColumnNull("NoInBox"))
                uiTextBoxNoInBox.Text = objPricing.NoInBox.ToString();

            objPricing.LowestIntPrice = uiTextBoxLowestIntPriceBrand.Text;
            objPricing.PriceInEgy = uiTextBoxBrandPriceInEgy.Text;
            uiTextBoxPriceAfter30.Text = objPricing.PriceAfter30;
            uiTextBoxPriceAfter35.Text = objPricing.PriceAfter35HighTech;
            uiTextBoxPriceAfter35FirstGeneric.Text = objPricing.PriceAfter35FirstGeneric;
            uiTextBoxPriceAfter40ndGeneric.Text = objPricing.PriceAfter40SecondGeneric;
            uiTextBoxLowestPriceGeneric.Text = objPricing.LowestPriceGeneric;
            uiTextBoxFinalPrice.Text = objPricing.FinalPrice;

            if (!objPricing.IsColumnNull("IsPricedTo499"))
                uiCheckBoxIsPricedTo499.Checked = objPricing.IsPricedTo499;
            uiTextBoxNotes.Text = objPricing.Notes;
            uiTextBoxMainGroup.Text = objPricing.MainGroup;
            uiTextBoxMonth.Text = objPricing.MonthYear;
            if (!objPricing.IsColumnNull("Similar"))
                uiCheckBoxSimilar.Checked = objPricing.Similar;
            uiTextBoxPreviouspack.Text = objPricing.PreviousPack;
            uiTextBoxPreviousPrice.Text = objPricing.PreviousPrice;
        }

        #endregion

        #endregion
        
        #region GenericInfoTab

        #region Events

        protected void ui_LnB_GenericSearch_Click(object sender, EventArgs e)
        {
            Session["SearchType"] = "Generic";
            ui_modalPopup_Generic.Show();
        }

        protected void ui_LnB_EquiGenericSearch_Click(object sender, EventArgs e)
        {
            Session["SearchType"] = "EquGeneric";
            ui_modalPopup_Generic.Show();
        }

        protected void Button_Update_Click(object sender, EventArgs e)
        {
            if (Session["PopUpType"].ToString() == "AddNewGeneric")
            {
                Drug_Reguest_Substances objData = new Pricing.BLL.Drug_Reguest_Substances();
                objData.AddNew();
                objData.DRUG_REQUEST_ID = TradePriceID;
                objData.SUBSTANCE_ID = Label_Generic_Name_ID.Text == "" ? 0 : Convert.ToInt32(Label_Generic_Name_ID.Text);
                objData.TYPE = DropDownList_GenericType.SelectedValue;
                if (ui_chb_GenericApproved.Checked == false || ui_chb_EquGenericApproved.Checked == false)
                {
                    objData.Approved = false;
                }
                else
                {
                    objData.Approved = true;
                }
                objData.Save();

                SUBSTANCE_SUPPLIER objSupplier = new Pricing.BLL.SUBSTANCE_SUPPLIER();
                objSupplier.AddNew();
                objSupplier.DRUG_REQUEST_SUBSTANCE_ID = objData.ID;
                objSupplier.UNIT_ID = Convert.ToInt32(DropDownList_Quantity_Unit.SelectedValue);
                objSupplier.QUANTITY = TextBox_Quantity.Text == "" ? 0 : float.Parse(TextBox_Quantity.Text);
                objSupplier.EQUI_NAME_SUBSTANCE = Label_Equ_Generic_Name_ID.Text == "" ? 0 : Convert.ToInt32(Label_Equ_Generic_Name_ID.Text);
                objSupplier.EQUI_QUANTITY = TextBox_EquQuantity.Text == "" ? 0 : float.Parse(TextBox_EquQuantity.Text);
                objSupplier.EQUI_UNIT = Convert.ToInt32(DropDownList_Eq_Quantity_Unit.SelectedValue);
                objSupplier.OVER_QUANTITY = TextBox_OverQuantity.Text == "" ? 0 : float.Parse(TextBox_OverQuantity.Text);
                objSupplier.OVER_UNIT_ID = Convert.ToInt32(DropDownList_Over_Quantity_Unit.SelectedValue);
                objSupplier.OVER_EQUI_QUANTITY = TextBox_EquQuantity.Text == "" ? 0 : float.Parse(TextBox_EquQuantity.Text);
                objSupplier.OVER_EQUI_UNIT = Convert.ToInt32(DropDownList_Eq_Quantity_Unit.SelectedValue);
                objSupplier.Save();

                //Response.Redirect("ProductEdit.aspx?DrugListId=" + TradePriceID);

                ResetPopUp();
                LoadGeneric();
            }
            else
            {
                if (Session["DrugReguestSubstancesID"] != null)
                {
                    Drug_Reguest_Substances objDRSub = new Pricing.BLL.Drug_Reguest_Substances();
                    objDRSub.LoadByPrimaryKey(Convert.ToInt32(Session["DrugReguestSubstancesID"].ToString()));
                    objDRSub.TYPE = DropDownList_GenericType.SelectedValue;
                    objDRSub.SUBSTANCE_ID = Convert.ToInt32(Label_Generic_Name_ID.Text);
                    if (ui_chb_GenericApproved.Checked == false || ui_chb_EquGenericApproved.Checked == false)
                    {
                        objDRSub.Approved = false;
                    }
                    else
                    {
                        objDRSub.Approved = true;
                    }
                    objDRSub.Save();

                    SUBSTANCE_SUPPLIER objSubSupplier = new Pricing.BLL.SUBSTANCE_SUPPLIER();
                    objSubSupplier.SelectByDrugReqID(Convert.ToInt32(Session["DrugReguestSubstancesID"].ToString()));
                    objSubSupplier.QUANTITY = float.Parse(TextBox_Quantity.Text);
                    objSubSupplier.UNIT_ID = Convert.ToInt32(DropDownList_Quantity_Unit.SelectedValue);
                    objSubSupplier.OVER_QUANTITY = float.Parse(TextBox_OverQuantity.Text);
                    objSubSupplier.OVER_UNIT_ID = Convert.ToInt32(DropDownList_Over_Quantity_Unit.SelectedValue);
                    objSubSupplier.EQUI_QUANTITY = float.Parse(TextBox_EquQuantity.Text);
                    objSubSupplier.EQUI_UNIT = Convert.ToInt32(DropDownList_Eq_Quantity_Unit.SelectedValue);
                    objSubSupplier.OVER_EQUI_QUANTITY = float.Parse(TextBox_OverEquQuantity.Text);
                    objSubSupplier.OVER_EQUI_UNIT = Convert.ToInt32(DropDownList_Eq_Over_Quantity_Unit.SelectedValue);
                    objSubSupplier.EQUI_NAME_SUBSTANCE = Convert.ToInt32(Label_Equ_Generic_Name_ID.Text);
                    objSubSupplier.Save();

                    //Response.Redirect("ProductEdit.aspx?DrugListId=" + TradePriceID);

                    ResetPopUp();
                    LoadGeneric();
                }
            }
            Session["PopUpType"] = "AddNewGeneric";
        }

        protected void Button_Cancel_Click(object sender, EventArgs e)
        {
            ResetPopUp();
        }

        protected void Button_Generic_Search_Click(object sender, EventArgs e)
        {
            Substances objData = new Pricing.BLL.Substances();
            objData.GetByName(TextBox_GenericSearch.Text);
            GridView_Search.DataSource = objData.DefaultView;
            GridView_Search.DataBind();
            ui_modalPopup_Generic.Show();
        }

        protected void GridView_Search_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_Search.PageIndex = e.NewPageIndex;
            Substances objData = new Pricing.BLL.Substances();
            objData.GetByName(TextBox_GenericSearch.Text);
            GridView_Search.DataSource = objData.DefaultView;
            GridView_Search.DataBind();
            ui_modalPopup_Generic.Show();
        }

        protected void chRow_CheckedChanged(object sender, EventArgs e)
        {
            CheckBoxStatus();
            ui_modalPopup_Generic.Show();
        }

        protected void Button_Generic_Select0_Click(object sender, EventArgs e)
        {
            if (Session["SearchType"].ToString() == "Generic")
            {
                foreach (GridViewRow DR in GridView_Search.Rows)
                {
                    if (((CheckBox)DR.FindControl("chRow")).Checked)
                    {
                        Label_Generic_Name.Text = ((Label)DR.FindControl("Label_New_Generic")).Text;
                        Label_Generic_Name_ID.Text = ((CheckBox)DR.FindControl("chRow")).ToolTip;
                        ui_chb_GenericApproved.Checked = ((CheckBox)DR.FindControl("ui_chb_Approved")).Checked;
                    }
                }
            }
            else if (Session["SearchType"].ToString() == "EquGeneric")
            {
                foreach (GridViewRow DR in GridView_Search.Rows)
                {
                    if (((CheckBox)DR.FindControl("chRow")).Checked)
                    {
                        Label_Equ_Generic_Name.Text = ((Label)DR.FindControl("Label_New_Generic")).Text;
                        Label_Equ_Generic_Name_ID.Text = ((CheckBox)DR.FindControl("chRow")).ToolTip;
                        ui_chb_EquGenericApproved.Checked = ((CheckBox)DR.FindControl("ui_chb_Approved")).Checked;
                    }
                }
            }
            TextBox_GenericSearch.Text = "";
            ResetSearchGrid();
        }

        protected void Button_Change_Cancel_Click(object sender, EventArgs e)
        {
            TextBox_GenericSearch.Text = "";
            ResetSearchGrid();
        }

        protected void GridView_Generic_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ShowPopUp")
            {
                v_GetOneGenericInfoByDrugID objData = new v_GetOneGenericInfoByDrugID();
                objData.GetCertainGenericInfo(TradePriceID, Convert.ToInt32(e.CommandArgument.ToString()));

                Session["DrugReguestSubstancesID"] = e.CommandArgument.ToString();
                Session["PopUpType"] = "Update Generic";

                Label_Generic_Name.Text = objData.Active;
                TextBox_Quantity.Text = objData.s_QUANTITY;
                TextBox_OverQuantity.Text = objData.s_OverActiveQuantity;
                TextBox_EquQuantity.Text = objData.s_EQUI_QUANTITY;
                TextBox_OverEquQuantity.Text = objData.s_OverEquiActiveQuantity;

                LoadQuantityUnit();
                DropDownList_Quantity_Unit.SelectedValue = objData.s_QuantityUnit;
                DropDownList_Over_Quantity_Unit.SelectedValue = objData.s_OverUnitID;
                DropDownList_Eq_Quantity_Unit.SelectedValue = objData.s_EquUnit;
                DropDownList_Eq_Over_Quantity_Unit.SelectedValue = objData.s_OverEquUnit;
                DropDownList_GenericType.SelectedValue = objData.GenericType;

                string s = objData.Equi_Active;
                if (objData.Equi_Active != "")
                {
                    Label_Equ_Generic_Name.Text = objData.Equi_Active;
                    Label_Equ_Generic_Name_ID.Text = objData.s_EQUI_NAME_SUBSTANCE;
                }
                else
                {
                    Label_Equ_Generic_Name.Text = "No Equivalent Exist";
                    Label_Equ_Generic_Name_ID.Text = "0";
                }
                Label_Generic_Name_ID.Text = objData.s_SUBSTANCE_ID;
            }
        }

        protected void LinkButton_Delete_Command(object sender, CommandEventArgs e)
        {
            SUBSTANCE_SUPPLIER objData = new Pricing.BLL.SUBSTANCE_SUPPLIER();
            objData.SelectByDrugReqID(int.Parse(e.CommandArgument.ToString()));
            objData.MarkAsDeleted();
            objData.Save();

            Drug_Reguest_Substances objData2 = new Pricing.BLL.Drug_Reguest_Substances();
            objData2.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
            objData2.MarkAsDeleted();
            objData2.Save();

            LoadGeneric();
        }

        #endregion
        
        #region Methods

        private void ResetPopUp()
        {
            Label_Generic_Name.Text = "";
            Label_Generic_Name_ID.Text = "";
            TextBox_Quantity.Text = "";
            TextBox_OverQuantity.Text = "";
            DropDownList_Quantity_Unit.SelectedValue = "45";
            DropDownList_Over_Quantity_Unit.SelectedValue = "45";
            TextBox_EquQuantity.Text = "";
            TextBox_OverEquQuantity.Text = "";
            DropDownList_Eq_Quantity_Unit.SelectedValue = "45";
            DropDownList_Eq_Over_Quantity_Unit.SelectedValue = "45";
            Label_Equ_Generic_Name.Text = "";
            Label_Equ_Generic_Name_ID.Text = "";
        }

        private void LoadGeneric()
        {
            v_GetAllGenericInfoByDrugID objData = new Pricing.BLL.v_GetAllGenericInfoByDrugID();
            objData.GetGenericsInfo(TradePriceID);
            GridView_Generic.DataSource = objData.DefaultView;
            GridView_Generic.DataBind();
        }

        private void LoadQuantityUnit()
        {
            Pricing.BLL.Unit objdata = new Pricing.BLL.Unit();
            objdata.LoadAll();
            DropDownList_Quantity_Unit.DataSource = objdata.DefaultView;
            DropDownList_Quantity_Unit.DataTextField = Pricing.BLL.Unit.ColumnNames.NAME;
            DropDownList_Quantity_Unit.DataValueField = Pricing.BLL.Unit.ColumnNames.ID;
            DropDownList_Quantity_Unit.DataBind();
            DropDownList_Quantity_Unit.SelectedValue = "45";

            ///////////////////////////////
            DropDownList_Over_Quantity_Unit.DataSource = objdata.DefaultView;
            DropDownList_Over_Quantity_Unit.DataTextField = Pricing.BLL.Unit.ColumnNames.NAME;
            DropDownList_Over_Quantity_Unit.DataValueField = Pricing.BLL.Unit.ColumnNames.ID;
            DropDownList_Over_Quantity_Unit.DataBind();
            DropDownList_Over_Quantity_Unit.SelectedValue = "45";

            ///////////////////////////////
            DropDownList_Eq_Quantity_Unit.DataSource = objdata.DefaultView;
            DropDownList_Eq_Quantity_Unit.DataTextField = Pricing.BLL.Unit.ColumnNames.NAME;
            DropDownList_Eq_Quantity_Unit.DataValueField = Pricing.BLL.Unit.ColumnNames.ID;
            DropDownList_Eq_Quantity_Unit.DataBind();
            DropDownList_Eq_Quantity_Unit.SelectedValue = "45";

            ///////////////////////////////
            DropDownList_Eq_Over_Quantity_Unit.DataSource = objdata.DefaultView;
            DropDownList_Eq_Over_Quantity_Unit.DataTextField = Pricing.BLL.Unit.ColumnNames.NAME;
            DropDownList_Eq_Over_Quantity_Unit.DataValueField = Pricing.BLL.Unit.ColumnNames.ID;
            DropDownList_Eq_Over_Quantity_Unit.DataBind();
            DropDownList_Eq_Over_Quantity_Unit.SelectedValue = "45";

        }

        private void ResetSearchGrid()
        {
            foreach (GridViewRow DR in GridView_Search.Rows)
            {
                ((CheckBox)DR.FindControl("chRow")).Checked = false;
                ((CheckBox)DR.FindControl("chRow")).Enabled = true;
            }
            GridView_Search.DataSource = null;
            GridView_Search.DataBind();
        }

        private void CheckBoxStatus()
        {
            bool check = false;
            foreach (GridViewRow DR in GridView_Search.Rows)
            {
                if (((CheckBox)DR.FindControl("chRow")).Checked)
                {
                    check = true;
                }
            }

            if (check)
            {
                foreach (GridViewRow DR in GridView_Search.Rows)
                {
                    if (!((CheckBox)DR.FindControl("chRow")).Checked)
                    {
                        ((CheckBox)DR.FindControl("chRow")).Enabled = false;
                    }
                }
            }
            else
            {
                foreach (GridViewRow DR in GridView_Search.Rows)
                {
                    if (!((CheckBox)DR.FindControl("chRow")).Checked)
                    {
                        ((CheckBox)DR.FindControl("chRow")).Enabled = true;
                    }
                }
            }
        }

        #endregion
        
        #endregion

        #region BeforeAfterCommitte

        protected void uiButtonBeforeComm_Save_Click(object sender, EventArgs e)
        {
            SaveBeforeCommitte();
        }

        protected void uiButtonUpdate_After_Click(object sender, EventArgs e)
        {
            SaveAfterCommitte();
        }

        private void SaveBeforeCommitte()
        {
            try
            {
                TradePricing objPricing = new TradePricing();
                objPricing.LoadByPrimaryKey(TradePriceID);
                // before commitee
                if(uiDropDownListCommitterType_Before.SelectedValue != "-1")
                    objPricing.RegistrationCommitteTypeID = Convert.ToInt32(uiDropDownListCommitterType_Before.SelectedValue);
                if (uiDropDownListStatusType.SelectedValue != "-1")
                    objPricing.TradePricingStatusID = Convert.ToInt32(uiDropDownListStatusType.SelectedValue);
                if (uiDropDownListLicenseType.SelectedValue != "-1")
                    objPricing.TradePricingLicenseTypeID = Convert.ToInt32(uiDropDownListLicenseType.SelectedValue);
                objPricing.RegNo = uiTextBoxBeforeRegNo.Text;
                objPricing.Reference = uiTextBoxReference.Text;
                objPricing.Indication = uiTextBoxIndication.Text;
                objPricing.Dose = uiTextBoxDose.Text;
                objPricing.SubmittedToSpecialized = uiCheckBoxSubmittedToSpecialized.Checked;
                objPricing.SalesTaxes = uiCheckBoxSalesTaxes.Checked;
                objPricing.EssentialDrugList = uiCheckBoxEssentialDrugList.Checked;

                objPricing.Save();

            }
            catch
            {
                
            }
        }

        private void SaveAfterCommitte()
        {
            try
            {
                TradePricing objPricing = new TradePricing();
                objPricing.LoadByPrimaryKey(TradePriceID);
                // after commite
                if (uiDropDownListSectorType.SelectedValue != "-1")
                    objPricing.SectorTypeID = Convert.ToInt32(uiDropDownListSectorType.SelectedValue);
                objPricing.RegNo = uiTextBoxRegNoAfter.Text;
                objPricing.CommitteePrice = uiTextBoxCommittePrice.Text;
                DateTime date;
                if (DateTime.TryParseExact(uiTextBoxCommitteDate.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date))
                    objPricing.CommiteeDate = date;
                objPricing.CommitteePrice = uiTextBoxCommittePrice.Text;
                objPricing.RationalForPricing = uiTextBoxRationalForPricing.Text;
                if (!string.IsNullOrEmpty(uiTextBoxNoInBox.Text))
                {
                    int x = 0;
                    int.TryParse(uiTextBoxNoInBox.Text, out x);
                    objPricing.NoInBox = x;
                }
                objPricing.LowestIntPrice = uiTextBoxLowestIntPriceBrand.Text;
                objPricing.PriceInEgy = uiTextBoxBrandPriceInEgy.Text;
                objPricing.PriceAfter30 = uiTextBoxPriceAfter30.Text;
                objPricing.PriceAfter35HighTech = uiTextBoxPriceAfter35.Text;
                objPricing.PriceAfter35FirstGeneric = uiTextBoxPriceAfter35FirstGeneric.Text;
                objPricing.PriceAfter40SecondGeneric = uiTextBoxPriceAfter40ndGeneric.Text;
                objPricing.LowestPriceGeneric = uiTextBoxLowestPriceGeneric.Text;
                objPricing.FinalPrice = uiTextBoxFinalPrice.Text;
                objPricing.IsPricedTo499 = uiCheckBoxIsPricedTo499.Checked;
                objPricing.Notes = uiTextBoxNotes.Text;
                objPricing.MainGroup = uiTextBoxMainGroup.Text;
                objPricing.MonthYear = uiTextBoxMonth.Text;
                objPricing.Similar = uiCheckBoxSimilar.Checked;
                objPricing.PreviousPack = uiTextBoxPreviouspack.Text;
                objPricing.PreviousPrice = uiTextBoxPreviousPrice.Text;
                objPricing.Save();
            }
            catch (Exception ex)
            {                
            }
        }
        #endregion 

        #region Status History

        protected void btnOpenStatusModal_Click(object sender, EventArgs e)
        {
            ui_modalPopup_Status.Show();
        }

        private void BindStatusHistory()
        {
            v_StatusHistory objstatus = new v_StatusHistory();
            objstatus.LoadStatusForTrade(TradePriceID);

            rptrStatusList.DataSource = objstatus.DefaultView;
            rptrStatusList.DataBind();


        }

        private void ValidateAndBindStatus()
        {
            // Get Last status ID
            TradePricing obj = new TradePricing();
            obj.LoadByPrimaryKey(TradePriceID);

            switch (obj.PricingStatusID)
            {

                case 1: //Initiated.
                case 4: // Need More Info / Complete
                    StatusHistoryEnable(true);
                    ui_drpTradeStatus.Items.Clear();
                    ui_drpTradeStatus.Items.Add(new ListItem("Choose Status", "-1"));
                    ui_drpTradeStatus.Items.Add(new ListItem("Request Accepted", "2"));
                    ui_drpTradeStatus.Items.Add(new ListItem("Reviw / Need More Info", "3"));
                    break;

                case 2: //Request Accepted.
                case 10: // Committee Postponded / Need More Info / Complete
                case 13: // Need Discussion
                    StatusHistoryEnable(true);
                    ui_drpTradeStatus.Items.Clear();
                    ui_drpTradeStatus.Items.Add(new ListItem("Choose Status", "-1"));
                    ui_drpTradeStatus.Items.Add(new ListItem("Committee Date Informed ", "5"));
                    tr_committee_1.Visible = true;
                    tr_committee_2.Visible = true;
                    break;

                case 5: //Committee Date Informed
                    StatusHistoryEnable(true);
                    ui_drpTradeStatus.Items.Clear();
                    ui_drpTradeStatus.Items.Add(new ListItem("Choose Status", "-1"));
                    ui_drpTradeStatus.Items.Add(new ListItem("Committee Price Informed  ", "6"));
                    ui_drpTradeStatus.Items.Add(new ListItem("Committee Postponded / Need More Info  ", "7"));
                    ui_drpTradeStatus.Items.Add(new ListItem("Committee Postponded / Studies  ", "8"));
                    ui_drpTradeStatus.Items.Add(new ListItem("Committee Product Transfered  ", "9"));
                    break;

                case 11: //Price Accepted 
                    StatusHistoryEnable(true);
                    ui_drpTradeStatus.Items.Clear();
                    ui_drpTradeStatus.Items.Add(new ListItem("Choose Status", "-1"));
                    ui_drpTradeStatus.Items.Add(new ListItem("Approved by the Minister", "15"));
                    break;

                case 15: //Price Accepted 
                    StatusHistoryEnable(true);
                    ui_drpTradeStatus.Items.Clear();
                    ui_drpTradeStatus.Items.Add(new ListItem("Choose Status", "-1"));
                    ui_drpTradeStatus.Items.Add(new ListItem("Pricing Certificate Issued", "16"));
                    break;

                default:
                    // In case of that the company couldn't change the status 
                    StatusHistoryEnable(false);
                    break;
            }
        }

        private void StatusHistoryEnable(bool isEnable)
        {
            if (isEnable)
            {
                tblAddStatusContainer.Visible = true;
                btnAddNewStatus.Visible = true;
                lblCouldNotchangeStatus.Visible = false;
            }
            else
            {
                tblAddStatusContainer.Visible = false;
                btnAddNewStatus.Visible = false;
                lblCouldNotchangeStatus.Visible = true;
            }

        }

        protected void rptrStatusList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lblStatusDetails;
            HyperLink lnkViewAttachement;
            Panel pnlTextContainer;
            int _statusID = 0;
            string _statusText = "";

            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                // get current data row 
                DataRow CurrentRow = ((DataRowView)e.Item.DataItem).Row;

                // get label which we will view it's status.
                lblStatusDetails = (Label)e.Item.FindControl("lblStatusDetailsText");
                lnkViewAttachement = (HyperLink)e.Item.FindControl("lnkViewAttachementFile");
                pnlTextContainer = (Panel)e.Item.FindControl("pnlStatusContainer");
                _statusID = int.Parse(CurrentRow["PricingStatusID"].ToString());

                if (CurrentRow["CommitteeTypeID"].ToString() != "")
                {
                    _statusText += "<b>Committee : </b>" + CurrentRow["TypeText"].ToString() + "&nbsp;&nbsp;";
                    _statusText += "<b>Date of Committee : </b>" + CurrentRow["CommitteDate"].ToString();
                    _statusText += "<br>";
                }

                if (CurrentRow["CurrentPrice"].ToString() != "")
                {
                    _statusText += "<b>Current Price : </b>" + CurrentRow["CurrentPrice"].ToString();
                    _statusText += "<br>";
                }

                if (CurrentRow["Comment"].ToString() != "")
                {
                    _statusText += "<b>Comment : </b>" + CurrentRow["Comment"].ToString();
                }

                lblStatusDetails.Text = _statusText;

                if (CurrentRow["AttachementPath"].ToString() != "")
                {
                    lnkViewAttachement.Visible = true;
                    lnkViewAttachement.NavigateUrl = ConfigurationManager.AppSettings["StatusAttachementPath"].ToString() + CurrentRow["StatusHistoryID"].ToString() + "_" + CurrentRow["AttachementPath"].ToString();
                }
                else
                {
                    lnkViewAttachement.Visible = false;
                }


                // Control status Color related to status ID
                switch (_statusID)
                {
                    case 1: // initiated
                         pnlTextContainer.CssClass = "Initiated";
                        break;
                    case 4: // Need More Info / Complete
                    case 10: //Committee Postponded / Need More Info / Complete
                        pnlTextContainer.CssClass = "Complete";
                        break;
                    case 5: // Need More Info / Complete
                        pnlTextContainer.CssClass = "CommitteeDateInformed";
                        break;
                    case 2:
                        pnlTextContainer.CssClass = "Accepted";
                        break;
                    default:
                        pnlTextContainer.CssClass = "default_Status";
                        break;
                }
            }

        }

        protected void btnAddNewStatus_Click(object sender, EventArgs e)
        {
            //TODO: add code for saving status 
        }


        #endregion 


    }
}