using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Form.DefaultFocus = "Button1";
            if (Request.QueryString["Birth"] != null && Request.QueryString["Birth"].ToString() == "1")
                btnAddNewBirth.Text = "اضافة حالة ميلاد جديدة";
            if (Request.QueryString["Dead"] != null && Request.QueryString["Dead"].ToString() == "1")
                btnAddNewBirth.Text = "اضافة حالة وفاة جديدة";
            if (Request.QueryString["ApproveDead"] != null && Request.QueryString["ApproveDead"].ToString() == "1")
                btnAddNewBirth.Text = "رجوع لتاكيد بيانات الوفاة";
            if (Request.QueryString["ApproveBirth"] != null && Request.QueryString["ApproveBirth"].ToString() == "1")
                btnAddNewBirth.Text = "رجوع لتاكيد بيانات الميلاد";
            if (Request.QueryString["UpdateMedicalDeath"] != null)
                btnAddNewBirth.Text = "رجوع لتعديل بيانات الصحية لمتوفي";
            if (Request.QueryString["AddMedicalDeath"] != null)
                btnAddNewBirth.Text = "رجوع لاضافة بيانات الصحية لمتوفي";

            //if (Request.QueryString["Birth"] != null)
            //{
            //    Button1.Attributes.Add("onclick", string.Format("javascript:window.open('PrintBirthInfo.aspx?ForApprove=1&Print=1&BornEventID={0}')", Request.QueryString["BornEventIdParameter"]));
            //}
            //else if (Request.QueryString["Dead"] != null)
            //{
            //    Button1.Attributes.Add("onclick", string.Format("javascript:window.open('PrintDeathInfo.aspx?ForApprove=1&Print=1&DeadEventID={0}')", Request.QueryString["DeadEventIDParameter"])); 
            //}
            //else if (Request.QueryString["Medical"] != null)
            //{
            //    Button1.Attributes.Add("onclick", string.Format("javascript:window.open('PrintMedicalDeathInfo.aspx?ForApprove=1&Print=1&ForUpdate=1&DeadEventID={0}')", Request.QueryString["DeadEventID"]));
            //}

           /* if (Request.QueryString["Birth"] != null)
            {
                Button1.Attributes.Add("onclick", string.Format("javascript:window.open('Print.aspx?Born=1&Dead=0&BornEventID={0}')", Request.QueryString["BornEventIdParameter"]));
               // Button1.Attributes.Add("onclick", string.Format("javascript:window.location.href = '{0}/Print.aspx?Born=1&Dead=0&BornEventID={1}'", Request.ApplicationPath, Request.QueryString["BornEventIdParameter"]));
            }
            else
            {
                Button1.Attributes.Add("onclick", string.Format("javascript:window.open('Print.aspx?Born=0&Dead=1&DeadEventID={0}')", Request.QueryString["DeadEventID"]));
                //Button1.Attributes.Add("onclick", string.Format("javascript:window.location.href='{0}/Print.aspx?Born=0&Dead=1&DeadEventID={1}'",Request.ApplicationPath, Request.QueryString["DeadEventID"]));
            }*/
            
          
        }
    }
    protected void btnAddNewBirth_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Birth"] != null && Request.QueryString["Birth"].ToString() == "1")
            Response.Redirect("RegisterBirthInfo.aspx");
        if (Request.QueryString["Dead"] != null && Request.QueryString["Dead"].ToString() == "1")
            Response.Redirect("RegisterDeathCase.aspx");
        if (Request.QueryString["ApproveDead"] != null && Request.QueryString["ApproveDead"].ToString() == "1")
            Response.Redirect("ApproveDead.aspx");
        if (Request.QueryString["ApproveBirth"] != null && Request.QueryString["ApproveBirth"].ToString() == "1")
            Response.Redirect("ApproveBirth.aspx");
        if (Request.QueryString["UpdateMedicalDeath"] != null)
            Response.Redirect("ListDeadMedicalInfo.aspx?ForUpdate=1");
        if (Request.QueryString["AddMedicalDeath"] != null)
            Response.Redirect("ListDeadMedicalInfo.aspx");
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Birth"] != null)
        {
            MHOCommon.WriteQrsBorn(new Guid(Request.QueryString["BornEventIdParameter"].ToString()));
            ScriptManager.RegisterStartupScript(this, this.GetType(), "openPrint", string.Format("window.open('Print.aspx?Born=1&Dead=0&BornEventID={0}');", Request.QueryString["BornEventIdParameter"]), true);
        }
        else 
        {
            MHOCommon.WriteQrsDead(new Guid(Request.QueryString["DeadEventID"].ToString()));
            ScriptManager.RegisterStartupScript(this, this.GetType(), "openPrint", string.Format("window.open('Print.aspx?Born=0&Dead=1&DeadEventID={0}');", Request.QueryString["DeadEventID"]), true);
        }
    }
}
