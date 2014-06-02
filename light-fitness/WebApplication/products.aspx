<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/products.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="WebApplication.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="uiPanelCats" runat="server" >
        <asp:Repeater ID="uiRepeaterCats" runat="server">
            <ItemTemplate>
                <div style="float:left;width:22%;padding:5px;margin:5px;">
                    <a href='products.aspx?cid=<%# Eval("ID") %>' class="butt"
                        id="cat_<%# Eval("ID") %>"> 
                        <img src='Images.aspx?Inner=product&Image=<%# Eval("MainPic") %>' /> <br /> <%# Eval("CategoryName") %></a>
                </div>
            </ItemTemplate>
            <FooterTemplate>
            <div class="clear5"></div>
                <table border="0" width="100%" cellspacing="0" cellpadding="5">
                    <tbody>
                        <tr>
                            <td>
                                <p class="tittle_kreem">
                                    * imported indoor & outdoor Furniture
                                    <br />
                                     - Indoor furniture (bedrooms, coffee tables,side tables, dining rooms, sofa sets, sofa bed, reclining sets, wall units, etc)
                                     <br />
                                    - Rattan furniture (chaise longue, dining rooms, sofa sets, swings , umbrellas , etc)
                                </p>
                            </td>
                            <td width="20">
                                &nbsp;
                            </td>
                        </tr>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>  
        
            
                  
    </asp:Panel>
    <asp:Panel ID="uiPanelProducts" runat="server">
        
        <div style="width:100%;padding:5px;">
        <div style="width:40%;float:left;">
            <h3><asp:Label ID="uiLabelCategory" runat="server" ></asp:Label></h3>
        </div>
        <div style="float:right;width:10%;padding-top:20px;">
            <div class="SmallBtn">
                <asp:LinkButton ID="uiLinkButtonBack" runat="server" OnClick="uiLinkButtonBack_Click">Back</asp:LinkButton>
            </div>
        </div>
        </div>
        <div class="clear5"></div>
        
        <asp:Repeater ID="uiRepeaterProducts" runat="server">
        
            <ItemTemplate>
                <div style="float: left; width: 32%; height:308px;padding: 5px; border:1px solid yellow;background-color:#fff;text-align:center;" >
                    <a class="tittle_black" href='<%# Eval("PicPath") %>' style="text-align:center;color:#000;"
                        rel="lightbox[products]" title='<%# Eval("Description") %>' alt='<%# Eval("Description") %>'>
                        <img src='Images.aspx?Inner=product&Image=<%# Eval("PicPath") %>' />
                        <br />
                        <%# Eval("ProductName") %></a>
                        <div class="clear"></div>
                        <div style="font-family:Tahoma; font-size:13px;color:#7A6D5D;">
                        <%# Eval("Description").ToString().Length > 60 ? Eval("Description").ToString().Substring(0, 57) + "..." : Eval("Description").ToString()%>
                        <div class="clear"></div>
                        <div class="butt" style="color:#695349;font-weight:bold;">
                        <%# Eval("Price") %>
                        </div>
                        </div>
                        <div class="clear"></div>
                </div>
            </ItemTemplate>           
        </asp:Repeater>

        <asp:Panel ID="uiPanelPaging" runat="server" Style="text-align: center" CssClass="tittle_kreem">
            
            <div class="clear5" style="height: 10px">
            </div>
            <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"><< Prev</asp:LinkButton>&nbsp;
            <asp:Label ID="uiLabelPages" runat="server" Text="Page "></asp:Label>&nbsp;
            <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">Next >></asp:LinkButton>
        </asp:Panel>
    </asp:Panel>

    
</asp:Content>
