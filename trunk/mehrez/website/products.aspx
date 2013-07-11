<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProductMaster.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="website.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelCats" runat="server" BackColor="#F0EFED">
        <asp:Repeater ID="uiRepeaterCats" runat="server">
            <ItemTemplate>
                <div style="float:left;width:22%;padding:5px;margin:5px;">
                    <a href='products.aspx?cid=<%# Eval("ID") %>' class="pro_main"> 
                        <img src='Images.aspx?Inner=product&Image=<%# Eval("MainPic") %>' /> <br /> <%# Eval("CategoryName") %></a>
                </div>
            </ItemTemplate>
            
        </asp:Repeater>        
    </asp:Panel>
    <asp:Panel ID="uiPanelProducts" runat="server">
        <asp:Repeater ID="uiRepeaterProducts" runat="server">
            <ItemTemplate>
                <div style="float: left; width: 22%; padding: 5px; margin: 5px;" >
                    <a href='products.aspx?pid=<%# Eval("ProductID") %>' class="pro_main">
                        <img src='Images.aspx?Inner=product&Image=<%# Eval("PicPath") %>' />
                        <br />
                        <%# Eval("ProductName") %></a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Panel ID="uiPanelPaging" runat="server" Style="text-align: center">
            
            <div class="clear5" style="height: 10px">
            </div>
            <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"><< Prev</asp:LinkButton>&nbsp;
            <asp:Label ID="uiLabelPages" runat="server" Text="Page "></asp:Label>&nbsp;
            <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">Next >></asp:LinkButton>
        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="uiPanelDetail" runat="server">
    <div class="details">
        <div class="path">
            <asp:Label ID="uiLabelPath" runat="server" ></asp:Label>
        </div>
        <div class="clear5"></div>

        <div>
            <asp:Image ID="uiImagemainPic" runat="server" />
        </div>
            
        <div class="productItems">
            <asp:Repeater ID="uiRepeaterItems" runat="server">
            <HeaderTemplate>
            <table border="1" cellpadding="2" cellspacing="2">
            <tr>
            <td class="content_black">No.</td>
                <td class="content_black">
                    Item Name
                </td>
                <td class="content_black">
                    Dimension
                </td>
                <td class="content_black">
                    Code
                </td>
            </tr>
            
            </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                    <td>
                        <%# Container.ItemIndex + 1 %>
                    </td>
                        <td>
                        <%# Eval("ItemName") %>
                        </td>
                        <td>
                            <%# Eval("Dimension") %>
                        </td>
                        <td>
                            <%# Eval("Code") %>
                        </td>
                    
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
        
        
    </asp:Panel>
</asp:Content>
