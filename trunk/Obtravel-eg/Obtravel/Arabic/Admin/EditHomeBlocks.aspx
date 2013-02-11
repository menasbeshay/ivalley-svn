<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARNoBanner.Master" AutoEventWireup="true" CodeBehind="EditHomeBlocks.aspx.cs" Inherits="Obtravel.Arabic.Admin.EditHomeBlocks" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="direction:rtl;">
 <div><h1> تعديل الصفحة الرئيسية </h1>
    <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">العودة إلى لوحة التحكم</a>
                            </div>                           
                        </div>
    </div>
<div class="clear10px"></div>
<asp:Panel ID="uiPanelCurrentBlocks" runat="server" Visible= "true">
<div><h2>الأقسام الحالية</h2></div>
<div style="direction: rtl">
    <asp:GridView ID="uiGridViewBlocks" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewBlocks_RowCommand">
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="العنوان" DataField="arTitle" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <div class="smallrightHeight AdminCP">
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="EditBlock" >تعديل</asp:LinkButton>
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
<div class="smallleft">العنوان</div><div class="smallrightHeight">
    <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateBlocks" 
        Columns="50"></asp:TextBox></div>
    <div style="float:left"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ErrorMessage="*" ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" 
    ValidationGroup="UpdateBlocks"></asp:RequiredFieldValidator></div>
<div class="clear10px"></div>
<div class="smallleft">الصورة</div><div class="smallrightHeight">
    <asp:FileUpload ID="uiFileUploadImage" runat="server" /></div>
    <div style="float:right;margin-right:100px;">
                <asp:Image ID="uiImageCurrent" runat="server" Width="80px" />         
            </div>
<div class="clear10px"></div>
<div class="smallleft">المحتوى</div><div class="smallrightHeight"></div>
<div class="clear10px"></div>
<div><FCKeditorV2:FCKeditor ID="uiFCKeditor" runat="server" 
        BasePath="~/modules/fckeditor/">
</FCKeditorV2:FCKeditor>
</div>
<div class="clear10px"></div>
<div class="smallleft"></div><div class="smallrightHeight AdminCP">
<div class="btn">
    <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" 
        onclick="uiLinkButtonUpdate_Click" ValidationGroup="UpdateBlocks">تحديث</asp:LinkButton>
    </div>
    
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonCancel" runat="server" 
            onclick="uiLinkButtonCancel_Click">إلغاء</asp:LinkButton>
    </div>
    </div>
    <div class="clear10px"></div>
    </asp:Panel>
    </div>
</asp:Content>
