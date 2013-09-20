using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
namespace Website
{
    public partial class splash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                //load verse
                Readings read1 = new Readings();
                read1.Where.ViewDate.Value = DateTime.Now.ToShortDateString();
                read1.Where.ReadingsType.Value = 1;
                read1.Query.Load();
                if (read1.RowCount == 0)
                {
                    read1.Where.WhereClauseReset();
                    read1.Query.AddOrderBy(Ermia_BLL.Readings.ColumnNames.ViewDate, MyGeneration.dOOdads.WhereParameter.Dir.DESC);
                    read1.Where.ReadingsType.Value = 1;
                    read1.Query.Top = 1;
                    read1.Query.Load();
                }
                uiLiteralverse.Text = Server.HtmlDecode(read1.ArContent);

                //load sayings
                Readings read2 = new Readings();
                read2.Where.ViewDate.Value = DateTime.Now.ToShortDateString();
                read2.Where.ReadingsType.Value = 3;
                read2.Query.Load();
                if (read2.RowCount == 0)
                {
                    read2.Where.WhereClauseReset();
                    read2.Query.AddOrderBy(Ermia_BLL.Readings.ColumnNames.ViewDate, MyGeneration.dOOdads.WhereParameter.Dir.DESC);
                    read2.Where.ReadingsType.Value = 3;
                    read2.Query.Top = 1;
                    read2.Query.Load();
                }
                uiLiteralsaying.Text = Server.HtmlDecode(read2.ArContent);

                // load quotes
                Quotes read3 = new Quotes();
                read3.Where.WhereClauseReset();
                read3.Query.AddOrderBy(Ermia_BLL.Quotes.ColumnNames.PostedDate, MyGeneration.dOOdads.WhereParameter.Dir.DESC);
                read3.Query.Top = 1;
                read3.Query.Load();
                uiLiteralquotes.Text = Server.HtmlDecode(read3.ArContent);

                //load reading
                Readings read4 = new Readings();
                read4.Where.ViewDate.Value = DateTime.Now.ToShortDateString();
                read4.Where.ReadingsType.Value = 2;
                read4.Query.Load();
                if (read4.RowCount == 0)
                {
                    read4.Where.WhereClauseReset();
                    read4.Query.AddOrderBy(Ermia_BLL.Readings.ColumnNames.ViewDate, MyGeneration.dOOdads.WhereParameter.Dir.DESC);
                    read4.Where.ReadingsType.Value = 2;
                    read4.Query.Top = 1;
                    read4.Query.Load();
                }
                uiLiteralreading.Text = Server.HtmlDecode(read4.ArContent);

            }
        }
    }
}