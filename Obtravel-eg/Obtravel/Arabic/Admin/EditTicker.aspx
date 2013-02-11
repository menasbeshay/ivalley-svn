<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARNoBanner.Master" AutoEventWireup="true" CodeBehind="EditTicker.aspx.cs" Inherits="Obtravel.Arabic.Admin.EditTicker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="direction:rtl;"><h1>
        تعديل شريط الأخبار</h1>
        <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">العودة إلى لوحة التحكم</a>
                            </div>                           
                        </div>
                        </div>
<asp:Panel ID="uiPanelCurrentNews" runat="server" Visible= "true" style="direction:rtl;">
<h2>
            إضافة خبر 
        </h2>
        <div class="smallleftHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة خبر</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
<div><h2>الأخبار الحالية</h2></div>
<div style="direction:rtl">
    <asp:GridView ID="uiGridViewNews" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewNews_RowCommand" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="العنوان" DataField="arContent" />
    <asp:BoundField  HeaderText="الترتيب" DataField="arOrder" />
    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <div class="smallrightHeight AdminCP">
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="EditNews" >تعديل</asp:LinkButton>
    </div>    
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="DeleteNews"  OnClientClick="return confirm('؟هل تريد حذف هذا السجل');">حذف</asp:LinkButton>
    </div> 
    </div>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" Visible= "false">


        <div class="smallleft">
            العنوان</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateNews" 
                Columns="50"></asp:TextBox></div>
        <div style="float: left; margin-left: 35px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="من فضلك أدخل العنوان"
                ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" ValidationGroup="UpdateNews"></asp:RequiredFieldValidator></div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            الترتيب</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxOrder" runat="server" ValidationGroup="UpdateNews"></asp:TextBox></div>
        <div class="clear10px">
        </div>
       <div class="smallleft">
            &nbsp;</div>
        <div class="smallrightHeight AdminCP">
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
