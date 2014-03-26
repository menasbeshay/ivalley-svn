using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditSchoolBus : System.Web.UI.Page
    {
        public int CurrentSchoolBus
        {
            get
            {
                if (Session["CurrentSchoolBus"] != null && !string.IsNullOrEmpty(Session["CurrentSchoolBus"].ToString()) && Session["CurrentSchoolBus"].ToString() != "0")
                {
                    return Convert.ToInt32(Session["CurrentSchoolBus"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["CurrentSchoolBus"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {               
                
                if (CurrentSchoolBus != 0)
                {
                    //BindData();
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetSchoolBus(CurrentSchoolBus);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENLineName"].ToString();
                        uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArLineName"].ToString();
                        uiTextBoxENDriverName.Text = ds.Tables[0].Rows[0]["ENDriverName"].ToString();
                        uiTextBoxARDriverName.Text = ds.Tables[0].Rows[0]["ArDriverName"].ToString();
                        uiTextBoxDriverTele.Text = ds.Tables[0].Rows[0]["DriverTele"].ToString();
                        uiTextBoxENSupName.Text = ds.Tables[0].Rows[0]["ENSupervisorName"].ToString();
                        uiTextBoxARSupName.Text = ds.Tables[0].Rows[0]["ARSupervisorName"].ToString();
                        uiTextBoxSupTele.Text = ds.Tables[0].Rows[0]["SupervisorTele"].ToString();
                        uiTextBoxENNotes.Text = ds.Tables[0].Rows[0]["ENNotes"].ToString();
                        uiTextBoxARNotes.Text = ds.Tables[0].Rows[0]["ARNotes"].ToString();
                    }
                    uiPanelCurrentSchoolBus.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    uiPanelCurrentSchoolBus.Visible = true;
                    uiPanelCurrent.Visible = false;
                    BindData();
                }
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllSchoolBus();
            uiGridViewSchoolBus.DataSource = ds;
            uiGridViewSchoolBus.DataBind();
        }

        protected void uiGridViewSchoolBus_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSchoolBus.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewSchoolBus_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSchoolBus")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentSchoolBus = id;
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetSchoolBus(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uiTextBoxEnName.Text = ds.Tables[0].Rows[0]["ENLineName"].ToString();
                    uiTextBoxArName.Text = ds.Tables[0].Rows[0]["ArLineName"].ToString();
                    uiTextBoxENDriverName.Text = ds.Tables[0].Rows[0]["ENDriverName"].ToString();
                    uiTextBoxARDriverName.Text = ds.Tables[0].Rows[0]["ArDriverName"].ToString();
                    uiTextBoxDriverTele.Text = ds.Tables[0].Rows[0]["DriverTele"].ToString();
                    uiTextBoxENSupName.Text = ds.Tables[0].Rows[0]["ENSupervisorName"].ToString();
                    uiTextBoxARSupName.Text = ds.Tables[0].Rows[0]["ARSupervisorName"].ToString();
                    uiTextBoxSupTele.Text = ds.Tables[0].Rows[0]["SupervisorTele"].ToString();
                    uiTextBoxENNotes.Text = ds.Tables[0].Rows[0]["ENNotes"].ToString();
                    uiTextBoxARNotes.Text = ds.Tables[0].Rows[0]["ARNotes"].ToString();
                }
                uiPanelCurrentSchoolBus.Visible = false;
                uiPanelCurrent.Visible = true;
            }
            else if (e.CommandName == "DeleteSchoolBus")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CurrentSchoolBus = id;
                DBLayer db = new DBLayer();
                db.DeleteSchoolBus(id);
                uiPanelCurrentSchoolBus.Visible = true;
                uiPanelCurrent.Visible = false;
                BindData();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentSchoolBus.Visible = false;
            uiPanelCurrent.Visible = true;
        }

        private void ClearFields()
        {
            CurrentSchoolBus = 0;
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxENDriverName.Text = "";
            uiTextBoxARDriverName.Text ="";
            uiTextBoxDriverTele.Text = "";
            uiTextBoxENSupName.Text = "";
            uiTextBoxARSupName.Text = "";
            uiTextBoxSupTele.Text = "";
            uiTextBoxENNotes.Text = "";
            uiTextBoxARNotes.Text = "";
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (CurrentSchoolBus != 0)
            {
                db.UpdateSchoolBus(CurrentSchoolBus, uiTextBoxEnName.Text, uiTextBoxArName.Text, uiTextBoxENDriverName.Text, uiTextBoxARDriverName.Text, uiTextBoxDriverTele.Text, uiTextBoxENSupName.Text, uiTextBoxARSupName.Text, uiTextBoxSupTele.Text, uiTextBoxARNotes.Text, uiTextBoxENNotes.Text);
            }
            else
            {
                db.AddSchoolBus(uiTextBoxEnName.Text, uiTextBoxArName.Text, uiTextBoxENDriverName.Text, uiTextBoxARDriverName.Text, uiTextBoxDriverTele.Text, uiTextBoxENSupName.Text, uiTextBoxARSupName.Text, uiTextBoxSupTele.Text, uiTextBoxARNotes.Text, uiTextBoxENNotes.Text);
            }
            CurrentSchoolBus = 0;
            uiPanelCurrentSchoolBus.Visible = true;
            uiPanelCurrent.Visible = false;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelCurrentSchoolBus.Visible = false;
            uiPanelCurrent.Visible = false;
        }


    }
}