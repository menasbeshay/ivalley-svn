<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/IStock.Master" AutoEventWireup="true" CodeBehind="ClientReturns.aspx.cs" Inherits="I_Stock.Admin.ClientReturns" %>
<%@ MasterType VirtualPath="~/Masterpages/IStock.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            $("#<%= uiTextBoxItems.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "../modules/stockservice.asmx/GetItems",
                        dataType: "json",
                        type: "Post",
                        data: "{'query':'" + request.term.toString() + "','ClientId':'" + $("#<%= uiDropDownListClients.ClientID %> option:selected").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response(jQuery.map(data.d, function (item) {
                                return {
                                    val: item.split('##')[0],
                                    label: item.split('##')[1],
                                    price: item.split('##')[2]
                                }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest);
                        }
                    });

                },
                select: function (e, i) {
                    $("#<%=uiHiddenFieldCurrentItem.ClientID %>").val(i.item.val);
                    $("#<%=uiTextBoxPrice.ClientID %>").val(i.item.price);
                },
                minLength: 1
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelEditReturn" runat="server">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            <i class="icon-reorder"></i>إضافة / تعديل مردودات مبيعات</h4>
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
                                        الموظف</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="uiDropDownListEmployee" runat="server" CssClass="input-large"
                                            Width="225px">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="span6">
                                    <label class="control-label">
                                        العميل</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="uiDropDownListClients" runat="server" CssClass="input-large"
                                            Width="250px" Style="width: 223px;">
                                        </asp:DropDownList>
                                    </div>
                                </div>
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
                            </div>
                            <div class="control-group">
                                <div class="span6">
                                    <label class="control-label">
                                        الخصم</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxDiscount" runat="server" CssClass="input-large" data-validation-engine="validate[custom[number],min[0],max[100]]"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix" style="height: 20px;">
                        </div>
                        <asp:Panel ID="uiPanelItems" runat="server" GroupingText="الأصناف">
                            <asp:Panel ID="uiPanelErrorItems" runat="server" Visible="false">
                                <div class="alert alert-error">
                                    <button class="close" data-dismiss="alert">
                                        ×</button>
                                    <strong>خطأ!</strong> حدث خطأ. من فضك أعد المحاولة.
                                </div>
                            </asp:Panel>
                            <div class="form-horizontal">
                                <div class="control-group">
                                    <div class="span12">
                                        <label class="control-label">
                                            الصنف</label>
                                        <div class="controls">
                                            <asp:TextBox ID="uiTextBoxItems" runat="server" data-validation-engine="validate[required]"></asp:TextBox>

                                            <asp:DropDownList ID="uiDropDownListItems" runat="server" CssClass="input-large"
                                                Width="225px" AutoPostBack="True" OnSelectedIndexChanged="uiDropDownListItems_SelectedIndexChanged" style="display:none;">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="span12">
                                        <label class="control-label">
                                            السعر</label>
                                        <div class="controls">
                                            <asp:TextBox ID="uiTextBoxPrice" runat="server" CssClass="input-large" data-validation-engine="validate[required]"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="span12">
                                        <label class="control-label">
                                            الكمية</label>
                                        <div class="controls">
                                            <asp:TextBox ID="uiTextBoxQty" runat="server" CssClass="input-large" ClientIDMode="Static" data-validation-engine="validate[required,custom[integer],min[0]]"></asp:TextBox>                                                                                        
                                        </div>
                                    </div>
                                </div>
                                 <div class="control-group">
                                    <div class="span12">
                                        <label class="control-label">
                                            الكمية الصالحة</label>
                                        <div class="controls">
                                            <asp:TextBox ID="uiTextBoxValid" runat="server" CssClass="input-large" data-validation-engine="validate[required,custom[integer],min[0]]"></asp:TextBox>
                                            &nbsp;
                                            <asp:Button ID="uiLinkButtonAddItem" runat="server" CssClass="btn blue" OnClick="uiLinkButtonAddItem_Click" Text="إضافة صنف"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <asp:GridView ID="uiGridViewItems" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" GridLines="None" OnPageIndexChanging="uiGridViewItems_PageIndexChanging"
                                        OnRowCommand="uiGridViewItems_RowCommand" Width="90%" CssClass="table table-striped table-bordered">
                                        <AlternatingRowStyle HorizontalAlign="Center" />
                                        <FooterStyle Font-Bold="True" />
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField DataField="ItemName" HeaderText="الصنف" />
                                            <asp:BoundField DataField="ItemPrice" HeaderText="السعر" />
                                            <asp:BoundField DataField="Quantity" HeaderText="الكمية" />
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ReturnDetailID") %>'
                                                        CssClass="btn blue" CommandName="DeleteDetail" OnClientClick="return confirm('هل تريد حذف هذا السجل ؟');"><i class='icon-remove'></i> حذف</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="control-group">
                                    <div class="span12">
                                        <label class="control-label">
                                            الإجمالى</label>
                                        <div class="controls">
                                            <asp:TextBox ID="uiTextBoxTotal" runat="server" CssClass="input-large" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <div class="form-actions">
                            <div style="float: right; margin-right: -180px;">
                                <asp:LinkButton ID="uiLinkButtonBack" runat="server" CssClass="btn blue" OnClick="uiLinkButtonBack_Click"><i class='icon-arrow-left'></i> عودة لمردودات المبيعات</asp:LinkButton>
                            </div>
                            <div style="float: right;">
                                <asp:Button ID="uiLinkButtonOK" runat="server" CssClass="btn btn-success" OnClick="uiLinkButtonOK_Click"
                                    Text="حفظ"></asp:Button>
                                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn blue" OnClick="uiLinkButtonCancel_Click"><i class='icon-remove'></i> إلغاء</asp:LinkButton>

                            </div>
                            <div style="float: right;margin-right:100px; ">
                                <asp:LinkButton ID="uiLinkButtonPrint" runat="server" CssClass="btn blue" OnClick="uiLinkButtonPrint_Click"><i class='icon-print'></i> طباعة مرتجع عميل</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="uiHiddenFieldCurrentItem" runat="server" />
    </asp:Panel>
    <asp:Panel ID="uiPanelAllReturns" runat="server">
        <div class="row-fluid">
            <div class="span12">
                <!-- BEGIN BORDERED TABLE widget-->
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            مردودات المبيعات</h4>
                        <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                            class="icon-remove"></a></span>
                    </div>
                    <div class="widget-body">
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn blue" OnClick="uiLinkButtonAdd_Click"><i class='icon-plus'></i> إضافة إذن مرتجع </asp:LinkButton>
                        <div class="clearfix" style="height: 20px;">
                        </div>
                        <asp:GridView ID="uiGridViewReturns" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" GridLines="None" OnPageIndexChanging="uiGridViewReturns_PageIndexChanging"
                            OnRowCommand="uiGridViewReturns_RowCommand" Width="90%" CssClass="table table-striped table-bordered">
                            <AlternatingRowStyle HorizontalAlign="Center" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="ReturnNo" HeaderText="رقم الإذن" />
                                <asp:BoundField DataField="ReturnDate" HeaderText="التاريخ" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="ClientName" HeaderText="العميل" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ClientReturnID") %>'
                                            CssClass="btn blue" CommandName="EditReturn"><i class='icon-edit'></i> تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ClientReturnID") %>'
                                            CssClass="btn blue" CommandName="DeleteReturn" OnClientClick="return confirm('هل تريد حذف هذا السجل ؟');"><i class='icon-remove'></i> حذف</asp:LinkButton>
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
