using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;
using System.Data.OleDb;
using System.Collections;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditSailing : System.Web.UI.Page
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                BindData();
            }  
        }

        protected void uiGridViewShipping_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewShipping.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewShipping_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteShipping")
            {
                ShippingLines objData = new ShippingLines();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiGridViewShipping_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                SeaPorts From = new SeaPorts();
                SeaPorts To = new SeaPorts();
                Companies Comp = new Companies();
                From.LoadByPrimaryKey(Convert.ToInt32(objData["FromSeaPortID"].ToString()));
                Label temp = (Label)e.Row.FindControl("uiLabelFromName");
                temp.Text = From.EnName;

                To.LoadByPrimaryKey(Convert.ToInt32(objData["ToSeaPortID"].ToString()));
                Label temp2 = (Label)e.Row.FindControl("uiLabelToName");
                temp2.Text = To.EnName;

                Comp.LoadByPrimaryKey(Convert.ToInt32(objData["CompanyID"].ToString()));
                Label temp3 = (Label)e.Row.FindControl("uiLabelCompanyName");
                temp3.Text = Comp.ArName;
            }
        }
        #endregion

        #region Methods
        private void BindData()
        {
            ShippingLines objData = new ShippingLines();
            objData.LoadAll();
            uiGridViewShipping.DataSource = objData.DefaultView;
            uiGridViewShipping.DataBind();
        }
        
        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ShippingLines objData = new ShippingLines();
            objData.AddNew();
            objData.CompanyID = Convert.ToInt32(uiDropDownListCompanies.SelectedValue);
            objData.FromSeaPortID = Convert.ToInt32(uiDropDownListFromCity.SelectedValue);
            objData.ToSeaPortID = Convert.ToInt32(uiDropDownListToCity.SelectedValue);            
            objData.Save();

            BindData();
        }

        private void LoadDDLs()
        {
            Companies comp = new Companies();
            comp.SearchCompanies("", 0, 1, 3);
            uiDropDownListCompanies.DataSource = comp.DefaultView;
            uiDropDownListCompanies.DataTextField = "ArName";
            uiDropDownListCompanies.DataValueField = "CompanyID";
            uiDropDownListCompanies.DataBind();

            Companies comp1 = new Companies();
            comp1.SearchCompanies("", 0, 1, 3);
            uiDropDownListUploadCompany.DataSource = comp1.DefaultView;
            uiDropDownListUploadCompany.DataTextField = "ArName";
            uiDropDownListUploadCompany.DataValueField = "CompanyID";
            uiDropDownListUploadCompany.DataBind();

            SeaPorts city = new SeaPorts();
            city.LoadAll();
            uiDropDownListFromCity.DataSource = city.DefaultView;
            uiDropDownListToCity.DataSource = city.DefaultView;

            uiDropDownListFromCity.DataTextField = "EnName";
            uiDropDownListToCity.DataTextField = "EnName";

            uiDropDownListFromCity.DataValueField = "SeaPortID";
            uiDropDownListToCity.DataValueField = "SeaPortID";

            uiDropDownListFromCity.DataBind();
            uiDropDownListToCity.DataBind();
        }
        #endregion

        protected void uiLinkButtonUpload_Click(object sender, EventArgs e)
        {
            if (uiFileUploadshippingLines.HasFile)
            {
                ArrayList nonUploaded = new ArrayList();
                uiFileUploadshippingLines.SaveAs(Server.MapPath("~/FileUploads/" + uiFileUploadshippingLines.FileName));
                string connectionString = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0;HDR=NO;""", Server.MapPath("~/FileUploads/" + uiFileUploadshippingLines.FileName));

                string strSQL = "SELECT * FROM [sheet1$]";
                OleDbConnection excelConnection = new OleDbConnection(connectionString);
                excelConnection.Open();
                OleDbCommand dbCommand = new OleDbCommand(strSQL, excelConnection);
                OleDbDataAdapter dataAdapter = new OleDbDataAdapter(dbCommand);

                DataTable dTable = new DataTable();

                dataAdapter.Fill(dTable);
                ShippingLines objData = new ShippingLines();
                if (uiDropDownListUploadType.SelectedValue == "1")
                {
                    
                    foreach (DataRow item in dTable.Rows)
                    {                                   
                        SeaPorts Fcity = new SeaPorts();
                        Fcity.GetSeaPortByCode(item[0].ToString());

                        SeaPorts Tcity = new SeaPorts();
                        Tcity.GetSeaPortByCode(item[1].ToString());

                        if (Fcity.RowCount == 0 || Tcity.RowCount == 0)
                        {
                            nonUploaded.Add("From : " + item[0].ToString() + " - To : " + item[1].ToString());
                            continue;
                        }
                        else
                        {
                            objData.AddNew();
                            objData.CompanyID = Convert.ToInt32(uiDropDownListUploadCompany.SelectedValue);
                            objData.FromSeaPortID = Fcity.SeaPortID;
                            objData.ToSeaPortID = Tcity.SeaPortID;
                        }
                    }
                }
                else if (uiDropDownListUploadType.SelectedValue == "2")
                {
                    
                    foreach (DataRow item in dTable.Rows)
                    {
                        
                        SeaPorts Fcity = new SeaPorts();
                        Fcity.GetSeaPortByName(item[0].ToString());

                        SeaPorts Tcity = new SeaPorts();
                        Tcity.GetSeaPortByName(item[1].ToString());

                        if (Fcity.RowCount == 0 || Tcity.RowCount == 0)
                        {
                            nonUploaded.Add("From : " + item[0].ToString() + " - To : " + item[1].ToString());
                            continue;
                        }
                        else
                        {
                            objData.AddNew();
                            objData.CompanyID = Convert.ToInt32(uiDropDownListUploadCompany.SelectedValue);
                            objData.FromSeaPortID = Fcity.SeaPortID;
                            objData.ToSeaPortID = Tcity.SeaPortID;
                        }
                    }
                }

                objData.Save();
                BindData();

                uiGridViewLog.DataSource = nonUploaded;
                //uiGridViewLog.Columns[0].HeaderText = "These items faild to insert";
                uiGridViewLog.DataBind();                
            }
        }

        
    }
}