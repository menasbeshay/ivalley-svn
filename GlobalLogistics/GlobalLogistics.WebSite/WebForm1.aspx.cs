using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
using System.IO;
using System.Net;
namespace GlobalLogistics.WebSite
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(DateTime.Now.ToString()+ "<br>");
            Response.Write(DateTime.Now.AddHours(7).ToString());
            //Response.Write("MENA");
            //Response.Write(Environment.i);
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DirectoryInfo dir = new DirectoryInfo(Server.MapPath("~/fileuploads/magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Now)));
            if (!dir.Exists)
            {
                dir.Create();
            }
            FileUpload1.SaveAs(Server.MapPath("~/fileuploads/magazine/" + string.Format("{0:dd-MM-yyyy}",DateTime.Now) + "/" + FileUpload1.FileName));
            if (ZipFile.IsZipFile(Server.MapPath("~/fileuploads/magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Now) + "/" + FileUpload1.FileName)))
            {
                ZipFile s = ZipFile.Read(Server.MapPath("~/fileuploads/magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Now) + "/" + FileUpload1.FileName));                
                if (s.SelectEntries("*.swf", FileUpload1.FileName.Substring(0, FileUpload1.FileName.LastIndexOf("."))).Count == 1)
                {
                    s.ExtractAll(Server.MapPath("~/fileuploads/magazine/" + string.Format("{0:dd-MM-yyyy}", DateTime.Now)), ExtractExistingFileAction.OverwriteSilently);
                    FileInfo[] files = dir.GetDirectories(FileUpload1.FileName.Substring(0, FileUpload1.FileName.LastIndexOf(".")))[0].GetFiles("*.swf");
                    if (files.Length > 0)
                    {
                        Label1.Text = files[0].Name;
                    }
                    //else
                    //{
                    //    Label1.Text = "no SWF files";
                    //    FileInfo[] search = dir.GetFiles(FileUpload1.FileName);
                    //    if (search.Length > 0)
                    //    {
                    //        foreach (FileInfo item in search)
                    //        {
                    //            item.Delete();
                    //        }
                    //    }
                    //}
                }
                //else
                //{
                //    Label1.Text = "no SWF files";
                //    FileInfo[] search = dir.GetFiles(FileUpload1.FileName);
                //    if (search.Length > 0)
                //    {
                //        foreach (FileInfo item in search)
                //        {                            
                //            item.Delete();
                //        }
                //    }
                //}
            }
            //else
            //{
            //    Label1.Text = "not a valid zip file";
            //    FileInfo[] search = dir.GetFiles(FileUpload1.FileName);
            //    if (search.Length > 0)
            //    {
            //        foreach (FileInfo item in search)
            //        {
            //            item.Delete();
            //        }
            //    }
            //}
        }
    }
}