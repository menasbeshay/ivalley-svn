<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="MagazineSubscribtion.aspx.cs" Inherits="GlobalLogistics.WebSite.MagazineSubscribtion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
                <h1>
                    Magazine Registration
                </h1>
                <div class="Details675">

                
<div class="LeftContent" style="width: 120px">
                        
                    </div>
                    <div class="MiddleContent">
                        <asp:Label ID="uiLabelMessage" runat="server" Text="Name :" CssClass="Label" 
                            Visible="False"></asp:Label>
                    </div>
                    <div class="RightContent">
                        
                    </div>
                    <div class="clear5">
                    </div>
<div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label1" runat="server" Text="Name :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxName" Display="Dynamic" 
                            ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label2" runat="server" Text="Email :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxEmail" Display="Dynamic" 
                            ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label3" runat="server" Text="Mobile :" CssClass="Label"></asp:Label></div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxMobile" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label4" runat="server" Text="Company :" CssClass="Label"></asp:Label></div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxCompany" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        &nbsp;</div>
                    <div class="MiddleContent" style="text-align:center;">
                        <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                            <div class="SearchBtn">
                        <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="Submit" 
                            ValidationGroup="EditPage" onclick="uiButtonUpdate_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    </div>
                    </div>
                    

</asp:Content>
