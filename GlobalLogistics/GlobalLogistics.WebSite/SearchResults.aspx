<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARMaster.Master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="GlobalLogistics.WebSite.Arabic.SearchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
        <h1>
            نتائج البحث</h1>
        <div class="Details675">
            <asp:Panel ID="uiPanelResults" runat="server" style="direction: ltr">
                <asp:Repeater ID="uiRepeaterResults" runat="server" 
                    onitemdatabound="uiRepeaterResults_ItemDataBound">
                    <ItemTemplate>
                        
                                <div class="ItemHeader" style="font-weight:bold;text-decoration:underline;color:#0B538E;">
                                  <asp:HyperLink ID="CompanyLink" runat="server" ><%# Eval("ArName") %></asp:HyperLink>
                                    <div runat="server" ID="CompanyName"><%# Eval("ArName") %></div>
                                </div>
                                <div class="clear">
                                </div>
                                <div >
                                <div class="ItemLogo">
                                    <img src='<%# string.IsNullOrEmpty(Eval("LogoPath").ToString()) ? "images/default_logo.gif" : Eval("LogoPath") %>' />
                                </div>
                                <div class="ItemDetails">
                                    <div class="ItemHead" style="font-weight:bold;">
                                        المدينة</div>
                                    <div class="ItemValue">
                                        <asp:Label ID="uiLabelCityName" runat="server" ></asp:Label>
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="ItemHead" style="font-weight:bold;">
                                        العنوان</div>
                                    <div class="ItemValue">
                                        <%# Eval("ArAddress") %></div>
                                    <div class="clear">
                                    </div>
                                    <div class="ItemHead" style="font-weight:bold;">
                                        التليفون</div>
                                    <div class="ItemValue">
                                        <%# Eval("Tele") %></div>
                                    <div class="clear">
                                    </div>
                                    <div class="ItemHead" style="font-weight:bold;">
                                        الفاكس</div>
                                    <div class="ItemValue">
                                        <%# Eval("Fax") %></div>
                                    <div class="clear">
                                    </div>
                                </div>
                                </div>
                                <div class="clear10">
                                </div>
                            <div class="clear10">
                                </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:Panel ID="uiPanelPaging" runat="server" style="text-align:center;direction:rtl;">

                <asp:LinkButton ID="uiLinkButtonPrev" runat="server" 
                        onclick="uiLinkButtonPrev_Click" ><< السابق</asp:LinkButton>&nbsp;
                <asp:Label ID="uiLabelPages" runat="server" Text="Page "></asp:Label>&nbsp;
                <asp:LinkButton ID="uiLinkButtonNext" runat="server" 
                        onclick="uiLinkButtonNext_Click" >التالى >></asp:LinkButton>
                </asp:Panel>

            </asp:Panel>
            <asp:Panel ID="uiPanelNoResults" runat="server">
                <asp:Label ID="Label1" runat="server" Text="عفواً ، لا توجد نتائج ."></asp:Label>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
