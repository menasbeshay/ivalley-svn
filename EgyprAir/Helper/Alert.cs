using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Helper
{
    public static class Alert
    {        
        private const string ErrorAlertBody = "<div class='alert alert-danger' role='alert'>{0}</div>";
        private const string WarningAlertBody = "<div class='alert alert-warning' role='alert'>{0}</div>";
        private const string InfoAlertBody = "<div class='alert alert-info' role='alert'>{0}</div>";
        private const string SuccessAlertBody = "<div class='alert alert-success' role='alert'>{0}</div>";

        public static void ShowMessage(string Type, string Msg)
        {
            string body = "";
            string title = "";
            switch (Type)
            {
                case "Error":
                    title = "Error";
                    body = string.Format(ErrorAlertBody, Msg);
                    break;
                case "Warning":
                    title = "Warning";
                    body = string.Format(WarningAlertBody, Msg);
                    break;
                case "Info":
                    title = "Info";
                    body = string.Format(InfoAlertBody, Msg);
                    break;
                case "Success":
                    title = "Success";
                    body = string.Format(SuccessAlertBody, Msg);
                    break;
                default:
                    break;
            }
            var http = System.Web.HttpContext.Current;

            if ((http != null))
            {
                var page = http.CurrentHandler as System.Web.UI.Page;
                if (page != null)
                {                    
                    System.Web.UI.ScriptManager.RegisterStartupScript(page, page.GetType(),"Alert","$(document).ready(function (){ $('#GeneralModalTitle').html(\"" + title + "\");  $('#GeneralModalBody').html(\"" + body + "\"); $('#GeneralModal').modal('show'); });",true);
                    //page.ClientScript.RegisterStartupScript(page.GetType(), "Alert", , true);
                }
            }
        }
    }
}
