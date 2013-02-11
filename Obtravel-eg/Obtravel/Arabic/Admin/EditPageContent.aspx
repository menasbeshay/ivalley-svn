<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARNoBanner.Master" AutoEventWireup="true" CodeBehind="EditPageContent.aspx.cs" Inherits="Obtravel.Arabic.Admin.EditPageContent" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="direction:rtl;">
<div><h1>
        تعديل الصفحات</h1>
        <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">العودة إلى لوحة التحكم</a>
                            </div>                           
                        </div>
                        </div>
<asp:Panel ID="uiPanelCurrentPages" runat="server" Visible= "true">
<div><h2>الصفحات الحالية</h2></div>
<div>
    <asp:GridView ID="uiGridViewPages" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewPages_RowCommand" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="العنوان" DataField="arTitle" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <div class="smallrightHeight AdminCP">
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="EditPage" >تعديل</asp:LinkButton>
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
            <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateService"></asp:TextBox></div>
        <div style="float: left; margin-left: 35px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="من فضلك أدخل العنوان"
                ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" ValidationGroup="UpdateService"></asp:RequiredFieldValidator></div>
        <div class="clear10px">
        </div>
        <div class="smallleft" style="display:none;">
            الصورة</div>
        <div class="smallrightHeight" style="display:none;">
            <asp:FileUpload ID="uiFileUploadImage" runat="server" /></div>
        <div class="clear10px" style="display:none;">
        </div>
       <div class="smallleft">
            المحتوى</div>
        <div style="float:right;width:780px;height:300px;">
            <FCKeditorV2:FCKeditor ID="uiFCKeditorContent" runat="server" BasePath="~/modules/fckeditor/" Height="300px">
            </FCKeditorV2:FCKeditor>
            </div>
        
        <div class="clear10px">
        </div>
        
        <div class="smallleft">
            &nbsp;</div>
        <div class="smallrightHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" OnClick="uiLinkButtonUpdate_Click"
                    ValidationGroup="UpdateService">تحديث</asp:LinkButton>
            </div>
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" OnClick="uiLinkButtonCancel_Click">إلغاء</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
        </asp:Panel>
        </div>
</asp:Content>
