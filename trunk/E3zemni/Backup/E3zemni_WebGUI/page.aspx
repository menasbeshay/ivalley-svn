<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true" CodeBehind="page.aspx.cs" Inherits="E3zemni_WebGUI.page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row clearfix mbs">
					<h3 class="col-title mb"> 
                        <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label> </h3>

                        <div class="grid_12 row clearfix">
                            <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                        </div>
                        </div>
</asp:Content>
