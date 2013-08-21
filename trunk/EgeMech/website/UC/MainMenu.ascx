<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.ascx.cs" Inherits="website.UC.MainMenu" %>

<nav class="main-nav clearfix">
    <div class="menu-div">
        <ul>
            <li><a href="../Default.aspx">Home</a> </li>
            <li><a href="../Products.aspx">Products</a>
                <ul style="display: none;">
                    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                </ul>
            </li>
            <li><a href="../Pages.aspx?pid=2">About Us</a>                
            </li>
            <li><a href="../Pages.aspx?pid=6">Contact Us</a> </li>
            <li><a href="../Pages.aspx?pid=7">Media Center</a> </li>
            
        </ul>

        <!-- my litral -->
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </div>
</nav>