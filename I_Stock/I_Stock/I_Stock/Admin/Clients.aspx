<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/IStock.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="I_Stock.Admin.Clients" %>

<%@ MasterType VirtualPath="~/Masterpages/IStock.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelEditClients" runat="server" DefaultButton="uiLinkButtonOK">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            <i class="icon-reorder"></i>إضافة / تعديل العملاء</h4>
                        <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                            class="icon-remove"></a></span>
                    </div>
                    <div class="widget-body form">                        
                        <div class="clearfix">
                        </div>
                        <div class="form-horizontal">
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
                                        قطاع العميل</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="uiDropDownListClientTypes" runat="server" CssClass="input-xxlarge">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="control-group">
                                <div class="span12">
                                    <label class="control-label">
                                        المدينة</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="uiDropDownListCities" runat="server" CssClass="input-xxlarge">
                                        </asp:DropDownList>
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
                            <div class="control-group">
                                <div class="span12">
                                    <label class="control-label">
                                        العنوان</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxAddress" runat="server" CssClass="input-xxlarge" TextMode="MultiLine"
                                            Rows="5"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="span12">
                                    <label class="control-label">
                                        التليفون</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxTele" runat="server" CssClass="input-xxlarge"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="span12">
                                    <label class="control-label">
                                        الرصيد</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxCredit" runat="server" CssClass="input-xxlarge" data-validation-engine="validate[custom[number]]"></asp:TextBox>
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
                                <asp:LinkButton ID="uiLinkButtonBack" runat="server" CssClass="btn blue" OnClick="uiLinkButtonBack_Click"><i class='icon-arrow-left'></i> العودة إلى العملاء</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelAllClients" runat="server">
        <div class="row-fluid">
            <div class="span12">
                <!-- BEGIN BORDERED TABLE widget-->
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            <i class="icon-reorder"></i>العملاء</h4>
                        <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                            class="icon-remove"></a></span>
                    </div>
                    <div class="widget-body">
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn blue" OnClick="uiLinkButtonAdd_Click"><i class='icon-plus'></i> إضافة عميل جديد</asp:LinkButton>
                           &nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonAllClientsCredits" runat="server" CssClass="btn blue"
                                            OnClick="uiLinkButtonAllClientsCredits_Click"><i class='icon-bar-chart'></i> مديونيات جميع العملاء</asp:LinkButton>
                              <div class="clearfix" style="height: 20px;">
                        </div>
                        <asp:GridView ID="uiGridViewClients" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" GridLines="None" OnPageIndexChanging="uiGridViewClients_PageIndexChanging"
                            OnRowCommand="uiGridViewClients_RowCommand" Width="90%" CssClass="table table-striped table-bordered">
                            <AlternatingRowStyle HorizontalAlign="Center" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="الأسم" ControlStyle-Width="30%" />
                                <asp:BoundField DataField="ClientTypeName" HeaderText="قطاع العميل" ControlStyle-Width="30%"/>
                                <asp:TemplateField HeaderText="إجراءات">
                                <ItemStyle Width="30%" />
                                    <ItemTemplate>
                                    <asp:LinkButton ID="uiLinkButtonGetCredit" runat="server" CommandArgument='<%# Eval("ClientID") %>'
                                        CssClass="btn blue" style="width:113px;" CommandName="GetClientCredit"><i class='icon-bar-chart'></i> مراجعة المديونيات</asp:LinkButton>
                                        <div class="clearfix" style="height:3px"></div>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ClientID") %>'
                                            CssClass="btn blue" CommandName="EditClient"><i class='icon-edit'></i> تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ClientID") %>'
                                            CssClass="btn blue" CommandName="DeleteClient" OnClientClick="return confirm('هل تريد حذف هذا السجل؟');"><i class='icon-remove'></i> حذف</asp:LinkButton>
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
