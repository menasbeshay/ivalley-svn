<%@ Page Title="" Language="C#" MasterPageFile="~/Projects.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="archiplan.Project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="_pgtres/stmenu.js"></script>
    <script type="text/javascript" src="js/prototype.js"></script>
    <script type="text/javascript" src="js/scriptaculous.js?load=effects"></script>
    <script type="text/javascript" src="js/lightbox.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <div>
            <asp:Panel ID="pnlproducts" runat="server">
                <ul style="direction: rtl;">
                    <asp:Repeater ID="rptrProducts" runat="server">
                        <ItemTemplate>
                            <li>
                                <p style="text-align: right;">
                                    <a class="butt" href='<%# Eval("thumbs") %>' rel="lightbox[chiledranroom]"><%# Eval("ProductName") %></a>
                            </li>

                        </ItemTemplate>
                    </asp:Repeater>
                </ul>

            </asp:Panel>
        </div>
        <div>
            <asp:Panel ID="pnlUnderConstractor" Visible="false" runat="server">
                <div style="text-align: center">
                    <img src="images/underconstruction.jpg" />
                </div>
            </asp:Panel>
        </div>


    </div>
</asp:Content>
