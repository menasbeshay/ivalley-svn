<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Start.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Flights_GUI.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi11").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
                    <h4>
                        Log in
                    </h4>
                    <div class="Details900">
    <asp:Login ID="Login1" runat="server">
    </asp:Login>
    </div>
    </div>
</asp:Content>
