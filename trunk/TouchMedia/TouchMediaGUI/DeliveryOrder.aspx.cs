using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyGeneration.dOOdads;


using BLL;

namespace TouchMediaGUI
{
    public partial class DeliveryOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "اوامر النقل";
            }
            BLL.DeliveryOrder DlvO = new BLL.DeliveryOrder();
            DlvO.LoadAll();
            GrdDeliveryOrder.DataSource = DlvO.DefaultView;
            GrdDeliveryOrder.DataBind();
        }
    }
}