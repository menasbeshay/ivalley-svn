<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/ArSite.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication._default" %>
<%@ Register src="controls/ucArHomeSlider.ascx" tagname="ucArHomeSlider" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="slider">
              
              <uc1:ucArHomeSlider ID="ucArHomeSlider1" runat="server" />
            </div>              
            
              
            <div style="width:65%;float:left;">
                <h3>
                    <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label></h3>
                <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
             
            </div>
</asp:Content>
