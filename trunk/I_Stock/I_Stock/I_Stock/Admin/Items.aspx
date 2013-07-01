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
                        AutoGenerateColumns="False" onpageindexchanging="uiGridViewItems_PageIndexChanging" 
                        onrowcommand="uiGridViewItems_RowCommand" Width="90%" 
                        CssClass="table table-striped table-bordered">
                        <AlternatingRowStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="Name"  HeaderText="الإسم"/>
                            <asp:BoundField DataField="ItemCode" HeaderText="كود الصنف" />
                            <asp:TemplateField HeaderText="إجراءات">
                                <ItemTemplate>
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ItemID") %>'
                                        CssClass="btn blue" CommandName="EditItem" ><i class='icon-edit'></i> تعديل</asp:LinkButton>&nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ItemID") %>'
                                        CssClass="btn blue" CommandName="DeleteItem" OnClientClick="return confirm('هل تريد حذف هذا السجل؟');"
                                        ><i class='icon-remove'></i> حذف</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
            <!-- END BORDERED TABLE widget-->
        </div>
    </div>
    </asp:Panel>

</asp:Content>
