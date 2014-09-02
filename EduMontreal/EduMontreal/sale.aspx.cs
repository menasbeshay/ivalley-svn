using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal
{
    public partial class sale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string amount = "0";
                Student student = (Student)Session["CurrentUser"];

                ApplicationData application = new ApplicationData();
                application.GetApplicationByStudentID(student.StudentID);
                
                ApplicationStatusHistory history = new ApplicationStatusHistory();
                history.GetApplicationStatusHistorybyApplicationDataID(application.ApplicationDataID);

                if (history.ApplicationStatusID == 3)
                {
                    amount = "1501";
                }
                else
                {
                    amount = history.TuitionFees.ToString();
                }

                using (var wb = new WebClient())
                {
                    var data = new NameValueCollection();
                    // mena.samy@gmail.com
                    data["merchant_id"] = "d5365b0304";
                    data["key"] = "71e19c6b83a20732d89be47ed4b96fa4ccbc05d9";
                    
                    // heshamhunter@edumontreal.com
                    //data["merchant_id"] = "dd19a290a5";
                    //data["key"] = "d12336b277dc7dd42119a8745adeab14a08ea113";
                    data["amount"] = amount;
                    data["token"] = Request["token"];
                    data["first_name"] = Request["first_name"];
                    data["last_name"] = Request["last_name"];
                    data["currency"] = "US$";
                    data["test_mode"] = "true";
                    string url = "https://ecom.payfirma.com/sale?key=d12336b277dc7dd42119a8745adeab14a08ea113&merchant_id=dd19a290a5&test_mode=true";

                    byte[] ServerResponse = wb.UploadValues(url, "POST", data);
                    string responsetext = Encoding.ASCII.GetString(ServerResponse);

                    JavaScriptSerializer parser = new JavaScriptSerializer();
                    var info = parser.Deserialize<PayfirmaResponse>(responsetext);

                    if (info.result == "approved")
                    {                        

                        ApplicationStatus next = new ApplicationStatus();
                        next.GetNextApplicationStatusApplicationDataID(application.ApplicationDataID);
                        
                        history.AddNew();
                        history.StudentID = student.StudentID;
                        history.ApplicationDataID = application.ApplicationDataID;
                        history.StatusDate = DateTime.Now;
                        
                        history.ApplicationStatusID = next.ApplicationStatusID;
                        history.Save();
                    }
                    Response.Clear();
                    Response.Write(responsetext);
                    Response.End();
                }
            }
        }
    }

    public class PayfirmaResponse
    {
        public string type { get; set; }
        public string result { get; set; }
        public bool result_bool { get; set; }
        public string card_type { get; set; }
        public string amount { get; set; }
        public string transaction_id { get; set; }
        public string suffix { get; set; }
        public string avs { get; set; }
        public string cvv2 { get; set; }
        public string auth_code { get; set; }
        public string email { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string error { get; set; }
    }
}