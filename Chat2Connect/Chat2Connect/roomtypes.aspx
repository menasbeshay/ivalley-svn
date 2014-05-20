<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="roomtypes.aspx.cs" Inherits="Chat2Connect.roomtypes" %>

<%@ Register Src="~/usercontrols/RoomTypes.ascx" TagPrefix="uc1" TagName="RoomTypes" %>


<asp:Content ID="Content2" ContentPlaceHolderID="BHead" runat="server">
  
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <uc1:RoomTypes runat="server" id="RoomTypes" />
</asp:Content>
