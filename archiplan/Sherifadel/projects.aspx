<%@ Page Title="" Language="C#" MasterPageFile="~/Projects.Master" AutoEventWireup="true" CodeBehind="projects.aspx.cs" Inherits="archiplan.projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="js/prototype.js"></script>
<script type="text/javascript" src="js/scriptaculous.js?load=effects"></script>
<script type="text/javascript" src="js/effects.js"></script>
<script type="text/javascript" src="js/lightbox.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="uiPanelCats" runat="server" >
        <asp:Repeater ID="uiRepeaterCats" runat="server">
            <ItemTemplate>
                <div style="float:right;width:22%;padding:5px;margin:5px;">
                    <a href='projects.aspx?cid=<%# Eval("ID") %>' class="butt"
                        id="cat_<%# Eval("ID") %>"> 
                        <img src='Images.aspx?Inner=product&Image=<%# Eval("MainPic") %>' /> <br /> <%# Eval("CategoryName") %></a>
                </div>
            </ItemTemplate>
            <FooterTemplate>
            <div class="clear5"></div>
                
            </FooterTemplate>
        </asp:Repeater>  
        
            
                  
    </asp:Panel>
    <asp:Panel ID="uiPanelProducts" runat="server">
        
        <div style="width:100%;padding:5px;">
        <div style="width:100%;float:right; direction: rtl;">
            <h3><asp:Label ID="uiLabelCategory" runat="server" ></asp:Label></h3>
        </div>
        <div style="float:left;width:10%;padding-top:20px; ">
            <div class="SmallBtn">
                <asp:LinkButton ID="uiLinkButtonBack" runat="server" OnClick="uiLinkButtonBack_Click">Back</asp:LinkButton>
            </div>
        </div>
        </div>
        <div class="clear5"></div>
        
         <asp:Panel ID="uiPanelPaging" runat="server" Style="text-align: center" >
            
            <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"><< Prev</asp:LinkButton>&nbsp;
            <asp:Label ID="uiLabelPages" runat="server" Text="Page "></asp:Label>&nbsp;
            <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">Next >></asp:LinkButton>
            
            <div class="clear5" style="height: 10px">
            </div>
        </asp:Panel>
        <asp:Repeater ID="uiRepeaterProducts" runat="server">
        
            <ItemTemplate>
                <div style="float: right; width: 22%; padding: 5px; margin: 5px;" >
                    <a href='Projects.aspx?pid=<%# Eval("ProductID") %>&cid=<%# Eval("CategoryID") %>'
                        title='<%# Eval("ProductName") %>' alt='<%# Eval("ProductName") %>'>
                        <span  style="font-weight:normal;"><%# Eval("ProductName") %></span>
                        <div class="clear5" ></div>
                        <img src='Images.aspx?Inner=product&Image=<%# Eval("thumbs") %>' />
                        </a>
                        <div class="clear"></div>
                        
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
            <%# (Container.ItemIndex + 1) % 4 == 0 ? "<div class='clear5'></div>" : "" %>
            </SeparatorTemplate>
        </asp:Repeater>

       
    </asp:Panel>

    <asp:Panel ID="uiPanelProductDetails" runat="server">
        
        <div style="width:100%;padding:5px;">
        <div style="width:100%;float:right; direction:rtl;">
             <h3 style="margin:2px;"><asp:Label ID="uiLabelProducCat" runat="server" ></asp:Label></h3>
            <h3 style="margin:2px;color:#a2a2a2;"><asp:Label ID="uiLabelProductName" runat="server" Font-Bold="true"></asp:Label></h3>
            <div style="text-align:right;padding-right:20px;font-size:14px;color:#a2a2a2;" >
            <asp:Literal ID="uiLiteralDescription" runat="server" ></asp:Literal>
            </div>
        </div>
        <div style="float:left;width:10%;padding-top:20px;">
            <div class="SmallBtn">
                <asp:LinkButton ID="uiLinkButtonBackCat" runat="server" OnClick="uiLinkButtonBackCat_Click">Back</asp:LinkButton>
            </div>
        </div>
        </div>
        <div class="clear5"></div>
        
        <asp:Repeater ID="uiRepeaterProjectPics" runat="server">
        
            <ItemTemplate>
                <div style="float: right; width: 22%; padding: 5px; margin: 5px;" >
                    <a href='<%# Eval("PicPath") %>' class="butt"
                        rel="lightbox[products]" title='' alt=''>
                        
                        <img src='Images.aspx?Inner=product&Image=<%# Eval("PicPath") %>' />
                        </a>
                        <div class="clear"></div>
                        
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
            <%# (Container.ItemIndex + 1) % 4 == 0 ? "<div class='clear5'></div>" : "" %>
            </SeparatorTemplate>
        </asp:Repeater>

        
    </asp:Panel>
</asp:Content>
