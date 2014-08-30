<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="archiplan.Admin.changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table>
            <tr>
                <td>Current Password :</td>
                <td>
                    <asp:TextBox ID="txtCurrentPassword" TextMode="Password" runat="server" />
                </td>
            </tr>
            <tr>
                <td>New Password :</td>
                <td>
                    <asp:TextBox ID="txtNewPaassword" TextMode="Password" runat="server" />

                </td>

            </tr>
            <tr>
                <td>Confirm Password :
                </td>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" />
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="btnSave" Text="Save" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
