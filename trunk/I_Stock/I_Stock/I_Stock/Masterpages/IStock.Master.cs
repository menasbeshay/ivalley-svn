﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace I_Stock.Masterpages
{
    public partial class IStock : System.Web.UI.MasterPage
    {
        public string CustomPageTitle
        {
            get { return uiLabelTitle.Text; }
            set { uiLabelTitle.Text = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}