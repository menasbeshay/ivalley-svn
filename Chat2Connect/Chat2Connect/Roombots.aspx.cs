using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect
{
    public partial class Roombots : System.Web.UI.Page
    {
        public string pageValidationGroup="RoomBotsValidationGroup";
        public int RoomID
        {
            get
            {
                return Helper.TypeConverter.ToInt32(ViewState["RoomID"]);
            }
            set
            {
                ViewState["RoomID"] = value;
            }
        }
        public List<Info.RoomBot> RoomBots
        {
            get
            {
                return (List<Info.RoomBot>)ViewState["RoomBot"];
            }
            set
            {
                ViewState["RoomBot"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlStep1.Visible = false;
                BLL.Room myrooms = new BLL.Room();
                myrooms.GetRoomsByCreatorID(BLL.Member.CurrentMemberID);
                uiDropDownListMyRooms.DataSource = myrooms.DefaultView;
                uiDropDownListMyRooms.DataTextField = "Name";
                uiDropDownListMyRooms.DataValueField = "RoomID";
                uiDropDownListMyRooms.DataBind();
                uiDropDownListMyRooms.Items.Insert(0, new ListItem("إختر غرفة. . . .",""));

                txtMemberPoints.Text = Convert.ToString(BLL.Member.CurrentMember.Credit_Point);
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            AddNewSelectedBots();
            grdUC.DataSource = this.RoomBots;
            grdUC.DataBind();

            //LoadBotControls();
            if (this.RoomBots.Count> 0)
            {
                pnlStep1.Visible = false;
                pnlStep2.Visible = true;
            }
        }

        //private void LoadBotControls()
        //{
        //    plcControls.Controls.Clear();
        //    foreach (var roomBot in this.RoomBots)
        //    {
        //        UserControl uc = null;
        //        switch (roomBot.BotID)
        //        {
        //            case (int)Helper.Enums.Bot.Welcome:
        //                uc = (UserControl)Page.LoadControl("~/UserControls/bot/WelcomeBot.ascx");
        //                break;
        //        }
        //        if (uc != null)
        //        {
        //            ((Chat2Connect.usercontrols.bot.IBotUserControl)uc).DataBind(roomBot);
        //            plcControls.Controls.Add(uc);
        //        }
        //    }
        //}

        private void AddNewSelectedBots()
        {
            int newBotsPoints = 0;
            foreach (RepeaterItem bot in repAllBots.Items)
            {
                CheckBox chkBot = (CheckBox)bot.FindControl("chkSelectBot");
                HiddenField hdnBotID = (HiddenField)bot.FindControl("hdnBotID");
                Label lblPoints = (Label)bot.FindControl("lblPoints");
                if (chkBot.Checked)
                {
                    System.Data.DataRowView dr = (System.Data.DataRowView)bot.DataItem;
                    int botID = Helper.TypeConverter.ToInt32(hdnBotID.Value);
                    Info.RoomBot newRoomBot = null;
                    switch (botID)
                    {
                        case (int)Helper.Enums.Bot.Welcome:
                            newRoomBot = new Info.WelcomeBot(this.RoomID);
                            break;
                    }
                    if (newRoomBot != null)
                    {
                        newBotsPoints += Helper.TypeConverter.ToInt32(lblPoints.Text);
                        this.RoomBots.Add(newRoomBot);
                    }
                }
            }
            NewPoints = newBotsPoints;
        }

        public int NewPoints
        {
            get
            {
                return Convert.ToInt32(ViewState["NewPoints"]);
            }
            set
            {
                ViewState["NewPoints"] = value;
            }
        }

        protected void btnSaveBots_Click(object sender, EventArgs e)
        {
            this.RoomBots = new List<Info.RoomBot>();
            foreach (GridViewRow row in grdUC.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    foreach (Control botControl in row.Cells[0].Controls)
                    {
                        if (botControl is Chat2Connect.usercontrols.bot.IBotUserControl && botControl.Visible)
                        {
                            this.RoomBots.Add(((Chat2Connect.usercontrols.bot.IBotUserControl)botControl).GetDataObject());
                            break;
                        }
                    }
                }
            }
            MyGeneration.dOOdads.TransactionMgr tx = MyGeneration.dOOdads.TransactionMgr.ThreadTransactionMgr();
            try
            {
                tx.BeginTransaction();

                BLL.RoomBot roomBot = new BLL.RoomBot();
                roomBot.Save(this.RoomBots);
                //update member points
                BLL.Member currentMember = BLL.Member.CurrentMember;
                currentMember.Credit_Point -= NewPoints;
                currentMember.Save();

                tx.CommitTransaction();
            }
            catch (Exception ex)
            {
                tx.RollbackTransaction();
            }
            

            Response.Redirect("Roombots.aspx");
        }

        protected void grdUC_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Info.RoomBot infoBot = (Info.RoomBot)e.Row.DataItem;
                foreach (Control control in e.Row.Cells[0].Controls)
                {
                    if (control is Chat2Connect.usercontrols.bot.IBotUserControl)
                    {
                        Chat2Connect.usercontrols.bot.IBotUserControl  botControl= ((Chat2Connect.usercontrols.bot.IBotUserControl)control);
                        if (infoBot.BotID == botControl.BotID)
                        {
                            botControl.ValidationGroup = pageValidationGroup;
                            botControl.DataBind(infoBot);
                            control.Visible = true;
                            break;
                        }
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Roombots.aspx");
        }

        protected void btnEditBots_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(uiDropDownListMyRooms.SelectedValue))
            {
                this.RoomID = Helper.TypeConverter.ToInt32(uiDropDownListMyRooms.SelectedValue);

                BLL.RoomBot roomBot = new BLL.RoomBot();
                this.RoomBots = roomBot.GetByRoomID(this.RoomID);

                repExistingBots.DataSource = this.RoomBots;
                repExistingBots.DataBind();

                BLL.Bot bot = new BLL.Bot();
                bot.LoadAllWithPoints();

                repAllBots.DataSource = bot.DefaultView;
                repAllBots.DataBind();

                pnlStep1.Visible = true;
                pnlStep2.Visible = false;
            }
        }
    }
}