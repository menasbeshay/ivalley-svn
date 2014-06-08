using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;


namespace ImageHandler
{

    /// <summary>
    /// Author : Souvik Das
    /// </summary>
    public class ImageOnDemand : IHttpHandler
    {

        #region Private Fields

        private static float m_opacity = 1.0f;
        private static UtilityVariable.WatermarkPosition m_position = UtilityVariable.WatermarkPosition.TopLeft;
        private static int m_x = 20;
        private static int m_y = 20;
        private static Color m_transparentColor = Color.Empty;
        private static RotateFlipType m_rotateFlip = RotateFlipType.RotateNoneFlipNone;
        private static Font m_font = new Font(FontFamily.GenericSansSerif, 12, FontStyle.Bold);
        private static Color m_fontColor = Color.White;
        private static float m_scaleRatio = 1.0f;
        private static string sFont = "Verdana";
        #endregion

        #region To process a request
        /// <summary>
        /// /
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
            string sSrc = (context.Request.QueryString["url"] == null) ? string.Empty : context.Server.MapPath(context.Server.UrlDecode(context.Request.QueryString["url"]));
            context.Response.Clear();
            if (File.Exists(sSrc))
            {
                context.Response.ContentType = "image/jpeg";
                int iMaxWidth = (context.Request.QueryString["maxwidth"] == null) ? 0 : Convert.ToInt32(context.Request.QueryString["maxwidth"]);
                int iMaxHeight = (context.Request.QueryString["maxheight"] == null) ? 0 : Convert.ToInt32(context.Request.QueryString["maxheight"]);
                bool bGray = (context.Request.QueryString["grayscaling"] == null) ? false : Convert.ToBoolean(context.Request.QueryString["grayscaling"]);
                bool bNegative = (context.Request.QueryString["negative"] == null) ? false : Convert.ToBoolean(context.Request.QueryString["negative"]);
                bool bSepia = (context.Request.QueryString["sepia"] == null) ? false : Convert.ToBoolean(context.Request.QueryString["sepia"]);
                bool bNormal = (context.Request.QueryString["normal"] == null) ? false : Convert.ToBoolean(context.Request.QueryString["normal"]);
                float fBrightness = (context.Request.QueryString["brightness"] == null) ? 0 : Convert.ToSingle(context.Request.QueryString["brightness"]);
                float fContrast = (context.Request.QueryString["contrast"] == null) ? 0 : Convert.ToSingle(context.Request.QueryString["contrast"]);
                string sWaterMark = (context.Request.QueryString["watermark"] == null) ? string.Empty : Convert.ToString(context.Request.QueryString["watermark"]);
                m_position = (context.Request.QueryString["position"] == null) ? UtilityVariable.WatermarkPosition.TopLeft : (UtilityVariable.WatermarkPosition)Enum.Parse(typeof(UtilityVariable.WatermarkPosition), context.Request.QueryString["position"]);
                int iXaxis = (context.Request.QueryString["xaxis"] == null) ? 10 : Convert.ToInt32(context.Request.QueryString["xaxis"]);
                int iYaxis = (context.Request.QueryString["yaxis"] == null) ? 10 : Convert.ToInt32(context.Request.QueryString["yaxis"]);
                m_fontColor = (context.Request.QueryString["fontcolor"] == null) ? Color.White : Color.FromName(context.Request.QueryString["fontcolor"]);
                sFont = (context.Request.QueryString["fontfamily"] == null) ? "Verdana" : Convert.ToString(context.Request.QueryString["fontfamily"]);

                using (Stream imgStream = File.OpenRead(sSrc))
                {
                    using (Bitmap bmpImage = Resize(imgStream, iMaxWidth, iMaxHeight))
                    {
                        if (sWaterMark != string.Empty)
                        {
                            DrawText(sWaterMark, bmpImage, bmpImage);
                        }

                        if (bGray)
                            ToGrayscale(bmpImage);

                        if (bNegative)
                            ToNegative(bmpImage);

                        if (bSepia)
                            ToSepia(bmpImage);

                        if (fBrightness != 0)
                            SetBrightness(bmpImage, fBrightness);

                        if (fContrast != 1)
                            SetContrast(bmpImage, fContrast);

                        bmpImage.Save(context.Response.OutputStream, ImageFormat.Jpeg);

                    }
                }
            }

            context.Response.End();
        }
        #endregion

        #region IsReusable
        public bool IsReusable
        {
            get { return true; }
        }
        #endregion

