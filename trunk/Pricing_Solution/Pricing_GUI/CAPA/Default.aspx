<%@ Page Title="" Language="C#" MasterPageFile="~/CAPA/DefaultSite.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pricing_GUI.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 35%;
            text-align: left;
            direction: ltr;
        }
        .style3
        {
            width: 30%;
        }
    </style>

<div style="text-align:center">
                    <table cellpadding="2" cellspacing="2" class="style1" dir="rtl">
                        <tr>
                            <td class="style2">
                                <br />
                                <br />
                                <br />
                            </td>
                            <td class="style3">
                                <asp:Label ID="ui_txtErrorMsg" runat="server" Font-Bold="True" Font-Size="13pt" 
                                    ForeColor="#CC3300"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                                    

                                                    <asp:RequiredFieldValidator runat="server" ForeColor="Red" 
                                                    ControlToValidate="ui_txtUserName" ErrorMessage="*" Display="Dynamic" 
                                                    ValidationGroup="CheckUser" ID="RequiredFieldValidator5" 
                                                    Style="font-weight: 700"></asp:RequiredFieldValidator>


                                                </td>
                            <td class="style3" style="text-align: right; direction: ltr;">
                                                    <asp:TextBox runat="server" Font-Size="14px" Width="100%" 
                                    ID="ui_txtUserName"></asp:TextBox>

                                                </td>
                            <td style="text-align: right; direction: ltr;">
                                                    

                               <asp:Label runat="server" Text="User Name :" 
                                    Font-Size="15pt" ID="ui_lblArName"></asp:Label>


                                                </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                                    <asp:RequiredFieldValidator runat="server" ForeColor="Red" 
                                                        ControlToValidate="ui_txtPassword" ErrorMessage="*" Display="Dynamic" 
                                                        ValidationGroup="CheckUser" ID="RequiredFieldValidator6" 
                                                        Style="font-weight: 700"></asp:RequiredFieldValidator>

                                                </td>
                            <td class="style3" style="text-align: right; direction: ltr;">
                                                    <asp:TextBox runat="server" Font-Size="14px" Width="100%" 
                                    ID="ui_txtPassword" TextMode="Password"></asp:TextBox>

                                                </td>
                            <td style="text-align: right; direction: ltr;">
                                                    <asp:Label runat="server" Text="Password :" 
                                    Font-Size="15pt" ID="ui_lblArName0"></asp:Label>

                                                </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                                    &nbsp;</td>
                            <td class="style3" style="text-align: right">
                                                    &nbsp;</td>
                            <td style="text-align: right">
                                                    &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td style="text-align: center" class="style3">
                        <asp:Button runat="server" Text="Log In" ValidationGroup="CheckUser" 
                                    BorderColor="#006699" BorderWidth="3px" BorderStyle="Groove" Font-Bold="True" 
                                    Font-Names="Tahoma" ForeColor="#000066" Width="120px" ID="ui_btnCheckUser" 
                                    OnClick="ui_btnCheckUser_Click"></asp:Button>

                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </td>
                            <td class="style3">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
        </div>

</asp:Content>
