<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HonorPanel.aspx.cs" Inherits="Taqwa.Website.HonorPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
<div class="style24">
    <asp:Literal ID="uiLiteralTitle" runat="server" Text="لوحة الشرف"></asp:Literal>
</div>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <asp:DataList ID="uiDataListHonorPanel" runat="server" HorizontalAlign="Center" 
        RepeatLayout="Flow" Width="80%">
    <ItemTemplate>
    <div class="Right"></div>
    <div class="Middle"><%# Server.HtmlDecode(Eval("ArComments").ToString()) %></div>
    <div class="Left"></div>
    <div class="clear"></div>
    <div class="Right"><%# Eval("ArName") %></div>
    <div class="Middle"></div>
    <div class="Left">
        <asp:Image ID="uiImage" runat="server" ImageUrl='<%# Eval("PicturePath") %>' Width="120px" /></div>
    <div class="clear"></div>
    
    </ItemTemplate>
    </asp:DataList>
</div>
</div>
</asp:Content>
