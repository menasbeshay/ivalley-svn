<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/IStock.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="I_Stock.Admin.Items" %>
<%@ MasterType VirtualPath="~/Masterpages/IStock.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelEditItems" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-reorder"></i>Add / Edit Courses</h4>
                    <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                        class="icon-remove"></a></span>
                </div>
                <div class="widget-body">
                    <div class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label">
                                Course name</label>
                            <div class="controls">
                                <input type="text" placeholder="name" class="input-large" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                                Course code</label>
                            <div class="controls">
                                <input type="text" placeholder="code" class="input-large" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                                Description</label>
                            <div class="controls">
                                <textarea class="input-large" rows="3" cols="50"></textarea>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                                Alert date period (days)</label>
                            <div class="controls">
                                <input type="text" placeholder=" period (days)" class="input-large" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                                Expiry date period (days)</label>
                            <div class="controls">
                                <input type="text" placeholder=" period (days)" class="input-large" />
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn blue">
                                <i class="icon-ok"></i>Save</button>
                            <button type="button" class="btn">
                                <i class=" icon-remove"></i>Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelAllItems" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <!-- BEGIN BORDERED TABLE widget-->
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-reorder"></i>Courses</h4>
                    <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                        class="icon-remove"></a></span>
                </div>
                <div class="widget-body">
                    <asp:GridView ID="uiGridViewItems" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" onpageindexchanging="uiGridViewItems_PageIndexChanging" 
                        onrowcommand="uiGridViewItems_RowCommand" Width="90%">
                        <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />

                        <Columns>
                            <asp:BoundField DataField="Name"  HeaderText="الإسم"/>
                            <asp:BoundField DataField="ItemCode" HeaderText="كود الصنف" />
                            <asp:TemplateField HeaderText="إجراءات">
                                <ItemTemplate>
                                    <asp:Button ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ItemID") %>'
                                        CssClass="btn blue" CommandName="EditItem" Text="تعديل"></asp:Button>&nbsp;
                                    <asp:Button ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ItemID") %>'
                                        CssClass="btn blue" CommandName="DeleteItem" OnClientClick="return confirm('هل تريد حذف هذا السجل?');"
                                        Text="حذف"></asp:Button>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <!-- END BORDERED TABLE widget-->
        </div>
    </div>
    </asp:Panel>

</asp:Content>
