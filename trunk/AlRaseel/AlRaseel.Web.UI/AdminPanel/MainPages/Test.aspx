<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Web.UI.AdminPanel.MainPages.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div>

            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="txtname" runat="server" />  </td>
                </tr>
                <tr>
                    <td> <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" /></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
            </table>

            <table>
                <tr>
                    <td>
                        <asp:GridView id="grd" runat="server">  

                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddl" runat="server">
                        </asp:DropDownList></td>
                </tr>
            </table>


        </div>
    </div>
    </form>
</body>
</html>
