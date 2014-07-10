using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin.Controls
{
    public partial class ucresults : System.Web.UI.UserControl
    {
        public int CurrentActiveStudent
        {
            get
            {
                if (Session["CurrentActiveStudent"] != null && !string.IsNullOrEmpty(Session["CurrentActiveStudent"].ToString()) && Session["CurrentActiveStudent"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentActiveStudent"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentActiveStudent"] = value;
            }
        }

        public int CurrentResult
        {
            get
            {
                if (Session["CurrentResult"] != null && !string.IsNullOrEmpty(Session["CurrentResult"].ToString()) && Session["CurrentResult"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentResult"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentResult"] = value;
            }
        }

        public DataSet CurrentStudentResults 
        {
            get
            {
                if (Session["CurrentStudentResults"] != null && !string.IsNullOrEmpty(Session["CurrentStudentResults"].ToString()) && Session["CurrentStudentResults"].ToString() != "0")
                {
                    return (DataSet)Session["CurrentStudentResults"];
                }
                else
                {
                    return null;
                }
            }
            set
            {
                Session["CurrentStudentResults"] = value;
            }      
        }

        public int CurrentResultType
        {
            get
            {
                if (Session["CurrentResultType"] != null && !string.IsNullOrEmpty(Session["CurrentResultType"].ToString()) && Session["CurrentResultType"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentResultType"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentResultType"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
            }
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
        }

        public void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetStudent(CurrentActiveStudent);
            if (ds.Tables[0].Rows.Count > 0)
            {
               /* uiGridViewStudentResults.DataSource = db.GetResultByStudentIDAndSchoolYearForAdmin(CurrentActiveStudent, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                uiGridViewStudentResults.DataBind();*/
                uiLabelStudentName.Text = ds.Tables[0].Rows[0]["ArStudentName"].ToString() + " " +  ds.Tables[0].Rows[0]["ArFatherName"].ToString();
                DataSet StudentClassRoom = new DataSet();
                StudentClassRoom = db.GetClassRoom(Convert.ToInt32(ds.Tables[0].Rows[0]["ClassRoomID"].ToString()));
                DataSet StudentClass = new DataSet();
                StudentClass = db.GetClass(Convert.ToInt32(StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString()));
                uiLabelClass.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
                uiHiddenFieldClassID.Value = StudentClass.Tables[0].Rows[0]["ClassID"].ToString();
               

                BindResults(Convert.ToInt32(StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString()));
                
            }            
        }

        public void BindResults(int classID)
        {
            
            DBLayer db = new DBLayer();
            CurrentStudentResults = db.GetResultByStudentIDAndSchoolYearForAdmin(CurrentActiveStudent, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            uiRepeaterResults.DataSource = db.GetAllCoursesByClass(classID);
            uiRepeaterResults.DataBind();
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {            
            DBLayer db = new DBLayer();
            foreach (RepeaterItem item in uiRepeaterResults.Items)
            {
                TextBox grade = (TextBox)item.FindControl("uiTextBoxGrade");
                DropDownList eval = (DropDownList)item.FindControl("uiDropDownListEval");
                HiddenField CourseId = (HiddenField)item.FindControl("uiHiddenFieldResultID");
                HiddenField ResultId = (HiddenField)item.FindControl("uiHiddenFieldCourseID");
                HiddenField MaxGrade = (HiddenField)item.FindControl("uiHiddenFieldMaxGrade");
                if (float.Parse(grade.Text) <= float.Parse(MaxGrade.Value))
                {

                    if (ResultId.Value != "0" && !string.IsNullOrEmpty(grade.Text) && !string.IsNullOrEmpty(eval.Text))
                    {
                        db.UpdateResult(Convert.ToInt32(ResultId.Value), CurrentActiveStudent, Convert.ToInt32(CourseId.Value), float.Parse(grade.Text), eval.Text, (CurrentResultType == 1), (CurrentResultType == 2), (CurrentResultType == 3), (CurrentResultType == 4), Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                    }
                    else if (!string.IsNullOrEmpty(grade.Text) && !string.IsNullOrEmpty(eval.Text))
                    {
                        db.AddResult(CurrentActiveStudent, Convert.ToInt32(CourseId.Value), float.Parse(grade.Text), eval.Text, (CurrentResultType == 1), (CurrentResultType == 2), (CurrentResultType == 3), (CurrentResultType == 4), Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                    }

                }
                else
                {
                    uiLabelError.Visible = true;
                    uiLabelError.Text += "<br/>لا يمكن إضافة نتيجة أعلى من النهاية العظمى";
                }
                
            }
                                  
            //BindData();
            BindResults(Convert.ToInt32(uiHiddenFieldClassID.Value));
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();            
            BindData();
        }

        private void ClearFields()
        {
            
            CurrentActiveStudent = 0;
            CurrentResult = 0;
            
        }        

        protected void uiRepeaterResults_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Label course = (Label)e.Item.FindControl("uiLabelCourseName");
                TextBox grade = (TextBox)e.Item.FindControl("uiTextBoxGrade");
                DropDownList eval = (DropDownList)e.Item.FindControl("uiDropDownListEval");
                HiddenField CourseId = (HiddenField)e.Item.FindControl("uiHiddenFieldResultID");
                HiddenField ResultId = (HiddenField)e.Item.FindControl("uiHiddenFieldCourseID");
                HiddenField MaxGrade = (HiddenField)e.Item.FindControl("uiHiddenFieldMaxGrade");
                

                DataRowView row = (DataRowView)e.Item.DataItem;

                ResultId.Value = "0";
                course.Text = row["ArName"].ToString();
                CourseId.Value = row["CourseID"].ToString();
                MaxGrade.Value = row["MaxGrade"].ToString();

                foreach (DataRow item in CurrentStudentResults.Tables[0].Rows)
	            {
                    
                    if (CurrentResultType == 1)
                    {
                        if (row["CourseID"].ToString() == item["CourseID"].ToString() && uiDropDownListSchoolYear.SelectedValue == item["SchoolYearID"].ToString() && item["FirstHalfMidterm"].ToString() == "True")
                        {
                            grade.Text = item["Grade"].ToString();
                            eval.Text = item["Evaluation"].ToString();
                            ResultId.Value = item["ResultID"].ToString();                            
                        }
                    }
                    else if (CurrentResultType == 2)
                    {
                        if (row["CourseID"].ToString() == item["CourseID"].ToString() && uiDropDownListSchoolYear.SelectedValue == item["SchoolYearID"].ToString() && item["FirstHalfFinal"].ToString() == "True")
                        {
                            grade.Text = item["Grade"].ToString();
                            eval.Text = item["Evaluation"].ToString();
                            ResultId.Value = item["ResultID"].ToString();                          
                        }
                    }
                    else if (CurrentResultType == 3)
                    {
                        if (row["CourseID"].ToString() == item["CourseID"].ToString() && uiDropDownListSchoolYear.SelectedValue == item["SchoolYearID"].ToString() && item["SecondHalfMidterm"].ToString() == "True")
                        {
                            grade.Text = item["Grade"].ToString();
                            eval.Text = item["Evaluation"].ToString();
                            ResultId.Value = item["ResultID"].ToString();                            
                        }
                    }
                    else if (CurrentResultType == 4)
                    {
                        if (row["CourseID"].ToString() == item["CourseID"].ToString() && uiDropDownListSchoolYear.SelectedValue == item["SchoolYearID"].ToString() && item["SecondHalfFinal"].ToString() == "True")
                        {
                            grade.Text = item["Grade"].ToString();
                            eval.Text = item["Evaluation"].ToString();
                            ResultId.Value = item["ResultID"].ToString();                            
                        }
                    }
	            }
            }
        }

    }
}