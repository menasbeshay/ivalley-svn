<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="SearchDeath.aspx.cs" Inherits="SearchDeath"  %>

<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table cellspacing="5" cellpadding="5" width="100%">
        <tr>
            <td valign="top">
                <table dir="rtl">
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblFatherNID" Text="ÇáÑÞã ÇáÞæãì ááãÊæÝì"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtDeadNID" MaxLength="14" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblMotherNID" Text="ÇÓã ÇáãÊæÝì"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtDeadName" MaxLength="30" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table dir="rtl">
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label2" Text="ÇáÑÞã ÇáÞæãì ááãÈáÛ"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtInformerNID" MaxLength="14" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label4" Text="ÊÇÑíÎ ÇáæÝÇå Ýì ÇáÝÊÑÉ ãä" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtDateFrom" Width="160px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender Format="yyyy/MM/dd" CssClass="custom-calendar" TargetControlID="txtDateFrom" ID="dateExtender1"
                                runat="server" Animated="true">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Label runat="server" ID="Label5" Text="Çáì" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtDateTo" Width="160px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender CssClass="custom-calendar" Format="yyyy/MM/dd" TargetControlID="txtDateTo" ID="CalendarExtender1"
                                runat="server" Animated="true">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button runat="server" ID="btnFilter" Text="ÈÍÜÜÜÜË" OnClick="btnFilter_Click"
                    Font-Bold="True" />
            </td>
        </tr>
    </table>
    <table dir="rtl" width="100%">
        <tr>
            <td>
                <asp:GridView runat="server" Width="100%" ID="grdDead" AllowPaging="True" 
                    PageSize="15" OnRowDataBound="grdDead_RowDataBound" EmptyDataText="áÇ íæÌÏ ÈíÇäÇÊ ãÊÇÍÉ "
                    AutoGenerateColumns="False" 
                    onpageindexchanging="grdDead_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="ÇÓã ÇáãÊæÝì">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkDeadName" OnClick="lnkDeadName_Click" Text='<%#Eval("DeadFullName") %>'
                                    CommandArgument='<%#Eval("DeadEventID") %>' CommandName='<%#Eval("Approved") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle CssClass="grdcolumnDeadNAmeWidth" />
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="ÇáÑÞã ÇáÞæãì ááãÊæÝì"   DataField="DeadNID" />
                        <asp:BoundField HeaderText="ÊÇÑíÎ ÇáæÝÇÉ " DataFormatString="{0:d}" DataField="DeadDieDate" />
                         <asp:BoundField HeaderText="ÊÇÑíÎ ÇáÞíÏ" DataFormatString="{0:d}" DataField="RegisterDate" />
                        <asp:BoundField HeaderText="ÇÓã ÇáãÈáÛ " 
                            ItemStyle-CssClass="grdcolumnInformerNAmeWidth" DataField="InformerName" >
<ItemStyle CssClass="grdcolumnInformerNAmeWidth"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="ÇáÑÞã ÇáÞæãì ááãÈáÛ" DataField="InformerNID" />
                         <asp:TemplateField HeaderText="ãæËÞ / ÛíÑ ãæËÞ">
                            <ItemTemplate>
                                <asp:Label ID="lblApproved" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ØÈÇÚÉ">
                        <ItemTemplate>
                            <input id="Button1" type="button" value="ØÈÇÚÉ" onclick="javascript:window.open('Print.aspx?Born=0&Dead=1&DeadEventID=<%#Eval("DeadEventID") %>')" />
                        </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
