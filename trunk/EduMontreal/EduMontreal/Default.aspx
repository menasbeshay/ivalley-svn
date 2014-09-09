<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EduMontreal._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Welcome to Edu Montreal </h1>    
    <asp:Panel ID="startPanel" runat="server">
    please fill your application in order to get your course at Edu montreal institute <a href="apply.aspx" class="btn btn-primary">Start now</a>
        <br />
        <img src="Images/status/start.jpg" style="max-width:700px;"/>
        </asp:Panel>
    <asp:Panel ID="uiPanelfollow" runat="server">
    please follow your application progress at Edu montreal institute <a href="checkapp.aspx" class="btn btn-primary">Check it</a>
        <br />
        
        </asp:Panel>

</asp:Content>