<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARMaster.Master" AutoEventWireup="true" CodeBehind="Exchange.aspx.cs" Inherits="GlobalLogistics.WebSite.Arabic.Exchange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
                <h1>
                    أسعار العملات</h1>
                <div class="Details675">
                <div class="Middle" style="width: 100%; text-align: center">
                    <asp:GridView ID="UIGridViewExchange" runat="server" 
                        AutoGenerateColumns="False" HorizontalAlign="Center" Width="100%" 
                        onrowdatabound="UIGridViewExchange_RowDataBound" CellPadding="4" 
                        EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                    <asp:TemplateField HeaderText="العملة">
                    <ItemTemplate>
                        <asp:Label ID="uiLabelCurrencyName" runat="server"></asp:Label>
                    </ItemTemplate>                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="CellPrice" HeaderText="سعر البيع" />
                    <asp:BoundField DataField="BuyPrice" HeaderText="سعر الشراء" />
                    <asp:BoundField DataField="LastCellPrice" HeaderText=" السعر السابق (البيع)" />
                    <asp:TemplateField HeaderText="نسبة التغير">
                    <ItemTemplate>
                        <%# (Convert.ToDouble(Eval("CellPrice")) - Convert.ToDouble(Eval("LastCellPrice"))).ToString("00.0000") %>
                    </ItemTemplate>                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="CreatedDate" HeaderText="أخر تحديث" DataFormatString="{0:dd/MM/yyyy hh:mm:ss tt}"/>
                    </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle HorizontalAlign="Center" BackColor="#5D7B9D" Font-Bold="True" 
                            ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    </div>
                    <div class="clear"></div>
                </div>
                </div>
</asp:Content>
