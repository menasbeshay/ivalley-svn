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
                if (!String.IsNullOrEmpty(Request.QueryString["rid"]))
                {
                    this.RoomID=Helper.TypeConverter.ToInt32(Request.QueryString["rid"]);

                    BLL.RoomBot roomBot = new BLL.RoomBot();
                    this.RoomBots=roomBot.GetByRoomID(this.RoomID);

                    repExistingBots.DataSource = this.RoomBots;
                    repExistingBots.DataBind();

                    BLL.Bot bot = new BLL.Bot();
                    bot.LoadAll();

                    repAllBots.DataSource = bot.DefaultView;
                    repAllBots.DataBind();
                }
                else
                {
                    Response.Redirect("CreateRoom.aspx");
                }
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
            foreach (RepeaterItem bot in repAllBots.Items)
            {
                CheckBox chkBot = (CheckBox)bot.FindControl("chkSelectBot");
                HiddenField hdnBotID = (HiddenField)bot.FindControl("hdnBotID");
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
                        this.RoomBots.Add(newRoomBot);
                    }
                }
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
            BLL.RoomBot roomBot = new BLL.RoomBot();
            roomBot.Save(this.RoomBots);
        }

        protected void grdUC_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Info.RoomBot infoBot = (Info.RoomBot)e.Row.DataItem;
                foreach (Control botControl in e.Row.Cells[0].Controls)
                {
                    if (botControl is Chat2Connect.usercontrols.bot.IBotUserControl)
                    {
                        ((Chat2Connect.usercontrols.bot.IBotUserControl)botControl).DataBind(infoBot);
                        break;
                    }
                }
            }
        }
    }
}