        #region To Draw Water Mark
        public void AddWaterMark(string watermark, int xAxis, int yAxis, Bitmap bmp)
        {
            Graphics canvas = default(Graphics);
            try
            {
                canvas = Graphics.FromImage(bmp);
            }
            catch (Exception e)
            {
                Bitmap bmpNew = new Bitmap(bmp.Width, bmp.Height);
                canvas = Graphics.FromImage(bmpNew);
                canvas.DrawImage(bmp, new Rectangle(0, 0, bmpNew.Width, bmpNew.Height), 0, 0, bmp.Width, bmp.Height, GraphicsUnit.Pixel);
                bmp = bmpNew;
            }

            canvas.DrawString(watermark, new Font(sFont, 12, FontStyle.Bold), new SolidBrush(Color.Beige), new Point(xAxis, yAxis));
            canvas.Save();
        }
        #endregion

        #region Method Declaration

        #region Property Declaration
        /// <summary>
        /// Watermark position relative to the image sizes. 
        /// If Absolute is chosen, watermark positioning is being done via PositionX and PositionY 
        /// properties (0 by default)\n
        /// </summary>        
        public UtilityVariable.WatermarkPosition Position { get { return m_position; } set { m_position = value; } }

        /// <summary>
        /// Watermark X coordinate (works if Position property is set to WatermarkPosition.Absolute)
        /// </summary>
        public int PositionX { get { return m_x; } set { m_x = value; } }

        /// <summary>
        /// Watermark Y coordinate (works if Position property is set to WatermarkPosition.Absolute)
        /// </summary>
        public int PositionY { get { return m_y; } set { m_y = value; } }

        /// <summary>
        /// Watermark opacity. Can have values from 0.0 to 1.0
        /// </summary>
        public float Opacity { get { return m_opacity; } set { m_opacity = value; } }

        /// <summary>
        /// Transparent color
        /// </summary>
        public Color TransparentColor { get { return m_transparentColor; } set { m_transparentColor = value; } }

        /// <summary>
        /// Watermark rotation and flipping
        /// </summary>
        public RotateFlipType RotateFlip { get { return m_rotateFlip; } set { m_rotateFlip = value; } }

        /// <summary>
        /// Watermark scaling ratio. Must be greater than 0. Only for image watermarks
        /// </summary>
        public float ScaleRatio { get { return m_scaleRatio; } set { m_scaleRatio = value; } }

        /// <summary>
        /// Font of the text to add
        /// </summary>
        public Font Font { get { return m_font; } set { m_font = value; } }

        /// <summary>
        /// Color of the text to add
        /// </summary>
        public Color FontColor { get { return m_fontColor; } set { m_fontColor = value; } }

        #endregion

        #region Public Methods

        public static void DrawImage(Image watermark, Image m_image, Image m_originalImage)
        {
            // Calculate watermark position
            Point waterPos = GetWatermarkPosition(m_image, watermark);

            // Watermark destination rectangle
            Rectangle destRect = new Rectangle(waterPos.X, waterPos.Y, watermark.Width, watermark.Height);

            // Draw the watermark

            int i = watermark.Width;
            int j = m_image.Width;
            using (Graphics gr = Graphics.FromImage(m_image))
            {
                gr.DrawImage(watermark, destRect, 0, 0, watermark.Width, watermark.Height, GraphicsUnit.Pixel);
                gr.Save();
            }
        }

        public static void DrawText(string text, Image m_image, Image m_originalImage)
        {
            // Convert text to image, so we can use opacity etc.
            Image textWatermark = GetTextWatermark(text, m_image);
            DrawImage(textWatermark, m_image, m_originalImage);
        }
        #endregion



        private static Image GetTextWatermark(string text, Image m_image)
        {
            Brush brush = new SolidBrush(m_fontColor);
            SizeF size;

            // Figure out the size of the box to hold the watermarked text
            using (Graphics g = Graphics.FromImage(m_image))
            {
                size = g.MeasureString(text, new Font(sFont, 12, FontStyle.Bold));
            }

            // Create a new bitmap for the text, and, actually, draw the text
            Bitmap bitmap = new Bitmap((int)size.Width, (int)size.Height);
            bitmap.SetResolution(m_image.HorizontalResolution, m_image.VerticalResolution);

            using (Graphics g = Graphics.FromImage(bitmap))
            {
                g.DrawString(text, new Font(sFont, 12, FontStyle.Bold), brush, 0, 0);
            }

            return bitmap;
        }

        private static Image GetWatermarkImage(Image watermark)
        {
            return watermark;
        }

