using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
namespace Website.Controls
{
    public partial class NewsTicker : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Ermia_BLL.NewsTicker NT = new Ermia_BLL.NewsTicker();
                NT.Query.AddOrderBy(Ermia_BLL.News.ColumnNames.PostedDate, MyGeneration.dOOdads.WhereParameter.Dir.DESC);
                GeneralSettings GS = new GeneralSettings();
                GS.LoadByPrimaryKey(1);
                int top = 0;
                try
                {
                    if (int.TryParse(GS.Value, out top))
                        NT.Query.Top = top;
                }
                catch (Exception ee)
                {
                    NT.Query.Top = 2;
                }
                                
                NT.Query.Load();   
                uiRepeaterTicker.DataSource = NT.DefaultView;
                uiRepeaterTicker.DataBind();
            }
        }
    }
}