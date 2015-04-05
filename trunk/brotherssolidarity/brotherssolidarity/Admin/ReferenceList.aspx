<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="ReferenceList.aspx.cs" Inherits="brotherssolidarity.Admin.ReferenceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-dashboard"></i>Projects</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                            <div style="margin: 0 auto; float:none;text-align:center;">
                                <asp:Button ID="btnCreateCollection" runat="server" Text="Create New Project" CssClass="btn btn-primary" OnClick="btnCreateCollection_Click" />
                            </div>

                            <div class="clearfix" style="height: 20px">
                            </div>
                            <asp:GridView HorizontalAlign="Center" ID="GrdReferences" runat="server" Width="80%" AllowPaging="true" PageSize="6" AutoGenerateColumns="False" CellPadding="4" CssClass="fc-grid" ForeColor="#333333" GridLines="Horizontal" OnPageIndexChanging="GrdReferences_PageIndexChanging">
                                <AlternatingRowStyle HorizontalAlign="Center" BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField HeaderText="Project Name" DataField="NameAr" />
                                     <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <img id="CollectionGrdImg" runat="server" src='<%#Eval("MainImagePath") %>' style="max-height:80px" />
                                        </ItemTemplate>
                                        <ControlStyle CssClass="actions"></ControlStyle>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                   
                                    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkBtnEdit" runat="server" CommandArgument='<%# Eval("ReferenceID") %>' OnClick="LinkBtnEdit_Click" CssClass="btn btn-primary">Edit</asp:LinkButton>
                                            <asp:LinkButton ID="LinkBtnDelete" runat="server" CommandArgument='<%# Eval("ReferenceID") %>' OnClientClick="return confirm('Are you sure you want to delete this record?')" CssClass="btn btn-danger" OnClick="LinkBtnDelete_Click">Delete</asp:LinkButton>
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
