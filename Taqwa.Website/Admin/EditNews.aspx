<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditNews.aspx.cs" Inherits="Taqwa.Website.Admin.EditNews" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
    <div class="AdminMain">
<asp:Panel ID="uiPanelCurrentNews" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<div><h3>الأخبار الحالية</h3></div>
<div>
    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" 
        onclick="uiLinkButtonAdd_Click" style="font-size:15px;">إضافة خبر جديد</asp:LinkButton>
</div>
<div>
    <asp:GridView ID="uiGridViewNews" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewNews_RowCommand" 
        AllowPaging="true" onpageindexchanging="uiGridViewNews_PageIndexChanging" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="العنوان بالإنجليزية" DataField="EnTitle" />
    <asp:BoundField  HeaderText="العنوان بالعربية" DataField="ArTitle" />
    <asp:BoundField HeaderText="Date" DataField="CreatedDate" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("NewsID") %>' CommandName="EditNews" ToolTip="تعديل" ><img src="../images/icons/edit.gif" /></asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("NewsID") %>' CommandName="DeleteNews"  OnClientClick="return confirm('Are you want to delete this record?');" ToolTip="حذف" ><img src="../images/icons/delete.gif" /></asp:LinkButton>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
        <EmptyDataTemplate>
    عفواً ، لا توجد بيانات
    </EmptyDataTemplate>
    </asp:GridView>
    <div class="clear"></div>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div><h3>تعديل الخبر</h3></div>
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMessage" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>

        <div class="AdminLeft">
            <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" 
                Text="العنوان بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEnNewsTitle" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="uiTextBoxEnNewsTitle" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

         <div class="AdminLeft">
            <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="العنوان بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxArNewsTitle" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="uiTextBoxArNewsTitle" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>
        
        
         <div class="AdminLeft">
            <asp:Label ID="Label1" runat="server" CssClass="Label" 
                Text="صورة الخبر :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:FileUpload ID="uiFileUploadImage" runat="server" />
        </div>
        <div class="AdminRight">
            &nbsp;
        </div>
        <div class="clear"></div>

         <div class="AdminLeft">
            <asp:Label ID="Label2" runat="server" CssClass="Label" 
                Text="تاريخ الخبر :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxDate" runat="server"></asp:TextBox>
            <cc1:CalendarExtender ID="uiTextBoxDate_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="uiTextBoxDate" Format="dd/MM/yyyy">
            </cc1:CalendarExtender>
        </div>
        <div class="AdminRight">
            &nbsp;
        </div>
        <div class="clear"></div>

        
        <div class="AdminMiddle">
        <asp:Label ID="uiLabelEnContent" runat="server" CssClass="Label" 
                Text="المحتوى بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminMiddle">
        <FCKeditorV2:FCKeditor ID="uiFCKeditorEnContent" runat="server" BasePath="~/modules/fckeditor/" Height="300px" Width="750px">
            </FCKeditorV2:FCKeditor>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>

        
        <div class="AdminMiddle">
        <asp:Label ID="uiLabelArContent" runat="server" CssClass="Label" 
                Text="المحتوى بالعربية :"></asp:Label>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>

        <div class="AdminMiddle">
        <FCKeditorV2:FCKeditor ID="uiFCKeditorArContent" runat="server" BasePath="~/modules/fckeditor/" Height="300px" Width="750px">
            </FCKeditorV2:FCKeditor>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
        
        <div class="AdminLeft">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل" ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        </asp:Panel>
    </div>
</asp:Content>
