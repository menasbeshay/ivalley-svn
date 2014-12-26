using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing;
using Helper;

public partial class Thumb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string imgPath;
        int maxWidth = 200;
        int maxHeight = 200;
        if (!string.IsNullOrEmpty(Request.QueryString["w"]))
        {
            maxWidth = Convert.ToInt32(Request.QueryString["w"].ToString());
        }
        if (!string.IsNullOrEmpty(Request.QueryString["h"]))
        {
            maxHeight = Convert.ToInt32(Request.QueryString["h"].ToString());
        }
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
                            imgPath = "images/defaultavatar.png";
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