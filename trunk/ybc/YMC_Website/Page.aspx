<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="YMC_Website.Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="Scripts/purl.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(
            function () {
                var id = $.url().param('pid');
                if (id == 2) {
                    $("#mi2").addClass("current");
                }
                else if (id == 3) {
                    $("#mi3").addClass("current");
                }
                else if (id == 9) {
                    $("#mi6").addClass("current");
                }

            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="direction:rtl;">
    <h1>
        <asp:Label ID="uiLabelTitle" runat="server"></asp:Label></h1>
    <div style="margin-top:15px;">
        <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
    </div>   
    </div>
</asp:Content>
