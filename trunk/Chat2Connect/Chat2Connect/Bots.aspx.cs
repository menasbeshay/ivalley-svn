using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace Chat2Connect
{
    public partial class Bots : System.Web.UI.Page
    {
        private object _dicRoomsBots;
        private object _dicRoomsSpecs;
        public object RoomsBots
        {
            get
            {
                return _dicRoomsBots;
            }
            set
            {
                _dicRoomsBots = value;
            }
        }

        public object RoomsSpecs
        {
            get
            {
                return _dicRoomsSpecs;
            }
            set
            {
                _dicRoomsSpecs = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.Bot bllBot = new BLL.Bot();
                bllBot.LoadAllWithPoints();
                repBots.DataSource = bllBot.DefaultView;
                repBots.DataBind();

                BLL.Room bllRooms = new BLL.Room();
                bllRooms.GetRoomsByCreatorID(BLL.Member.CurrentMemberID);
                lstRooms.DataTextField = BLL.Room.ColumnNames.Name;
                lstRooms.DataValueField = BLL.Room.ColumnNames.RoomID;
                lstRooms.DataSource = bllRooms.DefaultView;
                lstRooms.DataBind();

                lblPointsBalance.Text = BLL.Member.CurrentMember.s_Credit_Point;

                _dicRoomsSpecs = new List<object>();
                _dicRoomsSpecs = bllRooms.DefaultView.Table.AsEnumerable().Select(m => new { RoomID = m[BLL.Room.ColumnNames.RoomID], SpecID = m["RoomTypeSpecID"] }).ToList();
                BindRoomsBots();

            }
        }

        private void BindRoomsBots()
        {
            BLL.RoomBot bllRoomBot = new BLL.RoomBot();
            _dicRoomsBots = new List<object>();
            if (bllRoomBot.GetRoomsBotsByCreatorID(BLL.Member.CurrentMemberID))
            {
                _dicRoomsBots = bllRoomBot.DefaultView.Table.AsEnumerable().Select(m => new { RoomID = m[BLL.RoomBot.ColumnNames.RoomID], BotID = m[BLL.RoomBot.ColumnNames.BotID] }).ToList();
            }
        }

        protected void btnSaveBots_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(lstRooms.SelectedValue))
            {
                dvError.Visible = true;
                lblError.Text = "يرجى إختيار الغرفة";
                return;
            }

            List<BLL.Log.AddRoomBot> lstLogs=new List<BLL.Log.AddRoomBot>();
            BLL.MemberLog bllLog = new BLL.MemberLog();

            int totalPoint = 0;
            int roomID = Convert.ToInt32(lstRooms.SelectedValue);
            BLL.RoomBot bllRoomBot = new BLL.RoomBot();
            foreach (RepeaterItem bot in repBots.Items)
            {
                CheckBox chkBot = (CheckBox)bot.FindControl("chkSelect");
                HiddenField hdnBotID = (HiddenField)bot.FindControl("hdnBotID");
                HiddenField hdnBotPoints = (HiddenField)bot.FindControl("hdnBotPoints");
                if (chkBot.Checked)
                {
                    int botID = Helper.TypeConverter.ToInt32(hdnBotID.Value);
                    int points = Helper.TypeConverter.ToInt32(hdnBotPoints.Value);
                    totalPoint += points;
                    bllRoomBot.AddNew();
                    bllRoomBot.BotID = botID;
                    bllRoomBot.RoomID = roomID;
                    bllRoomBot.CreatedByMemberID = BLL.Member.CurrentMemberID;
                    bllRoomBot.StartDate = DateTime.Now;
                    bllRoomBot.EndDate = DateTime.Now.AddMonths(1);

                    lstLogs.Add(new BLL.Log.AddRoomBot(){RoomID=roomID,RoomName=lstRooms.SelectedItem.Text,BotID=botID,BotPoints=points});
                }
            }

            if (totalPoint < BLL.Member.CurrentMember.Credit_Point || totalPoint == 0)
            {
                MyGeneration.dOOdads.TransactionMgr tx = MyGeneration.dOOdads.TransactionMgr.ThreadTransactionMgr();
                try
                {
                    tx.BeginTransaction();
                    BLL.Member.CurrentMember.Credit_Point -= totalPoint;
                    BLL.Member.CurrentMember.Save();

                    bllRoomBot.Save();

                    foreach(var log in lstLogs)
                    {
                        bllLog.AddNew(BLL.Member.CurrentMemberID, log, null, roomID);
                    }
                    tx.CommitTransaction();
                    //notify rooms
                    List<int> newBots = bllRoomBot.DefaultView.Table.AsEnumerable().Select(r => Helper.TypeConverter.ToInt32(r[BLL.RoomBot.ColumnNames.ID])).ToList();
                    services.Services.AddRoomBots(roomID, newBots);

                    Response.Redirect("Bots.aspx");
                }
                catch(Exception ex)
                {
                    tx.RollbackTransaction();
                    dvError.Visible = true;
                    lblError.Text = "عفوا حدث حطأ يرجى المحاولة لاحقا";
                }
            }
            else
            {
                dvError.Visible = true;
                lblError.Text = "رصيد نقاطك غير كافى";
            }
        }

        protected void lstRooms_DataBinding(object sender, EventArgs e)
        {
            
        }

        protected void lstRooms_DataBound(object sender, EventArgs e)
        {
            
        }
    }
}