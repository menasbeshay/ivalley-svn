<%@ Page Title="" Language="C#" MasterPageFile="~/AccountMatster.master" AutoEventWireup="true" CodeBehind="SchoolBus.aspx.cs" Inherits="Taqwa.Website.SchoolBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
<div class="style24" style="color: Green;">
    معلومات ومواعيد سيارة المدرسة
</div>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <asp:Repeater ID="uiRepeaterSchoolBus" runat="server">    
    <ItemTemplate>
    <div class="Right" style="border: 1px solid black; border-bottom: 0px;padding-right:3px;">
        <asp:Label ID="Label2" runat="server" CssClass="Label">إسم الخط :</asp:Label>
    </div>
    <div class="Middle" style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
     <%# Eval("ArLineName") %>
    </div>
    <div class="Left">
    </div>
    <div class="clear" style="height:0px;">
    </div>

    <div class="Right" style="border: 1px solid black; border-bottom: 0px;padding-right:3px;">
        <asp:Label ID="Label1" runat="server" CssClass="Label">إسم السائق :</asp:Label> 
    </div>
    <div class="Middle" style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
    <%# Eval("ArDriverName") %>
    </div>
    <div class="Left">
    </div>
    <div class="clear" style="height:0px;">
    </div>

    <div class="Right" style="border: 1px solid black; border-bottom: 0px;padding-right:3px;">
        <asp:Label ID="Label3" runat="server" CssClass="Label">رقم تليفون السائق :</asp:Label> 
    </div>
    <div class="Middle" style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
    <%# Eval("DriverTele") %>
    </div>
    <div class="Left">
    </div>
    <div class="clear" style="height:0px;"> 
    </div>

    <div class="Right" style="border: 1px solid black; border-bottom: 0px;padding-right:3px;">
        <asp:Label ID="Label4" runat="server" CssClass="Label">إسم المشرف :</asp:Label> 
    </div>
    <div class="Middle" style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
    <%# Eval("ArSupervisorName") %>
    </div>
    <div class="Left">
    </div>
    <div class="clear" style="height:0px;">
    </div>

     <div class="Right" style="border: 1px solid black; border-bottom: 0px;padding-right:3px;">
        <asp:Label ID="Label5" runat="server" CssClass="Label">رقم تليفون المشرف :</asp:Label> 
    </div>
    <div class="Middle" style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
    <%# Eval("SupervisorTele")%>
    </div>
    <div class="Left">
    </div>
    <div class="clear" style="height:0px;">
    </div>

    <div class="Right" style="border: 1px solid black;padding-right:3px; ">
        <asp:Label ID="Label6" runat="server" CssClass="Label">ملاحظات :</asp:Label> 
    </div>
    <div class="Middle" style="width: 100px; border: 1px solid black;border-right:0px;text-align: center;height:20px;">
    <%# Eval("ArNotes")%>
    </div>
    <div class="Left">
    </div>
    <div class="clear" style="height:0px;">
    </div>
    <hr style="width:50%"/>
    </ItemTemplate>
    </asp:Repeater>

</div>
</div>
</asp:Content>
