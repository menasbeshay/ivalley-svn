using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin.UserControls
{
    public partial class MemberLogDetails : System.Web.UI.UserControl
    {
        public string DataSource
        {
            get
            {
                return Convert.ToString(ViewState["DataSource"]);
            }
            set
            {
                ViewState["DataSource"] = value;
            }
        }
        /// <summary>
        /// Helper.Enums.LogType
        /// </summary>
        public int Type
        {
            get
            {
                if (ViewState["Type"] == null)
                    return 0;
                return Convert.ToInt32(ViewState["Type"]);
            }
            set
            {
                ViewState["Type"] = value;
            }
        }

        public bool AutoBind { get; set; }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            DataBind();
        }

        public void DataBind()
        {
            dtlLog.DataSource = null;
            dtlLog.Columns.Clear();
            if (!String.IsNullOrEmpty(DataSource))
            {
                BLL.Log.Log logDetails = null;
                List<Helper.BoundProperty> columns = new List<Helper.BoundProperty>();
                switch (Type)
                {
                    case (int)Helper.Enums.LogType.ChangePassword:
                        logDetails = BLL.Log.ChangePassword.FromString(DataSource);
                        break;
                    case (int)Helper.Enums.LogType.AddFriend:
                        logDetails = BLL.Log.AddFriend.FromString(DataSource);
                        break;
                    case (int)Helper.Enums.LogType.ChangeMemberType:
                        logDetails = BLL.Log.ChangeMemberType.FromString(DataSource);
                        break;
                    case (int)Helper.Enums.LogType.ChangeRoomType:
                        logDetails = BLL.Log.ChangeRoomType.FromString(DataSource);
                        break;
                    case (int)Helper.Enums.LogType.CreateRoom:
                        logDetails = BLL.Log.CreateRoom.FromString(DataSource);
                        break;
                    case (int)Helper.Enums.LogType.EnterPrivateChate:
                        logDetails = BLL.Log.EnterPrivateChate.FromString(DataSource);
                        break;
                    case (int)Helper.Enums.LogType.EnterRoom:
                        logDetails = BLL.Log.EnterRoom.FromString(DataSource);
                        break;
                    case (int)Helper.Enums.LogType.RechargePoints:
                        logDetails = BLL.Log.RechargePoints.FromString(DataSource);
                        break;
                    case (int)Helper.Enums.LogType.TransferPoints:
                        logDetails = BLL.Log.TransferPoints.FromString(DataSource);
                        break;
                    case (int)Helper.Enums.LogType.AddRoomBot:
                        logDetails = BLL.Log.AddRoomBot.FromString(DataSource);
                        break;
                    default:
                        logDetails = BLL.Log.Log.FromString(DataSource);
                        break;
                }
                columns = Helper.DataBinding.GetBoundFields(logDetails);
                foreach (var column in columns)
                {
                    BoundField field = new BoundField();
                    field.HeaderText = column.HeaderText;
                    field.DataFormatString = "{0:" + column.DataFormat + "}";
                    field.DataField = column.PropertyName;

                    dtlLog.Columns.Add(field);
                }

                dtlLog.DataSource = new List<BLL.Log.Log>(){logDetails};
                dtlLog.DataBind();

            }
        }
    }
}