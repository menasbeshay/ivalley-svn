using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Drawing;

namespace brotherssolidarity.Admin
{
    public partial class BranchesPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (getQueryString > 0)
            {
                if (!Page.IsPostBack)
                {
                    Branches BranEdit = new Branches();
                    BranEdit.LoadByPrimaryKey(getQueryString);
                    TxtName.Text = BranEdit.BranchName;
                    TxtAddress.Text = BranEdit.BranchAddress;
                    TxtTelephone.Text = BranEdit.Telephone;
                    TxtManagerName.Text = BranEdit.ManagerName;
                    TxtDurationHour.Text = BranEdit.Duration_Hours;
                    TxtGoogleLink.Text = BranEdit.GoogleMapLink;
                    BranchImg.Src = BranEdit.ImagePath;

                    BranchesTable.Visible = true;
                    GrdBranches.Visible = false;
                    BtnNewBranches.Visible = false;
                    RequiredUploadImg.Enabled = false;
                    SaveBranch.Text = "Update Branch";
                }
            }
            else
            {
                BranchImg.Visible = false;
            }

            if (!Page.IsPostBack)
            {
                BranchesBind();
            }
        }

        private int getQueryString
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["BranID"]))
                {
                    return int.Parse(Request.QueryString["BranID"].ToString());
                }
                else
                {
                    return 0;
                }
            }
        }

        protected void SaveBranch_Click(object sender, EventArgs e)
        {
            BranchesTable.Visible = false;
            GrdBranches.Visible = true;
            BtnNewBranches.Visible = true;

            Branches UpdateBranch = new Branches();

            if (getQueryString > 0)
            {
                UpdateBranch.LoadByPrimaryKey(getQueryString);
            }
            else
            {
                UpdateBranch.AddNew();
            }
            UpdateBranch.BranchName = TxtName.Text;
            UpdateBranch.BranchAddress = TxtAddress.Text;
            UpdateBranch.Telephone = TxtTelephone.Text;
            UpdateBranch.ManagerName = TxtManagerName.Text;
            UpdateBranch.Duration_Hours = TxtDurationHour.Text;
            UpdateBranch.GoogleMapLink = TxtGoogleLink.Text;

            if (UploadImg.HasFile)
            {
                string path = "/Admin/BranchesImg/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + UploadImg.FileName;

                Bitmap UpImg = (Bitmap)Bitmap.FromStream(UploadImg.PostedFile.InputStream);
                UpImg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);
                UpdateBranch.ImagePath = path;
            }

            UpdateBranch.Save();

            Response.Redirect("BranchesPage.aspx");
        }

        protected void GrdBranches_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteGrd")
            {
                Branches DelBran = new Branches();
                DelBran.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                DelBran.MarkAsDeleted();
                DelBran.Save();


            }
            else if (e.CommandName == "EditGrd")
            {
                int ID = int.Parse(e.CommandArgument.ToString());
                Response.Redirect("BranchesPage.aspx?BranID=" + ID.ToString());

            }

            BranchesBind();
        }

        protected void GrdBranches_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void BranchesBind()
        {
            Branches Bran = new Branches();
            Bran.LoadAll();
            GrdBranches.DataSource = Bran.DefaultView;
            GrdBranches.DataBind();
        }

        protected void BtnNewBranches_Click(object sender, EventArgs e)
        {
            BranchesTable.Visible = true;
            GrdBranches.Visible = false;
            BtnNewBranches.Visible = false;
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("BranchesPage.aspx");
        }
    }
}