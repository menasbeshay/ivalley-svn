<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="SiteMails.aspx.cs" Inherits="Chat2Connect.Admin.SiteMails" %>

<%@ Register Src="~/usercontrols/Mail.ascx" TagPrefix="uc1" TagName="Mail" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="row">
            <div class="pull-right ">
                إسم البريد
            </div>
            <div class="form-group">
                <asp:DropDownList ID="drpSiteMembers" runat="server">
                </asp:DropDownList>
                <asp:LinkButton ID="lnkLoadMail" runat="server" OnClick="lnkLoadMail_Click">عرض</asp:LinkButton>
            </div>
        </div>

    <uc1:Mail runat="server" ID="ctrlMail"/>
</asp:Content>
