using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Chat2Connect
{
    /// <summary>
    /// Summary description for audioUploader
    /// </summary>
    public class audioUploader : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            
            System.IO.Stream str; 
            int strLen, strRead;
            str = context.Request.InputStream;
            strLen = Convert.ToInt32(str.Length);
            byte[] strArr = new byte[strLen];
            strRead = str.Read(strArr, 0, strLen);
            string fileName = GetUniqueFileName("audio", HttpContext.Current.Server.MapPath("~/files/rooms/attacheaudio/"), ".wav").ToLower();
            string location = HttpContext.Current.Server.MapPath("~/files/rooms/attacheaudio/") + fileName + ".wav";
            File.WriteAllBytes(location, strArr);
            str.Close();
            context.Response.Write(context.Request["roomId"].ToString() + "," + fileName + ".wav");
            context.Response.End();
               
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