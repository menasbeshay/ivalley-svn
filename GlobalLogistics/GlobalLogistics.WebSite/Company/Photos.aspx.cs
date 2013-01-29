using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.IO;

namespace GlobalLogistics.WebSite.Company
{
    public partial class Photos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            Companies currentCompany = new Companies();
            currentCompany.GetCompanyByUserName(Page.User.Identity.Name);
            BLL.Photos objData = new BLL.Photos();
            objData.GetPhotosByCompanyID(currentCompany.CompanyID);

            uiDataListPhotos.DataSource = objData.DefaultView;
            uiDataListPhotos.DataBind();
        }

        protected void uiDataListPhotos_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Delete") ;
            {
                BLL.Photos objData = new BLL.Photos();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Companies currentCompany = new Companies();
            currentCompany.GetCompanyByUserName(Page.User.Identity.Name);
            BLL.Photos objData = new BLL.Photos();
            objData.AddNew();
            objData.EnTitle = uiTextBoxEnName.Text;
            objData.ArTitle = uiTextBoxArName.Text;
            DirectoryInfo Dir = new DirectoryInfo(Server.MapPath("~/FileUploads/Companies/" + currentCompany.CompanyID.ToString()));
            if (!Dir.Exists)
                Dir.Create();
            if (uiFileUploadPhoto.HasFile)
            {
                uiFileUploadPhoto.SaveAs(Server.MapPath("~/FileUploads/Companies/" + currentCompany.CompanyID.ToString() + "/" + uiFileUploadPhoto.FileName));
                objData.PhotoPath = "/FileUploads/Companies/" + currentCompany.CompanyID.ToString() + "/" + uiFileUploadPhoto.FileName;
            }
            objData.CreatedDate = DateTime.Now;
            objData.CompanyID = currentCompany.CompanyID;
            objData.Save();
            BindData();
        }
    }
}