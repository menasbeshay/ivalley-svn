using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
namespace Website.Controls
{
    public partial class ViewDayVerse : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Readings read = new Readings();
                read.Where.ViewDate.Value = DateTime.Now.ToShortDateString();
                read.Where.ReadingsType.Value = 1;
                read.Query.Load();
                if (read.RowCount == 0)
                {
                    read.Where.WhereClauseReset();
                    read.Query.AddOrderBy(Ermia_BLL.Readings.ColumnNames.ViewDate, MyGeneration.dOOdads.WhereParameter.Dir.DESC);
                    read.Where.ReadingsType.Value = 1;
                    read.Query.Top = 1;
                    read.Query.Load();
                }
                uiLiteralContent.Text = Server.HtmlDecode(read.ArContent);
            }
        }
    }
}