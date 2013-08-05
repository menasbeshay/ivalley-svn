<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="website.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mi5").addClass("current");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelAll" runat="server" BackColor="#F0EFED">
        <asp:Repeater ID="uiRepeaterNews" runat="server">
            <ItemTemplate>
                <div class="designerHost" style="width:550px;margin:0 auto;">
                    <div class="designerpic">
                        <img src='<%# Eval("MainPicURL") %>' style="width:110px;height:110px;"/>
                    </div>
                    <div class="designerDetails" style="width:410px;">
                        
                        <div class="tittle">
                            <a href='news.aspx?NID=<%# Eval("ID") %>'>    <%# Eval("Title") %>
                            </a>
                            </div>
                        <div class="clearfix">
                        </div>
                        <div class="content_black">
                            <%# Eval("Brief") %>
                        </div>
                        <div class="clearfix">
                        </div>
                       
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <div class="clear5" style="height: 10px">
                </div>
                <hr style="width:80%;"/>
            </SeparatorTemplate>
            
        </asp:Repeater>
        <asp:Panel ID="uiPanelPaging" runat="server" Style="text-align: center" CssClass="tittle_kreem">
            <div class="clear5" style="height: 10px">
            </div>
            <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"><< Prev</asp:LinkButton>&nbsp;
            <asp:Label ID="uiLabelPages" runat="server" Text="Page "></asp:Label>&nbsp;
            <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">Next >></asp:LinkButton>
        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="uiPanelDetails" runat="server">
        <div class="designerHost">
            <div class="designerpic">
                <asp:Image ID="uiImagemain" runat="server" />
                <div class="clear5">
                </div>
            </div>
            <div class="designerDetails">
                
                <div class="tittle">
                    <asp:Label ID="uiLabelTitle" runat="server"></asp:Label>
                    <div class="clear5">
                    </div>
                </div>
                <div class="clear5">
                </div>
                <div class="content_black">
                    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                    <div class="clear5">
                    </div>
                </div>
                <div class="clear5">
                </div>
                <div class="content_black">
                    <a href='news.aspx'><< Back</a>
                </div>
                <div class="clear5" style="height: 5px;">
                </div>
            </div>
            <div class="clear5" style="height: 5px;">
            </div>
        </div>
        <div class="clear5" style="height: 5px;">
        </div>
        <div class="designerHost">
        <asp:Repeater ID="newImages" runat="server">
        <ItemTemplate>
        <div style="float:left;width:30%;margin:5px;">
            <img src="images.aspx?Inner=News&Image=<%# Eval("picpath") %>" style="border: 1px solid black;
                border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;" />
        </div>
        </ItemTemplate>
        </asp:Repeater>
        </div>
    </asp:Panel>
</asp:Content>
