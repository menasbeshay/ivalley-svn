using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;

namespace Website.Controls
{
    public partial class ViewQuotes : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Quotes read = new Quotes();
                read.Where.WhereClauseReset();
                read.Query.AddOrderBy(Ermia_BLL.Quotes.ColumnNames.PostedDate, MyGeneration.dOOdads.WhereParameter.Dir.DESC);                    
                read.Query.Top = 4;
                read.Query.Load();                
                uiRepeaterQuotes.DataSource = read.DefaultView;
                uiRepeaterQuotes.DataBind();
            }
        }
    }
}