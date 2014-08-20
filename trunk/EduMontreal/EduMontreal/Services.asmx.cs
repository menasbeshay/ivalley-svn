﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Collections;

namespace EduMontreal
{
    /// <summary>
    /// Summary description for Services
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Services : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod(EnableSession = true)]
        public void DeleteFile(string FileName)
        {
            Hashtable Files;
            if (Session["CurrentUploadedFiles"] != null)
                Files = (Hashtable)Session["CurrentUploadedFiles"];
            else
                return;

            Files.Remove(FileName);
            Session["CurrentUploadedFiles"] = Files;
        }
    }
}
