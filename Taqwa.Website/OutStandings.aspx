<%@ Page Title="" Language="C#" MasterPageFile="~/ZahraaAr.Master" AutoEventWireup="true" CodeBehind="OutStandings.aspx.cs" Inherits="Taqwa.Website.OutStandings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="clear:both; height:10px;"></div>
<div class="mainContent col-lg-12 row" >
<div style="text-align:right;">
    <h3>
    أوائل الطلبة
    </h3>
</div>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <asp:DataList ID="uiDataListOutStanding" runat="server" RepeatColumns="1" 
        RepeatLayout="Flow" onitemdatabound="uiDataListOutStanding_ItemDataBound">
    <ItemTemplate>
    <div style="width:100%;border:1px solid black;border-radius:5px;-webkit-border-radius:5px;-moz-border-radius:5px;padding:5px;margin-right:-5px;">
        <div style="float:right;width:21%;">
            <img src='<%# Eval("PicturePath") %>' width="200px" />
        </div>
        <div style="float:right;width:75%">
            <div style="font-weight:bold;font-size:18px;">
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
<div style="clear:both; height:10px;"></div>
</div>
</asp:Content>
