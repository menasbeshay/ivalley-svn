<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="brotherssolidarity.Admin.Services" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-cog"></i>Services</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span10">
                            <asp:PlaceHolder ID="placeHolderGrdView" runat="server">
                                <div style="text-align:center">
                                    <asp:Button ID="btnCreateService" runat="server" Text="Create New Service" CssClass="btn btn-primary" OnClick="btnCreateService_Click" />
                                </div>
                                <div class="clearfix" style="height: 20px"></div>
                                <asp:GridView ID="GrdViewServices" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Service Name" ItemStyle-HorizontalAlign="Center" DataField="NameEn">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:ImageField HeaderText="Service Main Image" DataImageUrlField="MainImagePath" ControlStyle-Height="100px" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:ImageField>
                                        <asp:TemplateField HeaderText="Actions">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkBtnEdit" CssClass="btn btn-primary" OnClick="LinkBtnEdit_Click" CommandArgument='<%# Eval("ServiceID") %>' runat="server">Edit</asp:LinkButton>
                                                <asp:LinkButton ID="LinkBtnDelete" CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete this Service?')" OnClick="LinkBtnDelete_Click" CommandArgument='<%# Eval("ServiceID") %>' runat="server">Delete</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="placeHolderEditServ" runat="server">
                                <div class="row-fluid">
                                    <div class="span12">
                                        <div class="span8">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblServiceName" runat="server" Text="Service Name"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtServiceName" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Bold="true" ValidationGroup="ServValGroup" ControlToValidate="txtServiceName">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblServiceDesc" runat="server" Text="Service Description"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtServiceDesc" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Font-Bold="true" ValidationGroup="ServValGroup" ControlToValidate="txtServiceDesc">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblFileUploadMain" runat="server" Text="Main Image"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUploadMainImage" runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" Font-Bold="true" ValidationGroup="ServValGroup" ControlToValidate="FileUploadMainImage">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblFileUploadInternal" runat="server" Text="Internal Image"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUploadInternalImage" runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" Font-Bold="true" ValidationGroup="ServValGroup" ControlToValidate="FileUploadInternalImage">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblIsActive" runat="server" Text="Is Active"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkIsActive" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="clearfix" style="height:15px"></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:Button ID="BtnSave" ValidationGroup="ServValGroup" OnClick="BtnSave_Click" runat="server" Text="Create Service" Style="margin-right: 5px" CssClass="btn btn-success" />
                                                        <asp:Button ID="BtnCancel" OnClick="BtnCancel_Click" runat="server" Text="<< Back To List" CssClass="btn btn-danger" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="span4">
                                            <img id="imgMainImage" src="~/Admin/Images/no-image.png" runat="server"  width="150" />
                                            <div class="clearfix" style="height: 20px"></div>
                                            <img id="imgInternalImage" src="~/Admin/Images/no-image.png" runat="server"  width="150" />
                                        </div>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
