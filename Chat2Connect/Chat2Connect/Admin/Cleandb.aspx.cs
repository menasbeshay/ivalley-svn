using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class Cleandb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRooms();
                BindMembers();
            }
        }

        private void BindMembers()
        {
            BLL.Member membs = new BLL.Member();
            membs.LoadAll();

            uiGridViewMembers.DataSource = membs.DefaultView;
            uiGridViewMembers.DataBind();
        }

        private void BindRooms()
        {
            BLL.Room rooms = new BLL.Room();
            rooms.LoadAll();

            uiGridViewRoom.DataSource = rooms.DefaultView;
            uiGridViewRoom.DataBind();
        }

        protected void uiGridViewRoom_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewRoom.PageIndex = e.NewPageIndex;
            BindRooms();
        }

        protected void uiGridViewMembers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewMembers.PageIndex = e.NewPageIndex;
            BindMembers();
        }

        protected void uiGridViewRoom_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int roomid = Convert.ToInt32(e.CommandArgument.ToString());
            if (e.CommandName == "DeleteRoom")
            {
                
                BLL.Room room = new BLL.Room();
                

                room.LoadByPrimaryKey(roomid);
                room.MarkAsDeleted();

                
                room.Save();
                BindRooms();
            }
            else if (e.CommandName == "DeleteBots")
            {
                BLL.RoomBot bots = new BLL.RoomBot();
                

                bots.Where.RoomID.Value = roomid;
                bots.Where.RoomID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                bots.Query.Load();

                for (int i = 0; i < bots.RowCount; i++)
                {
                    bots.MarkAsDeleted();
                    bots.MoveNext();
                }

                bots.Save();

            }
            else if (e.CommandName == "DeleteMembers")
            {
                BLL.RoomMember members = new BLL.RoomMember();
                

                members.Where.RoomID.Value = roomid;
                members.Where.RoomID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                members.Query.Load();

                for (int i = 0; i < members.RowCount; i++)
                {
                    members.MarkAsDeleted();
                    members.MoveNext();
                }
                members.Save();
                
            }

            else if (e.CommandName == "DeleteMessages")
            {
                BLL.RoomMessages msgs = new BLL.RoomMessages();
                

                msgs.Where.RoomID.Value = roomid;
                msgs.Where.RoomID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                msgs.Query.Load();

                for (int i = 0; i < msgs.RowCount; i++)
                {
                    msgs.MarkAsDeleted();
                    msgs.MoveNext();
                }
                msgs.Save();
                
            }
            else if (e.CommandName == "DeleteBannedmembers")
            {
                BLL.RoomMemberBanning bans = new BLL.RoomMemberBanning();
                bans.Where.RoomID.Value = roomid;
                bans.Where.RoomID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                bans.Query.Load();

                for (int i = 0; i < bans.RowCount; i++)
                {
                    bans.MarkAsDeleted();
                    bans.MoveNext();
                }
                bans.Save();
            }

            else if (e.CommandName == "DeleteTypes")
            {
                BLL.RoomType type = new BLL.RoomType();
                type.Where.RoomID.Value = roomid;
                type.Where.RoomID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                type.Query.Load();

                for (int i = 0; i < type.RowCount; i++)
                {
                    type.MarkAsDeleted();
                    type.MoveNext();
                }
                type.Save();
            }
                 



        }

        protected void uiGridViewMembers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int memberid = Convert.ToInt32(e.CommandArgument.ToString());
            if (e.CommandName == "DeleteMember")
            {

                BLL.Member mem = new BLL.Member();


                mem.LoadByPrimaryKey(memberid);
                mem.MarkAsDeleted();
                string name = mem.UserName;
               
                mem.Save();
                Membership.DeleteUser(name);
                BindMembers();
            }
            else if (e.CommandName == "DeleteTypes")
            {
                BLL.MemberType types = new BLL.MemberType();


                types.Where.MemberID.Value = memberid;
                types.Where.MemberID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                types.Query.Load();

                for (int i = 0; i < types.RowCount; i++)
                {
                    types.MarkAsDeleted();
                    types.MoveNext();
                }

                types.Save();

            }
            else if (e.CommandName == "DeleteProfileLike")
            {
                BLL.ProfileLike Ilike = new BLL.ProfileLike();
                BLL.ProfileLike Iliked = new BLL.ProfileLike();


                Ilike.Where.MemberID.Value = memberid;
                Ilike.Where.MemberID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                Ilike.Query.Load();

                Iliked.Where.ProfileMemberID.Value = memberid;
                Iliked.Where.ProfileMemberID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                Iliked.Query.Load();

                for (int i = 0; i < Ilike.RowCount; i++)
                {
                    Ilike.MarkAsDeleted();
                    Ilike.MoveNext();
                }

                for (int i = 0; i < Iliked.RowCount; i++)
                {
                    Iliked.MarkAsDeleted();
                    Iliked.MoveNext();
                }
                Ilike.Save();
                Iliked.Save();
            }

            else if (e.CommandName == "DeleteMsgFolder")
            {
                BLL.MessageFolder msgs = new BLL.MessageFolder();


                msgs.Where.MemberID.Value = memberid;
                msgs.Where.MemberID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                msgs.Query.Load();

                for (int i = 0; i < msgs.RowCount; i++)
                {
                    msgs.MarkAsDeleted();
                    msgs.MoveNext();
                }
                msgs.Save();

            }
            else if (e.CommandName == "DeleteSettings")
            {
                BLL.MemberSetting settings = new BLL.MemberSetting();
                settings.Where.MemberID.Value = memberid;
                settings.Where.MemberID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                settings.Query.Load();

                for (int i = 0; i < settings.RowCount; i++)
                {
                    settings.MarkAsDeleted();
                    settings.MoveNext();
                }
                settings.Save();
            }

            else if (e.CommandName == "DeletePics")
            {
                BLL.MemberPic pics = new BLL.MemberPic();
                pics.Where.MemberID.Value = memberid;
                pics.Where.MemberID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                pics.Query.Load();

                for (int i = 0; i < pics.RowCount; i++)
                {
                    pics.MarkAsDeleted();
                    pics.MoveNext();
                }
                pics.Save();
            }

            else if (e.CommandName == "DeleteMessages")
            {
                BLL.Message msgs = new BLL.Message();
                msgs.Where.SenderID.Value = memberid;
                msgs.Where.SenderID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                msgs.Query.Load();

                for (int i = 0; i < msgs.RowCount; i++)
                {
                    msgs.MarkAsDeleted();
                    msgs.MoveNext();
                }
                msgs.Save();
            }

            else if (e.CommandName == "DeleteLog")
            {
                BLL.MemberLog msgs = new BLL.MemberLog();
                msgs.Where.MemberID.Value = memberid;
                msgs.Where.MemberID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                msgs.Query.Load();

                for (int i = 0; i < msgs.RowCount; i++)
                {
                    msgs.MarkAsDeleted();
                    msgs.MoveNext();
                }
                msgs.Save();


                BLL.MemberLog related = new BLL.MemberLog();
                related.Where.RelatedMemberID.Value = memberid;
                related.Where.RelatedMemberID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                related.Query.Load();

                for (int i = 0; i < related.RowCount; i++)
                {
                    related.MarkAsDeleted();
                    related.MoveNext();
                }
                related.Save();
            }

            else if (e.CommandName == "DeleteGifts")
            {
                BLL.MemberGift gifts = new BLL.MemberGift();
                gifts.Where.MemberID.Value = memberid;
                gifts.Where.MemberID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                gifts.Query.Load();

                for (int i = 0; i < gifts.RowCount; i++)
                {
                    gifts.MarkAsDeleted();
                    gifts.MoveNext();
                }
                gifts.Save();

                BLL.MemberGift giftsm = new BLL.MemberGift();
                giftsm.Where.SenderID.Value = memberid;
                giftsm.Where.SenderID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                giftsm.Query.Load();

                for (int i = 0; i < giftsm.RowCount; i++)
                {
                    giftsm.MarkAsDeleted();
                    giftsm.MoveNext();
                }
                giftsm.Save();
            }

            else if (e.CommandName == "DeleteFriends")
            {
                BLL.MemberFriend friend = new BLL.MemberFriend();
                friend.Where.MemberID.Value = memberid;
                friend.Where.MemberID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                friend.Query.Load();

                for (int i = 0; i < friend.RowCount; i++)
                {
                    friend.MarkAsDeleted();
                    friend.MoveNext();
                }
                friend.Save();

                BLL.MemberFriend mem = new BLL.MemberFriend();
                mem.Where.MemberFriendID.Value = memberid;
                mem.Where.MemberFriendID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                mem.Query.Load();

                for (int i = 0; i < mem.RowCount; i++)
                {
                    mem.MarkAsDeleted();
                    mem.MoveNext();
                }
                mem.Save();
            }



        }
    }
}