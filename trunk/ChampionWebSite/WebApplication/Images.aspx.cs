﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;

namespace WebApplication
{
    public partial class Images : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Image = Request.QueryString["Image"];
            if (Image == null)
            {
                this.ErrorResult();
                return;
            }

            string sSize = Request["Size"];
            int Size = 120;
            if (sSize != null)
                Size = Int32.Parse(sSize);

            string Path = Server.MapPath(Request.ApplicationPath) + "\\" + Image;
            //Bitmap bmp = CreateThumbnail(Path, 130, 127);
            System.Drawing.Image bmp;
            if (Request.QueryString["Inner"] != null)
            {
                if (Request.QueryString["Inner"] == "photo")
                {
                    bmp = FixedSize(Path, 150, 150);
                }
                else if (Request.QueryString["Inner"] == "Quote")
                {
                    bmp = FixedSize(Path, 80, 80);
                }
                else
                {
                    bmp = FixedSize(Path, 930, 200);
                }
            }
            else
            {
                bmp = FixedSize(Path, 640, 300);
            }
            if (bmp == null)
            {
                this.ErrorResult();
                return;
            }

            string OutputFilename = null;
            OutputFilename = Request.QueryString["OutputFilename"];

            if (OutputFilename != null)
            {
                if (this.User.Identity.Name == "")
                {
                    // *** Custom error display here
                    bmp.Dispose();
                    this.ErrorResult();
                }
                try
                {
                    bmp.Save(OutputFilename);
                }
                catch (Exception ex)
                {
                    bmp.Dispose();
                    this.ErrorResult();
                    return;
                }
            }

            // Put user code to initialize the page here
            Response.ContentType = "image/jpeg";
            bmp.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            bmp.Dispose();
        }

        private void ErrorResult()
        {
            Response.Clear();
            Response.StatusCode = 404;
            Response.End();
        }

        ///
        /// Creates a resized bitmap from an existing image on disk.
        /// Call Dispose on the returned Bitmap object
        ///
        ///
        ///
        ///
        /// Bitmap or null
        public static Bitmap CreateThumbnail(string lcFilename, int lnWidth, int lnHeight)
        {

            System.Drawing.Bitmap bmpOut = null;
            try
            {
                Bitmap loBMP = new Bitmap(lcFilename);
                ImageFormat loFormat = loBMP.RawFormat;

                decimal lnRatio;
                int lnNewWidth = 0;
                int lnNewHeight = 0;

                //*** If the image is smaller than a thumbnail just return it
                if (loBMP.Width < lnWidth && loBMP.Height < lnHeight)
                    return loBMP;


                if (loBMP.Width > loBMP.Height)
                {
                    lnRatio = (decimal)lnWidth / loBMP.Width;
                    lnNewWidth = lnWidth;
                    decimal lnTemp = loBMP.Height * lnRatio;
                    lnNewHeight = (int)lnTemp;
                }
                else
                {
                    lnRatio = (decimal)lnHeight / loBMP.Height;
                    lnNewHeight = lnHeight;
                    decimal lnTemp = loBMP.Width * lnRatio;
                    lnNewWidth = (int)lnTemp;
                }

                // System.Drawing.Image imgOut =
                //      loBMP.GetThumbnailImage(lnNewWidth,lnNewHeight,
                //                              null,IntPtr.Zero);

                // *** This code creates cleaner (though bigger) thumbnails and properly
                // *** and handles GIF files better by generating a white background for
                // *** transparent images (as opposed to black)
                bmpOut = new Bitmap(lnNewWidth, lnNewHeight);
                Graphics g = Graphics.FromImage(bmpOut);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.FillRectangle(Brushes.White, 0, 0, lnNewWidth, lnNewHeight);
                g.DrawImage(loBMP, 0, 0, lnNewWidth, lnNewHeight);

                loBMP.Dispose();
            }
            catch
            {
                return null;
            }

            return bmpOut;
        }


        public System.Drawing.Image FixedSize(string lcFilename, int Width, int Height)
        {
            if (!string.IsNullOrEmpty(lcFilename))
            {
                try
                {
                    Bitmap imgPhoto = new Bitmap(lcFilename);
                    int sourceWidth = imgPhoto.Width;
                    int sourceHeight = imgPhoto.Height;
                    int sourceX = 0;
                    int sourceY = 0;
                    int destX = 0;
                    int destY = 0;

                    float nPercent = 0;
                    float nPercentW = 0;
                    float nPercentH = 0;

                    nPercentW = ((float)Width / (float)sourceWidth);
                    nPercentH = ((float)Height / (float)sourceHeight);
                    if (nPercentH < nPercentW)
                    {
                        nPercent = nPercentH;
                        destX = System.Convert.ToInt16((Width -
                                      (sourceWidth * nPercent)) / 2);
                    }
                    else
                    {
                        nPercent = nPercentW;
                        destY = System.Convert.ToInt16((Height -
                                      (sourceHeight * nPercent)) / 2);
                    }

                    int destWidth = (int)(sourceWidth * nPercent);
                    int destHeight = (int)(sourceHeight * nPercent);

                    Bitmap bmPhoto = new Bitmap(Width, Height,
                                      PixelFormat.Format24bppRgb);
                    bmPhoto.SetResolution(imgPhoto.HorizontalResolution,
                                     imgPhoto.VerticalResolution);

                    Graphics grPhoto = Graphics.FromImage(bmPhoto);
                    grPhoto.Clear(Color.White);
                    grPhoto.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;

                    grPhoto.DrawImage(imgPhoto,
                        new Rectangle(destX, destY, destWidth, destHeight),
                        new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
                        GraphicsUnit.Pixel);

                    grPhoto.Dispose();
                    return bmPhoto;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            return null;
        }
    }
}