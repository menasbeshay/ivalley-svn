<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="activate.aspx.cs" Inherits="Chat2Connect.activate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <asp:Panel runat="server" ID="uiPanelActivated" Visible="false"> 
        <div class=" alert alert-success" style="margin:20px auto; width:95%;">
            <h3>تأكيد البريد الإلكترونى</h3>
            <div >
                تم تأكيد البريد الإلكترونى الخاص بك لهذا الحساب بنجاح.
            </div>
        </div>
        </asp:Panel> 
    <asp:Panel runat="server" ID="uiPanelActivationForm" Visible="false"> 
        <div class=" form-horizontal" style="margin:20px auto; width:95%;">
            <h3>تأكيد البريد الإلكترونى</h3>
            <asp:Panel runat="server" ID="uiPanelMailSent" Visible="false"> 
        <div class=" alert alert-success" style="margin:20px auto; width:95%;">
            
            <div >
                تم إرسال رسالة التأكيد على البريد الإلكترونى الخاص بك لهذا الحساب بنجاح.
            </div>
        </div>
        </asp:Panel> 
            <div >
                إضغط هنا إعادة إرسال رسالة تأكيد البريد الإلكترونى&nbsp;&nbsp; <asp:LinkButton Text="إرسال" runat="server" CssClass="btn btn-main" ID="uiLinkButtonSend" OnClick="uiLinkButtonSend_Click" />
            </div>
        </div>
        </asp:Panel> 

</asp:Content>
