<%@ Page Title="" Language="C#" MasterPageFile="~/Zahraa.Master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="Taqwa.Website.en.news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#menuItemNews").addClass("current");
        });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="clear:both; height:10px;"></div>
<div class="mainContent col-lg-12 row" >
<h2 >
   Latest news
</h2>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <asp:Panel ID="uiPanelAllNews" runat="server" Width="95%">
        <asp:GridView ID="uiGridViewAllNews" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="3" CellSpacing="3" GridLines="None" 
            HorizontalAlign="left" ShowHeader="False">
            <PagerSettings Position="TopAndBottom" />
            <PagerStyle HorizontalAlign="Center" />

            <Columns>
            <asp:TemplateField>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/bullet.gif" />
            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
            <ItemTemplate>
                <a href='News.aspx?NID=<%# Eval("NewsID") %>'><%# Eval("EnTitle") %></a>
                </ItemTemplate>
            </asp:TemplateField>            
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" Width="95%">
     <div class="Right">
        <asp:Label ID="uiLabelTitle" runat="server" CssClass="Label"></asp:Label>
    </div>
    <div class="Middle">
        
    </div>
    <div class="Left">
        &nbsp;</div>
    <div class="clear">
    </div>
     <div >
         <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
    </div>
   
    </asp:Panel>
</div>
<div style="clear:both; height:10px;"></div>
</div>
</asp:Content>
