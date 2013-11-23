<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCP.aspx.cs" Inherits="WebApplication.Admin.AdminCP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div style="width:100%" >
<p style="padding-left:7px">
 <asp:Label runat="server" ID="lblTitle" 
        Text="Choose page from the list to edit it's content" Font-Names="Verdana" 
        Font-Size="17px" ForeColor="#336699"></asp:Label>
</p>
 

 </div>
    <div style="width: 50%">
        <table width="50%">
            <tr style="width:100%">
                <td style="width:15%">
                    <asp:Label runat="server" Font-Bold="true" ID="lblPageTitle" Text="Action"></asp:Label>
                </td>
                <td >
                    <asp:Label runat="server" Font-Bold="true" ID="Label1" Text="Function"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ImageButton PostBackUrl="~/Admin/EditPages.aspx" runat="server" ID="imgbtn1"
                        ToolTip="Click here to Edit" Width="30px" ImageUrl="~/images/edit.png" />
                </td>
                <td >
                    <asp:Label runat="server" ID="Label2" Text="Edit Pages"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:ImageButton PostBackUrl="~/Admin/EditCategories.aspx" runat="server" ID="ImageButton1"
                        ToolTip="Click here to Edit" Width="30px" ImageUrl="~/images/edit.png" />
                </td>
                <td >
                    <asp:Label runat="server" ID="Label3" Text="Edit Gallery Folders"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:ImageButton PostBackUrl="~/Admin/EditGallery.aspx" runat="server" ID="ImageButton2"
                        ToolTip="Click here to Edit" Width="30px" ImageUrl="~/images/edit.png" />
                </td>
                <td >
                    <asp:Label runat="server" ID="Label4" Text="Manage Gallery Images"></asp:Label>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
