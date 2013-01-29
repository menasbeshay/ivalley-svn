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
    public partial class EditAirLines : System.Web.UI.Page
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

        protected void uiGridViewAirLines_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewAirLines.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewAirLines_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteAirLine")
            {
                AirLines objData = new AirLines();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiGridViewAirLines_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                AirPorts From = new AirPorts();
                AirPorts To = new AirPorts();
                Companies Comp = new Companies();
                From.LoadByPrimaryKey(Convert.ToInt32(objData["FromAirPortID"].ToString()));
                Label temp = (Label)e.Row.FindControl("uiLabelFromName");
                temp.Text = From.EnName;

                To.LoadByPrimaryKey(Convert.ToInt32(objData["ToAirPortID"].ToString()));
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
            AirLines objData = new AirLines();
            objData.LoadAll();
            uiGridViewAirLines.DataSource = objData.DefaultView;
            uiGridViewAirLines.DataBind();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            AirLines objData = new AirLines();
            objData.AddNew();
            objData.CompanyID = Convert.ToInt32(uiDropDownListCompanies.SelectedValue);
            objData.FromAirPortID = Convert.ToInt32(uiDropDownListFromCity.SelectedValue);
            objData.ToAirPortID = Convert.ToInt32(uiDropDownListToCity.SelectedValue);
            objData.Save();

            BindData();
        }

        private void LoadDDLs()
        {
            Companies comp = new Companies();
            comp.SearchCompanies("", 0, 1, 1);
            uiDropDownListCompanies.DataSource = comp.DefaultView;
            uiDropDownListCompanies.DataTextField = "ArName";
            uiDropDownListCompanies.DataValueField = "CompanyID";
            uiDropDownListCompanies.DataBind();

            Companies comp1 = new Companies();
            comp1.SearchCompanies("", 0, 1, 1);
            uiDropDownListCompanyUpload.DataSource = comp1.DefaultView;
            uiDropDownListCompanyUpload.DataTextField = "ArName";
            uiDropDownListCompanyUpload.DataValueField = "CompanyID";
            uiDropDownListCompanyUpload.DataBind();

            AirPorts city = new AirPorts();
            city.LoadAll();
            uiDropDownListFromCity.DataSource = city.DefaultView;
            uiDropDownListToCity.DataSource = city.DefaultView;

            uiDropDownListFromCity.DataTextField = "EnName";
            uiDropDownListToCity.DataTextField = "EnName";

            uiDropDownListFromCity.DataValueField = "AirPortID";
            uiDropDownListToCity.DataValueField = "AirPortID";

            uiDropDownListFromCity.DataBind();
            uiDropDownListToCity.DataBind();
        }

        #endregion

        protected void uiLinkButtonUpload_Click(object sender, EventArgs e)
        {
            if (uiFileUploadAirLines.HasFile)
            {
                ArrayList nonUploaded = new ArrayList();
                uiFileUploadAirLines.SaveAs(Server.MapPath("~/FileUploads/" + uiFileUploadAirLines.FileName));
                string connectionString = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0;HDR=NO;""", Server.MapPath("~/FileUploads/" + uiFileUploadAirLines.FileName));

                string strSQL = "SELECT * FROM [sheet1$]";
                OleDbConnection excelConnection = new OleDbConnection(connectionString);
                excelConnection.Open();
                OleDbCommand dbCommand = new OleDbCommand(strSQL, excelConnection);
                OleDbDataAdapter dataAdapter = new OleDbDataAdapter(dbCommand);

                DataTable dTable = new DataTable();

                dataAdapter.Fill(dTable);
                AirLines objData = new AirLines();
                if (uiDropDownListUploadType.SelectedValue == "1")
                {
                    
                    foreach (DataRow item in dTable.Rows)
                    {
                        AirPorts Fcity = new AirPorts();
                        Fcity.GetAirPortByCode(item[0].ToString());

                        AirPorts Tcity = new AirPorts();
                        Tcity.GetAirPortByCode(item[1].ToString());

                        if (Fcity.RowCount == 0 || Tcity.RowCount == 0)
                        {
                            nonUploaded.Add("From : " + item[0].ToString() + " - To : " + item[1].ToString());
                            continue;
                        }
                        else
                        {
                            objData.AddNew();
                            objData.CompanyID = Convert.ToInt32(uiDropDownListCompanyUpload.SelectedValue);
                            objData.FromAirPortID = Fcity.AirPortID;
                            objData.ToAirPortID = Tcity.AirPortID;
                        }
                    }
                }
                else if (uiDropDownListUploadType.SelectedValue == "2")
                {
                    
                    foreach (DataRow item in dTable.Rows)
                    {
                        
                        AirPorts Fcity = new AirPorts();
                        Fcity.GetAirPortByName(item[0].ToString());

                        AirPorts Tcity = new AirPorts();
                        Tcity.GetAirPortByName(item[1].ToString());

                        if (Fcity.RowCount == 0 || Tcity.RowCount == 0)
                        {
                            nonUploaded.Add("From : " + item[0].ToString() + " - To : " + item[1].ToString());
                            continue;
                        }
                        else
                        {
                            objData.AddNew();
                            objData.CompanyID = Convert.ToInt32(uiDropDownListCompanyUpload.SelectedValue);
                            objData.FromAirPortID = Fcity.AirPortID;
                            objData.ToAirPortID = Tcity.AirPortID;
                        }
                    }
                }

                objData.Save();
                BindData();

                uiGridViewLog.DataSource = nonUploaded;
                //uiGridViewLog.Columns[1].HeaderText = "These items faild to insert";
                uiGridViewLog.DataBind();
            }
        }
    }
}