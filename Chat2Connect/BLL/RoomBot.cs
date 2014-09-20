﻿
// Generated by MyGeneration Version # (1.3.0.3)

using DAL;
using System;
using System.Collections.Generic;

namespace BLL
{
    public class RoomBot : _RoomBot
    {
        #region Properties
        public Info.BotSettings Settings
        {
            get
            {
                Info.BotSettings botSetting=BLL.Bot.GetSettingObject(BotID,SettingString);
                return botSetting;
            }
        }
        #endregion
        public RoomBot()
        {

        }

        public List<Info.RoomBot> GetByRoomID(int roomID)
        {
            List<Info.RoomBot> result = new List<Info.RoomBot>();
            if (LoadFromRawSql(@"SELECT RoomBot.*,Bot.ID,Bot.Title,Bot.IconPath
	                                FROM RoomBot INNER JOIN Bot on RoomBot.BotID=Bot.ID
                                WHERE RoomBot.RoomID={0}", roomID))
            {
                do
                {
                    result.Add(
                        GetInfoObject()
                        );

                } while (MoveNext());
            }
            return result;
        }

        public List<Info.RoomBot> GetByRoomIDandBotID(int roomID,Helper.Enums.Bot botType)
        {
            List<Info.RoomBot> result = new List<Info.RoomBot>();
            if (LoadFromRawSql(@"SELECT RoomBot.*,Bot.ID,Bot.Title,Bot.IconPath
	                                FROM RoomBot INNER JOIN Bot on RoomBot.BotID=Bot.ID
                                WHERE RoomBot.RoomID={0} AND BotID={1}", roomID,(int)botType))
            {
                do
                {
                    result.Add(
                        GetInfoObject()
                        );

                } while (MoveNext());
            }
            return result;
        }

        #region Private methods
        private Info.RoomBot GetInfoObject()
        {
            Info.RoomBot infoBot = new Info.RoomBot();
            infoBot.ID = ID;
            infoBot.RoomID = RoomID;
            infoBot.BotID = BotID;
            infoBot.IsEnabled = IsEnabled;
            infoBot.ShortcutKey = ShortcutKey;
            infoBot.Settings = Settings;
            infoBot.Bot = new Info.Bot() { ID = this.BotID, Title = Helper.TypeConverter.ToString(GetColumn(Bot.ColumnNames.Title)), IconPath = Helper.TypeConverter.ToString(GetColumn(Bot.ColumnNames.IconPath)) };

            return infoBot;
        }
        #endregion

        public void Save(List<Info.RoomBot> lst)
        {
            MyGeneration.dOOdads.TransactionMgr tx = MyGeneration.dOOdads.TransactionMgr.ThreadTransactionMgr();
            try
            {
                BLL.RoomBot bllRoomBot = new BLL.RoomBot();

                tx.BeginTransaction();
                foreach (Info.RoomBot bot in lst)
                {
                    if (bot.ID == 0)//new bot
                    {
                        bllRoomBot.AddNew();
                        bllRoomBot.RoomID = bot.RoomID;
                        bllRoomBot.BotID = bot.Bot.ID;
                        bllRoomBot.IsEnabled = bot.IsEnabled;
                        bllRoomBot.StartDate = DateTime.Now;
                        bllRoomBot.TimeStamp = DateTime.Now;
                        bllRoomBot.ShortcutKey = bot.ShortcutKey;
                        bllRoomBot.SettingString = Helper.JsonConverter.Serialize(bot.Settings);
                        bllRoomBot.Save();
                        //update member points
                        BLL.Member currentMember = BLL.Member.CurrentMember;
                        if (currentMember.Credit_Point < bot.Bot.Points)
                            throw new Exception("رصيد النقاط غير كافى");
                        currentMember.Credit_Point -= bot.Bot.Points;
                        currentMember.Save();
                    }
                    else
                    {
                        if (bllRoomBot.LoadByPrimaryKey(bot.ID))
                        {
                            bllRoomBot.IsEnabled = bot.IsEnabled;
                            bllRoomBot.ShortcutKey = bot.ShortcutKey;
                            bllRoomBot.SettingString = Helper.JsonConverter.Serialize(bot.Settings);
                            bllRoomBot.Save();
                        }
                    }
                }
                tx.CommitTransaction();
            }
            catch (Exception ex)
            {
                tx.RollbackTransaction();
                throw;
            }
        }
    }
}
