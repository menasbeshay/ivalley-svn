<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Taqwa.Website.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="mainContent">
<div class="style24">
    أخر الأخبار 
</div>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <asp:Panel ID="uiPanelAllNews" runat="server" Width="95%">
        <asp:GridView ID="uiGridViewAllNews" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="3" CellSpacing="3" GridLines="None" 
            HorizontalAlign="Right" ShowHeader="False">
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
                <a href='News.aspx?NID=<%# Eval("NewsID") %>'><%# Eval("ArTitle") %></a>
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
</div>
</asp:Content>
