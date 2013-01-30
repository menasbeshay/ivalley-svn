<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <div class="ContentLeftDiv">
            <h1>
                تغيير كلمة المرور
            </h1>
            <div class="Details675">
            
             <div class="AdminRight" style="width: 160px">
            </div>
            <div class="AdminMiddle">
                <asp:Label ID="uiLabelMessage" runat="server" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 160px">
                <asp:Label ID="Label14" runat="server" Text=" كلمة المرور الجديدة :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
               
                <asp:TextBox ID="uiTextBoxPassword" runat="server" ValidationGroup="Password" TextMode="Password" 
                    Width="230px"></asp:TextBox>                
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="uiTextBoxPassword" Display="Dynamic" ErrorMessage="*" 
                    ValidationGroup="Password"></asp:RequiredFieldValidator>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 160px">
                <asp:Label ID="Label1" runat="server" Text=" إعادة كلمة المرور الجديدة :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
               
                <asp:TextBox ID="uiTextBoxRePassword" runat="server" ValidationGroup="Password" TextMode="Password" 
                    Width="230px"></asp:TextBox>                
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="uiTextBoxPassword" ControlToValidate="uiTextBoxRePassword" 
                    Display="Dynamic" ErrorMessage="كلمة السر غير متطابقة" 
                    ValidationGroup="Password"></asp:CompareValidator>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 160px">
                &nbsp;
            </div>
            <div class="AdminMiddle">
            <div class="SearchBtn">
                        <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="تغيير" 
                            ValidationGroup="Password" onclick="Button1_Click"></asp:LinkButton></div>
               
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
                              
    </div>
    </div>
    
    </div>
</asp:Content>
