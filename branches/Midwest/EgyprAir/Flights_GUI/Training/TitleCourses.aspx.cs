using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;

namespace Flights_GUI.Training
{
    public partial class TitleCourses : System.Web.UI.Page
    {

        #region properties
        
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDls();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Flight_BLL.TitleCourse tc = new TitleCourse();
            tc.AddNew();
            tc.CourseID = Convert.ToInt32(uiDropDownListCourses.SelectedValue);
            tc.TitleID = Convert.ToInt32(uiDropDownListTitle.SelectedValue);
            tc.Save();
            BindCourses();
        }

        protected void uiGridViewTitleCourses_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewTitleCourses.PageIndex = e.NewPageIndex;
            BindCourses();
        }

        protected void uiGridViewTitleCourses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteCourse")
            {
                Flight_BLL.TitleCourse objData = new Flight_BLL.TitleCourse();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()), Convert.ToInt32(uiDropDownListTitle.SelectedValue));                
                objData.MarkAsDeleted();
                objData.Save();
                BindCourses();
            }
        }

        protected void uiDropDownListTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCourses();
        }
        #endregion

        #region methods

        private void LoadDDls()
        {
            Flight_BLL.Title titles = new Title();
            titles.LoadAll();
            uiDropDownListTitle.DataSource = titles.DefaultView;
            uiDropDownListTitle.DataTextField = "Name";
            uiDropDownListTitle.DataValueField = "TitleID";
            uiDropDownListTitle.DataBind();

            Flight_BLL.Course courses = new Course();
            courses.LoadAll();
            uiDropDownListCourses.DataSource = courses.DefaultView;
            uiDropDownListCourses.DataTextField = "Name";
            uiDropDownListCourses.DataValueField = "CourseID";
            uiDropDownListCourses.DataBind();

        }

        private void BindCourses()
        {
            uiLabelCourseLabel.Text = GetLocalResourceObject("Title").ToString() + uiDropDownListTitle.SelectedItem.Text;
            Flight_BLL.Course courses = new Course();
            courses.GetTitleCoursesByTitleID(Convert.ToInt32(uiDropDownListTitle.SelectedValue));
            uiGridViewTitleCourses.DataSource = courses.DefaultView;            
            uiGridViewTitleCourses.DataBind();
        }
        #endregion


    }
}