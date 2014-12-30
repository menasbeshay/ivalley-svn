using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;

namespace Taqwa.Website.Admin
{
    public partial class promotestudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                BindData();
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
            
           // uiLabelError.Visible = false;
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListClasses.DataSource = db.GetAllClass();
            uiDropDownListClasses.DataTextField = "ArName";
            uiDropDownListClasses.DataValueField = "ClassID";
            uiDropDownListClasses.DataBind();
            uiDropDownListClasses.SelectedIndex = 0;

            uiDropDownListNextClasses.DataSource = db.GetAllClass();
            uiDropDownListNextClasses.DataTextField = "ArName";
            uiDropDownListNextClasses.DataValueField = "ClassID";
            uiDropDownListNextClasses.DataBind();
            uiDropDownListNextClasses.SelectedIndex = 0;

            uiDropDownListClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiDropDownListClassRooms.DataTextField = "ArName";
            uiDropDownListClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListClassRooms.DataBind();
            if (uiDropDownListClassRooms.Items.Count > 0)
            {
                uiDropDownListClassRooms.SelectedIndex = 0;
            }

            uiDropDownListNextClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListNextClasses.SelectedValue));
            uiDropDownListNextClassRooms.DataTextField = "ArName";
            uiDropDownListNextClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListNextClassRooms.DataBind();
            if (uiDropDownListNextClassRooms.Items.Count > 0)
            {
                uiDropDownListNextClassRooms.SelectedIndex = 0;
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
            uiGridViewStudents.DataSource = null;
            uiGridViewStudents.DataBind();
        }

        protected void uiDropDownListNextClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            uiDropDownListNextClassRooms.DataSource = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListNextClasses.SelectedValue));
            uiDropDownListNextClassRooms.DataTextField = "ArName";
            uiDropDownListNextClassRooms.DataValueField = "ClassRoomID";
            uiDropDownListNextClassRooms.DataBind();
            if (uiDropDownListNextClassRooms.Items.Count > 0)
            {
                uiDropDownListNextClassRooms.SelectedIndex = 0;
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

        protected void uiButtonPromote_Click(object sender, EventArgs e)
        {
            uiLabelError.Visible = false;
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            if (!string.IsNullOrEmpty(uiDropDownListClasses.SelectedValue) && !string.IsNullOrEmpty(uiDropDownListClassRooms.SelectedValue))
            {                
                ds = db.SearchStudentsByStudentAndFather(Convert.ToInt32(uiDropDownListClasses.SelectedValue), Convert.ToInt32(uiDropDownListClassRooms.SelectedValue), uiTextBoxSearchText.Text, uiTextBoxFatherName.Text);
            }
            if (ds.Tables.Count > 0)
            {
                try
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        db.UpdateStudent(Convert.ToInt32(ds.Tables[0].Rows[i]["StudentID"].ToString()),
                                         ds.Tables[0].Rows[i]["ArFatherName"].ToString(),
                                         ds.Tables[0].Rows[i]["EnFatherName"].ToString(),
                                         ds.Tables[0].Rows[i]["FatherNationalNumber"].ToString(),
                                         ds.Tables[0].Rows[i]["FatherJobDesc"].ToString(),
                                         ds.Tables[0].Rows[i]["ARStudentName"].ToString(),
                                         ds.Tables[0].Rows[i]["ENStudentName"].ToString(),
                                         ds.Tables[0].Rows[i]["Tele"].ToString(),
                                         ds.Tables[0].Rows[i]["Mobile"].ToString(),
                                         ds.Tables[0].Rows[i]["Email"].ToString(),
                                         ds.Tables[0].Rows[i]["StudentAddress"].ToString(),
                                         Convert.ToBoolean(ds.Tables[0].Rows[i]["IsActive"].ToString()),
                                         Convert.ToInt32(uiDropDownListNextClassRooms.SelectedValue),
                                         ds.Tables[0].Rows[i]["UserName"].ToString());
                    }

                    uiLabelError.Text = "تم نقل الطلاب بنجاح";
                    uiLabelError.ForeColor = System.Drawing.Color.Green;
                    uiLabelError.Visible = true;                    
                    BindData();
                }
                catch (Exception ex)
                {
                     uiLabelError.Text = "حدث خطأ. من فضلك أعد المحاولة";
                    uiLabelError.ForeColor = System.Drawing.Color.Red;
                    uiLabelError.Visible = true;
                }
            }
        }

    }
}