<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LatestOffers.ascx.cs" Inherits="GlobalLogistics.WebSite.Controls.LatestOffers" %>
                        <asp:Panel ID="EnPanel" runat="server">
                        <div class="ContentLeftDiv">
                            <h2>
                                Latest Offers</h2>
                            <div class="Details490">
                                <asp:Repeater ID="uiRepeaterEnOffers" runat="server">
                                <HeaderTemplate>
                                <ul>
                                </HeaderTemplate>
                                <ItemTemplate>
                                <li> <a href='../Service.aspx?T=off&sid=<%# Eval("ServiceID") %>'> <%# Eval("EnName") %> </a> </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                </ul>
                                </FooterTemplate>

                                </asp:Repeater>
                            </div>
                        </div>
                        </asp:Panel>
<asp:Panel ID="ArPanel" runat="server">
                      <div class="ContentLeftDiv">
                        <h2>العروض الأخيره</h2>
                          <div class="Details490">
                                <asp:Repeater ID="uiRepeaterArOffers" runat="server">
                                <HeaderTemplate>
                                <ul>
                                </HeaderTemplate>
                                <ItemTemplate>
                                <li> <a href='../Arabic/Service.aspx?T=off&sid=<%# Eval("ServiceID") %>'> <%# Eval("ArName") %> </a> </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                </ul>
                                </FooterTemplate>

                                </asp:Repeater>
                            </div>
                    </div>

</asp:Panel>