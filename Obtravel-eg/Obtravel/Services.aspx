<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENBanner.Master" AutoEventWireup="true"
    CodeBehind="Services.aspx.cs" Inherits="Obtravel.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Services</h1>
    <div class="clear10px">
    </div>
    <div class="right" style="width:100%">
    <asp:Panel ID="uiPanelAllServices" runat="server">
        <asp:Repeater ID="uiRepeaterCurrentServices" runat="server">
            <HeaderTemplate>
                <div class="services">
                    <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <div class="img">
                        <a href='Services.aspx?SID=<%# Eval("ID") %>'>
                        <asp:Image ID="uiImageService" runat="server" ImageUrl='<%# Eval("ImagePath") %>' />
                        </a> </div>
                    <div class="serv_data" style="width:80%">
                        <h4><a class="title" href='Services.aspx?SID=<%# Eval("ID") %>'>
                            <%# Eval("Title") %>
                            </a>
                            </h4>
                        <%# Eval("Brief") %>
                    </div>
                    <div class="clear">
                    </div>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul> </div></FooterTemplate>
        </asp:Repeater>
    </asp:Panel>
    <asp:Panel ID="uiPanelViewService" runat="server">
        <div class="services">
            <ul>
                <li>
                    <div class="img">
                        <asp:Image ID="uiImageService" runat="server" /></div>
                    <div class="serv_data" style="width:80%">
                        <h4>
                            <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label></h4>
                        <asp:Literal ID="uiLiteralBrief" runat="server"></asp:Literal>
                        <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="Services.aspx">Back</a>
                            </div>                            
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div>
                        <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                    </div>
                    <div class="clear">
                    </div>
                </li>
            </ul>
        </div>
    </asp:Panel>
    </div>
</asp:Content>
