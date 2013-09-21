<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCSubItemControl.ascx.cs" Inherits="UserControls_UCSubItemControl" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:UpdatePanel runat="server" ID="updateDeseases" UpdateMode="Conditional">
    <ContentTemplate>
    
        <table dir="rtl" width="100%">
            <tr>
                <td width="90%" align="right">
                    <table width="100%">
                        <tr>
                            <td width="30%" align="right">
                                <asp:Label ID="lblTitle" runat="server" Font-Underline="true"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label runat="server" ID="lblInsertedCode" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" dir="ltr" align="right">
                                <asp:TextBox ID="txtSearch" Width="250px" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" meta:resourcekey="btnSearchResource1" Width="50px"
                                    OnClick="btnSearch_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div dir="ltr" align="right">
                                    <asp:DropDownList ID="dropItem" AutoPostBack="true" Width="310px" runat="server"
                                        OnSelectedIndexChanged="dropItem_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td>
                                <asp:UpdateProgress ID="UpdateProgress1" DisplayAfter="1" AssociatedUpdatePanelID="updateDeseases" runat="server">
                                    <ProgressTemplate>
                                        <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <asp:Label ID="lblSelectedICD" runat="server" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="10%" align="left">
                    <table width="100%" style="display:none;">
                        <tr>
                            <td align="center">
                                <asp:Label ID="lblDay" runat="server" meta:resourcekey="lblDayResource1"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="lblMonth" runat="server" meta:resourcekey="lblMonthResource1"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="lblYear" runat="server" meta:resourcekey="lblYearResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:TextBox ID="txtDay" Text="00" Width="30px" runat="server" meta:resourcekey="txtDayResource1"
                                    MaxLength="2"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="lbl" SetFocusOnError="true" ValidationExpression="^([0]?[0-9]|[1][0-9]|[2][0-9]|[3][0-0])$"
                                    ControlToValidate="txtDay" runat="server" ErrorMessage="اليوم غير صحيح"></asp:RegularExpressionValidator>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtMonth" Text="00" Width="30px" runat="server" meta:resourcekey="txtMonthResource1"
                                    MaxLength="2"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" SetFocusOnError="true"
                                    ValidationExpression="^([0]?[0-9]|[1][0-1])$" ControlToValidate="txtMonth" runat="server"
                                    ErrorMessage="الشهر غير صحيحة"></asp:RegularExpressionValidator>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtYear" Text="00" Width="30px" runat="server" meta:resourcekey="txtYearResource1"
                                    MaxLength="2"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" SetFocusOnError="true"
                                    ValidationExpression="^([0]?[0-9]|[1][0-9]|[2][0-9]|[3][0-9]|[4][0-9]|[5][0-9]|[6][0-9]|[7][0-9]|[8][0-9])$"
                                    ControlToValidate="txtYear" runat="server" ErrorMessage="السنة غير صحيح"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="dropItem" EventName="SelectedIndexChanged" />
        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
