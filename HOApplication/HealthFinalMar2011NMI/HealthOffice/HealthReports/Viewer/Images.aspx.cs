using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;
using MHO.BLL;
using System.IO;
using System.Threading;
using System.Text;

public partial class HealthReports_Viewer_Images : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool dead = false;
        bool born = false;
        ReaderWriterLockSlim cacheLock = new ReaderWriterLockSlim();
        string generatedpath = "";
        string Image = Request.QueryString["Image"];
        if (Image == null)
        {
            this.ErrorResult();
            return;
        }

        if (Request.QueryString["Dead"] != null)
            dead = Request.QueryString["Dead"].ToString() == "1";

        if (Request.QueryString["Born"] != null)
            born = Request.QueryString["Born"].ToString() == "1";

        if (born)
        {
            Born bornCase = new Born();
            bornCase.LoadByPrimaryKey(new Guid(Image));
            MHO.BLL.AREA area = new AREA();
            area.LoadByPrimaryKey(bornCase.BornArea);
            MHO.BLL.POLICE_STATION ps = new POLICE_STATION();
            ps.LoadByPrimaryKey(bornCase.BornSection);
            MHO.BLL.health_office ho = new health_office();
            ho.LoadByPrimaryKey(bornCase.OrgID);
            NATIONALITY FatherNath = new NATIONALITY();
            FatherNath.LoadByPrimaryKey(bornCase.FatherNationality);
            NATIONALITY MotherNath = new NATIONALITY();
            MotherNath.LoadByPrimaryKey(bornCase.MotherNationality);
            string gender = (bornCase.BornGender == 1) ? "ذكر " : "أنثى";
            string fatherReligion = "مسلم", motherReligion = "مسلم", InformRelation = "الأب";
            switch (bornCase.FatherReligion)
            {
                case 1:
                    fatherReligion = "مسلم";
                    break;
                case 2 :
                    fatherReligion = "مسيحى";
                    break;
                case 3 :
                    fatherReligion = "يهودى";
                    break;
                
            }

            switch (bornCase.MotherReligion)
            {
                case 1:
                    motherReligion = "مسلم";
                    break;
                case 2:
                    motherReligion = "مسيحى";
                    break;
                case 3:
                    motherReligion = "يهودى";
                    break;
            }

            switch (bornCase.InformerRelation)
            {
                case 1:
                    InformRelation = "الاب";
                    break;
                case 2:
                    InformRelation = "الام";
                    break;
                case 3:
                    InformRelation = "الاخ";
                    break;
                case 4:
                    InformRelation = "الاخت";
                    break;
                case 5:
                    InformRelation = "العم";
                    break;
                case 6:
                    InformRelation = "الخال";
                    break;
                case 7:
                    InformRelation = "الجد";
                    break;
                case 8:
                    InformRelation = "اخري";
                    break;
                case 9:
                    InformRelation = "الابن";
                    break;
                case 10:
                    InformRelation = "الابنة";
                    break;
            }
            if (bornCase.RowCount > 0)
            {
                QrEncoder encoder = new QrEncoder(ErrorCorrectionLevel.M);
                QrCode qrCode;
                StringBuilder builder = new StringBuilder();
                
                builder.AppendLine( bornCase.BornName + " " + bornCase.FirstFatherName + " " + bornCase.SecondFatherName + " " + bornCase.FatherSureName);
                builder.AppendLine("," + ps.DESCR);
                builder.AppendLine("," + area.DESCR);
                builder.AppendLine("," + gender);
                builder.AppendLine(","+  bornCase.BirthDate.ToShortDateString() + " " + bornCase.BirthDate.Minute.ToString() + ":" + bornCase.BirthDate.Hour.ToString());                
                builder.AppendLine("," + bornCase.FirstFatherName + " " + bornCase.SecondFatherName + " " + bornCase.FamilyFatherName +" "+ bornCase.FatherSureName);
                builder.AppendLine("," + FatherNath.DESCR );
                builder.AppendLine("," + fatherReligion);
                builder.AppendLine(",");
                builder.AppendLine(","+ bornCase.FatherJob);
                builder.AppendLine("," + bornCase.FatherNID);                
                builder.AppendLine("," + bornCase.FirstMotherName + " " + bornCase.SecondMotherName + " " + bornCase.FamilyMotherName +" "+ bornCase.MotherSureName);
                builder.AppendLine("," + MotherNath.DESCR);
                builder.AppendLine("," + motherReligion);
                builder.AppendLine(",");
                builder.AppendLine(","+ bornCase.MotherJob);
                builder.AppendLine("," + bornCase.MotherNID);                
                builder.AppendLine("," + bornCase.InformerFirstName + " " + bornCase.InformerSecondName );
                builder.AppendLine("," + InformRelation );
                builder.AppendLine("," + bornCase.InformerNID);
                builder.AppendLine("," + bornCase.InformerPhone );                
                encoder.TryEncode(builder.ToString(), out qrCode);

                GraphicsRenderer gRenderer = new GraphicsRenderer(
             new FixedModuleSize(2, QuietZoneModules.Zero),
             Brushes.Black, Brushes.White);

                MemoryStream ms = new MemoryStream();
                gRenderer.WriteToStream(qrCode.Matrix, ImageFormat.Bmp, ms);

                //FileStream file = new FileStream(MapPath("~/qrs/" + Image+ Session.SessionID + ".bmp"), FileMode.Create, FileAccess.Write, FileShare.None);
                generatedpath = "D:\\qrs\\" + Image + Guid.NewGuid().ToString() + ".bmp";
                FileStream file = new FileStream(generatedpath, FileMode.OpenOrCreate, FileAccess.Write, FileShare.ReadWrite);
                ms.WriteTo(file);
                file.Flush();
                file.Close();
                ms.Close();
                file.Dispose();
                ms.Dispose();
                Thread.Sleep(3000);
            }

        }
        else if (dead)
        {
            Dead deadCase = new Dead();
            deadCase.LoadByPrimaryKey(new Guid(Image));
            MHO.BLL.AREA area = new AREA();
            area.LoadByPrimaryKey(deadCase.DeadArea);
            MHO.BLL.POLICE_STATION ps = new POLICE_STATION();
            ps.LoadByPrimaryKey(deadCase.DeadSection);
            MHO.BLL.health_office ho = new health_office();
            ho.LoadByPrimaryKey(deadCase.OrgID);
           
            NATIONALITY MotherNath = new NATIONALITY();
            MotherNath.LoadByPrimaryKey(deadCase.DeadMotherNationality);
            string gender = (deadCase.DeadGender == 1) ? "ذكر " : "أنثى";
            string deadMartialStatus = "اعزب",deadReligion = "مسلم", motherReligion = "مسلم", InformRelation = "الأب";
           
            switch (deadCase.DeadMartialStatus)
	        {
		        case 1:
                    deadMartialStatus= "اعزب";
                    break;
                case 2:
                    deadMartialStatus = "متزوج";
                    break;
                case 3:
                    deadMartialStatus = "مطلق";
                    break;
                case 4:
                    deadMartialStatus = "أرمل";
                    break;
	        }
            switch (deadCase.DeadMotherReligion)
            {
                case 1:
                    motherReligion = "مسلم";
                    break;
                case 2:
                    motherReligion = "مسيحى";
                    break;
                case 3:
                    motherReligion = "يهودى";
                    break;
            }

            switch (deadCase.DeadReligion)
            {
                case 1:
                    deadReligion = "مسلم";
                    break;
                case 2:
                    deadReligion = "مسيحى";
                    break;
                case 3:
                    deadReligion = "يهودى";
                    break;
            }

            switch (deadCase.InformerRelation)
            {
                case 1:
                    InformRelation = "الاب";
                    break;
                case 2:
                    InformRelation = "الام";
                    break;
                case 3:
                    InformRelation = "الاخ";
                    break;
                case 4:
                    InformRelation = "الاخت";
                    break;
                case 5:
                    InformRelation = "العم";
                    break;
                case 6:
                    InformRelation = "الخال";
                    break;
                case 7:
                    InformRelation = "الجد";
                    break;
                case 8:
                    InformRelation = "اخري";
                    break;
                case 9:
                    InformRelation = "الابن";
                    break;
                case 10:
                    InformRelation = "الابنة";
                    break;
            }
            if (deadCase.RowCount > 0)
            {
                QrEncoder encoder = new QrEncoder(ErrorCorrectionLevel.M);
                QrCode qrCode;
                StringBuilder builder = new StringBuilder();
                builder.AppendLine(deadCase.DeadNID);
                builder.AppendLine("," + deadCase.DeadFirstName + " " + deadCase.DeadFatherName + " " + deadCase.DeadGrandName + " " + deadCase.DeadFamilyName);
                builder.AppendLine("," + deadCase.DeadBirthDate.ToShortDateString());
                builder.AppendLine("," + deadReligion);
                builder.AppendLine("," + deadMartialStatus);                
                builder.AppendLine("," + gender);
                builder.AppendLine("," + deadCase.AddressNo + "," + deadCase.AddressStreet + "," + deadCase.AddressFeatured);
                builder.AppendLine("," + ps.DESCR);
                builder.AppendLine("," + area.DESCR);
                builder.AppendLine("," + deadCase.DeadDieDate.ToShortDateString() + " - " + deadCase.DeadDieHour + ":" + deadCase.DeadDieMin);
                builder.AppendLine("," + deadCase.DiePlace + "," + deadCase.DiePlaceDescription);
                builder.AppendLine("," + deadCase.DeadMotherFirstName + " " + deadCase.DeadMotherSecondName + " " + deadCase.DeadMotherFamilyName + " " + deadCase.DaadMotherSureName);
                builder.AppendLine("," + MotherNath.DESCR);
                builder.AppendLine("," + motherReligion);
                builder.AppendLine("," + deadCase.DeadMotherJob);
                builder.AppendLine("," + deadCase.DeadMotherNID);
                builder.AppendLine("," + deadCase.InformerFirstName + " " + deadCase.InformerSecondName);
                builder.AppendLine("," + InformRelation);
                builder.AppendLine("," + deadCase.InformerNID);
                builder.AppendLine("," + deadCase.InformerPhone);
                encoder.TryEncode(builder.ToString(), out qrCode);

                GraphicsRenderer gRenderer = new GraphicsRenderer(
                new FixedModuleSize(2, QuietZoneModules.Zero),
                Brushes.Black, Brushes.White);

                MemoryStream ms = new MemoryStream();
                gRenderer.WriteToStream(qrCode.Matrix, ImageFormat.Bmp, ms);

                //FileStream file = new FileStream(MapPath("~/qrs/" + Image + Session.SessionID + ".bmp"), FileMode.Create, FileAccess.Write, FileShare.None);
                generatedpath = "D:\\qrs\\" + Image + Guid.NewGuid().ToString() + ".bmp";
                FileStream file = new FileStream(generatedpath, FileMode.OpenOrCreate, FileAccess.Write, FileShare.ReadWrite);
                ms.WriteTo(file);
                file.Flush();
                file.Close();
                ms.Close();
                file.Dispose();
                ms.Dispose();
                Thread.Sleep(3000);    
            }
        }

        

        string sSize = Request["Size"];
        int Size = 120;
        if (sSize != null)
            Size = Int32.Parse(sSize);

        //string Path = Server.MapPath(Request.ApplicationPath) + "\\" + "qrs\\" + Image + Session.SessionID + ".bmp";
        string Path = generatedpath; //"D:\\" + "qrs\\" + Image + Session.SessionID + ".bmp";
        //Bitmap bmp = CreateThumbnail(Path, 130, 127);
        System.Drawing.Image bmp;
        if (Request.QueryString["Inner"] != null)
        {
            if (Request.QueryString["Inner"] == "photo")
            {
                bmp = FixedSize(Path, 200, 200);
            }
            else if (Request.QueryString["Inner"] == "photo1")
            {
                bmp = FixedSize(Path, 200, 150);
            }
            else if (Request.QueryString["Inner"] == "Quote")
            {
                bmp = FixedSize(Path, 80, 80);
            }
            else if (Request.QueryString["Inner"] == "news")
            {
                bmp = FixedSize(Path, 200, 300);
            }
            else
            {
                bmp = FixedSize(Path, 930, 200);
            }
        }
        else
        {
            bmp = FixedSize(Path, 200, 200);
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
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = string.Empty;
        Response.ContentType = "image/bmp";

        bmp.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Bmp);
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
                throw;
                //return null;
            }
        }
        return null;
    }
}