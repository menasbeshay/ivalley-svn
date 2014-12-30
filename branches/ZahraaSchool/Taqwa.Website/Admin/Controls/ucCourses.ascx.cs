using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin.Controls
{
    public partial class ucCourses : System.Web.UI.UserControl
    {

        public int CurrentCourse
        {
            get
            {
                if (Session["CurrentCourse"] != null && !string.IsNullOrEmpty(Session["CurrentCourse"].ToString()) && Session["CurrentCourse"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentCourse"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentCourse"] = value;
            }
        }

        public int CurrentClass
        {
            get
            {
                if (Session["CurrentClassForCourse"] != null && !string.IsNullOrEmpty(Session["CurrentClassForCourse"].ToString()) && Session["CurrentClassForCourse"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentClassForCourse"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentClassForCourse"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllCoursesByClass(CurrentClass);
            DataSet dsClass = new DataSet();
            dsClass = db.GetClass(CurrentClass);
            uiLabelClass.Text = dsClass.Tables[0].Rows[0]["ArName"].ToString();
            uiGridViewCourses.DataSource = ds;
            uiGridViewCourses.DataBind();
        }

   
        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentCourse != 0)
            {
                db.UpdateCourse(CurrentCourse, Convert.ToInt32(uiTextBoxMaxGradeFMT.Text), Convert.ToInt32(uiTextBoxMinGradeFMT.Text),Convert.ToInt32(uiTextBoxMaxGradeFT.Text), Convert.ToInt32(uiTextBoxMinGradeFT.Text),Convert.ToInt32(uiTextBoxMaxGradeSMT.Text), Convert.ToInt32(uiTextBoxMinGradeSMT.Text),Convert.ToInt32(uiTextBoxMaxGradeST.Text), Convert.ToInt32(uiTextBoxMinGradeST.Text), uiTextBoxEnName.Text, uiTextBoxArName.Text, CurrentClass, uiCheckBoxInTotal.Checked);
            }
            else
            {
                db.AddCourse(Convert.ToInt32(uiTextBoxMaxGradeFMT.Text), Convert.ToInt32(uiTextBoxMinGradeFMT.Text),Convert.ToInt32(uiTextBoxMaxGradeFT.Text), Convert.ToInt32(uiTextBoxMinGradeFT.Text),Convert.ToInt32(uiTextBoxMaxGradeSMT.Text), Convert.ToInt32(uiTextBoxMinGradeSMT.Text),Convert.ToInt32(uiTextBoxMaxGradeST.Text), Convert.ToInt32(uiTextBoxMinGradeST.Text), uiTextBoxEnName.Text, uiTextBoxArName.Text, CurrentClass, uiCheckBoxInTotal.Checked);
            }
            CurrentCourse = 0;
            ClearFields();
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        protected void uiGridViewCourses_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCourses.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewCourses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCourse")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentCourse = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetCourse(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ARName"].ToString();

                    if (ds.Tables[0].Rows[0]["MaxGradeFMT"]!= null)
                        uiTextBoxMaxGradeFMT.Text = ds.Tables[0].Rows[0]["MaxGradeFMT"].ToString();
                    if (ds.Tables[0].Rows[0]["MinGradeFMT"] != null)
                        uiTextBoxMinGradeFMT.Text = ds.Tables[0].Rows[0]["MinGradeFMT"].ToString();
                    if (ds.Tables[0].Rows[0]["MaxGradeFT"] != null)
                        uiTextBoxMaxGradeFT.Text = ds.Tables[0].Rows[0]["MaxGradeFT"].ToString();
                    if (ds.Tables[0].Rows[0]["MinGradeFT"] != null)
                        uiTextBoxMinGradeFT.Text = ds.Tables[0].Rows[0]["MinGradeFT"].ToString();
                    if (ds.Tables[0].Rows[0]["MaxGradeSMT"] != null)
                        uiTextBoxMaxGradeSMT.Text = ds.Tables[0].Rows[0]["MaxGradeSMT"].ToString();
                    if (ds.Tables[0].Rows[0]["MinGradeSMT"] != null)
                        uiTextBoxMinGradeSMT.Text = ds.Tables[0].Rows[0]["MinGradeSMT"].ToString();
                    if (ds.Tables[0].Rows[0]["MaxGradeST"] != null)
                        uiTextBoxMaxGradeST.Text = ds.Tables[0].Rows[0]["MaxGradeST"].ToString();
                    if (ds.Tables[0].Rows[0]["MinGradeST"] != null)
                        uiTextBoxMinGradeST.Text = ds.Tables[0].Rows[0]["MinGradeST"].ToString(); 
                    uiCheckBoxInTotal.Checked = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["InTotal"].ToString()) ? false : (bool)ds.Tables[0].Rows[0]["InTotal"];
                }

            }
            else if (e.CommandName == "DeleteCourse")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentCourse = id;
                DBLayer db = new DBLayer();
                db.DeleteCourse(id);

                BindData();
            }
        }

        private void ClearFields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxMaxGradeFMT.Text = "";
            uiTextBoxMinGradeFMT.Text = "";
            uiTextBoxMaxGradeFT.Text = "";
            uiTextBoxMinGradeFT.Text = "";
            uiTextBoxMaxGradeSMT.Text = "";
            uiTextBoxMinGradeSMT.Text = "";
            uiTextBoxMaxGradeST.Text = "";
            uiTextBoxMinGradeST.Text = "";
            uiCheckBoxInTotal.Checked = false;
        }

    }
}