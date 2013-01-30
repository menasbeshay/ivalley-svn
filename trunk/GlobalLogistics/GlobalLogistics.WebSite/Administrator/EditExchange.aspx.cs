using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;
using System.Data.OleDb;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditExchange : System.Web.UI.Page
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                LoadDDLs();
            }  
        }

        private void LoadDDLs()
        {
            Currency curr = new Currency();
            curr.LoadAll();
            uiDropDownListCurrencies.DataSource = curr.DefaultView;
            uiDropDownListCurrencies.DataTextField = "ArName";
            uiDropDownListCurrencies.DataValueField = "CurrencyID";
            uiDropDownListCurrencies.DataBind();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            BLL.Exchange objData = new BLL.Exchange();
            objData.AddNew();
            objData.CurrencyID = Convert.ToInt32(uiDropDownListCurrencies.SelectedValue);
            objData.CellPrice = decimal.Parse(uiTextBoxCellPrice.Text);
            objData.BuyPrice = decimal.Parse(uiTextBoxBuyPrice.Text);
            objData.LastCellPrice = decimal.Parse(uiTextBoxLastCellPrice.Text);
            objData.CreatedDate = DateTime.Now.AddHours(7);
            objData.Save();

            BindData();
        }

        protected void uiGridViewExchange_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewExchange.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewExchange_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteExchange")
            {
                BLL.Exchange objData = new BLL.Exchange();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiGridViewExchange_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                Currency cat = new Currency();
                cat.LoadByPrimaryKey(Convert.ToInt32(objData["CurrencyID"].ToString()));
                Label temp = (Label)e.Row.FindControl("uiLabelCurrencyName");
                temp.Text = cat.ArName;
            }
        }

        #endregion

        #region Methods
        private void BindData()
        {
            BLL.Exchange objData = new BLL.Exchange();
            objData.LoadAll();
            uiGridViewExchange.DataSource = objData.DefaultView;
            uiGridViewExchange.DataBind();
        }
        #endregion

        protected void uiLinkButtonUpload_Click(object sender, EventArgs e)
        {
            if (uiFileUploadExchange.HasFile)
            {
                uiFileUploadExchange.SaveAs(Server.MapPath("~/FileUploads/" + uiFileUploadExchange.FileName));
                string connectionString = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0;HDR=NO;""", Server.MapPath("~/FileUploads/" + uiFileUploadExchange.FileName));

                string strSQL = "SELECT * FROM [sheet1$]";
                OleDbConnection excelConnection = new OleDbConnection(connectionString);
                excelConnection.Open();
                OleDbCommand dbCommand = new OleDbCommand(strSQL, excelConnection);
                OleDbDataAdapter dataAdapter = new OleDbDataAdapter(dbCommand);

                DataTable dTable = new DataTable();

                dataAdapter.Fill(dTable);
                BLL.Exchange objData = new BLL.Exchange();
                foreach (DataRow item in dTable.Rows)
                {
                    
                    objData.AddNew();
                    objData.CurrencyID = Convert.ToInt32(item[0].ToString());
                    objData.CellPrice = decimal.Parse(item[1].ToString());
                    objData.LastCellPrice = decimal.Parse(item[2].ToString());
                    objData.CreatedDate = DateTime.Now.AddHours(7);
                }
                objData.Save();
                BindData();

            }
        }

        protected void uiLinkButtonDelete_Click(object sender, EventArgs e)
        {
            BLL.Exchange objData = new BLL.Exchange();
            objData.LoadAll();
            objData.DeleteAll();
            objData.Save();
            BindData();
        }
    }
}