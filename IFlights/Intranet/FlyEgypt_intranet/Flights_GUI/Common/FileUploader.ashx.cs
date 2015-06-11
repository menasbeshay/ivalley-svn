using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;


namespace Flights_GUI.Common
{
    /// <summary>
    /// Summary description for FileUploader
    /// </summary>
    public class FileUploader : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            
            var result = new System.Collections.Generic.List<UploadedFile>();
            JavaScriptSerializer js = new JavaScriptSerializer();
            //Uploaded File Deletion
            if (context.Request.QueryString.Count > 0)
            {
                string filePath = HttpContext.Current.Server.MapPath("~") + "//" + context.Request.QueryString["path"].ToString();
                if (File.Exists(filePath))
                {
                    File.Delete(filePath);
                    Hashtable Files;
                    if (context.Session["CurrentUploadedFiles"] != null)
                    {
                        Files = (Hashtable)context.Session["CurrentUploadedFiles"];
                        Files.Remove(context.Request.QueryString["key"].ToString());
                    }
                    var jsonObj = js.Serialize(true);
                    context.Response.Write(jsonObj.ToString());
                    context.Response.End();
                }

            }
            //File Upload
            else if (context.Request.Files.Count != 0)
            {
                Hashtable Files;
                if (context.Session["CurrentUploadedFiles"] != null)
                    Files = (Hashtable)context.Session["CurrentUploadedFiles"];
                else
                    Files = new Hashtable();


                var ext = System.IO.Path.GetExtension(context.Request.Files[0].FileName);
                var fileName = Path.GetFileName(context.Request.Files[0].FileName);

                if (context.Request.Files[0].FileName.LastIndexOf("\\") != -1)
                {
                    fileName = context.Request.Files[0].FileName.Remove(0, context.Request.Files[0].FileName.LastIndexOf("\\")).ToLower();
                }



                fileName = GetUniqueFileName(fileName, HttpContext.Current.Server.MapPath("~/fileuploads/"), ext).ToLower();

                string FilePath = "/fileuploads/" + fileName + ext;

                Files.Add(fileName, FilePath);
                context.Session["CurrentUploadedFiles"] = Files;

                string location = HttpContext.Current.Server.MapPath("~/fileuploads/") + fileName + ext;
                context.Request.Files[0].SaveAs(location);

                result.Add(new UploadedFile()
                {
                    name = fileName + ext,
                    size = context.Request.Files[0].ContentLength,
                    url = FilePath,
                    thumbnailUrl = "",
                    deleteUrl = "common/fileuploader.ashx?path=/fileuploads/" + fileName + ext + "&key=" + fileName,
                    deleteType = "Get"
                });

                var uploadedFiles = new
                {
                    files = result.ToArray()
                };
                var jsonObj = js.Serialize(uploadedFiles);
                context.Response.Write(jsonObj.ToString());
                context.Response.End();


            }
        }

        public static string GetUniqueFileName(string name, string savePath, string ext)
        {

            name = name.Replace(ext, "").Replace(" ", "_");
            name = System.Text.RegularExpressions.Regex.Replace(name, @"[^\w\s]", "");

            var newName = name;
            var i = 0;
            if (System.IO.File.Exists(savePath + newName + ext))
            {

                do
                {
                    i++;
                    newName = name + "_" + i;

                }
                while (System.IO.File.Exists(savePath + newName + ext));

            }

            return newName;


        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }


    public class UploadedFile
    {
        public string name { get; set; }
        public double size { get; set; }
        public string url { get; set; }
        public string thumbnailUrl { get; set; }
        public string deleteUrl { get; set; }
        public string deleteType { get; set; }
    }
    
}