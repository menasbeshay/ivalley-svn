using Combo.BLL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Combo.ComboAPI
{
    /// <summary>
    /// Summary description for FileUploader
    /// </summary>
    public class FileUploader : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {   
            bool isImage = false, isCover = false, isProfile = false;
            
            if (context.Request.Form["IsCover"] != null)
                isCover = Convert.ToBoolean(context.Request.Form["IsCover"].ToString());
            if (context.Request.Form["IsProfile"] != null)
                isProfile = Convert.ToBoolean(context.Request.Form["IsProfile"].ToString());

            int userid = Convert.ToInt32(context.Request.Form["UserId"].ToString());
            int typeid = Convert.ToInt32(context.Request.Form["Type"].ToString());  // 1 - image , 2- audio , 3 - video
            isImage = (typeid == 1);

            var ext = System.IO.Path.GetExtension(context.Request.Files[0].FileName);
            string fileName = Guid.NewGuid().ToString();

            DirectoryInfo dir = new DirectoryInfo(context.Server.MapPath("~/userfiles/" + userid.ToString()));
            if (!dir.Exists)
                dir.Create();

            string location = context.Server.MapPath("~/userfiles/"+ userid.ToString() + "/") + fileName + ext;
            context.Request.Files[0].SaveAs(location);

            BLL.Attachment newfile = new BLL.Attachment();
            newfile.AddNew();
            newfile.Path = "/userfiles/"+ userid.ToString() + "/" + fileName + ext;
            newfile.AttachmentTypeID = typeid;            
            newfile.Save();

            if (isCover || isProfile)
            {
                BLL.ComboUser user = new ComboUser();
                user.LoadByPrimaryKey(userid);
                if (isCover)
                    user.CoverImgID = newfile.AttachmentID;
                if (isProfile)
                    user.ProfileImgID = newfile.AttachmentID;
                user.Save();
            }

            Models.Attachment responseText = new Models.Attachment();
            responseText.AttachmentID = newfile.AttachmentID;
            responseText.Path = newfile.Path;
            responseText.AttachmentTypeID = newfile.AttachmentTypeID;

            Models.ComboResponse _response = new Models.ComboResponse();
            _response.bool_result = true;
            _response.ErrorCode = 0;
            _response.ErrorMsg = "";
            _response.Entity = new Models.Attachment[] { responseText };
            SetContentResult(_response);

        }

        private void SetContentResult(dynamic data)
        {
            string result = Newtonsoft.Json.JsonConvert.SerializeObject(data);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
            HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
            HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
            HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.
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