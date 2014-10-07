<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="ITravel.Reports" %>
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
            <ul class="iconlist">
                <li>
                    <a href="#" >
                        <span class="glyph opened-chat"></span>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:SendSMS %>"></asp:Label>
                    </a>
                </li>
                <li>
                    <a href="#" >
                        <span class="glyph close-2"></span>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:TotalCanceledTickets %>"></asp:Label>
                    </a>
                </li>
                <li>
                    <a href="#" >
                        <span class="glyph done"></span>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:TotalSold %>"></asp:Label>
                    </a>
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
            <div class="clear" style="height:10px;"></div>
         </div>
      </div>
</asp:Content>