        private static Point GetWatermarkPosition(Image m_image, Image m_watermark)
        {
            int x = 0;
            int y = 0;

            switch (m_position)
            {
                case UtilityVariable.WatermarkPosition.TopLeft:
                    x = 0; y = 0;
                    break;
                case UtilityVariable.WatermarkPosition.TopRight:
                    x = m_image.Width - m_watermark.Width; y = 0;
                    break;
                case UtilityVariable.WatermarkPosition.TopMiddle:
                    x = (m_image.Width - m_watermark.Width) / 2; y = 0;
                    break;
                case UtilityVariable.WatermarkPosition.BottomLeft:
                    x = 0; y = m_image.Height - m_watermark.Height;
                    break;
                case UtilityVariable.WatermarkPosition.BottomRight:
                    x = m_image.Width - m_watermark.Width; y = m_image.Height - m_watermark.Height;
                    break;
                case UtilityVariable.WatermarkPosition.BottomMiddle:
                    x = (m_image.Width - m_watermark.Width) / 2; y = m_image.Height - m_watermark.Height;
                    break;
                case UtilityVariable.WatermarkPosition.MiddleLeft:
                    x = 0; y = (m_image.Height - m_watermark.Height) / 2;
                    break;
                case UtilityVariable.WatermarkPosition.MiddleRight:
                    x = m_image.Width - m_watermark.Width; y = (m_image.Height - m_watermark.Height) / 2;
                    break;
                case UtilityVariable.WatermarkPosition.Center:
                    x = (m_image.Width - m_watermark.Width) / 2; y = (m_image.Height - m_watermark.Height) / 2;
                    break;
                default:
                    break;
            }

            return new Point(x, y);
        }
        #endregion
        
