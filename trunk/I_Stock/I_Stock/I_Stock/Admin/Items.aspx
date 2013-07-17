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
                        <i class="icon-reorder"></i>لإضافة / تعديل الأصناف</h4>
                    <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                        class="icon-remove"></a></span>
                </div>
                <div class="widget-body">
                    <asp:Panel ID="uipanelError" runat="server">
                        <div class="alert alert-error">
                            <button class="close" data-dismiss="alert">
                                ×</button>
                            <strong>خطأ!</strong> حدث خطأ. لم يتم الحذف. 
                        </div>
                    </asp:Panel>
                    <div class="clearfix">
                    </div>
                    <div class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label">
                                الأسم</label>
                            <div class="controls">
                                <asp:TextBox ID="uiTextBoxName" runat="server" CssClass="input-xxlarge"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="span12">
                                <label class="control-label">
                                    كود الصنف</label>
                                <div class="controls">
                                    <asp:TextBox ID="uiTextBoxCode" runat="server" CssClass="input-xxlarge"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="span12">
                                <label class="control-label">
                                    الوصف</label>
                                <div class="controls">
                                    <asp:TextBox ID="uiTextBoxDesc" runat="server" CssClass="input-xxlarge" TextMode="MultiLine" Rows="10"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="span12">
                                <label class="control-label">
                                    الكمية</label>
                                <div class="controls">
                                    <asp:TextBox ID="uiTextBoxQty" runat="server" CssClass="input-xxlarge"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="span12">
                                <label class="control-label">
                                    حد الطلب</label>
                                <div class="controls">
                                    <asp:TextBox ID="uiTextBoxReOrderLevel" runat="server" CssClass="input-xxlarge"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-actions">
                        <asp:Panel ID="uiPanelActions" runat="server" Visible="false">
                        
                            <div style="float:left;width:55%">
                                <asp:HyperLink runat="server" CssClass="btn btn-primary" ID="uiHyperLinkPrices" NavigateUrl="#Pricesmodal"
                                    data-toggle="modal">
                                <i class="icon-tag"></i> أسعار الصنف</asp:HyperLink>
                               
                            </div>
                        </asp:Panel>
                            <div style="float:right;">
                            <asp:LinkButton runat="server" CssClass="btn btn-success" ID="uiLinkButtonOK" 
                                onclick="uiLinkButtonOK_Click">
                                <i class="icon-ok"></i> حفظ</asp:LinkButton>
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn blue" OnClick="uiLinkButtonCancel_Click"><i class='icon-remove'></i> إلغاء</asp:LinkButton>
                            </div>
                            <div style="float: right; margin-right: -300px;">
                                <asp:LinkButton ID="uiLinkButtonBack" runat="server" CssClass="btn blue" OnClick="uiLinkButtonBack_Click"><i class='icon-arrow-right'></i> العودة للأصناف</asp:LinkButton>
                            </div>
                            
                        </div>
                    </div>
                    <!-- modals -->

                    <!-- prices -->
                    <div id="Pricesmodal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel1"
                        aria-hidden="true">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                ×</button>
                            <h3 id="myModalLabel1">
                                إضافة / تعديل أسعار الصنف</h3>
                        </div>
                        <div class="modal-body">
                            <asp:UpdatePanel ID="uiUpdatePanelPrices" runat="server">
                                <ContentTemplate>
                                    <div class="form-horizontal">
                                        <div class="control-group">
                                            <label class="control-label">
                                                قطاع العميل</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:DropDownList ID="uiDropDownListClientTypes" runat="server" AutoPostBack="true" CssClass="input-large">
                                                    </asp:DropDownList>                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">
                                                السعر</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:TextBox ID="uiTextBoxPrice" runat="server" CssClass="input-large">
                                                    </asp:TextBox>
                                                    &nbsp;
                                                    <asp:LinkButton ID="uiLinkButtonAddPrice" runat="server" CssClass="btn blue" OnClick="uiLinkButtonAddPrice_Click"
                                                        Style="margin-right: 10px !important;"><i class='icon-plus'></i> إضافة سعر</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix" style="height: 20px;">
                                    </div>
                                    <asp:GridView ID="uiGridViewPrices" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        OnRowCommand="uiGridViewPrices_RowCommand" 
                                        CssClass="table table-striped table-bordered" Width="90%">
                                        <Columns>
                                            <asp:BoundField DataField="Price" HeaderText="السعر" ItemStyle-Width="33%" />
                                            <asp:BoundField DataField="TypeName" HeaderText="قطاع العميل" ItemStyle-Width="33%" />                                            
                                            <asp:TemplateField HeaderText="إجراءات" ItemStyle-Width="20%">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ClientTypeID") %>'
                                                        CssClass="btn blue" CommandName="DeletePrice" OnClientClick="return confirm('هل تريد حذف هذا السجل ؟');"><i class='icon-remove'></i> حذف</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">
                                    إلغاء</button>
                                <asp:LinkButton ID="uiLinkButtonUpdatePrices" runat="server" class="btn btn-primary"
                                    OnClick="uiLinkButtonUpdatePrices_Click">
                                    إغلاق وتحديث</asp:LinkButton>
                            </div>
                        </div>
                    </div>

                   
                    <!-- end modals -->
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
                        <i class="icon-reorder"></i>الأصناف</h4>
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
                                    <asp:DropDownList ID="uiDropDownListCats" runat="server" CssClass="input-xxlarge"
                                        AutoPostBack="True" OnSelectedIndexChanged="uiDropDownListCats_SelectedIndexChanged">
                                    </asp:DropDownList>                                    
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="span12">
                                <label class="control-label">
                                    المجموعة</label>
                                <div class="controls">
                                    <asp:DropDownList ID="uiDropDownListGroup" runat="server" CssClass="input-xxlarge" AutoPostBack="True"
                                        OnSelectedIndexChanged="uiDropDownListGroup_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn blue" OnClick="uiLinkButtonAdd_Click" Enabled="false"><i class='icon-plus'></i> إضافة صنف جديد</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                        <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiLinkButtonSearch">
                            <div class="span12">
                                <label class="control-label">
                                    بحث</label>
                                <div class="controls">
                                    <asp:TextBox ID="uiTextBoxSearch" runat="server" CssClass="input-xxlarge" 
                                        Width="515px"></asp:TextBox>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonSearch" runat="server" CssClass="btn blue" OnClick="uiLinkButtonSearch_Click"><i class='icon-search'></i> بحث</asp:LinkButton>
                                </div>
                            </div>
                        </asp:Panel>
                        </div>
                    </div>

                    <asp:GridView ID="uiGridViewItems" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" onpageindexchanging="uiGridViewItems_PageIndexChanging" 
                        onrowcommand="uiGridViewItems_RowCommand" Width="90%" 
                        CssClass="table table-striped table-bordered">
                        <AlternatingRowStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="Name"  HeaderText="الإسم" ItemStyle-Width="33%"/>
                            <asp:BoundField DataField="ItemCode" HeaderText="كود الصنف" ItemStyle-Width="20%" />
                            <asp:TemplateField HeaderText="إجراءات" ItemStyle-Width="20%">
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
