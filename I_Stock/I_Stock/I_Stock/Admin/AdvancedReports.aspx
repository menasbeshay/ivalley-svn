<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/IStock.Master" AutoEventWireup="true" CodeBehind="AdvancedReports.aspx.cs" Inherits="I_Stock.Admin.AdvancedReports" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ MasterType VirtualPath="~/Masterpages/IStock.Master" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {

        $("#<%= uiTextBoxItems.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "../modules/stockservice.asmx/GetItems",
                    dataType: "json",
                    type: "post",
                    data: "{'query':'" + request.term.toString() + "','ClientId':'0'}",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response(jQuery.map(data.d, function (item) {
                            return {
                                val: item.split('##')[0],
                                label: item.split('##')[1]
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
            },
            minLength: 1,
            change: function (event, ui) {
                $("#<%=uiHiddenFieldCurrentItem.ClientID %>").val(ui.item ? ui.item.val : 0);
            }
        });

    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-bar-chart"></i>تقارير متقدمة</h4>
                    <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                        class="icon-remove"></a></span>
                </div>
                <div class="widget-body form">
                    <div class="form-horizontal">
                        <div class="control-group">
                            <div class="span6">
                                <label class="control-label">
                                    من</label>
                                <div class="controls">
                                    <asp:TextBox ID="uiTextBoxFrom" runat="server" CssClass="input-large"></asp:TextBox>
                                    <asp:CalendarExtender ID="uiTextBoxFrom_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="uiTextBoxFrom" Format="dd/MM/yyyy">
                                    </asp:CalendarExtender>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="control-label">
                                    إلى</label>
                                <div class="controls">
                                    <asp:TextBox ID="uiTextBoxTo" runat="server" CssClass="input-large"></asp:TextBox>
                                    <asp:CalendarExtender ID="uiTextBoxTo_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="uiTextBoxTo" Format="dd/MM/yyyy">
                                    </asp:CalendarExtender>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="span6">
                                <label class="control-label">
                                   من أمر رقم</label>
                                <div class="controls">
                                    <asp:TextBox ID="uiTextBoxOrderFrom" runat="server" CssClass="input-large"></asp:TextBox>
                                    
                                </div>
                            </div>
                            <div class="span6">
                                <label class="control-label">
                                    إلى أمر رقم</label>
                                <div class="controls">
                                    <asp:TextBox ID="uiTextBoxOrderTo" runat="server" CssClass="input-large"></asp:TextBox>
                                   
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="span6">
                                <label class="control-label">
                                    قطاع العميل</label>
                                <div class="controls">
                                    <asp:DropDownList ID="uiDropDownListClientTypes" runat="server" CssClass="input-xxlarge"
                                        AutoPostBack="True" OnSelectedIndexChanged="uiDropDownListClientTypes_SelectedIndexChanged"
                                        Style="width: 223px;">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="span6">
                                <label class="control-label">
                                    العميل</label>
                                <div class="controls">
                                    <asp:DropDownList ID="uiDropDownListClients" runat="server" CssClass="input-large"
                                        Style="width: 223px;">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="span6">
                                <label class="control-label">
                                    الصنف</label>
                                <div class="controls">
                                    <asp:TextBox ID="uiTextBoxItems" runat="server" CssClass="input-large"></asp:TextBox>
                                </div>
                            </div>
                            <div class="span6">
                                 <div class="span6">
                                <label class="control-label">
                                    المورد</label>
                                <div class="controls">
                                    <asp:DropDownList ID="uiDropDownListSuppliers" runat="server" CssClass="input-large"
                                        Style="width: 223px;">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="space12">
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="space12">
                                <div class="span2 responsive clearfix" data-tablet="span3" data-desktop="span2">
                                    <asp:LinkButton ID="uiLinkButtonItemPrices" runat="server" 
                                        style="text-decoration:none;" onclick="uiLinkButtonItemPrices_Click">
                            <div class="circle-wrap">
                                <div class="stats-circle turquoise-color">
                                    <i class="icon-tags"></i>
                                </div>
                                <p>
                                <strong>
                                    أسعار الأصناف
                                    </strong>
                                </p>
                            </div>
                                    </asp:LinkButton>
                                </div>


                                <div class="span2 responsive clearfix" data-tablet="span3" data-desktop="span2">
                                    <asp:LinkButton ID="uiLinkButtonItemTranHiostory" runat="server" 
                                        style="text-decoration:none;" onclick="uiLinkButtonItemTranHiostory_Click">
                            <div class="circle-wrap">
                                <div class="stats-circle red-color">
                                    <i class="icon-folder-open"></i>
                                </div>
                                <p>
                                <strong>
                                    عمليات تمت على صنف/أصناف <br /> خلال فترة
                                    </strong>
                                </p>
                            </div>
                                    </asp:LinkButton>
                                </div>


                                <div class="span2 responsive clearfix" data-tablet="span3" data-desktop="span2">
                                    <asp:LinkButton ID="uiLinkButtonPaymentPeriod" runat="server" 
                                        style="text-decoration:none;" onclick="uiLinkButtonPaymentPeriod_Click">
                            <div class="circle-wrap">
                                <div class="stats-circle green-color">
                                    <i class="icon-money"></i>
                                </div>
                                <p>
                                <strong>
                                    التحصيلات النقدية لعميل/ عملاء <br /> خلال فترة
                                    </strong>
                                </p>
                            </div>
                                    </asp:LinkButton>
                                </div>


                                <div class="span2 responsive clearfix" data-tablet="span3" data-desktop="span2">
                                    <asp:LinkButton ID="uiLinkButtonOrdersForClient" runat="server" 
                                        style="text-decoration:none;" onclick="uiLinkButtonOrdersForClient_Click">
                            <div class="circle-wrap">
                                <div class="stats-circle gray-color">
                                    <i class="icon-list-alt"></i>
                                </div>
                                <p>
                                <strong>
                                    عمليات تمت لكل<br /> عميل/عملاء خلال فترة
                                    </strong>
                                </p>
                            </div>
                                    </asp:LinkButton>
                                </div>


                                  <div class="span2 responsive clearfix" data-tablet="span3" data-desktop="span2">
                                    <asp:LinkButton ID="uiLinkButtonDeliveryOrdersPeriod" runat="server" 
                                          style="text-decoration:none;" onclick="uiLinkButtonDeliveryOrdersPeriod_Click">
                            <div class="circle-wrap">
                                <div class="stats-circle purple-color">
                                    <i class="icon-edit"></i>
                                </div>
                                <p>
                                <strong>
                                    الفواتير المستحقة من عميل <br /> خلال فترة
                                    </strong>
                                </p>
                            </div>
                                    </asp:LinkButton>
                                </div>


                                  <div class="span2 responsive clearfix" data-tablet="span3" data-desktop="span2">
                                    <asp:LinkButton ID="uiLinkButtonDeliveryOrderTotals" runat="server" 
                                          style="text-decoration:none;" onclick="uiLinkButtonDeliveryOrderTotals_Click">
                            <div class="circle-wrap">
                                <div class="stats-circle blue-color">
                                    <i class="icon-shopping-cart"></i>
                                </div>
                                <p>
                                <strong>
                                    أعداد الأصناف المصروفة لعميل<br />لمجموعة فواتير
                                    </strong>
                                </p>
                            </div>
                                    </asp:LinkButton>
                                </div>

                            </div>
                        </div>
                        <div class="control-group">
                            <div class="space12">
                                <div class="span2 responsive clearfix" data-tablet="span3" data-desktop="span2">
                                    <asp:LinkButton ID="uiLinkButtonPurchaseOrders" runat="server" 
                                        style="text-decoration:none;" onclick="uiLinkButtonPurchaseOrders_Click">
                            <div class="circle-wrap">
                                <div class="stats-circle turquoise-color">
                                    <i class="icon-truck"></i>
                                </div>
                                <p>
                                <strong>
                                    أوامر التوريد لـ (عميل / صنف ) خلال فترة
                                    </strong>
                                </p>
                            </div>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">&nbsp;</div>
                        <div style="width:800px;margin:0 auto;">
                                <rsweb:ReportViewer ID="uiReportViewerMain" runat="server" Width="800px" 
                                    BackColor="White" Height="700px">
                                </rsweb:ReportViewer>
                             </div>    
                            
                        <asp:HiddenField ID="uiHiddenFieldCurrentItem" runat="server" />
                        <div class="clearfix">&nbsp;</div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    
</asp:Content>
