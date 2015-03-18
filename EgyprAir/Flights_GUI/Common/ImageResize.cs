using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace Flights_GUI.Common
{
    public class ImageResize
    {
        #region Instance Fields
        //instance fields
        private double m_width, m_height;
        private bool m_use_aspect = true;
        private bool m_use_percentage = false;
        private System.Drawing.Image m_src_image, m_dst_image;
        private System.Drawing.Image m_image;
        private ImageResize m_cache;
        private Graphics m_graphics;
        #endregion
        #region Public properties
        /// <summary>
        /// gets of sets the File
        /// </summary>
        public System.Drawing.Image File
        {
            get { return m_image; }
            set { m_image = value; }
        }
        /// <summary>
        /// gets of sets the Image
        /// </summary>
        public System.Drawing.Image Image
        {
            get { return m_src_image; }
            set { m_src_image = value; }
        }
        /// <summary>
        /// gets of sets the PreserveAspectRatio
        /// </summary>
        public bool PreserveAspectRatio
        {
            get { return m_use_aspect; }
            set { m_use_aspect = value; }
        }
        /// <summary>
        /// gets of sets the UsePercentages
        /// </summary>
        public bool UsePercentages
        {
            get { return m_use_percentage; }
            set { m_use_percentage = value; }
        }
        /// <summary>
        /// gets of sets the Width
        /// </summary>
        public double Width
        {
            get { return m_width; }
            set { m_width = value; }
        }
        /// <summary>
        /// gets of sets the Height
        /// </summary>
        public double Height
        {
            get { return m_height; }
            set { m_height = value; }
        }
        #endregion
        #region Public Methods
        /// <summary>
        /// Returns a Image which represents a rezised Image
        /// </summary>
        /// <returns>A Image which represents a rezised Image, using the 
        /// proprerty settings provided</returns>
        public virtual System.Drawing.Image GetThumbnail()
        {
            // Flag whether a new image is required
            bool recalculate = false;
            double new_width = Width;
            double new_height = Height;
            // Load via stream rather than Image.FromFile to release the file
            // handle immediately
            if (m_src_image != null)
                m_src_image.Dispose();
            m_src_image = m_image;
            recalculate = true;
            // If you opted to specify width and height as percentages of the original
            // image's width and height, compute these now
            if (UsePercentages)
            {
                if (Width != 0)
                {
                    new_width = (double)m_src_image.Width * Width / 100;

                    if (PreserveAspectRatio)
                    {
                        new_height = new_width * m_src_image.Height / (double)m_src_image.Width;
                    }
                }
                if (Height != 0)
                {
                    new_height = (double)m_src_image.Height * Height / 100;

                    if (PreserveAspectRatio)
                    {
                        new_width = new_height * m_src_image.Width / (double)m_src_image.Height;
                    }
                }
            }
            else
            {
                // If you specified an aspect ratio and absolute width or height, then calculate this 
                // now; if you accidentally specified both a width and height, ignore the 
                // PreserveAspectRatio flag
                if (PreserveAspectRatio)
                {
                    if (Width != 0 && Height == 0)
                    {
                        new_height = (Width / (double)m_src_image.Width) * m_src_image.Height;
                    }
                    else if (Height != 0 && Width == 0)
                    {
                        new_width = (Height / (double)m_src_image.Height) * m_src_image.Width;
                    }
                }
            }
            recalculate = true;
            if (recalculate)
            {
                // Calculate the new image
                if (m_dst_image != null)
                {
                    m_dst_image.Dispose();
                    m_graphics.Dispose();
                }
                Bitmap bitmap = new Bitmap((int)new_width, (int)new_height, m_src_image.PixelFormat);                
                m_graphics = Graphics.FromImage(bitmap);
                m_graphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                m_graphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                m_graphics.Clear(Color.White);
                m_graphics.DrawImage(m_src_image, 0, 0, bitmap.Width, bitmap.Height);
                m_dst_image = bitmap;
                // Cache the image and its associated settings
                m_cache = this.MemberwiseClone() as ImageResize;
            }

            return m_dst_image;
        }
        #endregion
        #region Deconstructor
        /// <summary>
        /// Frees all held resources, such as Graphics and Image handles
        /// </summary>
        ~ImageResize()
        {
            // Free resources
            if (m_dst_image != null)
            {
                m_dst_image.Dispose();
                m_graphics.Dispose();
            }

            if (m_src_image != null)
                m_src_image.Dispose();
        }
        #endregion
    }
}