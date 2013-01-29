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
    public partial class EditMinerals : System.Web.UI.Page
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
            Mines curr = new Mines();
            curr.LoadAll();
            uiDropDownListMins.DataSource = curr.DefaultView;
            uiDropDownListMins.DataTextField = "ArName";
            uiDropDownListMins.DataValueField = "MinID";
            uiDropDownListMins.DataBind();
        }
        
        protected void uiGridViewMineral_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                Mines cat = new Mines();
                cat.LoadByPrimaryKey(Convert.ToInt32(objData["MinID"].ToString()));
                Label temp = (Label)e.Row.FindControl("uiLabelMinName");
                temp.Text = cat.ArName;
            }
        }

        protected void uiGridViewMineral_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteMineral")
            {
                Mineral objData = new Mineral();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiGridViewMineral_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewMineral.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Mineral objData = new Mineral();
            objData.AddNew();
            objData.MinID = Convert.ToInt32(uiDropDownListMins.SelectedValue);
            objData.CellPrice = uiTextBoxCellPrice.Text;
            objData.BuyPrice = uiTextBoxBuyPrice.Text;
            objData.CreatedDate = DateTime.Now.AddHours(7);
            objData.Save();

            BindData();
        }
        #endregion

        #region Methods 
        private void BindData()
        {
            Mineral objData = new Mineral();
            objData.LoadAll();
            uiGridViewMineral.DataSource = objData.DefaultView;
            uiGridViewMineral.DataBind();
        }
        #endregion

        protected void uiLinkButtonUpload_Click(object sender, EventArgs e)
        {
            if (uiFileUploadMines.HasFile)
            {
                uiFileUploadMines.SaveAs(Server.MapPath("~/FileUploads/" + uiFileUploadMines.FileName));
                string connectionString = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0;HDR=NO;""", Server.MapPath("~/FileUploads/" + uiFileUploadMines.FileName));

                string strSQL = "SELECT * FROM [sheet1$]";
                OleDbConnection excelConnection = new OleDbConnection(connectionString);
                excelConnection.Open();
                OleDbCommand dbCommand = new OleDbCommand(strSQL, excelConnection);
                OleDbDataAdapter dataAdapter = new OleDbDataAdapter(dbCommand);

                DataTable dTable = new DataTable();

                dataAdapter.Fill(dTable);
                Mineral objData = new Mineral();
                foreach (DataRow item in dTable.Rows)
                {

                    objData.AddNew();
                    objData.MinID = Convert.ToInt32(item[0].ToString());
                    objData.CellPrice = item[1].ToString();
                    objData.BuyPrice = item[2].ToString();
                    objData.CreatedDate = DateTime.Now.AddHours(7);
                }
                objData.Save();
                BindData();

            }
        }

        protected void uiLinkButtonDelete_Click(object sender, EventArgs e)
        {
            Mineral objData = new Mineral();
            objData.LoadAll();
            objData.DeleteAll();
            objData.Save();
            BindData();
        }
    }
}