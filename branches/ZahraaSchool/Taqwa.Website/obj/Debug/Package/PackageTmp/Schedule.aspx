<%@ Page Title="" Language="C#" MasterPageFile="~/AccountMatster.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="Taqwa.Website.Schedule" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
<div class="style24" style="color: Green;">
    جدول الحصص
</div>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <div class="Right" style="width: 110px">
        <asp:Label ID="Label9" runat="server" CssClass="Label">الصف الدراسى :</asp:Label>
    </div>
    <div class="Middle">
        &nbsp;<asp:DropDownList ID="uiDropDownListClasses" runat="server" AutoPostBack="True"
            OnSelectedIndexChanged="uiDropDownListClasses_SelectedIndexChanged" 
            Width="130px">
        </asp:DropDownList>
    </div>
    <div class="Left">
        &nbsp;</div>
    <div class="clear">
    </div>
    <div class="Right" style="width: 110px">
        <asp:Label ID="Label10" runat="server" CssClass="Label">الفصل :</asp:Label>
    </div>
    <div class="Middle">
        &nbsp;<asp:DropDownList ID="uiDropDownListClassRooms" runat="server" 
            Width="130px">
        </asp:DropDownList>
    </div>
    <div class="Left">
        &nbsp;</div>
    <div class="clear">
    </div>
    <div class="Right" style="width: 110px">
        <asp:Label ID="Label2" runat="server" CssClass="Label">اليوم :</asp:Label>
    </div>
    <div class="Middle">
         &nbsp;<asp:DropDownList ID="uiDropDownListDay" runat="server" Width="130px">
                <asp:ListItem Value="0">الأحد</asp:ListItem>
                <asp:ListItem Value="1">الأثنين</asp:ListItem>
                <asp:ListItem Value="2">الثلاثاء</asp:ListItem>
                <asp:ListItem Value="3">الأربعاء</asp:ListItem>
                <asp:ListItem Value="4">الخميس</asp:ListItem>
                <asp:ListItem Value="5">الجمعة</asp:ListItem>
                <asp:ListItem Value="6">السبت</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:Button ID="uiButtonView" runat="server" Text="عرض الجدول " 
            onclick="uiButtonView_Click" />
    </div>
    <div class="Left">
        &nbsp;&nbsp;&nbsp;</div>
    <div class="clear"></div>
    <div class="Right" style="width: 110px">
        <asp:Label ID="Label1" runat="server" CssClass="Label">جدول الحصص :</asp:Label>
    </div>
    <div class="Middle">
       
    </div>
    <div class="Left">
        &nbsp;</div>
    <div class="clear"></div>
    
     <div class="Right" style="width: 110px">
    </div>
    <div class="Middle" style="Width:60%">
        <asp:GridView ID="uiGridViewSchedule" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" Width="100%" EnableModelValidation="True" ForeColor="#333333" 
            GridLines="None" >
        <AlternatingRowStyle HorizontalAlign="Center" BackColor="White" />
    <Columns>
        <asp:BoundField  HeaderText="الفصل " DataField="ARClassRoomName" />
        <asp:BoundField  HeaderText="الحصة" DataField="ARSectionName" />
        <asp:BoundField  HeaderText="التوقيت" DataField="Duration" />    
        <asp:BoundField  HeaderText="المادة" DataField="ARDetails" />
    
    </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
        <EmptyDataTemplate>
    عفواً ، لا توجد بيانات.
    </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    </div>
    <div class="Left">
        &nbsp;</div>
    <div class="clear">
    </div>
    
</div>
</div>
</asp:Content>
