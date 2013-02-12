<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Flights_GUI.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(function () {
        $("#mi34").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
            <h4>
                Change Password</h4>
            <div class="Details900">
                <asp:ChangePassword ID="ChangePassword1" runat="server" SuccessPageUrl="~/Default.aspx">
                </asp:ChangePassword>
            </div>
            </div>
</asp:Content>
