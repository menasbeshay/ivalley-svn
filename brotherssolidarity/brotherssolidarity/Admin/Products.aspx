<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="brotherssolidarity.Admin.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-edit"></i>Manage Products</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                            <asp:PlaceHolder ID="PlaceHolderGrd" Visible="false" runat="server">
                                <div style="text-align: center">
                                    <h4>
                                        <asp:Label ID="lblCatNameTitle" runat="server" Text="CategoryName"></asp:Label>
                                    </h4>
                                    <asp:Button ID="btnBackToCats" runat="server" Text="<< Back To Categories" style="margin-right:5px" CssClass="btn btn-info" PostBackUrl="~/Admin/ManageProducts.aspx" />
                                    <asp:Button ID="btnCreateProduct" runat="server" Text="Create New Product" OnClick="btnCreateProduct_Click" CssClass="btn btn-primary" />
                                </div>
                                <div class="clearfix" style="height: 15px"></div>
                                <div style="margin: 0 auto; text-align: center; float: none">
                                    <asp:GridView ID="GrdViewProducts" runat="server" OnRowCommand="GrdViewProducts_RowCommand" AutoGenerateColumns="False" HorizontalAlign="Center" Width="80%" CellPadding="6" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Product Name" DataField="NameEn" ItemStyle-HorizontalAlign="Center">
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Product Image" FooterStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <img src='<%# Eval("MainImagePath") %>' width="125" />
                                                </ItemTemplate>

                                                <FooterStyle HorizontalAlign="Center"></FooterStyle>

                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Center" ItemStyle-Width="40%" HeaderText="Actions">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkBtnEdit" CssClass="btn btn-primary" CommandName="EditProduct" CommandArgument='<%# Eval("ProductID") %>' runat="server">Edit</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkBtnAddFiles" CssClass="btn btn-primary" CommandName="AddFiles" CommandArgument='<%# Eval("ProductID") %>' runat="server">Add Files</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkBtnAddImgs" CssClass="btn btn-primary" CommandName="AddImgs" CommandArgument='<%# Eval("ProductID") %>' runat="server">Add Images</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkBtnDelete" CssClass="btn btn-danger" CommandName="DeleteProduct" OnClientClick="return confirm('Are you sure you want to delete this Product?')" CommandArgument='<%# Eval("ProductID") %>' runat="server">Delete</asp:LinkButton>
                                                </ItemTemplate>

                                                <FooterStyle HorizontalAlign="Center"></FooterStyle>

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
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="PlaceHolderEditProd" Visible="false" runat="server">
                                <div class="span8">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCat" runat="server" Text="Product Category"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblCatName" runat="server" Text="Category Name"></asp:Label>                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblName" runat="server" Text="Product Name"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtProdName" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ControlToValidate="txtProdName" ValidationGroup="SaveProdValGroup" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblDesc" runat="server" Text="Product Description"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtProdDesc" TextMode="MultiLine" Rows="3" Wrap="true" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ControlToValidate="txtProdDesc" ValidationGroup="SaveProdValGroup" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblMainImg" runat="server" Text="Main Image"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:FileUpload ID="FileUploadMainImg" runat="server" />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ControlToValidate="FileUploadMainImg" ValidationGroup="SaveProdValGroup" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblVideoLink" runat="server" Text="Youtube Video Link"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtVidLink" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblAvailInHome" runat="server" Text="Available In Home"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkAvailHome" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblActive" runat="server" Text="Is Active"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkActive" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <div class="clearfix" style="height: 15px">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Button ID="BtnSaveProduct" OnClick="BtnSaveProduct_Click" CssClass="btn btn-success" Style="margin-right: 5px" ValidationGroup="SaveProdValGroup" runat="server" Text="Create Product" />
                                                <asp:Button ID="BtnCancel" CssClass="btn btn-danger" runat="server" OnClick="BtnCancel_Click" Text="Cancel" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="span4">
                                    <img id="ProdImg" runat="server" src="~/Admin/Images/no-image.png" alt="Image" height="200" width="200" />
                                </div>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="PlaceHolderFiles" Visible="false" runat="server">
                                <h4 style="color: black; font-weight: 600">Add Files</h4>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblFileName" runat="server" Text="File Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFileName" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtFileName" ValidationGroup="ProdFilesValGroup" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblFileDesc" runat="server" Text="File Description"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFileDesc" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUploadFile" runat="server" Text="Upload File"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUploadFile" runat="server" />
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="FileUploadFile" ValidationGroup="ProdFilesValGroup" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="clearfix" style="height: 15px"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Button ID="btnAddFile" OnClick="btnAddFile_Click" CssClass="btn btn-success" runat="server" ValidationGroup="ProdFilesValGroup" Text="Add File" Style="margin-right: 5px" />
                                            <asp:Button ID="btnCancel2" CssClass="btn btn-danger" OnClick="BtnCancel_Click" runat="server" Text="<< Back To Products" />
                                        </td>
                                    </tr>
                                </table>
                                <div class="clearfix" style="height: 20px"></div>
                                <asp:GridView ID="GrdViewFiles" runat="server" OnRowCommand="GrdViewFiles_RowCommand" AutoGenerateColumns="False" HorizontalAlign="Center" Width="80%" CellPadding="6" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField HeaderText="File Name" DataField="FileNameEn" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="File Description" DataField="FileDescriptionEn" ItemStyle-Width="50%" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>

                                        <asp:TemplateField FooterStyle-HorizontalAlign="Center" HeaderText="Actions">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkDeleteFile" CssClass="btn btn-danger" CommandName="DeleteFile" CommandArgument='<%# Eval("ProductFiles") %>' OnClientClick="return confirm('Are you sure you want to delete this File?')" runat="server">Delete</asp:LinkButton>
                                            </ItemTemplate>
                                            <FooterStyle HorizontalAlign="Center"></FooterStyle>
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
                            <asp:PlaceHolder ID="PlaceHolderImgs" Visible="false" runat="server">
                                <h4 style="color: black; font-weight: 600">Add Images</h4>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblProdImgName" runat="server" Text="Image Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtProdImgName" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtProdImgName" ValidationGroup="ProdImgsValGroup" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUploadImg" runat="server" Text="Upload Image"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUploadProdGalleryImg" runat="server" />
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="FileUploadProdGalleryImg" ValidationGroup="ProdImgsValGroup" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="clearfix" style="height: 15px"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Button ID="BtnSaveGalleryImg" OnClick="BtnSaveGalleryImg_Click" CssClass="btn btn-success" ValidationGroup="ProdImgsValGroup" runat="server" Text="Save Image" Style="margin-right: 5px" />
                                            <asp:Button ID="BtnCancel3" runat="server" CssClass="btn btn-danger" Text="<< Back To Products" OnClick="BtnCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <div class="clearfix" style="height: 20px"></div>
                                <asp:DataList ID="ProdImgsGallery" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="ProdImgsGallery_ItemCommand">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgBtnDeleteProdImg" runat="server" CommandArgument='<%# Eval("ProductImageID") %>' AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this Image?')" CommandName="DelteImg" ImageUrl="~/Images/action_delete.gif" ImageAlign="Middle" Style="float: right;" />
                                        <br />
                                        <a href='<%# Eval("ImagePath") %>'>
                                            <img src='<%# Eval("ImagePath") %>' alt="4" width="150" height="110" />
                                        </a>
                                    </ItemTemplate>
                                </asp:DataList>
                            </asp:PlaceHolder>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
