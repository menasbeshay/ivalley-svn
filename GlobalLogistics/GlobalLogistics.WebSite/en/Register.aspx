<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GlobalLogistics.WebSite.Register" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
                <h1>
                    Register Your Company
                </h1>
                <div class="Details675">
                    
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>  
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                                 <div style="background-color: transparent;width:640px;height:540px; z-index: 10000; text-align: center;position:absolute;-ms-filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=70); filter: alpha(opacity=70); -moz-opacity:0.7 -khtml-opacity: 0.7; opacity: 0.7;background-color:#fff;">                                
                                 <div style="height:10%">&nbsp;</div>
                                <div style="-ms-filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=100); filter: alpha(opacity=100); -moz-opacity:1; -khtml-opacity: 1; opacity:1;">
                                <img src="images/ajax-loader.gif" style="vertical-align:middle;border:0;margin-left:45%"/>
                                </div>
                            </div>
                                </ProgressTemplate>
                    </asp:UpdateProgress>                                  
<div class="LeftContent" style="width: 120px">
                        
                    </div>
                    <div class="MiddleContent">
                        <asp:Label ID="uiLabelMessage" runat="server" Text="" CssClass="Label" 
                            Visible="False"></asp:Label>
                    </div>
                    <div class="RightContent">
                        
                    </div>
                    <div class="clear5">
                    </div>
<div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label1" runat="server" Text="Company Name :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent" style="width: 50px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxName" Display="Dynamic" 
                            ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label2" runat="server" Text="Adddress :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxAddress" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent" style="width: 50px">
                        
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label3" runat="server" Text="City :" CssClass="Label"></asp:Label></div>
                    <div class="MiddleContent">
                        <asp:DropDownList ID="uiDropDownListCity" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label4" runat="server" Text="Category :" CssClass="Label"></asp:Label></div>
                    <div class="MiddleContent">
                        <asp:DropDownList ID="uiDropDownListCategory" runat="server" 
                            AutoPostBack="True" 
                            onselectedindexchanged="uiDropDownListCategory_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label5" runat="server" Text="Sub-Category :" CssClass="Label"></asp:Label></div>
                    <div class="MiddleContent">
                        <asp:DropDownList ID="uiDropDownListSubCategory" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                     <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label6" runat="server" Text="Tel :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxtele" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent" style="width: 50px">
                        
                    </div>
                    <div class="clear5">
                    </div>
                     <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label7" runat="server" Text="Fax :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="MiddleContent">
                        <asp:TextBox ID="uiTextBoxFax" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox>
                    </div>
                    <div class="RightContent" style="width: 50px">
                        
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        <asp:Label ID="Label8" runat="server" Text="Package :" CssClass="Label"></asp:Label></div>
                    <div class="MiddleContent">
                        <asp:DropDownList ID="uiDropDownListPackage" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="RightContent">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        &nbsp;</div>
                    <div class="MiddleContent">
                        <asp:CheckBox ID="uiCheckBoxAccept" runat="server" 
                            Text="I Agree on the terms and the conditions" />
                    </div>
                    <div class="RightContent">
                        &nbsp;</div>
                    <div class="clear5">
                    </div>
                    <div class="LeftContent" style="width: 120px">
                        &nbsp;</div>
                    <div class="MiddleContent" style="width: 400px">
                    <div style="max-height:200px; background-color:White;overflow:scroll;">
                        <asp:Literal ID="uiLiteralTerms" runat="server"></asp:Literal>
                        </div>
                    </div>
                    
                    <div class="RightContent">
                        &nbsp;&nbsp;</div>
                    <div class="clear5">
                    </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="LeftContent" style="width: 120px">
                        &nbsp;</div>
                    <div class="MiddleContent" style="text-align:center;">
                        <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                            <div class="SearchBtn">
                        <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="Register" 
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
