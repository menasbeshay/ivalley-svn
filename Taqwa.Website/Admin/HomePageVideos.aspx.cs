using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;

namespace Taqwa.Website.Admin
{
    public partial class HomePageVideos : System.Web.UI.Page
    {
        public int CurrentAttachment
        {
            get
            {
                if (Session["CurrentHomeAttachment_v"] != null && !string.IsNullOrEmpty(Session["CurrentHomeAttachment_v"].ToString()) && Session["CurrentHomeAttachment_v"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentHomeAttachment_v"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentHomeAttachment_v"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                uiPanelCurrentClasses.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }



        protected void uiGridViewAttachment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewAttachment.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewAttachment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditClassAttachment")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentAttachment = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetClassAttachment(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnTitle"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArTitle"].ToString();
                    
                    uiTextBoxURL.Text = ds.Tables[0].Rows[0]["FilePath"].ToString();
                    
                }
                uiPanelCurrentClasses.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteClassAttachment")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                //CurrentAttachment = id;
                DBLayer db = new DBLayer();
                db.DeleteClassAttachment(id);
                uiPanelCurrentClasses.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            int classid = 0, yearid = 0, courseid = 0;
            
            if (CurrentAttachment != 0)
            {
                db.UpdateClassAttachment(CurrentAttachment, classid, yearid, courseid, uiTextBoxArName.Text, uiTextBoxEnName.Text, "","", DateTime.Now, uiTextBoxURL.Text, true);
            }
            else
            {
                db.AddClassAttachment(classid, yearid, courseid, uiTextBoxArName.Text, uiTextBoxEnName.Text, "","", DateTime.Now, uiTextBoxURL.Text, true);
            }
            uiPanelCurrentClasses.Visible = true;
            uiPanelCurrent.Visible = false;
            ClearFields();
            BindData();
        }


        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentAttachment = 0;
            uiPanelCurrentClasses.Visible = true;
            uiPanelCurrent.Visible = false;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentAttachment = 0;
            uiLabelError.Visible = false;
            
            uiPanelCurrentClasses.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            
            ds = db.GetGetClassAttachmentByClassIDAndYearIDAndCourseIDAndTypeForHome();
            uiGridViewAttachment.DataSource = ds;
            uiGridViewAttachment.DataBind();
        }

        

       


        private void ClearFields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
           
            uiTextBoxURL.Text = "";
        }

    }
}