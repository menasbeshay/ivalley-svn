<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Inner.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="website.MyOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table cellpadding="2" class="style1">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <h2>
                My Orders
                </h2>
                <div class="clear5">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Order Number :" Font-Bold="True"></asp:Label>
            &nbsp;<asp:Label ID="uiLabelOrderNumber" runat="server" ></asp:Label>
            
            <div style="float:right;width:50%;text-align:center;">
                <asp:HyperLink ID="uiHyperLinkInvoice" runat="server">Download invoice</asp:HyperLink>
            </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Order Status :" Font-Bold="True"></asp:Label>
                &nbsp;<asp:Label ID="uiLabelStatus" runat="server"></asp:Label>
                </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Order Date :" Font-Bold="True"></asp:Label>
                &nbsp;<asp:Label ID="uiLabelDate" runat="server"></asp:Label>
                </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Order Total :" Font-Bold="True"></asp:Label>
                &nbsp;<asp:Label ID="uiLabelTotal" runat="server"></asp:Label>
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Bill To :" Font-Bold="True"></asp:Label></td>
        </tr>
        <tr>
            <td>
                Full Name: 
                <asp:Label ID="uiLabelFullName" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>
                City : 
                <asp:Label ID="uiLabelCity" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>
                Country : 
                <asp:Label ID="uiLabelCountry" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>
                Telephone : 
                <asp:Label ID="uiLabelTele" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>
                Fax : 
                <asp:Label ID="uiLabelFax" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>
                E-Mail : 
                <asp:Label ID="uiLabelMail" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <strong>Products :</strong></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="uiGridViewProducts" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" GridLines="Both" OnPageIndexChanging="uiGridViewProducts_PageIndexChanging" Width="90%">
                    <Columns>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                        <asp:BoundField DataField="ItemPrice" HeaderText="Price" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />                        
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <strong>Order History :</strong></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="uiGridViewHistory" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" GridLines="Both" OnPageIndexChanging="uiGridViewHistory_PageIndexChanging"
                    Width="90%">
                    <Columns>
                        <asp:BoundField DataField="StatusName" HeaderText="Status" />                        
                        <asp:BoundField DataField="ChangeDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>


</asp:Content>
