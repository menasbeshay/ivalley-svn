<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="RegisterHealthInfo.aspx.cs" Inherits="HealthInfo"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <asp:Panel ID="pnlHealthInfo"  runat="server" meta:resourcekey="pnlHealthInfoResource1">
        <table width="100%" dir="rtl">
            <tr>
                <td>
                    <asp:Label ID="lblBirthLocation" runat="server" Font-Underline="True" meta:resourcekey="lblBirthLocationResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBirthLocation" runat="server" meta:resourcekey="txtBirthLocationResource1"></asp:TextBox>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBirthWeight" runat="server" Font-Underline="True" meta:resourcekey="lblBirthWeightResource1"></asp:Label>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtWeight1" Width="50px" runat="server" meta:resourcekey="txtWeight1Resource1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtWeight2" Width="50px" runat="server" meta:resourcekey="txtWeight2Resource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:Label ID="lblKilo" runat="server" meta:resourcekey="lblKiloResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMotherCurrentInterval" runat="server" Font-Underline="True" meta:resourcekey="lblMotherCurrentIntervalResource1"></asp:Label>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtCurrentInterval1" Width="50px" runat="server" meta:resourcekey="txtCurrentInterval1Resource1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCurrentInterval2" Width="50px" runat="server" meta:resourcekey="txtCurrentInterval2Resource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:Label ID="lblYearMonth1" runat="server" meta:resourcekey="lblYearMonth1Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMotherPastInterval" runat="server" Font-Underline="True" meta:resourcekey="lblMotherPastIntervalResource1"></asp:Label>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtPastInterval1" Width="50px" runat="server" meta:resourcekey="txtPastInterval1Resource1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPastInterval2" Width="50px" runat="server" meta:resourcekey="txtPastInterval2Resource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:Label ID="lblYearMonth2" runat="server" meta:resourcekey="lblYearMonth2Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblVariatyBorn" runat="server" Font-Underline="True" meta:resourcekey="lblVariatyBornResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblAlive1" runat="server" meta:resourcekey="lblAlive1Resource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:TextBox ID="txtVariatyBorn1" runat="server" meta:resourcekey="txtVariatyBorn1Resource1"></asp:TextBox>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblTotal1" runat="server" meta:resourcekey="lblTotal1Resource1"></asp:Label></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTotal1" Width="50px" runat="server" meta:resourcekey="txtTotal1Resource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblCurrentNoOfChildren" runat="server" Font-Underline="True" meta:resourcekey="lblCurrentNoOfChildrenResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblAlive2" runat="server" meta:resourcekey="lblAlive2Resource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:TextBox ID="txtCurrentNoOfChildren" runat="server" meta:resourcekey="txtCurrentNoOfChildrenResource1"></asp:TextBox>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblTotal2" runat="server" meta:resourcekey="lblTotal2Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTotal2" Width="50px" runat="server" meta:resourcekey="txtTotal2Resource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblPastNoOfChildrent" runat="server" Font-Underline="True" meta:resourcekey="lblPastNoOfChildrentResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblAlive3" runat="server" meta:resourcekey="lblAlive3Resource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:TextBox ID="txtPastNoOfChildrent" runat="server" meta:resourcekey="txtPastNoOfChildrentResource1"></asp:TextBox>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblTotal3" runat="server" meta:resourcekey="lblTotal3Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTotal3" Width="50px" runat="server" meta:resourcekey="txtTotal3Resource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPastDeadNoOfChildrent" runat="server" Font-Underline="True" meta:resourcekey="lblPastDeadNoOfChildrentResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPastDeadNoOfChildrent" runat="server" meta:resourcekey="txtPastDeadNoOfChildrentResource1"></asp:TextBox>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="lblNationalNumber" runat="server" Font-Underline="True" meta:resourcekey="lblNationalNumberResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNationalNumber" runat="server" meta:resourcekey="txtNationalNumberResource1"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnSearch" Width="50px" runat="server" meta:resourcekey="btnSearchResource1" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="lblName" runat="server" Font-Underline="True" meta:resourcekey="lblNameResource1"></asp:Label>
                </td>
                <td colspan="2">
                    <table dir="rtl" class="TableBorderBlue">
                        <tr>
                            <td align="center">
                                <asp:Label ID="lblFirstName" runat="server" meta:resourcekey="lblFirstNameResource1"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="lblRemainName" runat="server" meta:resourcekey="lblRemainNameResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server" meta:resourcekey="txtFirstNameResource1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtRemainName" runat="server" meta:resourcekey="txtRemainNameResource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="lblRelation" runat="server" meta:resourcekey="lblRelationResource1"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpRelation" runat="server" meta:resourcekey="drpRelationResource1">
                        <asp:ListItem meta:resourcekey="ListItemResource1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <table dir="rtl" align="center">
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="btnAdd" runat="server" meta:resourcekey="btnAddResource1" />
                <asp:Button ID="BtnBack" runat="server" meta:resourcekey="BtnBackResource1" OnClick="BtnBack_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
