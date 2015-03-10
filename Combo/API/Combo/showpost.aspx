<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showpost.aspx.cs" Inherits="Combo.showpost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:99%;border:1px solid black;clear:both;padding:5px">
        <div style="float:left;width:10%;text-align:center;">
            <asp:Image ID="uiImageProfilePic" runat="server" style="max-width:100px;"/><br />
            <asp:Label ID="uiLabelName" runat="server" ></asp:Label>
        </div>
        <div style="float:left;width:50%;text-align:left;">
            <asp:Literal ID="uiLiteralText" runat="server"></asp:Literal>
        </div>
        <div style="float:left;width:35%;text-align:right;">
            <asp:Label ID="uiLabelDate" runat="server" ></asp:Label>
        </div>
        <div style="clear:both;height:1px;width:100%"></div>
    </div>
    </form>
</body>
</html>
