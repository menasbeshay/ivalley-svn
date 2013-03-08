<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="ErrorResult.aspx.cs" Inherits="ErrorResult"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <center>
<table>
<tr>
<td>
<br />
<br />
<br />
<br />
<font color="red" size="7px"><b> برجاء اعادة التسجيل  </b></font>
</td>
</tr>
<tr>
<td>
<br />
<br />

<asp:Button runat="server" ID="btnLogin" Width="150px" Text="اعادة التسجيل" 
        onclick="btnLogin_Click" Font-Bold="true" />
</td>
</tr>
</table>
</center>
</asp:Content>

