<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LatestRequests.ascx.cs" Inherits="GlobalLogistics.WebSite.Controls.LatestRequests" %>
<!-- Latest requests -->
<asp:Panel ID="EnPanel" runat="server">
                        <div class="ContentLeftDiv">
                            <h2>
                                Latest requests</h2>
                            <div class="Details490">
                                <asp:Repeater ID="uiRepeaterEnRequests" runat="server">
                                <HeaderTemplate>
                                <ul>
                                </HeaderTemplate>
                                <ItemTemplate>
                                <li> <a href='../en/Service.aspx?T=req&sid=<%# Eval("ServiceID") %>'> <%# Eval("EnName") %> </a> </li>
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
                        <h2>الطلبات الأخيره</h2>
                          <div class="Details490">
                           <asp:Repeater ID="uiRepeaterArRequests" runat="server">
                                <HeaderTemplate>
                                <ul>
                                </HeaderTemplate>
                                <ItemTemplate>
                                <li> <a href='../Service.aspx?T=req&sid=<%# Eval("ServiceID") %>'> <%# Eval("ArName") %> </a> </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                </ul>
                                </FooterTemplate>

                                </asp:Repeater>
                      </div>
                    </div>

</asp:Panel>