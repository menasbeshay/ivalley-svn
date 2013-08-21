<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Inner.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="website.Registration" %>
<%@ Register src="UC/register.ascx" tagname="register" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="clear5">
    </div>
    <h2>
    Create new account
    </h2>
    <div class="clear5">
    </div>

<div>
    <uc1:register ID="register1" runat="server" Onregistered="onRegistered" />
    </div>
    <div class="clear5"></div>
    <div>        
    </div>

</asp:Content>
