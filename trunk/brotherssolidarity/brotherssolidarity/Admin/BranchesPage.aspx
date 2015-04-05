<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="BranchesPage.aspx.cs" Inherits="brotherssolidarity.Admin.BranchesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-sitemap"></i>Branches Page</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span8 col1">

                            <table style="width: 100%;" id="BranchesTable" runat="server" visible="false">
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
                                        <asp:Label ID="lblAddress" runat="server" Text="Address : "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:TextBox ID="TxtAddress" runat="server"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="BranValGroup" runat="server" ID="RequiredAddress" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="TxtAddress"></asp:RequiredFieldValidator>
                                    </td>


                                </tr>
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="lblTelephone" runat="server" Text="Telephone : "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:TextBox ID="TxtTelephone" runat="server"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="BranValGroup" runat="server" ID="RequiredTelephone" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="TxtTelephone"></asp:RequiredFieldValidator>
                                    </td>


                                </tr>
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="lblMangerName" runat="server" Text="Manger Name : "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:TextBox ID="TxtManagerName" runat="server"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="BranValGroup" runat="server" ID="RequiredManName" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="TxtManagerName"></asp:RequiredFieldValidator>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="lblDurationHour" runat="server" Text="Duration Hour : "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:TextBox ID="TxtDurationHour" runat="server"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="BranValGroup" runat="server" ID="RequiredDurHours" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="TxtDurationHour"></asp:RequiredFieldValidator>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="lblImagePath" runat="server" Text="Image Path :           "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:FileUpload runat="server" ID="UploadImg"></asp:FileUpload></td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="BranValGroup" runat="server" ID="RequiredUploadImg" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="UploadImg"></asp:RequiredFieldValidator>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="lblGoogleMapLink" runat="server" Text="Google Map Link : "></asp:Label></td>
                                    <td style="width: 229px">
                                        <asp:TextBox ID="TxtGoogleLink"  runat="server"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="BranValGroup" runat="server" ID="RequiredGoogleLink" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="TxtGoogleLink"></asp:RequiredFieldValidator>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Button ID="SaveBranch" runat="server" ValidationGroup="BranValGroup" Text="Create Branch" OnClick="SaveBranch_Click" CssClass="btn btn-success fix-margin" />
                                        <asp:Button ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" CssClass="btn btn-danger" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="span4 col2">
                            <img id="BranchImg" runat="server" src="#" width="200" height="200" />
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <div style="float: none; margin: 0 auto; text-align: center;">
                                <asp:Button ID="BtnNewBranches" runat="server" Text="Create New Branch" OnClick="BtnNewBranches_Click" CssClass="btn btn-primary" />
                            </div>

                            <div class="clearfix" style="height: 15px"></div>

                            <asp:GridView ID="GrdBranches" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="grid"
                                HorizontalAlign="Center" Width="80%" OnRowCommand="GrdBranches_RowCommand" OnSelectedIndexChanged="GrdBranches_SelectedIndexChanged" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField HeaderText="Name" ItemStyle-HorizontalAlign="Center" DataField="BranchName" />
                                    <asp:BoundField HeaderText="Address" ItemStyle-HorizontalAlign="Center" DataField="BranchAddress" />
                                    <asp:BoundField HeaderText="Manager Name" ItemStyle-HorizontalAlign="Center" DataField="ManagerName" />

                                    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="btnDeleteGrd" OnClientClick="return confirm('Are you sure you want to delete this Branch ?')" CssClass="btn btn-primary" runat="server" CommandArgument='<%# Eval("BranchID") %>' CommandName="DeleteGrd">Delete</asp:LinkButton>
                                            <asp:LinkButton ID="btnEditGrd" runat="server" CommandArgument='<%# Eval ("BranchID") %>' CommandName="EditGrd" CssClass="btn btn-primary">Edit</asp:LinkButton>
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




