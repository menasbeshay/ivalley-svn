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

        /// <summary>
        /// This property for informing us if the current TradePricing Record allowed for edit or not.
        /// </summary>
        public static bool IsDisableMode
        {
            get
            {
                if (HttpContext.Current.Session["DisableTradePricing"] != null)
                {
                    return HttpContext.Current.Session["DisableTradePricing"].ToString() == "True";
                }
                else
                {
                    return false;
                }
            }
            set
            {
                HttpContext.Current.Session["DisableTradePricing"] = value;
            }
        }
    }
}