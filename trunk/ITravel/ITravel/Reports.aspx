<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="ITravel.Reports" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ MasterType VirtualPath="~/MasterPages/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="box grid_12">
        <header>
            <div class="inner">
                <div class="left title">
                    <h1>
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:PageTitle %>"></asp:Label></h1>

                </div>
                <div class="right">
                    <a href="#" class="close">
                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Close %>"></asp:Label></a>
                </div>
            </div>
        </header>
         
         
        <div class="box-content">
            <div class="grid_3  left" style="margin-right:0px;">
                <div class="field fullwidth">
                
                <label for="uiTextBoxFromDate">
                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:FromDate %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxFromDate" runat="server" ClientIDMode="Static" CssClass="datepicker"></asp:TextBox>
            </div>
                
            </div>
              <div class="grid_3  left" style="margin-right:0px;">
                <div class="field fullwidth">
                
                <label for="uiTextBoxToDate">
                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:ToDate %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxToDate" runat="server" ClientIDMode="Static" CssClass="datepicker"></asp:TextBox>
            </div>
                
            </div>
            <div class="clear" style="height:10px;"></div>
            <ul class="iconlist">
                <li>
                    <a href="#" >
                        <span class="glyph opened-chat"></span>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:SendSMS %>"></asp:Label>
                    </a>
                </li>
                <li>
                    <asp:LinkButton ID="uiLinkButtonCanceledTickets" runat="server" OnClick="uiLinkButtonCanceledTickets_Click"> <span class="glyph close-2"></span>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:TotalCanceledTickets %>"></asp:Label></asp:LinkButton>                    
                </li>
                <li>
                    <asp:LinkButton ID="uiLinkButtonSold" runat="server" OnClick="uiLinkButtonSold_Click">
                    
                        <span class="glyph done"></span>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:TotalSold %>"></asp:Label></asp:LinkButton>
                    
                </li>
                
                </ul>

            <div class="clear" style="height:25px;"></div>
            <ul class="iconlist">
                <li>
                    <a href="#" >
                        <span class="glyph reply"></span>
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:TotalReturned %>"></asp:Label>
                    </a>
                </li>
                <li>
                    <a href="#" >
                        <span class="glyph clock"></span>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Summary %>"></asp:Label>
                    </a>
                </li>
            </ul>
            <div class="clear" style="height:20px;"></div>

            <rsweb:ReportViewer ID="uiReportViewerMain" runat="server" Width="100%"></rsweb:ReportViewer>
         </div>
      </div>
</asp:Content>
