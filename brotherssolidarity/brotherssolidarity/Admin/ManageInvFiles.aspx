<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="ManageInvFiles.aspx.cs" Inherits="brotherssolidarity.Admin.ManageInvFiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-envelope-alt"></i>Investors</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span10">
                            
                            <asp:Panel runat="server" ID="uiPanelAll">  
                                Category :  <asp:DropDownList ID="uiDropDownListAllCats" runat="server" OnSelectedIndexChanged="uiDropDownListAllCats_SelectedIndexChanged"></asp:DropDownList>
                                <div class="span10">
                                    <asp:GridView ID="uiGridViewFiles" runat="server" AllowPaging="True" OnPageIndexChanging="uiGridViewFiles_PageIndexChanging" OnRowCommand="uiGridViewFiles_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Name" />
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this Branch ?')" CssClass="btn btn-primary" CommandArgument='<%# Eval("InvestorFileID") %>' CommandName="DeleteGrd">Delete</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="uiPanelAdd">  
                            <table >
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="Label3" runat="server" Text="Category : "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:DropDownList ID="uiDropDownListCats" runat="server"></asp:DropDownList>
                                    <td>
                                        
                                    </td>

                                </tr>
                                 <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="Label1" runat="server" Text="Name : "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:TextBox ID="TxtName" runat="server"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="BranValGroup" runat="server" ID="rquiredName" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="TxtName"></asp:RequiredFieldValidator>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="lblImagePath" runat="server" Text="Word file  :           "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:FileUpload runat="server" ID="UploadWord"></asp:FileUpload></td>
                                    <td>
                                        
                                    </td>

                                </tr>
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="Label2" runat="server" Text="PDF file  :           "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:FileUpload runat="server" ID="UploadPDF"></asp:FileUpload></td>
                                    <td>
                                        
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Button ID="SaveBranch" runat="server" ValidationGroup="BranValGroup" Text="Add files" OnClick="SaveBranch_Click" CssClass="btn btn-success fix-margin" />
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

