﻿using System;
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

[Serializable]
public partial class UserControls_ucGeneralDeathInfo : System.Web.UI.UserControl
{
    #region Properties


    /// <summary>
    /// Gets or sets value of Dead NID
    /// </summary>
    public string EventDeadBirthDate
    {
        get
        {
            return txtBirthDate.Text;
        }
        set
        {
            txtBirthDate.Text = value;
        }
    }
    /// <summary>
    /// Gets or sets value of Dead NID
    /// </summary>
    public string EventDeadDieDate
    {
        get
        {
            return txtDeathDate.Text;
        }
        set
        {
            txtDeathDate.Text = value;
        }
    }
    /// <summary>
    /// Gets or sets value of Dead NID
    /// </summary>
    public string EventDeadDieHour
    {
        get
        {
            return txtDeathHour.Text;
        }
        set
        {
            txtDeathHour.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Dead Minutes
    /// </summary>
    public string EventDeadDieMin
    {
        get
        {
            return txtDeathMin.Text;
        }
        set
        {
            txtDeathMin.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Dead NID
    /// </summary>
    public string EventDeadPlace
    {
        get
        {
            return rdioDeathLocation.SelectedValue;
        }
        set
        {
            rdioDeathLocation.SelectedIndex = rdioDeathLocation.Items.IndexOf(rdioDeathLocation.Items.FindByValue(value));
        }
    }
    /// <summary>
    /// Gets or sets value of Dead NID
    /// </summary>
    public string EventDeadPlaceDescription
    {
        get
        {
            return txtDescriptionOfLocation.Text;
        }
        set
        {
            txtDescriptionOfLocation.Text = value;
        }
    }

    public string EventState
    {
        get
        {
            return lblStateValue.Text;
        }
    }

    public string EventSection
    {
        get
        {
            return lblSectionValue.Text;
        }
    }

    public string EventSubSection
    {
        get
        {
            return lblSubSectionValue.Text;
        }
    }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //TODO: UnComment me 
            lblStateValue.Text = MHOCommon.CurrentOrgGovName;
            lblSectionValue.Text = MHOCommon.CurrentOrgPoliceStationName;
            lblSubSectionValue.Text = MHOCommon.CurrentOrgAreaName;
        }

        if (Session["NationalID"] != null)
        {
            txtBirthDate.Text = MHOCommon.GetDateFromNID(Session["NationalID"].ToString()).ToString("yyyy/MM/dd");
            updateGeneralDeathInfo.Update();
            Session.Remove("NationalID");
        }
    }
}
