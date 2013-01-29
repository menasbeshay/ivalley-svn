<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARMaster.Master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="GlobalLogistics.WebSite.Arabic.Service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
                <h1>
                    <asp:Label ID="uiLabelTypeName" runat="server" ></asp:Label>
                </h1>
                <div class="Details675">
                    <asp:Panel ID="uiPanelOffers" runat="server">
                        <asp:Repeater ID="uiRepeaterOffers" runat="server">
                        <HeaderTemplate>
                        <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href='Service.aspx?T=off&sid=<%# Eval("ServiceID") %>'><%# Eval("ArName") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </ul>
                        </FooterTemplate>
                        </asp:Repeater>
                        <asp:Literal ID="uiLiteralOffers" runat="server"></asp:Literal>
                    </asp:Panel>
                    
                    <asp:Panel ID="uiPanelRequests" runat="server">
                    <asp:Repeater ID="uiRepeaterRequests" runat="server">
                        <HeaderTemplate>
                        <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href='Service.aspx?T=req&sid=<%# Eval("ServiceID") %>'><%# Eval("ArName") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </ul>
                        </FooterTemplate>
                        </asp:Repeater>
                        <asp:Literal ID="uiLiteralRequests" runat="server"></asp:Literal>
                    </asp:Panel>

                    <asp:Panel ID="uiPanelJobs" runat="server">
                    <asp:Repeater ID="uiRepeaterJobs" runat="server">
                        <HeaderTemplate>
                        <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href='Service.aspx?T=job&sid=<%# Eval("ServiceID") %>'><%# Eval("ArName") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </ul>
                        </FooterTemplate>
                        </asp:Repeater>
                        <asp:Literal ID="uiLiteralJobs" runat="server"></asp:Literal>
                    </asp:Panel>

                    <asp:Panel ID="uiPanelServices" runat="server">
                    <asp:Repeater ID="uiRepeaterService" runat="server">
                        <HeaderTemplate>
                        <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href='Service.aspx?T=ser&sid=<%# Eval("ServiceID") %>'><%# Eval("ArName") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </ul>
                        </FooterTemplate>
                        </asp:Repeater>
                        <asp:Literal ID="uiLiteralServices" runat="server"></asp:Literal>
                    </asp:Panel>

                </div>
                </div>
</asp:Content>
