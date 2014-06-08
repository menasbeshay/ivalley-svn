using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


namespace ImageHandler
{
    /// <summary>
    /// Summary description for Utility
    /// </summary>
    public class UtilityVariable
    {
        public UtilityVariable()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        #region WatermarkPosition
        public enum WatermarkPosition
        {
            TopLeft,
            TopRight,
            TopMiddle,
            BottomLeft,
            BottomRight,
            BottomMiddle,
            MiddleLeft,
            MiddleRight,
            Center
        }
        #endregion
    }
}
