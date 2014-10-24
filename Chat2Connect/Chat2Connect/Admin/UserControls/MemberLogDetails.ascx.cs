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
                BLL.Log.Log logDetails = Helper.JsonConverter.Deserialize<BLL.Log.Log>(DataSource,true);
                List<Helper.BoundProperty> columns = new List<Helper.BoundProperty>();
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