        #region To resize By Percentage
        public static Image ScaleByPercent(Image imgPhoto)
        {
            float nPercent = (float).5; //((float)Percent / 100);

            int sourceWidth = imgPhoto.Width;
            int sourceHeight = imgPhoto.Height;
            int sourceX = 0;
            int sourceY = 0;

            int destX = 0;
            int destY = 0;
            int destWidth = (int)(sourceWidth * nPercent);
            int destHeight = (int)(sourceHeight * nPercent);

            Bitmap bmPhoto = new Bitmap(destWidth, destHeight, PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(imgPhoto.HorizontalResolution, imgPhoto.VerticalResolution);

            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;

            grPhoto.DrawImage(imgPhoto,
                new Rectangle(destX, destY, destWidth, destHeight),
                new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
                GraphicsUnit.Pixel);

            grPhoto.Dispose();
            return bmPhoto;
        }
        #endregion

        #region To resize a BitMap
        /// <summary>
        /// //
        /// </summary>
        /// <param name="SourceImage"></param>
        /// <param name="MaxWidth"></param>
        /// <param name="MaxHeight"></param>
        /// <returns></returns>
        public static Bitmap Resize(Stream SourceImage, int MaxWidth, int MaxHeight)
        {
            Bitmap b = null;

            using (System.Drawing.Image i = System.Drawing.Image.FromStream(SourceImage))
            {
                int _maxWidth = (MaxWidth > 0) ? MaxWidth : i.Width;
                int _maxHeight = (MaxHeight > 0) ? MaxHeight : i.Height;
                double _scaleWidth = (double)_maxWidth / (double)i.Width;
                double _scaleHeight = (double)_maxHeight / (double)i.Height;
                double _scale = (_scaleHeight < _scaleWidth) ? _scaleHeight : _scaleWidth;
                _scale = (_scale > 1) ? 1 : _scale;

                int _newWidth = (int)(_scale * i.Width);
                int _newHeight = (int)(_scale * i.Height);

                b = new Bitmap(_newWidth, _newHeight);

                using (Graphics g = Graphics.FromImage(b))
                {
                    g.CompositingQuality = CompositingQuality.HighQuality;
                    g.SmoothingMode = SmoothingMode.HighQuality;
                    g.InterpolationMode = InterpolationMode.HighQualityBicubic;

                    g.DrawImage(i, new Rectangle(0, 0, _newWidth, _newHeight));
                    g.Save();
                }
            }

            return b;
        }
        #endregion

        #region Gray Scale
        /// <summary>
        /// 
        /// </summary>
        /// <param name="b"></param>
        public static void ToGrayscale(Bitmap b)
        {
            ColorMatrix cm = new ColorMatrix(new float[][]{
                            new float[] {0.3086f, 0.3086f, 0.3086f, 0f, 0f},
                            new float[] {0.6094f, 0.6094f, 0.6094f, 0f, 0f},
                            new float[] {0.0820f, 0.0820f, 0.0820f, 0f, 0f},
                            new float[] {     0f,      0f,      0f, 1f, 0f},
                            new float[] {     0f,      0f,      0f, 0f, 1f}});

            ApplyColorMatrix(b, cm);
        }
        #endregion

        #region Color Navigation
        public static void ToNegative(Bitmap b)
        {
            ColorMatrix cm = new ColorMatrix(new float[][]{
                            new float[] {0.992f,     0f,     0f, 0f, 0f},
                            new float[] {    0f, 0.992f,     0f, 0f, 0f},
                            new float[] {    0f,     0f, 0.992f, 0f, 0f},
                            new float[] {    0f,     0f,     0f, 1f, 0f},
                            new float[] {0.004f, 0.004f, 0.004f, 0f, 1f}});

            ApplyColorMatrix(b, cm);

            cm = new ColorMatrix(new float[][]{
                new float[] {-1f,  0f,  0f, 0f, 0f},
                new float[] { 0f, -1f,  0f, 0f, 0f},
                new float[] { 0f,  0f, -1f, 0f, 0f},
                new float[] { 0f,  0f,  0f, 1f, 0f},
                new float[] { 0f,  0f,  0f, 0f, 1f}});

            ApplyColorMatrix(b, cm);
        }
        #endregion

        #region Dark brown-grey color
        /// <summary>
        /// 
        /// </summary>
        /// <param name="b"></param>
        public static void ToSepia(Bitmap b)
        {
            ColorMatrix cm = new ColorMatrix(new float[][]{
                            new float[] {0.393f, 0.349f, 0.272f, 0f, 0f},
                            new float[] {0.769f, 0.686f, 0.534f, 0f, 0f},
                            new float[] {0.189f, 0.168f, 0.131f, 0f, 0f},
                            new float[] {    0f,     0f,     0f, 1f, 0f},
                            new float[] {    0f,     0f,     0f, 0f, 1f}});

            ApplyColorMatrix(b, cm);
        }
        #endregion

        #region To set Brightness
        /// <summary>
        /// 
        /// </summary>
        /// <param name="b"></param>
        /// <param name="Brightness"></param>
        public static void SetBrightness(Bitmap b, float Brightness)
        {
            ApplyColorMatrix(b, CreateBrightnessMatrix(Brightness));
        }
        #endregion

        #region To set Contrast
        /// <summary>
        /// 
        /// </summary>
        /// <param name="b"></param>
        /// <param name="Contrast"></param>
        public static void SetContrast(Bitmap b, float Contrast)
        {
            ApplyColorMatrix(b, CreateContrastMatrix(Contrast));
        }
        #endregion

        #region To make bright Matrix
        /// <summary>
        /// /
        /// </summary>
        /// <param name="Brightness"></param>
        /// <returns></returns>
        public static ColorMatrix CreateBrightnessMatrix(float Brightness)
        {
            if (Brightness < -1 || Brightness > 1)
                throw new ArgumentOutOfRangeException("Brightness value is out of range");

            ColorMatrix cm = new ColorMatrix(new float[][]{
                            new float[] {        1f,          0,          0,  0,  0},
                            new float[] {         0,         1f,          0,  0,  0},
                            new float[] {         0,          0,         1f,  0,  0},
                            new float[] {         0,          0,          0, 1f,  0},
                            new float[] {Brightness, Brightness, Brightness, 1f, 1f}});

            return cm;
        }
        #endregion

        #region To make a Contrast Matrix
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Contrast"></param>
        /// <returns></returns>
        public static ColorMatrix CreateContrastMatrix(float Contrast)
        {
            if (Contrast < 0 || Contrast > 3)
                throw new ArgumentOutOfRangeException("Contrast value is out of range");

            float Trans = (1f - Contrast) / 2f;

            ColorMatrix cm = new ColorMatrix(new float[][]{
                            new float[] {Contrast,       0f,       0f, 0f, 0f},
                            new float[] {      0f, Contrast,       0f, 0f, 0f},
                            new float[] {      0f,       0f, Contrast, 0f, 0f},
                            new float[] {      0f,       0f,       0f, 1f, 0f},
                            new float[] {   Trans,    Trans,    Trans, 0f, 1f}});

            return cm;
        }
        #endregion

        #region Apply ColorMatrix
        /// <summary>
        /// /
        /// </summary>
        /// <param name="b"></param>
        /// <param name="cm"></param>
        public static void ApplyColorMatrix(Bitmap b, ColorMatrix cm)
        {
            using (Graphics g = Graphics.FromImage(b))
            {
                ImageAttributes ia = new ImageAttributes();
                ia.SetColorMatrix(cm);

                g.DrawImage(b, new Rectangle(0, 0, b.Width, b.Height), 0, 0, b.Width, b.Height, GraphicsUnit.Pixel, ia);
                g.Save();
            }
        }
        #endregion
    }

}
