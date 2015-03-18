using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Common
{
    public partial class Thumb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string imgPath;
            int maxWidth = 0;
            int maxHeight = 150;
            
            if (Request.QueryString["Image"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Image"].ToString()))
                {
                    imgPath = Request.QueryString["Image"].ToString();
                    if (!string.IsNullOrEmpty(imgPath))
                    {
                        try
                        {
                            if (!File.Exists(Server.MapPath(imgPath)))
                            {
                                imgPath = "/img/announcement-icon.png";
                            }
                            byte[] imgByte = GetImageByteArr(new Bitmap(Server.MapPath(imgPath)));
                            MemoryStream memoryStream = new MemoryStream();
                            memoryStream.Write(imgByte, 0, imgByte.Length);
                            System.Drawing.Image imagen = System.Drawing.Image.FromStream(memoryStream);
                            Response.ContentType = "image/Jpeg";
                            ImageResize ir = new ImageResize();
                            ir.File = imagen;
                            ir.Height = maxHeight;
                            ir.Width = maxWidth;
                            ir.GetThumbnail().Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                        }
                        catch { }
                    }
                }
            }
        }
        private static byte[] GetImageByteArr(System.Drawing.Image img)
        {
            byte[] ImgByte;
            using (MemoryStream stream = new MemoryStream())
            {
                img.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                ImgByte = stream.ToArray();
            }
            return ImgByte;
        }
    }
}