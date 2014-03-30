<%@ Page Title="" Language="C#" MasterPageFile="~/ZahraaAr.Master" AutoEventWireup="true" CodeBehind="Pages.aspx.cs" Inherits="Taqwa.Website.Pages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="js/purl.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Tabs
            var pid = $.url().param('PID');
            if (pid != "undefined") {
                switch (pid) {
                    case '2':
                        $("#menuItemAct").addClass("current");
                        break;
                    case '3':
                        $("#menuItemTW").addClass("current");
                        break;
                    case '5':
                        $("#menuItemAbout").addClass("current");
                        break;
                    case '7':
                        $("#menuItemContact").addClass("current");
                        break;

                }
            }

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="clear:both; height:10px;"></div>
    <div class="mainContent col-lg-12 row" >
<h2>
    <asp:Literal ID="uiLiteralTitle" runat="server"></asp:Literal>
</h2>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
</div>
</div>
</asp:Content>
