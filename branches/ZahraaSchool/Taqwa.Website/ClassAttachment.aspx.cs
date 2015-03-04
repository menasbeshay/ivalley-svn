using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class ClassAttachment : System.Web.UI.Page
    {
        public int currentPage
        {
            get
            {
                object o = Session["CurrentPagev"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { Session["CurrentPagev"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDls();
                BindData();
            }
        }

        private void LoadDDls()
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
            if (uiDropDownListClasses.Items.Count > 0)
            {
                uiDropDownListClasses.SelectedIndex = 0;               
            }

            if (Session["CurrentLoggedInStudent"] != null)
            {
                int id = Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString());
                DataSet ds = new DataSet();
                ds = db.GetStudent(id);
                DataSet StudentClassRoom = new DataSet();
                StudentClassRoom = db.GetClassRoom(Convert.ToInt32(ds.Tables[0].Rows[0]["ClassRoomID"].ToString()));
                uiDropDownListClasses.SelectedValue = StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString();

            }

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
            uiDropDownListCourses.Items.Insert(0, new ListItem("واجبات وأنشطة", "-2"));
            uiDropDownListCourses.Items.Insert(0, new ListItem("عام", "-1"));
            
            if (uiDropDownListCourses.Items.Count > 0)
            {
                uiDropDownListCourses.SelectedIndex = 0;                
            }

        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet Filesds = new DataSet();
            DataSet Videosds = new DataSet();
            int classid = 0, yearid = 0, courseid = 0;
            int.TryParse(uiDropDownListClasses.SelectedValue, out classid);
            int.TryParse(uiDropDownListSchoolYear.SelectedValue, out yearid);
            int.TryParse(uiDropDownListCourses.SelectedValue, out courseid);
            Filesds = db.GetGetClassAttachmentByClassIDAndYearIDAndCourseIDAndType(classid, yearid, courseid, false);
            Videosds = db.GetGetClassAttachmentByClassIDAndYearIDAndCourseIDAndType(classid, yearid, courseid, true);
            uiGridViewAttachment.DataSource = Filesds;
            uiGridViewAttachment.DataBind();

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = Videosds.Tables[0].DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 12;
            pds.CurrentPageIndex = currentPage;
            uiRepeaterCurrentVedios.DataSource = pds;
            uiRepeaterCurrentVedios.DataBind();
            uiLinkButtonPrev.Enabled = true;
            uiLinkButtonNext.Enabled = true;
            if (currentPage == 0)
            {
                uiLinkButtonPrev.Enabled = false;
            }

            if (currentPage == (pds.PageCount - 1))
            {
                uiLinkButtonNext.Enabled = false;
            }

            uiLabelClass.Text = uiDropDownListClasses.SelectedItem.Text;
            uiLabelCourse.Text = uiDropDownListCourses.SelectedItem.Text;
        }

        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            currentPage++;
            BindData();
        }
        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            currentPage--;
            BindData();
        }

        protected void uiGridViewAttachment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewAttachment.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiRepeaterCurrentVedios_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image thumb = (Image)e.Item.FindControl("uiImageThumb");
                DataRowView row = (DataRowView)e.Item.DataItem;
                string vid = row["FilePath"].ToString().Substring(row["FilePath"].ToString().IndexOf("v=") + 2);
                if (vid.Contains("&"))
                    vid = vid.Substring(0, vid.IndexOf("&"));
                thumb.ImageUrl = "http://img.youtube.com/vi/" + vid + "/0.jpg";


                Literal iframe = (Literal)e.Item.FindControl("uiLiteralIFrame");
                iframe.Text = "<iframe id='player' type='text/html' src='http://www.youtube.com/embed/" + vid + "?enablejsapi=1' frameborder='0' style='max-width:100%;min-height:400px;width:450px;'></iframe>";
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
    }
}