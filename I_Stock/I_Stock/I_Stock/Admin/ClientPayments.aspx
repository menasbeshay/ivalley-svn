<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/IStock.Master" AutoEventWireup="true" CodeBehind="ClientPayments.aspx.cs" Inherits="I_Stock.Admin.ClientPayments" %>
<%@ MasterType VirtualPath="~/Masterpages/IStock.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelEditPayment" runat="server">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            <i class="icon-reorder"></i>إضافة / تعديل إيصال تحصيل</h4>
                        <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                            class="icon-remove"></a></span>
                    </div>
                    <div class="widget-body form">
                        <asp:Panel ID="uipanelError" runat="server" Visible="false">
                            <div class="alert alert-error">
                                <button class="close" data-dismiss="alert">
                                    ×</button>
                                <strong>خطأ!</strong> حدث خطأ. لم يتم الحذف.
                            </div>
                        </asp:Panel>
                        <div class="form-horizontal">
                            <div class="control-group">
                                <div class="span6">
                                    <label class="control-label">
                                        رقم الأمر
                                    </label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxCode" runat="server" CssClass="input-large" Enabled="False"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="span6">
                                    <label class="control-label">
                                        العميل</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="uiDropDownListClients" runat="server" CssClass="input-large"
                                            Width="250px" Style="width: 223px;">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">                                
                                <div class="span6">
                                    <label class="control-label">
                                        التاريخ</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxDate" runat="server" CssClass="input-large" data-validation-engine="validate[required]"></asp:TextBox>
                                        <asp:CalendarExtender ID="uiTextBoxDate_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="uiTextBoxDate" Format="dd/MM/yyyy">
                                        </asp:CalendarExtender>
                                    </div>
                                </div>
                                <div class="span6">
                                    <label class="control-label">
                                        الموظف</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="uiDropDownListEmployee" runat="server" CssClass="input-large"
                                            data-validation-engine="validate[requiredInFunction]" Width="225px">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="span6">
                                    <label class="control-label">
                                        القيمة</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxAmount" runat="server" CssClass="input-large" data-validation-engine="validate[required,custom[number]]"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="span6">
                                    <label class="control-label">
                                        نوع التحصيل</label>
                                    <div class="controls">
                                        <asp:RadioButtonList ID="uiRadioButtonListPaymentType" runat="server" Width="100%">
                                            <asp:ListItem Selected="True" Value="1">خصم نقدى</asp:ListItem>
                                            <asp:ListItem Value="2">خصم نظير بضاعة</asp:ListItem>
                                            <asp:ListItem Value="3">خصم فروق أسعار</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="span6">
                                    <label class="control-label">
                                        تأكيد الأمر </label>
                                    <div class="controls">
                                        <asp:LinkButton ID="uiLinkButtonConfirm" runat="server" 
                                            CssClass="btn btn-success" onclick="uiLinkButtonConfirm_Click" style="width:200px;height:30px;font-size:20px;padding-top:15px;"><i class="icon-check"></i>&nbsp;تأكيد الأمر</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-actions">
                            
                            <div style="float: right; margin-right: -180px;">
                                <asp:LinkButton ID="uiLinkButtonBack" runat="server" CssClass="btn blue" OnClick="uiLinkButtonBack_Click"><i class='icon-arrow-left'></i> عودة لإيصالات التحصيل</asp:LinkButton>
                            </div>
                            <div style="float: right;">
                                <asp:Button ID="uiLinkButtonOK" runat="server" CssClass="btn btn-success" OnClick="uiLinkButtonOK_Click"
                                    Text="حفظ"></asp:Button>
                                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn blue" OnClick="uiLinkButtonCancel_Click"><i class='icon-remove'></i> إلغاء</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelAllPayments" runat="server">
        <div class="row-fluid">
            <div class="span12">
                <!-- BEGIN BORDERED TABLE widget-->
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            إيصالات التحصيل</h4>
                        <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                            class="icon-remove"></a></span>
                    </div>
                    <div class="widget-body">
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn blue" OnClick="uiLinkButtonAdd_Click"><i class='icon-plus'></i> إضافة إيصال تحصيل</asp:LinkButton>
                        <div class="clearfix" style="height: 20px;">
                        </div>
                        <asp:GridView ID="uiGridViewPayments" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" GridLines="None" OnPageIndexChanging="uiGridViewPayments_PageIndexChanging"
                            OnRowCommand="uiGridViewPayments_RowCommand" Width="90%" 
                            CssClass="table table-striped table-bordered" 
                            onrowdatabound="uiGridViewPayments_RowDataBound">
                            <AlternatingRowStyle HorizontalAlign="Center" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="PaymentNo" HeaderText="رقم الأمر" />
                                <asp:BoundField DataField="PaymentDate" HeaderText="التاريخ" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="ClientName" HeaderText="العميل" />
                                <asp:CheckBoxField DataField="Confirmed" HeaderText="مؤكد" />
                                <asp:BoundField DataField="Amount" HeaderText="القيمة" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>    
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("PaymentID") %>'
                                            CssClass="btn blue" CommandName="EditPayment"><i class='icon-edit'></i> تعديل</asp:LinkButton>&nbsp;                                    
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("PaymentID") %>'
                                            CssClass="btn blue" CommandName="DeletePayment" OnClientClick="return confirm('هل تريد حذف هذا السجل ؟');"><i class='icon-remove'></i> حذف</asp:LinkButton>
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
