<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="RegisterLostBirth.aspx.cs" Inherits="RegisterLostBirth" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<%@ Register Src="UserControls/UcBornInfo.ascx" TagName="UcBornInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/UcParentInfo.ascx" TagName="UcParentInfo" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/UcNotifierInfo.ascx" TagName="UcNotifierInfo" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 102px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table dir="rtl" align="center">
        <tr>
            <td>
                <asp:Label ID="lblRegisterType" runat="server" 
                    meta:resourcekey="lblRegisterTypeResource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdTypeList" RepeatDirection="Horizontal" 
                    runat="server" meta:resourcekey="rdTypeListResource1">
                    <asp:ListItem meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource2"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <asp:Panel runat="server" Width="100%" ID="pnlbornInfo" Direction="RightToLeft" 
         meta:resourcekey="pnlbornInfoResource1"
        >
        <uc1:UcBornInfo ID="UcBornInfo1" runat="server" />
    </asp:Panel>
    <br />
    <asp:Panel runat="server" ID="pnlFatherInfo" Direction="RightToLeft" 
         meta:resourcekey="pnlFatherInfoResource1"
        >
        <div style="width: 100%">
            <uc2:UcParentInfo ID="UcFatherInfo2" runat="server" />
        </div>
    </asp:Panel>
    <br />
    <asp:Panel runat="server" ID="pnlMotherInfo" Direction="RightToLeft" 
         meta:resourcekey="pnlMotherInfoResource1"
        >
        <uc2:UcParentInfo ID="UcMotherInfo2" Type="Mother" runat="server" />
    </asp:Panel>
    <br />
    <asp:Panel runat="server" ID="pnlNotifier" Direction="RightToLeft" 
         meta:resourcekey="pnlNotifierResource1"
       >
        <uc3:UcNotifierInfo ID="UcNotifierInfo1" runat="server" />
    </asp:Panel>
    <br />
    <asp:Panel runat="server" ID="pnlSummary" Direction="RightToLeft" 
         meta:resourcekey="pnlSummaryResource1"
        >
        <table width="100%">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblHealthOffice" runat="server" 
                                    meta:resourcekey="lblHealthOfficeResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblHealthOfficeValue" runat="server" 
                                    meta:resourcekey="lblHealthOfficeValueResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblDecisionNumber" runat="server" 
                                    meta:resourcekey="lblDecisionNumberResource1"></asp:Label>
                            </td>
                            <td style="padding-right:30px;">
                                <asp:TextBox ID="txtDecisionNumber" runat="server" 
                                    meta:resourcekey="txtDecisionNumberResource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblDecisionDirection" runat="server" 
                                    meta:resourcekey="lblDecisionDirectionResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDecisionDirectionValue" runat="server" 
                                    meta:resourcekey="lblDecisionDirectionValueResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDecisionDirectionValue" runat="server" 
                                    meta:resourcekey="txtDecisionDirectionValueResource1"></asp:TextBox>
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
                                <asp:Label ID="lblDecisionDate" runat="server" 
                                    meta:resourcekey="lblDecisionDateResource1"></asp:Label>
                            </td>
                            <td style="padding-right:20px;">
                                <table border="1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDay" runat="server" meta:resourcekey="lblDayResource1"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblMonth" runat="server" meta:resourcekey="lblMonthResource1"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblYear" runat="server" meta:resourcekey="lblYearResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtDay" Width="50px" runat="server" 
                                                meta:resourcekey="txtDayResource1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMonth" Width="50px" runat="server" 
                                                meta:resourcekey="txtMonthResource1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtYear" Width="50px" runat="server" 
                                                meta:resourcekey="txtYearResource1"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblNotes" runat="server" meta:resourcekey="lblNotesResource1"></asp:Label>
                            </td>
                            <td style="padding-right:140px;">
                               <asp:TextBox ID="txtNotesValue" runat="server" 
                                    meta:resourcekey="txtNotesValueResource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <table dir="rtl" align="center">
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="btnAdd" Width="150px" Font-Size="Large" runat="server" meta:resourcekey="btnAddResource1" />
                
            </td>
        </tr>
    </table>
</asp:Content>
