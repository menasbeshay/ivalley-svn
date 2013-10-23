using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;

using System.Drawing.Imaging;
using System.IO;
using System.Drawing;
public partial class chechQr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        QrEncoder encoder = new QrEncoder(ErrorCorrectionLevel.M);
        QrCode qrCode;
        encoder.TryEncode("Test", out qrCode);

        GraphicsRenderer gRenderer = new GraphicsRenderer(
     new FixedModuleSize(2, QuietZoneModules.Two),
     Brushes.Black, Brushes.White);

        MemoryStream ms = new MemoryStream();        
        gRenderer.WriteToStream(qrCode.Matrix, ImageFormat.Png, ms);

        FileStream file = new FileStream("D:\\qr.png", FileMode.OpenOrCreate);
        ms.WriteTo(file);
        file.Flush();
        file.Close();
    }

}