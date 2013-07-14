<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="designers.aspx.cs" Inherits="website.designers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
     $(document).ready(function () {         
             $("#mi3").addClass("current");         
     });
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="uiPanelAll" runat="server">
    <asp:Repeater ID="uiRepeaterDesigners" runat="server">
    <ItemTemplate>
        <div class="designerHost">
        <div class="designerpic">
            <img src='<%# Eval("MainPic") %>' />
        </div>
        
        <div class="designerDetails">
            <div class="tittle">
                <%# Eval("DesignerName") %></div>
            <div class="clearfix">
            </div>
            <div class="tittle">
                <%# Eval("Title") %></div>
            <div class="clearfix">
            </div>
            <div class="content_black">
                <%# Eval("Brief") %>
            </div>
            <div class="clearfix">
            </div>
            <div class="content_black">
                <a href='designers.aspx?did=<%# Eval("ID") %>' >Read more</a>
            </div>
            <div class="clearfix">
            </div>
        </div>

        <div class="clearfix"></div>
        </div>
    </ItemTemplate>
    <SeparatorTemplate>
        <div class="clear5" style="height:10px"></div>
    </SeparatorTemplate>
    </asp:Repeater>
    </asp:Panel>
    <asp:Panel ID="uiPanelDetails" runat="server">
        <div class="designerHost">
            <div class="designerpic">
                <asp:Image ID="uiImagemain" runat="server" />
            </div>
            <div class="designerDetails">
                <div class="tittle">
                    <asp:Label ID="uiLabelName" runat="server" ></asp:Label>
                    </div>
                <div class="clearfix">
                </div>
                <div class="tittle">
                    <asp:Label ID="uiLabelTitle" runat="server"></asp:Label>
                    </div>
                <div class="clearfix">
                </div>
                <div class="content_black">
                    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                </div>
                <div class="clearfix">
                </div>
                <div class="content_black">
                    <a href='designers.aspx'> << Back</a>
                </div>
                <div class="clearfix">
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </asp:Panel>    
</asp:Content>
