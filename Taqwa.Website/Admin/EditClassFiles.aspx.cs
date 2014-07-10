using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditClassFiles : System.Web.UI.Page
    {
        public int CurrentAttachment
        {
            get
            {
                if (Session["CurrentAttachment_f"] != null && !string.IsNullOrEmpty(Session["CurrentAttachment_f"].ToString()) && Session["CurrentAttachment_f"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentAttachment_f"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentAttachment_f"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                uiPanelCurrentClasses.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }


        protected void uiDropDownListClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCourses();
            BindData();
        }


        protected void uiDropDownListCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
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
                    uiTextBoxEnTeacherName.Text = ds.Tables[0].Rows[0]["EnTeacherName"].ToString();
                    uiTextBoxArTeacherName.Text = ds.Tables[0].Rows[0]["ArTeacherName"].ToString();
                    uiLabelClassName.Text = ds.Tables[0].Rows[0]["ArClassName"].ToString();
                    uiLabelCourseName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                }

                uiPanelCurrentClasses.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteClassAttachment")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentAttachment = id;
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
            int.TryParse(uiDropDownListClasses.SelectedValue, out classid);
            int.TryParse(uiDropDownListSchoolYear.SelectedValue, out yearid);
            int.TryParse(uiDropDownListCourses.SelectedValue, out courseid);
            string path = "";
            if (uiFileUploadAttachment.HasFile)
            {
                path = "/userfiles/Attachment/" + DateTime.Now.ToString("ddMMyyyyhhmmss_") + uiFileUploadAttachment.FileName;
                uiFileUploadAttachment.SaveAs(Server.MapPath("~" + path));
            }
            if (CurrentAttachment != 0)
            {
                db.UpdateClassAttachment(CurrentAttachment, classid, yearid, courseid, uiTextBoxArName.Text, uiTextBoxEnName.Text, uiTextBoxArTeacherName.Text, uiTextBoxEnTeacherName.Text, DateTime.Now, path, false);
            }
            else
            {
                db.AddClassAttachment(classid, yearid, courseid, uiTextBoxArName.Text, uiTextBoxEnName.Text, uiTextBoxArTeacherName.Text, uiTextBoxEnTeacherName.Text, DateTime.Now, path, false);
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
            if (uiDropDownListClasses.SelectedIndex == 0 || uiDropDownListCourses.SelectedIndex == 0)
            {
                uiLabelError.Visible = true;
                return;
            }
            uiLabelClassName.Text = uiDropDownListClasses.SelectedItem.Text;
            uiLabelCourseName.Text = uiDropDownListCourses.SelectedItem.Text;
            uiPanelCurrentClasses.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            int classid = 0, yearid = 0, courseid = 0;
            int.TryParse(uiDropDownListClasses.SelectedValue, out classid);
            int.TryParse(uiDropDownListSchoolYear.SelectedValue, out yearid);
            int.TryParse(uiDropDownListCourses.SelectedValue, out courseid);
            ds = db.GetGetClassAttachmentByClassIDAndYearIDAndCourseIDAndType(classid, yearid, courseid, false);
            uiGridViewAttachment.DataSource = ds;
            uiGridViewAttachment.DataBind();
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListSchoolYear.DataSource = db.GetAllSchoolYear();
            uiDropDownListSchoolYear.DataTextField = "ArName";
            uiDropDownListSchoolYear.DataValueField = "SchoolYearID";
            uiDropDownListSchoolYear.DataBind();
            if (db.GetCurrentSchoolYear().Tables[0].Rows.Count > 0)
                uiDropDownListSchoolYear.SelectedValue = db.GetCurrentSchoolYear().Tables[0].Rows[0]["SchoolYearID"].ToString();
            else
                uiDropDownListSchoolYear.SelectedIndex = 0;

            uiDropDownListClasses.DataSource = db.GetAllClass();
            uiDropDownListClasses.DataTextField = "ArName";
            uiDropDownListClasses.DataValueField = "ClassID";
            uiDropDownListClasses.DataBind();
            uiDropDownListClasses.Items.Insert(0, new ListItem("كل الصفوف", "0"));
            if (uiDropDownListClasses.Items.Count > 0)
                uiDropDownListClasses.SelectedIndex = 0;            

            LoadCourses();
        }


        private void LoadCourses()
        {
            DBLayer db = new DBLayer();
            if (uiDropDownListClasses.SelectedIndex != -1)
                uiDropDownListCourses.DataSource = db.GetAllCoursesByClass(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListCourses.DataTextField = "ArName";
            uiDropDownListCourses.DataValueField = "CourseID";
            uiDropDownListCourses.DataBind();
            uiDropDownListCourses.Items.Insert(0, new ListItem("كل المواد", "0"));
            if(uiDropDownListCourses.Items.Count > 0)
                uiDropDownListCourses.SelectedIndex = 0;
        }


        private void ClearFields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxEnTeacherName.Text = "";
            uiTextBoxArTeacherName.Text = "";            
        }
    }
}