using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Pricing.BLL;

namespace Pricing_GUI
{
    public class CodeGlobal
    {
        public static Companies LogedInCompany
        {
            get
            {
                if (HttpContext.Current.Session["LoggedInCompany"] != null)
                {
                    return (Companies)HttpContext.Current.Session["LoggedInCompany"];
                }
                else
                {
                    return null;
                }
            }
            set
            {
                HttpContext.Current.Session["LoggedInCompany"] = value;
            }
        }
    }
}