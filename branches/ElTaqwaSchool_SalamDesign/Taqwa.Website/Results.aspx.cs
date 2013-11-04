using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class Results : System.Web.UI.Page
    {
        public int ResultType
        {
            get
            {
                if (Request.QueryString["ResultType"] != null && !string.IsNullOrEmpty(Request.QueryString["ResultType"].ToString()) && Request.QueryString["ResultType"].ToString() != "0")
                {
                    return Convert.ToInt32(Request.QueryString["ResultType"].ToString());
                }
                else
                {
                    return 0;
                }
            }          
        }

        public bool FHMT { get { return (ResultType == 1); } }
        public bool FHF { get { return (ResultType == 2); } }
        public bool SHMT { get { return (ResultType == 3); } }
        public bool SHF { get { return (ResultType == 4); } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentLoggedInStudent"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                LoadDDLs();
            }
        }

        protected void uiButtonViewResult_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            DataSet Student= new DataSet();
            Student = db.GetStudent(Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString()));
            DataSet StudentClassRoom = new DataSet();
            StudentClassRoom = db.GetClassRoom(Convert.ToInt32(Student.Tables[0].Rows[0]["ClassRoomID"].ToString()));
            DataSet StudentClass = new DataSet();
            StudentClass = db.GetClass(Convert.ToInt32(StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString()));
            DataSet ClassType = new DataSet();
            ClassType = db.GetClassType(Convert.ToInt32(StudentClass.Tables[0].Rows[0]["ClassTypeID"].ToString()));
            
            DataSet CoursesInTotal = new DataSet();
            DataSet CoursesRemaining = new DataSet();

            CoursesInTotal = db.GetAllCoursesByClassAndInTotal(Convert.ToInt32(StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString()), true);
            CoursesRemaining = db.GetAllCoursesByClassAndInTotal(Convert.ToInt32(StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString()), false);


            switch (StudentClass.Tables[0].Rows[0]["ClassTypeID"].ToString())
            {
                case "1":
                    uiDataListKidResults.DataSource = db.GetResultByStudentIDAndSchoolYear(Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString()), Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue),FHMT, FHF, SHMT, SHF);
                    uiDataListKidResults.DataBind();
                    uiLabelKidName.Text = Student.Tables[0].Rows[0]["ArStudentname"].ToString() + " " + Student.Tables[0].Rows[0]["Arfathername"].ToString();
                    uiLabelClass.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
                    uiPanelKids.Visible = true;
                    uiPanelPrepratory.Visible = false;
                    uiPanelPrimary.Visible = false;
                    break;
                case "2":
                    DataSet AllCoursesPrimary = db.GetResultByStudentIDAndSchoolYear(Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString()), Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue), FHMT, FHF, SHMT, SHF);
                    /*DataRow[] InTotalCourses = AllCoursesPrimary.Tables[0].Select("InTotal = 1");                    */
                    uiDataListCourseInTotalPrimary.DataSource = AllCoursesPrimary;
                    uiDataListCourseInTotalPrimary.DataBind();
                    uiLabelStudentName.Text = Student.Tables[0].Rows[0]["ArStudentname"].ToString() + " " + Student.Tables[0].Rows[0]["Arfathername"].ToString();
                    uiLabelClassPrim.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
                    uiLabelClassPrimary.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
                    uiPanelKids.Visible = false;
                    uiPanelPrepratory.Visible = false;
                    uiPanelPrimary.Visible = true;
                    break;
                case "3":
                    DataSet AllCoursesPrep = db.GetResultByStudentIDAndSchoolYear(Convert.ToInt32(Session["CurrentLoggedInStudent"].ToString()), Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue), FHMT, FHF, SHMT, SHF);
                    uiDataListPrep.DataSource = AllCoursesPrep;
                    uiDataListPrep.DataBind();
                    uiLabelStudentNamePrep.Text = Student.Tables[0].Rows[0]["ArStudentname"].ToString() + " " + Student.Tables[0].Rows[0]["Arfathername"].ToString();
                    uiLabelClassPrep.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
                    uiLabelClassPreparatory.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
                    uiPanelKids.Visible = false;
                    uiPanelPrepratory.Visible = true;
                    uiPanelPrimary.Visible = false;
                    break;
                default:
                    break;
            }
            
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListSchoolYear.DataSource = db.GetAllSchoolYear();
            uiDropDownListSchoolYear.DataTextField = "ArName";
            uiDropDownListSchoolYear.DataValueField = "SchoolYearID";
            uiDropDownListSchoolYear.DataBind();
            DataSet currentYear = new DataSet();
            currentYear = db.GetCurrentSchoolYear();

            if (currentYear.Tables[0].Rows.Count > 0)
            {
                uiDropDownListSchoolYear.SelectedValue = currentYear.Tables[0].Rows[0]["SchoolYearID"].ToString();
            }
            else
            {
                uiDropDownListSchoolYear.SelectedIndex = 0;
            }
        }       
    }
}