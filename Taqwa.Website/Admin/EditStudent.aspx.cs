using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditStudent : System.Web.UI.Page
    {
        public int CurrentStudent
        {
            get
            {
                if (Session["CurrentStudent"] != null && !string.IsNullOrEmpty(Session["CurrentStudent"].ToString()) && Session["CurrentStudent"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentStudent"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentStudent"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                //if (CurrentStudent != 0)
                //{
                //    //BindData();
                //    LoadDDLs();
                //    DBLayer db = new DBLayer();
                //    DataSet ds = new DataSet();
                //    ds = db.GetStudent(CurrentStudent);
                //    if (ds.Tables[0].Rows.Count > 0)
                //    {
                //        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENStudentName"].ToString();
                //        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArStudentName"].ToString();
                //        uiTextBoxENFatherName.Text = ds.Tables[0].Rows[0]["ENFatherName"].ToString();
                //        uiTextBoxARFatherName.Text = ds.Tables[0].Rows[0]["ArFatherName"].ToString();
                //        uiTextBoxNationalNo.Text = ds.Tables[0].Rows[0]["FatherNationalNumber"].ToString();
                //        uiTextBoxJobDesc.Text = ds.Tables[0].Rows[0]["FatherJobDesc"].ToString();
                //        uiTextBoxEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                //        uiTextBoxTele.Text = ds.Tables[0].Rows[0]["Tele"].ToString();
                //        uiTextBoxMobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                //        uiTextBoxAddress.Text = ds.Tables[0].Rows[0]["StudentAddress"].ToString();
                //        uiCheckBoxIsActive.Checked = (bool)ds.Tables[0].Rows[0]["IsActive"];
                //        uiTextBoxUsername.Text = ds.Tables[0].Rows[0]["UserName"].ToString();

                //        DataSet StudentClassRoom = new DataSet();
                //        StudentClassRoom = db.GetClassRoom(Convert.ToInt32(ds.Tables[0].Rows[0]["ClassRoomID"].ToString()));

                //        uiDropDownListStudentClass.SelectedValue = StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString();
                //        uiDropDownListStudentClassRoom.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListStudentClass.SelectedValue));
                //        uiDropDownListStudentClassRoom.DataTextField = "ArName";
                //        uiDropDownListStudentClassRoom.DataValueField = "ClassRoomID";
                //        uiDropDownListStudentClassRoom.DataBind();
                //        if (uiDropDownListStudentClassRoom.Items.Count > 0)
                //        {
                //            uiDropDownListStudentClassRoom.SelectedValue = ds.Tables[0].Rows[0]["ClassRoomID"].ToString();
                //        }
                //    }
                //    uiPanelCurrentStudents.Visible = false;
                //    uiPanelCurrent.Visible = true;
                //    uiPanelPrint.Visible = false;
                //}
                //else
                //{                    
                    uiPanelCurrentStudents.Visible = true;
                    uiPanelCurrent.Visible = false;
                    uiPanelPrint.Visible = false;
                    LoadDDLs();
                    BindData();
                //}
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            if (!string.IsNullOrEmpty(uiDropDownListClasses.SelectedValue) && !string.IsNullOrEmpty(uiDropDownListClassRooms.SelectedValue))
            {
                //ds = db.SearchStudents(Convert.ToInt32(uiDropDownListClasses.SelectedValue), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), uiTextBoxSearchText.Text);
                ds = db.SearchStudentsByStudentAndFather(Convert.ToInt32(uiDropDownListClasses.SelectedValue), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), uiTextBoxSearchText.Text, uiTextBoxFatherName.Text);
            }
            if (ds.Tables.Count > 0)
            {
                uiGridViewStudents.DataSource = ds;
            }
            else
            {
                uiGridViewStudents.DataSource = null;
            }
            uiGridViewStudents.DataBind();           
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListClasses.DataSource = db.GetAllClass();
            uiDropDownListClasses.DataTextField = "ArName";
            uiDropDownListClasses.DataValueField = "ClassID";
            uiDropDownListClasses.DataBind();
            uiDropDownListClasses.SelectedIndex = 0;

            uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListClassRooms.DataTextField = "ArName";
            uiDropDownListClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListClassRooms.DataBind();
            if (uiDropDownListClassRooms.Items.Count > 0)
            {
                uiDropDownListClassRooms.SelectedIndex = 0;
            }

            uiDropDownListStudentClass.DataSource = db.GetAllClass();
            uiDropDownListStudentClass.DataTextField = "ArName";
            uiDropDownListStudentClass.DataValueField = "ClassID";
            uiDropDownListStudentClass.DataBind();
            uiDropDownListStudentClass.SelectedIndex = 0;

            uiDropDownListStudentClassRoom.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListStudentClass.SelectedValue));
            uiDropDownListStudentClassRoom.DataTextField = "ArName";
            uiDropDownListStudentClassRoom.DataValueField = "ClassRoomID";
            uiDropDownListStudentClassRoom.DataBind();
            if (uiDropDownListStudentClassRoom.Items.Count > 0)
            {
                uiDropDownListStudentClassRoom.SelectedIndex = 0;
            }
        }

        protected void uiDropDownListClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListClassRooms.DataTextField = "ArName";
            uiDropDownListClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListClassRooms.DataBind();
            if (uiDropDownListClassRooms.Items.Count > 0)
            {
                uiDropDownListClassRooms.SelectedIndex = 0;
            }
        }

        protected void uiDropDownListStudentClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            uiDropDownListStudentClassRoom.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListStudentClass.SelectedValue));
            uiDropDownListStudentClassRoom.DataTextField = "ArName";
            uiDropDownListStudentClassRoom.DataValueField = "ClassRoomID";
            uiDropDownListStudentClassRoom.DataBind();
            if (uiDropDownListStudentClassRoom.Items.Count > 0)
            {
                uiDropDownListStudentClassRoom.SelectedIndex = 0;
            }
        }
        
        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BindData();  
        }

        protected void uiGridViewStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudents.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditStudent")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentStudent = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetStudent(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENStudentName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArStudentName"].ToString();
                    uiTextBoxENFatherName.Text = ds.Tables[0].Rows[0]["ENFatherName"].ToString();
                    uiTextBoxARFatherName.Text = ds.Tables[0].Rows[0]["ArFatherName"].ToString();
                    uiTextBoxNationalNo.Text = ds.Tables[0].Rows[0]["FatherNationalNumber"].ToString();
                    uiTextBoxJobDesc.Text = ds.Tables[0].Rows[0]["FatherJobDesc"].ToString();
                    uiTextBoxEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    uiTextBoxTele.Text = ds.Tables[0].Rows[0]["Tele"].ToString();
                    uiTextBoxMobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                    uiTextBoxAddress.Text = ds.Tables[0].Rows[0]["StudentAddress"].ToString();
                    uiCheckBoxIsActive.Checked = (bool)ds.Tables[0].Rows[0]["IsActive"];
                    uiTextBoxUsername.Text = ds.Tables[0].Rows[0]["UserName"].ToString();

                    DataSet StudentClassRoom = new DataSet();
                    StudentClassRoom = db.GetClassRoom(Convert.ToInt32(ds.Tables[0].Rows[0]["ClassRoomID"].ToString()));

                    uiDropDownListStudentClass.SelectedValue = StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString();
                    uiDropDownListStudentClassRoom.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListStudentClass.SelectedValue));
                    uiDropDownListStudentClassRoom.DataTextField = "ArName";
                    uiDropDownListStudentClassRoom.DataValueField = "ClassRoomID";
                    uiDropDownListStudentClassRoom.DataBind();
                    if (uiDropDownListStudentClassRoom.Items.Count > 0)
                    {
                        uiDropDownListStudentClassRoom.SelectedValue = ds.Tables[0].Rows[0]["ClassRoomID"].ToString();
                    }
                }
                uiPanelCurrentStudents.Visible = false;
                uiPanelCurrent.Visible = true;

                uiPanelMonthlyReport.Visible = false;
                uiPanelAttendanceReport.Visible = false;
                uiPanelFees.Visible = false;
                uiPanelInstallments.Visible = false;
                uiPanelResults.Visible = false;
            }
            else if (e.CommandName == "DeleteStudent")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentStudent = id;
                DBLayer db = new DBLayer();
                db.DeleteStudent(id);
                uiPanelCurrentStudents.Visible = true;
                uiPanelCurrent.Visible = false;
                uiPanelPrint.Visible = false;

                uiPanelMonthlyReport.Visible = false;
                uiPanelAttendanceReport.Visible = false;
                uiPanelFees.Visible = false;
                uiPanelInstallments.Visible = false;
                uiPanelResults.Visible = false;
                BindData();
            }
            else if (e.CommandName == "EditMonthlyReport")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["CurrentCheckedStudent"] = id;
                ucMonthlyReport1.BindData();
                uiPanelMonthlyReport.Visible = true;
                uiPanelAttendanceReport.Visible = false;
                uiPanelFees.Visible = false;
                uiPanelInstallments.Visible = false;
                uiPanelResults.Visible = false;
            }

            else if (e.CommandName == "EditAttedanceReport")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["CurrentCheckedStudentForAtt"] = id;
                ucAttendanceReport1.BindData();
                uiPanelAttendanceReport.Visible = true;
                uiPanelMonthlyReport.Visible = false;
                uiPanelFees.Visible = false;
                uiPanelInstallments.Visible = false;
                uiPanelResults.Visible = false;
            }

            else if (e.CommandName == "EditFees")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["CurrentStudentActive"] = id;
                ucFees1.BindData();
                uiPanelAttendanceReport.Visible = false;
                uiPanelMonthlyReport.Visible = false;
                uiPanelFees.Visible = true;
                uiPanelInstallments.Visible = false;
                uiPanelResults.Visible = false;
            }

            else if (e.CommandName == "EditInstallments")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["CurrentStudentToPay"] = id;
                ucInstallment1.BindData();
                uiPanelAttendanceReport.Visible = false;
                uiPanelMonthlyReport.Visible = false;
                uiPanelFees.Visible = false;
                uiPanelInstallments.Visible = true;
                uiPanelResults.Visible = false;
            }
            else if (e.CommandName == "EditResultsFHMT")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["CurrentActiveStudent"] = id;
                Session["CurrentResultType"] = 1;
                ucresults1.BindData();
                uiPanelAttendanceReport.Visible = false;
                uiPanelMonthlyReport.Visible = false;
                uiPanelFees.Visible = false;
                uiPanelInstallments.Visible = false;
                uiPanelResults.Visible = true;
            }
            else if (e.CommandName == "EditResultsFHF")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["CurrentActiveStudent"] = id;
                Session["CurrentResultType"] = 2;
                ucresults1.BindData();
                uiPanelAttendanceReport.Visible = false;
                uiPanelMonthlyReport.Visible = false;
                uiPanelFees.Visible = false;
                uiPanelInstallments.Visible = false;
                uiPanelResults.Visible = true;
            }
            else if (e.CommandName == "EditResultsSHMT")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["CurrentActiveStudent"] = id;
                Session["CurrentResultType"] = 3;
                ucresults1.BindData();
                uiPanelAttendanceReport.Visible = false;
                uiPanelMonthlyReport.Visible = false;
                uiPanelFees.Visible = false;
                uiPanelInstallments.Visible = false;
                uiPanelResults.Visible = true;
            }
            else if (e.CommandName == "EditResultsSHF")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["CurrentActiveStudent"] = id;
                Session["CurrentResultType"] = 4;
                ucresults1.BindData();
                uiPanelAttendanceReport.Visible = false;
                uiPanelMonthlyReport.Visible = false;
                uiPanelFees.Visible = false;
                uiPanelInstallments.Visible = false;
                uiPanelResults.Visible = true;
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            int id = 0;
            if (CurrentStudent != 0)
            {
                db.UpdateStudent(CurrentStudent,
                                uiTextBoxARFatherName.Text,
                                uiTextBoxENFatherName.Text,
                                uiTextBoxNationalNo.Text ,
                                uiTextBoxJobDesc.Text,
                                uiTextBoxArName.Text,
                                uiTextBoxEnName.Text,
                                uiTextBoxTele.Text,
                                uiTextBoxMobile.Text,
                                uiTextBoxEmail.Text ,                      
                                uiTextBoxAddress.Text ,
                                uiCheckBoxIsActive.Checked ,
                                Convert.ToInt32(uiDropDownListStudentClassRoom.SelectedValue),
                                uiTextBoxUsername.Text );
                id = CurrentStudent;
            }
            else
            {
                id = db.AddStudent(uiTextBoxARFatherName.Text,
                            uiTextBoxENFatherName.Text,
                            uiTextBoxNationalNo.Text,
                            uiTextBoxJobDesc.Text,
                            uiTextBoxArName.Text,
                            uiTextBoxEnName.Text,
                            uiTextBoxTele.Text,
                            uiTextBoxMobile.Text,
                            uiTextBoxEmail.Text,
                            uiTextBoxAddress.Text,
                            uiCheckBoxIsActive.Checked,
                            Convert.ToInt32(uiDropDownListStudentClassRoom.SelectedValue),
                            uiTextBoxUsername.Text);
            }
            CurrentStudent = id;
            uiPanelCurrentStudents.Visible = false;
            uiPanelCurrent.Visible = false;
            uiPanelPrint.Visible = true;
            BindDataForPrint();
        }

        private void BindDataForPrint()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetStudent(CurrentStudent);
            if (ds.Tables[0].Rows.Count > 0)
            {
                uiLabelEnName.Text = ds.Tables[0].Rows[0]["ENStudentName"].ToString();
                uiLabelArName.Text = ds.Tables[0].Rows[0]["ArStudentName"].ToString();
                uiLabelEnFatherName.Text = ds.Tables[0].Rows[0]["ENFatherName"].ToString();
                uiLabelArFatherName.Text = ds.Tables[0].Rows[0]["ArFatherName"].ToString();
                uiLabelNationalNumber.Text = ds.Tables[0].Rows[0]["FatherNationalNumber"].ToString();
                uiLabelJobDesc.Text = ds.Tables[0].Rows[0]["FatherJobDesc"].ToString();
                uiLabelMail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                uiLabelTele.Text = ds.Tables[0].Rows[0]["Tele"].ToString();
                uiLabelMobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                uiLabelAddress.Text = ds.Tables[0].Rows[0]["StudentAddress"].ToString();
                uiCheckBoxact.Checked = (bool)ds.Tables[0].Rows[0]["IsActive"];
                uiLabelUsername.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
                uiLabelSecertCode.Text = ds.Tables[0].Rows[0]["SecretCode"].ToString();
            }
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentStudents.Visible = true;
            uiPanelCurrent.Visible = false;
            uiPanelPrint.Visible = false;
            uiPanelMonthlyReport.Visible = false;
            uiPanelAttendanceReport.Visible = false;
            uiPanelFees.Visible = false;
            uiPanelInstallments.Visible = false;
            uiPanelResults.Visible = false;
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentStudents.Visible = false;
            uiPanelCurrent.Visible = true;
            uiPanelMonthlyReport.Visible = false;
            uiPanelAttendanceReport.Visible = false;
            uiPanelFees.Visible = false;
            uiPanelInstallments.Visible = false; 
            uiPanelPrint.Visible = false;
            uiPanelResults.Visible = false;
        }

        private void ClearFields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxENFatherName.Text = "";
            uiTextBoxARFatherName.Text = "";
            uiTextBoxNationalNo.Text = "";
            uiTextBoxJobDesc.Text = "";
            uiTextBoxEmail.Text = "";
            uiTextBoxTele.Text = "";
            uiTextBoxMobile.Text = "";
            uiTextBoxAddress.Text = "";
            uiCheckBoxIsActive.Checked = false;
            uiTextBoxUsername.Text = "";            
        }

        


    }
}