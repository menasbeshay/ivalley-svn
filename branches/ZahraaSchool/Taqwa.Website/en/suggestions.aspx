<%@ Page Title="" Language="C#" MasterPageFile="~/Zahraa.Master" AutoEventWireup="true" CodeBehind="suggestions.aspx.cs" Inherits="Taqwa.Website.en.suggestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script type="text/javascript">
    $(document).ready(function () {
        $("#menuItemSug").addClass("current");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="clear:both; height:10px;"></div>
<div class="mainContent col-lg-12 row" >
<h2>
    <asp:Literal ID="uiLiteralTitle" runat="server"></asp:Literal>
</h2>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <div class="Right" style="width: 200px">
        
    </div>
    <div class="Middle">
        <asp:Label ID="uiLabelMessage" runat="server" Visible="false"></asp:Label>
    </div>
    <div class="Left">
    </div>
    <div class="clear"></div>
    <div class="pull-left" style="width: 200px">
        <asp:Label ID="Label1" runat="server" Text="Name :" CssClass="Label control-label"></asp:Label>
    </div>
    <div class="pull-left">
        <asp:TextBox ID="uiTextBoxName" runat="server" Width="400px" CssClass="form-control"
            ValidationGroup="Suggest"></asp:TextBox>
    </div>
    <div class="pull-left">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            runat="server" ControlToValidate="uiTextBoxName" Display="Dynamic" 
            ErrorMessage="*" ValidationGroup="Suggest"></asp:RequiredFieldValidator>
    </div>
    <div style="clear:both; height:5px;"></div>
    <div class="pull-left" style="width: 200px">
        <asp:Label ID="Label2" runat="server" Text="Email :" 
            CssClass="Label control-label"></asp:Label>
    </div>
    <div class="pull-left">
        <asp:TextBox ID="uiTextBoxEmail" runat="server" Width="400px"  CssClass="form-control"
            ValidationGroup="Suggest"></asp:TextBox>
    </div>
    <div class="pull-left">&nbsp;<asp:RegularExpressionValidator 
            ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="uiTextBoxEmail" Display="Dynamic" ErrorMessage="*" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ValidationGroup="Suggest"></asp:RegularExpressionValidator>
    </div>
    <div style="clear:both; height:5px;"></div>
    <div class="pull-left" style="width: 200px">
        <asp:Label ID="Label3" runat="server" Text="Suggestion :" CssClass="Label control-label"></asp:Label>
    </div>
    <div class="pull-left">
        <asp:TextBox ID="uiTextBoxSugg" runat="server" Width="400px" Rows="10"  CssClass="form-control"
            TextMode="MultiLine" ValidationGroup="Suggest"></asp:TextBox>
    </div>
    <div class="pull-left">&nbsp;</div>
    <div style="clear:both; height:5px;"></div>
    <div class="pull-left" style="width: 185px">
    &nbsp;
    </div>
    <div class="pull-left">
    &nbsp;
    </div>
    <div class="pull-left">&nbsp;<asp:Button ID="uiButtonSubmit" runat="server" CssClass="btn btn-default"
            onclick="uiButtonUpload_Click" Text="Send" ValidationGroup="Suggest" />
    </div>
    <div class="clear"></div>
</div>
</div>
</asp:Content>
