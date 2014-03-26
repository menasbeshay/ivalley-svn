using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditClassRoom : System.Web.UI.Page
    {
        public int CurrentClassRoom
        {
            get
            {
                if (Session["CurrentClassRoom"] != null && !string.IsNullOrEmpty(Session["CurrentClassRoom"].ToString()) && Session["CurrentClassRoom"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentClassRoom"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentClassRoom"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (CurrentClassRoom != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetClassRoom(CurrentClassRoom);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnName"].ToString();
                        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                    }
                    uiPanelCurrentClasses.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    uiPanelCurrentClasses.Visible = true;
                    uiPanelCurrent.Visible = false;
                    LoadDDLs();
                    BindData();
                }
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllClassRoomsByClassID(Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            uiGridViewClassRooms.DataSource = ds;
            uiGridViewClassRooms.DataBind();
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListClasses.DataSource = db.GetAllClass();
            uiDropDownListClasses.DataTextField = "ArName";
            uiDropDownListClasses.DataValueField = "ClassID";
            uiDropDownListClasses.DataBind();
            if (Session["CurrentClassForclassRoom"] != null)
            {
                uiDropDownListClasses.SelectedValue = Session["CurrentClassForclassRoom"].ToString();
            }
            else
            {
                uiDropDownListClasses.SelectedIndex = 0;
            }
        }

        protected void uiGridViewClasses_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewClassRooms.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewClasses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditClassRoom")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentClassRoom = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetClassRoom(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["EnName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArName"].ToString();
                }
                uiPanelCurrentClasses.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteClassRoom")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentClassRoom = id;
                DBLayer db = new DBLayer();
                db.DeleteClassRoom(id);
                uiPanelCurrentClasses.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentClassRoom != 0)
            {
                db.UpdateClassRoom(CurrentClassRoom, uiTextBoxEnName.Text, uiTextBoxArName.Text, Convert.ToInt32(uiDropDownListClasses.SelectedValue));
            }
            else
            {
                db.AddClassRoom(uiTextBoxEnName.Text, uiTextBoxArName.Text, Convert.ToInt32(uiDropDownListClasses.SelectedValue));
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
            CurrentClassRoom = 0;
            uiTextBoxArName.Text = "";
            uiTextBoxEnName.Text = "";
        }

        protected void uiDropDownListClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }
    }
}