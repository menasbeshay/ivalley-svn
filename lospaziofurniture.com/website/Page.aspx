<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="website.Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        var id = $.url().param('PID');
        if (id == 2) {
            $("#mi2").css("color", "#F6E2A5");
        }
        else if (id == 7) {

            $("#mi5").css("color", "#F6E2A5");
        }
    });
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div  style="padding:20px;">
<h2>
    <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label>
</h2>

<div >

    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
</div>
</div>
</asp:Content>
