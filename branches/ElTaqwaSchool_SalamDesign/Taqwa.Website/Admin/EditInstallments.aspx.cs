using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditInstallments : System.Web.UI.Page
    {
        public int CurrentInstallment
        {
            get
            {
                if (Session["CurrentInstallment"] != null && !string.IsNullOrEmpty(Session["CurrentInstallment"].ToString()) && Session["CurrentInstallment"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentInstallment"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentInstallment"] = value;
            }
        }
        public int CurrentStudentToPay
        {
            get
            {
                if (Session["CurrentStudentToPay"] != null && !string.IsNullOrEmpty(Session["CurrentStudentToPay"].ToString()) && Session["CurrentStudentToPay"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentStudentToPay"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentStudentToPay"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                if (CurrentStudentToPay != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetInstallmentsByStudentIDAndSchoolYearID(CurrentStudentToPay, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxQty.Text = ds.Tables[0].Rows[0]["Quantity"].ToString();
                        uiTextBoxDate.Text = string.Format("{0:dd/MM/yyyy}", DateTime.Parse(ds.Tables[0].Rows[0]["Date"].ToString()));
                        uiTextBoxPayOrderNo.Text = ds.Tables[0].Rows[0]["PayOrderNo"].ToString();
                    }
                    uiPanelCurrentInstallments.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    uiPanelCurrentInstallments.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindStudentsData();
                }
            }
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

            uiDropDownListSchoolYear.DataSource = db.GetAllSchoolYear();
            uiDropDownListSchoolYear.DataTextField = "ArName";
            uiDropDownListSchoolYear.DataValueField = "SchoolYearID";
            uiDropDownListSchoolYear.DataBind();
            uiDropDownListSchoolYear.SelectedIndex = 0;
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetInstallmentsByStudentIDAndSchoolYearID(CurrentStudentToPay, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            uiGridViewStudentsInstallments.DataSource = ds;
            uiGridViewStudentsInstallments.DataBind();     
        }

        private void BindStudentsData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.SearchStudents(Convert.ToInt32(uiDropDownListClasses.SelectedValue), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), uiTextBoxSearchText.Text);
            uiGridViewStudents.DataSource = ds;
            uiGridViewStudents.DataBind();  
        }

        protected void uiDropDownListClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListClassRooms.DataTextField = "ArName";
            uiDropDownListClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListClassRooms.DataBind();
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BindStudentsData();
        }

        protected void uiGridViewStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudentsInstallments.PageIndex = e.NewPageIndex;
            BindData();
        }

        

        protected void uiGridViewStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditInstallments")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentStudentToPay = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetStudent(CurrentStudentToPay);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiGridViewStudentsInstallments.DataSource = db.GetInstallmentsByStudentIDAndSchoolYearID(CurrentStudentToPay, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
                    uiGridViewStudentsInstallments.DataBind();
                    uiLabelStudentName.Text = ds.Tables[0].Rows[0]["ARStudentName"].ToString() + " " + ds.Tables[0].Rows[0]["ArFatherName"].ToString();
                    DataSet StudentClassRoom = new DataSet();
                    StudentClassRoom = db.GetClassRoom(Convert.ToInt32(ds.Tables[0].Rows[0]["ClassRoomID"].ToString()));
                    DataSet StudentClass = new DataSet();
                    StudentClass = db.GetClass(Convert.ToInt32(StudentClassRoom.Tables[0].Rows[0]["ClassID"].ToString()));
                    uiLabelClass.Text = StudentClass.Tables[0].Rows[0]["ArName"].ToString();
                }
                uiPanelCurrentInstallments.Visible = false;
                uiPanelCurrent.Visible = true;
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentInstallment != 0)
            {
                db.UpdateInstallment(CurrentInstallment, float.Parse(uiTextBoxQty.Text), DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null), uiTextBoxPayOrderNo.Text, CurrentStudentToPay,Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            }
            else
            {
                db.AddInstallment(float.Parse(uiTextBoxQty.Text), DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null), uiTextBoxPayOrderNo.Text, CurrentStudentToPay, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            }
            uiPanelCurrentInstallments.Visible = false;
            uiPanelCurrent.Visible = true;
            CurrentInstallment = 0;
            ClearFields();
            BindData();
        }

        private void ClearFields()
        {
            uiTextBoxDate.Text = "";
            uiTextBoxPayOrderNo.Text = "";
            uiTextBoxQty.Text = "";            
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentInstallments.Visible = false;
            uiPanelCurrent.Visible = true;
            CurrentInstallment = 0;
            BindData();
        }

        protected void uiButtonNewStudent_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentInstallments.Visible = true;
            uiPanelCurrent.Visible = false;
            BindStudentsData(); 
        }

        protected void uiGridViewStudentsInstallments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStudentsInstallments.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewStudentsInstallments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditInstallment")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentInstallment = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetInstallments(id);
                if (ds.Tables[0].Rows.Count > 0)
                {                    
                    uiTextBoxQty.Text = ds.Tables[0].Rows[0]["Quantity"].ToString();
                    uiTextBoxDate.Text = string.Format("{0:dd/MM/yyyy}", DateTime.Parse(ds.Tables[0].Rows[0]["Date"].ToString()));
                    uiTextBoxPayOrderNo.Text = ds.Tables[0].Rows[0]["PayOrderNo"].ToString();
                }
                uiPanelCurrentInstallments.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteInstallment")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentInstallment = id;
                DBLayer db = new DBLayer();
                db.DeleteInstallment(id);
                uiPanelCurrentInstallments.Visible = false;
                uiPanelCurrent.Visible = true;
                BindData();
            }
        }
    }
}