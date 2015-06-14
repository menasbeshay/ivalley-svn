<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ExceptionLight.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Flights_GUI.Account.Profile" %>
<%@ MasterType VirtualPath="~/MasterPages/ExceptionLight.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="cell-12 clearfix">
                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" Text="An error occured. please try again later."
                    Visible="False" CssClass="Label"></asp:Label>
            </div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Username : 
                </div>
                <div class="cell-4">
                    <asp:Label ID="uiLabelUsername" runat="server" ></asp:Label>
                </div>
                <div class="cell-2"></div>
                <div class="cell-4">
                    <img id="userImg" style="position:absolute;max-height:200px"  runat="server" src="../img/noImg.gif" />
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Change Password : 
                </div>
                <div class="cell-4">
                    <a href="ChangePassword.aspx">Change</a>
                </div>
            </div>            
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Full Name : 
                </div>
                <div class="cell-4">
                   <asp:Label ID="uiLabelFullName" runat="server" ></asp:Label>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Email : 
                </div>
                <div class="cell-4">
                   <asp:Label ID="uiLabelEmail" runat="server" ></asp:Label>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Telephone : 
                </div>
                <div class="cell-4">
                  <asp:Label ID="uiLabelTele" runat="server" ></asp:Label>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Group : 
                </div>
                <div class="cell-4">
                    <asp:DropDownList ID="DropDownListGroups" runat="server" Enabled="false"></asp:DropDownList>
                    
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Roles :
                </div>
                <div class="cell-10">
                    <asp:Label ID="uiLabelRoles" runat="server" ></asp:Label>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
</asp:Content>
