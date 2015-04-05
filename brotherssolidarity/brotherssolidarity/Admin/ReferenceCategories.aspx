<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="ReferenceCategories.aspx.cs" Inherits="brotherssolidarity.Admin.ReferenceCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-sitemap"></i>Reference Categories</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span8 col1">

                            <table style="width: 100%;" id="BranchesTable" runat="server" >
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="Label1" runat="server" Text="Category Name : "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:TextBox ID="TxtName" runat="server"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="BranValGroup" runat="server" ID="rquiredName" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="TxtName"></asp:RequiredFieldValidator>
                                    </td>

                                </tr>
                                
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="lblImagePath" runat="server" Text="Image Path :           "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:Panel runat="server" ID="pnlAddMode" Visible="true" >
                                        <asp:FileUpload runat="server" ID="UploadImg"></asp:FileUpload>
                                            </asp:Panel>
                                        <asp:Panel runat="server" ID="pnlEditMode" Visible="false">
                                            <asp:Image runat="server" ID="imgReferenceCategory" Height="150px" />
                                            &nbsp;&nbsp;
                                            <asp:Button ID="btnDeleteImage" OnClick="btnDeleteImage_Click" runat="server" Text="Delete Image" CssClass="btn btn-danger" />
                                        </asp:Panel>

                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="BranValGroup" runat="server" ID="RequiredUploadImg" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="UploadImg"></asp:RequiredFieldValidator>
                                    </td>

                                </tr>
                               
                                <tr>
                                    <td colspan="3">
                                        <asp:Button ID="SaveCategory" runat="server" OnClick="SaveCategory_Click" ValidationGroup="BranValGroup" Text="Save Ctegory"  CssClass="btn btn-success fix-margin" />
                                        <asp:Button ID="BtnCancel" runat="server" OnClick="BtnCancel_Click" Text="Cancel" CssClass="btn btn-danger" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                       
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                           
                            <div class="clearfix" style="height: 15px"></div>

                            <asp:GridView ID="GrdCtegories" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="grid"
                                HorizontalAlign="Center" Width="80%"  ForeColor="#333333" OnRowCommand="GrdCtegories_RowCommand" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField HeaderText="Category Name" ItemStyle-HorizontalAlign="Center" DataField="CatNameEn" />
                                    <asp:ImageField HeaderText="Category Image" ItemStyle-HorizontalAlign="Center" DataImageUrlField="RefernceImagePath" />

                                    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="btnDeleteGrd" OnClientClick="return confirm('Are you sure you want to delete this Category ?')" CommandName="Delete" CssClass="btn btn-danger" runat="server" CommandArgument='<%# Eval("RefrenceCategoryID") %>' >Delete</asp:LinkButton>
                                            <asp:LinkButton ID="btnEditGrd" runat="server" CommandArgument='<%# Eval ("RefrenceCategoryID") %>' CommandName="Edit" CssClass="btn btn-primary">Edit</asp:LinkButton>
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
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
