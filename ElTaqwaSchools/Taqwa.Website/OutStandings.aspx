<%@ Page Title="" Language="C#" MasterPageFile="~/NewDesign.Master" AutoEventWireup="true" CodeBehind="OutStandings.aspx.cs" Inherits="Taqwa.Website.OutStandings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="mainContent" style="background-color:#fff;width:980px;">
<div class="style24" style="text-align:right;">
    أوائل الطلبة
</div>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <asp:DataList ID="uiDataListOutStanding" runat="server" RepeatColumns="1" 
        RepeatLayout="Flow" onitemdatabound="uiDataListOutStanding_ItemDataBound">
    <ItemTemplate>
    <div style="width:100%;border:1px solid black;border-radius:5px;-webkit-border-radius:5px;-moz-border-radius:5px;padding:5px;margin-right:-5px;">
        <div style="float:right;width:19%;">
            <img src='<%# Eval("PicturePath") %>' width="100px" />
        </div>
        <div style="float:right;width:79%">
            <div style="font-weight:bold;">
            <%# Eval("ARName") %>
            </div>
            <div class="clear">
            </div>
            <div style="direction:rtl;">
            <asp:Literal ID="uiLiteralComments" runat="server" ></asp:Literal>
            </div>
        </div>
        <div class="clear">
            </div>
    </div>
        
        
        
    </ItemTemplate>
    </asp:DataList>
</div>
</div>
</asp:Content>
