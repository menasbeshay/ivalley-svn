<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARNoBanner.Master" AutoEventWireup="true" CodeBehind="BookingMails.aspx.cs" Inherits="Obtravel.Arabic.Admin.BookingMails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div><h1>
        تعديل البريد الإلكترونى الخاص بالحجز</h1>
        <div class="ServicesControls AdminCP" style="width:220px;">
                            <div class="btn">
                                <a href="AdminCP.aspx">العودة إلى لوحة التحكم</a>
                            </div>                           
                        </div>
                        </div>
<asp:Panel ID="uiPanelCurrentNews" runat="server" Visible= "true" Direction="RightToLeft">
<h2>
            إضافة بريد جديد
        </h2>
        <div class="smallleftHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة بريد جديد</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
<div><h2>البريد الإلكترونى الحالى</h2></div>
<div>
    <asp:GridView ID="uiGridViewNews" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewNews_RowCommand" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="Title" DataField="Content" />
    <asp:BoundField  HeaderText="Order" DataField="Order" />
    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <div class="smallrightHeight AdminCP">
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="Editmails" >تعديل</asp:LinkButton>
    </div>    
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="Deletemails"  OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
    </div> 
    </div>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" Visible= "false" Direction="RightToLeft">


        <div class="smallleft">
            البريد الإلكترونى</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateNews" 
                Columns="50"></asp:TextBox></div>
        <div style="float: left; margin-left: 200px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" ValidationGroup="UpdateNews"></asp:RequiredFieldValidator></div>
        <div class="clear10px">
        </div>      
        <div class="smallleft">
           الوظيفة</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxPosition" runat="server" ValidationGroup="UpdateNews" 
                Columns="50"></asp:TextBox></div>
        <div style="float: left; margin-left: 200px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxPosition" ForeColor="#C76E1F" ValidationGroup="UpdateNews"></asp:RequiredFieldValidator></div>
        <div class="clear10px">
        </div>      
       <div class="smallleft">
            &nbsp;</div>
        <div class="smallrightHeight AdminCP" style="width:240px">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" OnClick="uiLinkButtonUpdate_Click"
                    ValidationGroup="UpdateNews">تحديث</asp:LinkButton>
            </div>
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" OnClick="uiLinkButtonCancel_Click">إلغاء</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
        </asp:Panel>
</asp:Content>
