using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Chat2Connect.services
{
    /// <summary>
    /// Summary description for FileUploader
    /// </summary>
    public class FileUploader : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //Uploaded File Deletion
            if (context.Request.QueryString.Count > 0)
            {
                string filePath = HttpContext.Current.Server.MapPath("~/files/rooms/attachedimages") + "//" + context.Request.QueryString[0].ToString();
                if (File.Exists(filePath))
                    File.Delete(filePath);
            }
            //File Upload
            else
            {
                var ext = System.IO.Path.GetExtension(context.Request.Files[0].FileName);
                var fileName = Path.GetFileName(context.Request.Files[0].FileName);

                if (context.Request.Files[0].FileName.LastIndexOf("\\") != -1)
                {
                    fileName = context.Request.Files[0].FileName.Remove(0, context.Request.Files[0].FileName.LastIndexOf("\\")).ToLower();
                }



                fileName = GetUniqueFileName(fileName, HttpContext.Current.Server.MapPath("~/files/rooms/attachedimages/"), ext).ToLower();



                string location = HttpContext.Current.Server.MapPath("~/files/rooms/attachedimages/") + fileName + ext;
                context.Request.Files[0].SaveAs(location);
                context.Response.Write(fileName + ext);
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
}