using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;

namespace Taqwa.Website
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBLayer db = new DBLayer();
                DataSet Videosds = new DataSet();
                
                Videosds = db.GetGetClassAttachmentByClassIDAndYearIDAndCourseIDAndTypeForHome();
                if (Videosds.Tables[0].Rows.Count > 0)
                {
                    string vid = Videosds.Tables[0].Rows[0]["FilePath"].ToString().Substring(Videosds.Tables[0].Rows[0]["FilePath"].ToString().IndexOf("v=") + 2);
                    uiLabelVTitle.Text = Videosds.Tables[0].Rows[0]["ArTitle"].ToString();
                    if (vid.Contains("&"))
                        vid = vid.Substring(0, vid.IndexOf("&"));
                    uiImageVideoThumb.ImageUrl = "http://img.youtube.com/vi/" + vid + "/0.jpg";


                    uiLiteralIFrame.Text = "<iframe id='player' type='text/html' src='http://www.youtube.com/embed/" + vid + "?enablejsapi=1' frameborder='0' style='max-width:100%;min-height:400px;width:450px;'></iframe>";
                }
                DBLayer db2 = new DBLayer();
                RepeaterHomePhotos.DataSource = db2.GetHomePhotos();
                RepeaterHomePhotos.DataBind();
            }
        }
    }
}