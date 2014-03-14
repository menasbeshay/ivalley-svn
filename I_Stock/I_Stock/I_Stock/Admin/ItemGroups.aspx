<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/IStock.Master" AutoEventWireup="true" CodeBehind="ItemGroups.aspx.cs" Inherits="I_Stock.Admin.ItemGroups" %>

<%@ MasterType VirtualPath="~/Masterpages/IStock.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelEditGroup" runat="server" DefaultButton="uiLinkButtonOK">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            <i class="icon-reorder"></i>إضافة / تعديل مجموعات الأصناف</h4>
                        <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                            class="icon-remove"></a></span>
                    </div>
                    <div class="widget-body form">
                        <asp:Panel ID="uipanelError" runat="server">
                            <div class="alert alert-error">
                                <button class="close" data-dismiss="alert">
                                    ×</button>
                                <strong>خطأ!</strong> حدث خطأ. لم يتم الحذف. تأكد أن هذه المجموعة لا يوجد عليها أى
                                أصناف قبل الحذف.
                            </div>
                        </asp:Panel>
                        <div class="clearfix">
                        </div>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <div class="span12">
                                    <label class="control-label">
                                        التصنيف</label>
                                    <div class="controls">
                                        <asp:Label ID="uiLabelCat" runat="server" ></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="span12">
                                    <label class="control-label">
                                        الإسم</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxName" runat="server" CssClass="input-xxlarge" data-validation-engine="validate[required]"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="span12">
                                    <label class="control-label">
                                        الوصف</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxDesc" runat="server" CssClass="input-xxlarge" TextMode="MultiLine"
                                            Rows="5"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <div style="float: right;">
                                <asp:Button ID="uiLinkButtonOK" runat="server" CssClass="btn btn-success" OnClick="uiLinkButtonOK_Click" Text="حفظ"> </asp:Button>
                                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn blue" OnClick="uiLinkButtonCancel_Click"><i class='icon-remove'></i> إلغاء</asp:LinkButton>
                            </div>
                            <div style="float: right; margin-right: -290px;">
                                <asp:LinkButton ID="uiLinkButtonBack" runat="server" CssClass="btn blue" OnClick="uiLinkButtonBack_Click"><i class='icon-arrow-left'></i> العودة إلى المجموعات</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelAllGroups" runat="server">
        <div class="row-fluid">
            <div class="span12">
                <!-- BEGIN BORDERED TABLE widget-->
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            <i class="icon-reorder"></i>المجموعات</h4>
                        <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                            class="icon-remove"></a></span>
                    </div>
                    <div class="widget-body">
                        <div class="form-horizontal">
                        <div class="control-group">
                            <div class="span12">
                                <label class="control-label">
                                    التصنيف</label>
                                <div class="controls">
                                    <asp:DropDownList ID="uiDropDownListCats" runat="server" 
                                        CssClass="input-xxlarge" AutoPostBack="True" 
                                        onselectedindexchanged="uiDropDownListCats_SelectedIndexChanged">
                                    </asp:DropDownList>

                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn blue" OnClick="uiLinkButtonAdd_Click"><i class='icon-plus'></i> إضافة مجموعة تصنيف جديد</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        </div>
                        
                        <div class="clearfix" style="height: 20px;">
                        </div>
                        <asp:GridView ID="uiGridViewGroups" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" GridLines="None" OnPageIndexChanging="uiGridViewGroups_PageIndexChanging"
                            OnRowCommand="uiGridViewGroups_RowCommand" Width="90%" 
                            CssClass="table table-striped table-bordered" 
                            onrowdatabound="uiGridViewGroups_RowDataBound">
                            <AlternatingRowStyle HorizontalAlign="Center" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="الأسم" />
                                <asp:TemplateField HeaderText="التصنيف" >
                                    <ItemTemplate>
                                        <asp:Label ID="uiLabelCat" runat="server" ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ItemGroupID") %>'
                                            CssClass="btn blue" CommandName="EditGroup"><i class='icon-edit'></i> تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ItemGroupID") %>'
                                            CssClass="btn blue" CommandName="DeleteGroup" OnClientClick="return confirm('هل تريد حذف هذا السجل؟');"><i class='icon-remove'></i> حذف</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="20%" />
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
