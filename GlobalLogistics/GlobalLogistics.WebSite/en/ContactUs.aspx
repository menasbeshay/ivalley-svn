<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="GlobalLogistics.WebSite.ConactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
                <h1>
                   Contact Us
                </h1>
                <div class="Details675">

                
<div class="LeftContent" style="width: 120px">
                        
                    </div>
                    <div class="MiddleContent">
                        <asp:Label ID="uiLabelMessage" runat="server" CssClass="Label"></asp:Label>
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
                        <asp:Label ID="Label5" runat="server" Text="Website :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxWebsite" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label6" runat="server" Text="Address :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxAddress" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label7" runat="server" Text="Tele :" CssClass="Label"></asp:Label></div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxTele" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label8" runat="server" Text="Fax :" CssClass="Label"></asp:Label></div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxFax" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label9" runat="server" Text="Comments :" CssClass="Label"></asp:Label></div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxComments" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    <hr />
                    <div class="clear10"></div>
                    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>

                    <div class="LeftContent" style="width: 120px">
                    &nbsp;
                    </div>
                    <div class="MiddleContent" ">
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
