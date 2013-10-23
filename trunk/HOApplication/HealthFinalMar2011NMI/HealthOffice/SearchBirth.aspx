<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="SearchBirth.aspx.cs" Inherits="SearchBirth" %>

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
                            <asp:Label runat="server" ID="lblFatherNID" Text="����� ������ ����"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtFatherNID" MaxLength="14" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblMotherNID" Text="����� ������ ������"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtInformerNID" MaxLength="14" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label1" Text="��� ������"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="drpRegestierNoList" Width="165px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table dir="rtl">
                    
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label3" Text="��� �����"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" MaxLength="20" ID="txtRegNo" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                    <td> <asp:Label runat="server" ID="Label4" Text="����� ������� �� ������ ��" Font-Bold="true"></asp:Label></td>
                    <td><asp:TextBox runat="server" ID="txtDateFrom" Width="160px" ></asp:TextBox>
                    <ajaxToolkit:CalendarExtender Format="yyyy/MM/dd"  CssClass="custom-calendar" TargetControlID="txtDateFrom" ID="dateExtender1" runat="server" Animated="true"></ajaxToolkit:CalendarExtender>
                     </td>
                    </tr>
                     <tr>
                    <td align="left"> <asp:Label runat="server" ID="Label5" Text="���" Font-Bold="true"></asp:Label></td>
                    <td><asp:TextBox runat="server" ID="txtDateTo" Width="160px" ></asp:TextBox>
                    <ajaxToolkit:CalendarExtender Format="yyyy/MM/dd" CssClass="custom-calendar" TargetControlID="txtDateTo" ID="CalendarExtender1" runat="server" Animated="true"></ajaxToolkit:CalendarExtender>
                     </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button runat="server" ID="btnFilter" Text="�������" 
                    onclick="btnFilter_Click" Font-Bold="True" />
            </td>
        </tr>
    </table>
    <table dir="rtl" width="100%">
        <tr>
            <td>
                <asp:GridView runat="server" ID="grdBorns" AllowPaging="True" PageSize="15" OnRowDataBound="grdBorns_RowDataBound"
                    EmptyDataText="�� ���� ������ ����� " AutoGenerateColumns="False" OnPageIndexChanging="grdBorns_PageIndexChanging"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3">
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:TemplateField HeaderText="��� �������">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkBornName" OnClick="lnkBornName_Click" Text='<%#Eval("BornName") %>'
                                    CommandArgument='<%#Eval("BornEventID") %>' CommandName='<%#Eval("Approved") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="��� ���� " DataField="FirstFatherName" />
                        <asp:BoundField HeaderText="����� ������ ���� " DataField="FatherNID" />
                        <asp:BoundField HeaderText="����� ������� " DataFormatString="{0:dd-MM-yyyy}" DataField="BirthDate" />
                        <asp:BoundField DataField="RegisterDate" DataFormatString="{0:dd-MM-yyyy}" 
                            HeaderText="����� ����� " />
                        <asp:BoundField HeaderText="��� ������ " DataField="InformerFirstName" />
                        <asp:BoundField HeaderText="����� ������ ������" DataField="InformerNID" />
                        <asp:TemplateField HeaderText="���� / ��� ����">
                            <ItemTemplate>
                                <asp:Label ID="lblApproved" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="�����">
                        <ItemTemplate>
                            <input id="Button1" type="button" value="�����" onclick='javascript:window.open("Print.aspx?Born=1&Dead=0&BornEventID=<%#Eval("BornEventID") %>")' />
                        </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
