using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin.Controls
{
    public partial class ucClassRooms : System.Web.UI.UserControl
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

        public int CurrentClass
        {
            get
            {
                if (Session["CurrentClassForRoom"] != null && !string.IsNullOrEmpty(Session["CurrentClassForRoom"].ToString()) && Session["CurrentClassForRoom"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentClassForRoom"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentClassForRoom"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            DataSet dsClass = new DataSet();
            ds = db.GetAllClassRoomsByClassID(CurrentClass);
            dsClass = db.GetClass(CurrentClass);
            uiLabelClass.Text = dsClass.Tables[0].Rows[0]["ArName"].ToString();
            uiGridViewClassRooms.DataSource = ds;
            uiGridViewClassRooms.DataBind();
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
            }
            else if (e.CommandName == "DeleteClassRoom")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentClassRoom = id;
                DBLayer db = new DBLayer();
                db.DeleteClassRoom(id);                
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentClassRoom != 0)
            {
                db.UpdateClassRoom(CurrentClassRoom, uiTextBoxEnName.Text, uiTextBoxArName.Text, CurrentClass);
            }
            else
            {
                db.AddClassRoom(uiTextBoxEnName.Text, uiTextBoxArName.Text, CurrentClass);
            }            
            ClearFields();
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();                        
        }


        private void ClearFields()
        {
            CurrentClassRoom = 0;
            uiTextBoxArName.Text = "";
        
        }

        
    }
}