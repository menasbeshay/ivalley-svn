<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SocialLinkList.aspx.cs" Inherits="Web.UI.AdminPanel.MainPages.SocialLinkList" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CPH" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <%--                    <h3 class="panel-title"><strong><%= Web.UI.AdminPanel.MasterPages.Admin.PageTitle %></strong></h3>--%>

                    <%--     <div id="divMsg" runat="server" class="col-md-6">   
                        <asp:Literal Text="text" runat="server" />

                    </div>--%>
                    <div style="float: right;">
                        <a class="btn btn-blue" href="~/AdminPanel/MainPages/SocialLinkManagement.aspx" runat="server">AddNew...</a>


                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN FORM WIZARD WITH VALIDATION -->
                            <div>
                                <div class="form-group col-md-4">
                                    <label for="userName">Choose Social Link Type :</label>
                                    <asp:DropDownList ID="ddlSocialLinkType" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <%--<input id="userName" name="userName" type="text" class="form-control required">--%>
                                </div>
                            <div>
                                <div class="form-group">

                                    <div>
                                        <asp:GridView ID="grdData" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" allowmultirowselection="True" OnRowCommand="grdData_RowCommand" OnRowDataBound="grdData_RowDataBound">
                                            <Columns>
                                                <asp:BoundField DataField="SocialLinkTitle" HeaderText="Social Link Title" SortExpression="SocialLinkTitle">
                                                    <HeaderStyle Width="85%" />
                                                    <ItemStyle Width="85%" />
                                                </asp:BoundField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgInfo" CssClass="grdimgicon" title='<%# Data.Extensions.GeneralMethods.GetRecordInfo(Eval("CreatedOn").ToString(),Eval("CreatedBy").ToString(),Eval("ModifiedOn").ToString(),Eval("ModifiedBy").ToString()) %>'
                                                            ImageUrl="../assets/img/info.png" runat="server" />
                                                        <asp:ImageButton ID="imgRestore" runat="server" CssClass="grdimgicon tip_right_top"
                                                            class="tip_right_top" ImageUrl="~/System/Backend/lib/img/Restor.png" CommandName="restoreitem"
                                                            CommandArgument='<%# Eval("Id") %>' BorderColor="Transparent" Visible='<%# Data.Extensions.GeneralMethods.DeleteRestorVisible(Eval("Active"),"true") %>'
                                                            ToolTip="Restore Item"></asp:ImageButton>
                                                        <asp:ImageButton ID="imgDelete" runat="server" CssClass="grdimgicon" ImageUrl="../assets/img/delete.png"
                                                            CommandName="deleteitem" CommandArgument='<%# Eval("id") %>' OnClientClick="if(!confirm('Are you sure you want delete this?')) return false;"
                                                            Visible='<%# Data.Extensions.GeneralMethods.DeleteRestorVisible(Eval("Active"),"false") %>'
                                                            title="Delete Item"></asp:ImageButton>
                                                        <asp:HyperLink ID="imgEdit" runat="server" CssClass="grdimgicon" NavigateUrl='<%#"~/AdminPanel/MainPages/SocialLinkManagement.aspx?ID="+Eval("Id")%>'
                                                            ImageUrl="../assets/img/edit.png" title="Edit"></asp:HyperLink>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </div>

                                </div>


                            </div>
                            <!-- END FORM WIZARD WITH VALIDATION -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
</asp:Content>
