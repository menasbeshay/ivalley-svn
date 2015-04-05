<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="CareersContent.aspx.cs" Inherits="brotherssolidarity.Admin.CareersContent" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <asp:PlaceHolder ID="CreateEditCareerPlaceHolder" runat="server">
                <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-briefcase"></i>Add/Edit Career</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span10">
                            <table>
                                <tr>
                                    <td style="height: 42px">
                                        <asp:Label ID="lblCareerPosition" runat="server" Text="Career Position"></asp:Label>
                                    </td>
                                    <td style="height: 42px">
                                        <asp:TextBox ID="txtCareerPosition" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="CareerValGroup" runat="server" ID="RequiredCareerPos" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="txtCareerPosition"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCareerDescription" runat="server" Text="Career Description"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <FCKeditorV2:FCKeditor ID="uiFCKeditorArContent" runat="server" BasePath="~/modules/fckeditor/" SkinPath="skins/silver/" Width="780" Height="300">
                                        </FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnCreateCareer" runat="server" ValidationGroup="CareerValGroup" Text="Create Career" Width="130" CssClass="btn btn-success" style="margin-right:3px" OnClick="btnCreateCareer_Click" />
                                        <asp:Button ID="btnNewCareer" Visible="false" runat="server" Text="Cancel" Width="130" CssClass="btn btn-danger" OnClick="btnNewCareer_Click" />
                                    </td>
                                </tr>
                            </table>
                            <div class="clearfix" style="height: 15px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            </asp:PlaceHolder>


            <asp:PlaceHolder ID="CareerTablePlaceHolder" runat="server">
                <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-table"></i>Careers Table</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body" style="float:none; margin:0 auto; text-align:center;">
                    <div>
                        <asp:Button ID="BtnCreateNewCareer" runat="server" Text="Create New Career" OnClick="BtnCreateNewCareer_Click" CssClass="btn btn-primary" />
                    </div>
                    <div class="clearfix" style="height:15px"></div>

                    <asp:GridView HorizontalAlign="Center" ID="GrdCareers" runat="server" Width="80%" OnRowCommand="GrdCareers_RowCommand" AutoGenerateColumns="False" CellPadding="4" CssClass="fc-grid" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle HorizontalAlign="Center" BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField HeaderText="Career Position" DataField="PositionEn" />
                            <%--<asp:TemplateField HeaderText="Description" ItemStyle-Width="40%">
                                <ItemTemplate>
                                    <asp:Label ID="lblCareerDescription" runat="server" Text='<%# Server.HtmlDecode(Eval("Description").ToString())%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center" >
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkBtnEdit" runat="server" CommandArgument='<%# Eval("CareerID") %>' CommandName="EditCareer" CssClass="btn btn-primary">Edit</asp:LinkButton>
                                    <asp:LinkButton ID="LinkBtnDelete" runat="server" CommandArgument='<%# Eval("CareerID") %>' CssClass="btn btn-primary" OnClientClick="return confirm('Are you sure you want to delete this Career?')" CommandName="DeleteCareer">Delete</asp:LinkButton>
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
            </div>
            </asp:PlaceHolder>
        </div>
    </div>
</asp:Content>
