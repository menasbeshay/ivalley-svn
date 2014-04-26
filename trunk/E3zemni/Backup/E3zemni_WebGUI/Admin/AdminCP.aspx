<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCP.aspx.cs" Inherits="E3zemni_WebGUI.Admin.AdminCP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#homeItem").addClass("current")
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row">
<h3>
    Welcome to admin control panel.</h3>
    <h3>
    please choose item from menu
</h3>
</div>
</asp:Content>
