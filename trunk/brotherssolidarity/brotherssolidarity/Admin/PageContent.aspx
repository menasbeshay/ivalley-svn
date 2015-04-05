<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="PageContent.aspx.cs" Inherits="brotherssolidarity.PageContent" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-paper-clip"></i>Pages Content</h4>
                    <span class="tools"></span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                            <asp:Panel ID="uiPanelCurrentPages" runat="server" Visible="true">
                                <div>
                                    <asp:GridView ID="uiGridViewPages" runat="server" AutoGenerateColumns="False"
                                        CellPadding="6" OnRowCommand="uiGridViewPages_RowCommand"
                                        HorizontalAlign="Center" Width="80%" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle HorizontalAlign="Center" BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Page Title" DataField="TitleEn" ItemStyle-Width="70%" />
                                            <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30%">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("PageID") %>' CommandName="EditPage" CssClass="btn btn-primary">Edit</asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="uiPanelCurrent" runat="server" Visible="false">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPageTitle" runat="server" Text="Page Title"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPageTitle" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPageContent" runat="server" Text="Page Content"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div style="float: left; width: 780px; height: 300px;">
                                                <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="~/modules/fckeditor/" SkinPath="skins/silver/" Width="780" Height="300">
                                                </FCKeditorV2:FCKeditor>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="RowImg" runat="server" visible="false">
                                        <td>
                                            <asp:Label ID="lblPageImg" runat="server" Text="Background Image"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUploadPageImg" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="clearfix" style="height:15px"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnSaveContent" style="margin-right:1px" runat="server" Text="Save" OnClick="btnSaveContent_Click" CssClass="btn btn-success" />
                                            <asp:Button ID="btnCancel" runat="server" Text="<< Back to Pages" OnClick="btnCancel_Click" CssClass="btn btn-danger" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
