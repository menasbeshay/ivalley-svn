using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pricing.BLL;
using System.Configuration;
using System.Data;


namespace Pricing_GUI
{
    public partial class New_Request : System.Web.UI.Page
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
                return TradePriceID != 0;
            }
        }

        #endregion

        #region MainDataTab

        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TradePriceID = 0;
                BindDropDownListsData();
                ui_lblResult.Text = "";
                tab_Generics.Visible = false;
                tab_Status.Visible = false;
                Session["PopUpType"] = "AddNewGeneric";
                ui_btnSave.Text = "Add Main Data";
                RequiredFieldValidator10.Visible = true;

                if (IsUpdateMode)
                {
                    InitializeUpdateMode();
                    // Bind status History
                    BindStatusHistory();
                    ValidateAndBindStatus();

                    if (CodeGlobal.IsDisableMode)
                    {
                        // disable Page Content.
                        pnl_MainData_Content.Enabled = false;
                        pnl_Generic_Contenets.Enabled = false;
                    }
                    else
                    {
                        pnl_MainData_Content.Enabled = true;
                        pnl_Generic_Contenets.Enabled = true;
                    }
                }



                // Select Logged In Company .
                ui_drpCompanies.SelectedIndex = ui_drpCompanies.Items.IndexOf(ui_drpCompanies.Items.FindByValue(CodeGlobal.LogedInCompany.s_CompanyID));
                ui_drpCompanies.Enabled = false;
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

                // Insert Inistial Status record for the new rquest ( status = initiated )
                //-----------------------------------------------------------------------
                StatusHistory objStatus = new StatusHistory();
                objStatus.AddNew();
                objStatus.PricingStatusID = 1; // Will be initiated by default.
                objStatus.StatusDate = DateTime.Now;
                objStatus.TradePricingID = objPricing.TradePricingID;
                objStatus.CurrentPrice = objPricing.CompanyPrice;
                objStatus.Save();
                //--------------------------------------------------------------

                //Response.Redirect("New_Request.aspx?ID=" + objPricing.TradePricingID + "&type=new#tab_1_2");

                TradePriceID = objPricing.TradePricingID;
                InitializeUpdateMode();

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
        }

        private void InitializeUpdateMode()
        {
            tab_Generics.Visible = true;
            tab_Status.Visible = true;
            BindMainData();
            LoadQuantityUnit();
            LoadGeneric();
            ui_btnSave.Text = "Update Main Data";
            RequiredFieldValidator10.Visible = false;
            lblPageTitle.Text = "Modify Pricing Request";

           
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

        #region Status History

        #region Methods

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
                    
                case 1: // inistiated
                case 2:
                default:// Accepted 
                    // In case of that the company couldn't change the status 
                    tblAddStatusContainer.Visible = false;
                    uiLinkButtonAddStatus.Visible = false;
                    lblCouldNotchangeStatus.Visible = true;
                    break;
                case 3:
                     tblAddStatusContainer.Visible = true;
                    uiLinkButtonAddStatus.Visible = true;
                    lblCouldNotchangeStatus.Visible = false;
                    ui_drpTradeStatus.Items.Add(new ListItem("Choose Status", "-1"));
                    ui_drpTradeStatus.Items.Add(new ListItem("Need More Info / Complete", "4"));
                    break;
                
            }
        }

       

        #endregion


        #region Events

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
                    case 4: // Need More Info / Complete
                        pnlTextContainer.CssClass = "alert alert-info";
                        break;
                    case 2: // Request Accepted
                        pnlTextContainer.CssClass = "alert alert-success";
                        break;
                    case 3:
                        pnlTextContainer.CssClass = "alert";
                        break;
                    case 5:
                        pnlTextContainer.CssClass = "alert alert-error";
                        break;
                    case 6:
                        pnlTextContainer.CssClass = "alert alert-default";
                        break;
                    default:
                        pnlTextContainer.CssClass = "alert alert-default";
                        break;
                }
            }
            
        }

        protected void uiLinkButtonAddStatus_Click(object sender, EventArgs e)
        {
            //TODO: Handle add new status for the current Trade Pricing Product.
        }

        #endregion



        #endregion
    }
}