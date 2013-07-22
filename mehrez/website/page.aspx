<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="page.aspx.cs" Inherits="website.page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">
     $(document).ready(function () {
         var id = $.url().param('PID');
         if (id == 2) {
             $("#mi1").addClass("current");
         }
         else if (id == 3) {
             $("#mi2").addClass("current");
         }
     });
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="text-align:left;margin-left:-8px;">
    <asp:Image ID="uiImagemain" runat="server" ImageAlign="AbsMiddle" />
    </div>
    <div class="clearfix"></div>
    <div style="width:85%;padding:5px;">
    <asp:Label ID="uiLabelcontent" runat="server" CssClass="content_black"></asp:Label>
    </div>
</asp:Content>
