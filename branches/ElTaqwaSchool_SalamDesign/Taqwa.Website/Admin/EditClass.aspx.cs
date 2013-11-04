using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditClass : System.Web.UI.Page
    {
        public int CurrentClass
        {
            get
            {
                if (Session["CurrentClass"] != null && !string.IsNullOrEmpty(Session["CurrentClass"].ToString()) && Session["CurrentClass"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentClass"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentClass"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                if (CurrentClass != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetClass(CurrentClass);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnName"].ToString();
                        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                        if (ds.Tables[0].Rows[0]["ClassTypeID"] != null)
                        {
                            uiDropDownListClassType.SelectedValue = ds.Tables[0].Rows[0]["ClassTypeID"].ToString();
                        }
                    }
                    uiPanelCurrentClasses.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    uiPanelCurrentClasses.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindData();
                }
            }
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListClassType.DataSource = db.GetAllClassType();
            uiDropDownListClassType.DataTextField = "ArName";
            uiDropDownListClassType.DataValueField = "ClassTypeID";
            uiDropDownListClassType.DataBind();
            uiDropDownListClassType.SelectedIndex = 0;
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllClass();
            uiGridViewClasses.DataSource = ds;
            uiGridViewClasses.DataBind();
        }

        protected void uiGridViewClasses_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewClasses.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewClasses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditClass")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentClass = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetClass(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                    if (ds.Tables[0].Rows[0]["ClassTypeID"] != null)
                    {
                        uiDropDownListClassType.SelectedValue = ds.Tables[0].Rows[0]["ClassTypeID"].ToString();
                    }
                }
                uiPanelCurrentClasses.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "EditClassRoom")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                Session["CurrentClassForclassRoom"] = id;
                Response.Redirect("EditClassRoom.aspx");
            }
            else if (e.CommandName == "DeleteClass")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentClass = id;
                DBLayer db = new DBLayer();
                db.DeleteClass(id);
                uiPanelCurrentClasses.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentClass != 0)
            {
                db.UpdateClass(CurrentClass, uiTextBoxEnName.Text, uiTextBoxArName.Text, Convert.ToInt32(uiDropDownListClassType.SelectedValue));
            }
            else
            {
                db.AddClass(uiTextBoxEnName.Text, uiTextBoxArName.Text, Convert.ToInt32(uiDropDownListClassType.SelectedValue));
            }
            uiPanelCurrentClasses.Visible = true;
            uiPanelCurrent.Visible = false;
            ClearFields();
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentClasses.Visible = true;
            uiPanelCurrent.Visible = false;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentClasses.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        private void ClearFields()
        {
            CurrentClass = 0;
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
        }
    }
}