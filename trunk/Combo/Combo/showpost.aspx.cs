using Combo.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Combo
{
    public partial class showpost : System.Web.UI.Page
    {
        public int PostID 
        { 
            get 
            {
                if (Request.QueryString["pid"] != null)
                {
                    int pid = 0;
                    int.TryParse(Request.QueryString["pid"].ToString(), out pid);
                    return pid;
                }
                else
                    return 0; 
            } 
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PostID != 0)
            {
                ComboPost post = new ComboPost();
                post.GetPostByID(PostID);
                uiImageProfilePic.ImageUrl = "comboAPI/images.aspx?Image=" + post.GetColumn("ProfilePic").ToString();
                uiLabelName.Text = post.GetColumn("UserName").ToString();
                uiLabelDate.Text = post.PostDate.ToString("dd/MM/yyyy hh:mm tt");
                uiLiteralText.Text = post.PostText;
            }
        }
    }
}