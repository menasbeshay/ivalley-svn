<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/IStock.Master" AutoEventWireup="true" CodeBehind="DOTotals.aspx.cs" Inherits="I_Stock.Admin.DOTotals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelAllOrders" runat="server">
        <div class="row-fluid">
            <div class="span12">
                <!-- BEGIN BORDERED TABLE widget-->
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            مجموع أذونات الصرف</h4>
                        <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                            class="icon-remove"></a></span>
                    </div>
                    <div class="widget-body">
                        <div class="form-horizontal">
                            <div class="control-group">
                                <div class="span4">
                                    <label class="control-label" style="width:50px">
                                        من رقم
                                    </label>
                                    <div class="controls" style="margin-right:20px;">
                                        <asp:TextBox ID="uiTextBoxFrom" runat="server" CssClass="input-large" data-validation-engine="validate[required]"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="span4">
                                    <label class="control-label" style="width: 50px">
                                        إلى رقم
                                    </label>
                                    <div class="controls" style="margin-right: 20px;">
                                        <asp:TextBox ID="uiTextBoxTo" runat="server" CssClass="input-large" data-validation-engine="validate[required]"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="span4">
                                   
                                    <div class="controls" style="margin-right:20px;">
                                        <asp:Button ID="uiLinkButtonCalculate" runat="server" CssClass="btn blue" OnClick="uiLinkButtonCalculate_Click"
                                            Text="حساب مجموع أذونات الصرف"></asp:Button>
                                    </div>
                                </div>
                            </div>
                            </div>
                        
                        <div class="clearfix" style="height: 20px;">
                        </div>
                        <asp:GridView ID="uiGridViewOrders" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" GridLines="None" Width="90%" CssClass="table table-striped table-bordered">
                            <AlternatingRowStyle HorizontalAlign="Center" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="ItemCode" HeaderText="كود الصنف" />
                                <asp:BoundField DataField="ItemName" HeaderText="إسم الصنف" />
                                <asp:BoundField DataField="Number" HeaderText="العدد" />
                                
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <!-- END BORDERED TABLE widget-->
            </div>
        </div>
    </asp:Panel>
</asp:Content>
