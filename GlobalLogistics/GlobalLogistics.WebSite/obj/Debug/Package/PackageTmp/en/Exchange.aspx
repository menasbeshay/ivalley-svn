<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Exchange.aspx.cs" Inherits="GlobalLogistics.WebSite.Exchange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
                <h1>
                    Currency Exchange</h1>
                <div class="Details675">
                <div class="Middle" style="width: 100%; text-align: center">
                    <asp:GridView ID="UIGridViewExchange" runat="server" 
                        AutoGenerateColumns="False" HorizontalAlign="Center" Width="100%" 
                        onrowdatabound="UIGridViewExchange_RowDataBound" CellPadding="4" 
                        EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                    <asp:TemplateField HeaderText="Currency">
                    <ItemTemplate>
                        <asp:Label ID="uiLabelCurrencyName" runat="server"></asp:Label>
                    </ItemTemplate>                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="CellPrice" HeaderText="Cell Price" />
                    <asp:BoundField DataField="BuyPrice" HeaderText="Buy Price" />
                    <asp:BoundField DataField="LastCellPrice" HeaderText="Last Price (Cell Price)" />
                    <asp:TemplateField HeaderText="Change Rate">
                    <ItemTemplate>
                        <%# (Convert.ToDouble(Eval("CellPrice")) - Convert.ToDouble(Eval("LastCellPrice"))).ToString("00.0000") %>
                    </ItemTemplate>                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="CreatedDate" HeaderText="Last Update" DataFormatString="{0:dd/MM/yyyy hh:mm:ss tt}"/>
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
