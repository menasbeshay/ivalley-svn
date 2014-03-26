using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin.Controls
{
    public partial class ucInstallment : System.Web.UI.UserControl
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
                LoadDDLs();
        }
        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();

            uiDropDownListSchoolYear.DataSource = db.GetAllSchoolYear();
            uiDropDownListSchoolYear.DataTextField = "ArName";
            uiDropDownListSchoolYear.DataValueField = "SchoolYearID";
            uiDropDownListSchoolYear.DataBind();
            uiDropDownListSchoolYear.SelectedIndex = 0;
        }

        public void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();

            DataSet dsStudent = new DataSet();
            DataSet dsClassRoom = new DataSet();
            DataSet dsClass = new DataSet();
            dsStudent = db.GetStudent(CurrentStudentToPay);
            uiLabelStudentName.Text = dsStudent.Tables[0].Rows[0]["ARStudentName"].ToString() + " " + dsStudent.Tables[0].Rows[0]["ArFatherName"].ToString();
            dsClassRoom = db.GetClassRoom(Convert.ToInt32(dsStudent.Tables[0].Rows[0]["ClassRoomID"].ToString()));
            dsClass = db.GetClass(Convert.ToInt32(dsClassRoom.Tables[0].Rows[0]["ClassID"].ToString()));
            uiLabelClass.Text = dsClass.Tables[0].Rows[0]["ArName"].ToString();

            ds = db.GetInstallmentsByStudentIDAndSchoolYearID(CurrentStudentToPay, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            uiGridViewStudentsInstallments.DataSource = ds;
            uiGridViewStudentsInstallments.DataBind();
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentInstallment != 0)
            {
                db.UpdateInstallment(CurrentInstallment, float.Parse(uiTextBoxQty.Text), DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null), uiTextBoxPayOrderNo.Text, CurrentStudentToPay, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            }
            else
            {
                db.AddInstallment(float.Parse(uiTextBoxQty.Text), DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null), uiTextBoxPayOrderNo.Text, CurrentStudentToPay, Convert.ToInt32(uiDropDownListSchoolYear.SelectedValue));
            }            
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
            
            CurrentInstallment = 0;
            BindData();
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
               
            }
            else if (e.CommandName == "DeleteInstallment")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentInstallment = id;
                DBLayer db = new DBLayer();
                db.DeleteInstallment(id);
               
                BindData();
            }
        }

        protected void uiDropDownListSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }


    }
}