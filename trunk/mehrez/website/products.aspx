<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ProductMaster.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="website.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mi4").addClass("current");
        });

        $(document).ready(function () {
            var id = $.url().param('cid');
            if (id == 1) {
                $("#cat1").addClass("mainCat");
            }
            else if (id == 2) {
                $("#cat2").addClass("mainCat");
            }
            else if (id == 3) {
                $("#cat3").addClass("mainCat");
            }
            else if (id == 4) {
                $("#cat4").addClass("mainCat");
            }
            else if (id == 5) {
                $("#cat5").addClass("mainCat");
            }
            else if (id == 6) {
                $("#cat6").addClass("mainCat");
            }            
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelCats" runat="server" >
        <asp:Repeater ID="uiRepeaterCats" runat="server">
            <ItemTemplate>
                <div style="float:left;width:22%;padding:5px;margin:5px;">
                    <a href='products.aspx?cid=<%# Eval("ID") %>' class="pro_main"> 
                        <img src='Images.aspx?Inner=product&Image=<%# Eval("MainPic") %>' /> <br /> <%# Eval("CategoryName") %></a>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                <table border="0" width="100%" cellspacing="0" cellpadding="5">
                    <tbody>
                        <tr>
                            <td>
                                <p class="content_black">
                                    Our products feature rich materials and authentic touches of handcraft. We select
                                    fine natural wood and veneer, as well as high quality finishing materials, using
                                    durable upholstering techniques and quality hardware. With our extensive variety,
                                    you will furnish your home with uniquely designed world-class products and benefit
                                    from our decoration consultancy services. Your home becomes then a work of art you
                                    will surely be proud of!
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
        <asp:Repeater ID="uiRepeaterProducts" runat="server">
            <ItemTemplate>
                <div style="float: left; width: 22%; padding: 5px; margin: 5px;" >
                    <a href='products.aspx?pid=<%# Eval("ProductID") %>' class="pro_main">
                        <img src='Images.aspx?Inner=product&Image=<%# Eval("thumbs") %>' />
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
