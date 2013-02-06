using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using System.Data.OleDb;
using GlobalLogistics.BLL;
using System.Web.Security;
using System.Collections;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class UploadCompanies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadDDLs();        
            }            
        }

        private void LoadDDLs()
        {
            Cities objCities = new Cities();
            objCities.LoadAll();
            uiDropDownListCity.DataSource = objCities.DefaultView;
            uiDropDownListCity.DataTextField = "ArName";
            uiDropDownListCity.DataValueField = "CityID";
            uiDropDownListCity.DataBind();

            Categories objCats = new Categories();
            objCats.LoadAll();
            uiDropDownListCategory.DataSource = objCats.DefaultView;
            uiDropDownListCategory.DataTextField = "ArName";
            uiDropDownListCategory.DataValueField = "CategoryID";
            uiDropDownListCategory.DataBind();
            uiDropDownListCategory.SelectedIndex = 0;

            SubCategories objSubCat = new SubCategories();
            objSubCat.GetAllSubCategoriesByCategory(Convert.ToInt32(uiDropDownListCategory.SelectedValue));
            uiDropDownListSubCategory.DataSource = objSubCat.DefaultView;
            uiDropDownListSubCategory.DataTextField = "ArName";
            uiDropDownListSubCategory.DataValueField = "SubCategoryID";
            uiDropDownListSubCategory.DataBind();
        }

        protected void uiDropDownListCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategories objSubCat = new SubCategories();
            objSubCat.GetAllSubCategoriesByCategory(Convert.ToInt32(uiDropDownListCategory.SelectedValue));
            uiDropDownListSubCategory.DataSource = objSubCat.DefaultView;
            uiDropDownListSubCategory.DataTextField = "ArName";
            uiDropDownListSubCategory.DataValueField = "SubCategoryID";
            uiDropDownListSubCategory.DataBind();
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (uiFileUpload.HasFile)
            {
                ArrayList notUploaded = new ArrayList();
                uiFileUpload.SaveAs(Server.MapPath("~/FileUploads/" + uiFileUpload.FileName));
                string connectionString = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0;HDR=NO;""", Server.MapPath("~/FileUploads/" + uiFileUpload.FileName));

                string strSQL = "SELECT * FROM [ورقة1$]";
                OleDbConnection excelConnection = new OleDbConnection(connectionString);
                excelConnection.Open();
                OleDbCommand dbCommand = new OleDbCommand(strSQL, excelConnection);
                OleDbDataAdapter dataAdapter = new OleDbDataAdapter(dbCommand);

                DataTable dTable = new DataTable();

                dataAdapter.Fill(dTable);
                Companies objData = new Companies();
                foreach (DataRow item in dTable.Rows)
                {
                    

                    MembershipCreateStatus obj;
                    string Username = item[1].ToString().Replace(" ", "");
                    Username = Username.Replace("&", "");
                    string Password = "";
                    if (Username.Length > 10)
                    {
                        Password = Username.Substring(0,10);
                    }
                    else
                    {
                        Password = Username;
                    }

                    if (Password.Length < 6)
                    {
                        Password = Password + Password;
                    }
                    MembershipUser objUser = Membership.CreateUser(Username, Password, "info@glologistics.com", null, null, true, out obj);
                    bool success = true;
                    switch (obj)
                    {
                        case MembershipCreateStatus.DuplicateUserName:                            
                            success = false;
                            break;
                        case MembershipCreateStatus.InvalidPassword:
                            success = false;
                            break;
                        case MembershipCreateStatus.ProviderError:
                        case MembershipCreateStatus.UserRejected:
                            success = false;
                            break;
                        default:
                            break;
                    }
                    try
                    {

                        if (!Roles.IsUserInRole(Username, "Company"))
                        {
                            Roles.AddUserToRole(Username, "Company");
                        }
                    }
                    catch (Exception ex)
                    {
                        uiLabelError.Text += "001";
                        uiLabelError.Visible = true;
                    }

                    if (success)
                    {
                        try
                        {
                            
                            objData.AddNew();
                            objData.EnName = item[1].ToString();
                            objData.ArName = item[0].ToString();
                            objData.EnAddress = item[3].ToString();
                            objData.ArAddress = item[2].ToString();
                            objData.Rank = 0;
                            try
                            {
                                objData.Tele = item[4].ToString();
                            }
                            catch (Exception ex)
                            {                                
                            }
                            try
                            {
                                objData.Fax = item[5].ToString();
                            }
                            catch (Exception ex)
                            {                                
                            }

                            objData.CityID = Convert.ToInt32(uiDropDownListCity.SelectedValue);
                            objData.CategoryID = Convert.ToInt32(uiDropDownListCategory.SelectedValue);
                            if(!string.IsNullOrEmpty(uiDropDownListSubCategory.SelectedValue))
                                objData.SubCategoryID = Convert.ToInt32(uiDropDownListSubCategory.SelectedValue);
                            objData.UserName = Username;
                            
                        }
                        catch (Exception ex)
                        {                            
                            uiLabelError.Visible = true;
                            Membership.DeleteUser(Username);
                            notUploaded.Add(item[1].ToString() + " - " + ex.Message);
                            objData.MarkAsDeleted();
                        }                 
                    }
                    else
                    {
                        notUploaded.Add(item[1].ToString() + " - " + obj.ToString());
                        continue;
                    }
                }
                objData.Save();

                if (notUploaded.Count < dTable.Rows.Count)
                    uiLabelmsg.Visible = true;

                uiGridViewLog.DataSource = notUploaded;
                uiGridViewLog.Columns[0].HeaderText = "These items faild to insert";
                uiGridViewLog.DataBind();
            }
        }

       
    }
}