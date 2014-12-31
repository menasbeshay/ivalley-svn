using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;

namespace Taqwa.Website
{
    public partial class videos : System.Web.UI.Page
    {
        public int currentPage
        {
            get
            {
                object o = Session["CurrentPagev"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { Session["CurrentPagev"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet Videosds = new DataSet();
            Videosds = db.GetGetClassAttachmentByClassIDAndYearIDAndCourseIDAndTypeForHome();
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = Videosds.Tables[0].DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 12;
            pds.CurrentPageIndex = currentPage;
            uiRepeaterCurrentVedios.DataSource = pds;
            uiRepeaterCurrentVedios.DataBind();
            uiLinkButtonPrev.Enabled = true;
            uiLinkButtonNext.Enabled = true;
            if (currentPage == 0)
            {
                uiLinkButtonPrev.Enabled = false;
            }

            if (currentPage == (pds.PageCount - 1))
            {
                uiLinkButtonNext.Enabled = false;
            }
        }


        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            currentPage++;
            BindData();
        }
        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            currentPage--;
            BindData();
        }

        protected void uiRepeaterCurrentVedios_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image thumb = (Image)e.Item.FindControl("uiImageThumb");
                DataRowView row = (DataRowView)e.Item.DataItem;
                string vid = row["FilePath"].ToString().Substring(row["FilePath"].ToString().IndexOf("v=") + 2);
                if (vid.Contains("&"))
                    vid = vid.Substring(0, vid.IndexOf("&"));
                thumb.ImageUrl = "http://img.youtube.com/vi/" + vid + "/0.jpg";


                Literal iframe = (Literal)e.Item.FindControl("uiLiteralIFrame");
                iframe.Text = "<iframe id='player' type='text/html' src='http://www.youtube.com/embed/" + vid + "?enablejsapi=1' frameborder='0' style='max-width:100%;min-height:400px;width:450px;'></iframe>";
            }
        }

    }
}