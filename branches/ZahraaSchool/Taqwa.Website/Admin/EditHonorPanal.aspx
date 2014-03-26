<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditHonorPanal.aspx.cs" Inherits="Taqwa.Website.Admin.EditHonorPanal" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
<div class="AdminMain">
<asp:Panel ID="uiPanelCurrentHonorPanel" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<div><h3>لوحة الشرف الحالية</h3></div>
<div>
    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" 
        onclick="uiLinkButtonAdd_Click" style="font-size:15px;">إضافة إلى لوحة الشرف</asp:LinkButton>
</div>
<div>
    <asp:GridView ID="uiGridViewHonorPanel" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewHonorPanel_RowCommand" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="الإسم بالإنجليزية" DataField="EnName" />
    <asp:BoundField  HeaderText="الإسم بالعربية" DataField="ArName" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("HonorPanelID") %>' CommandName="EditHonorPanel" ToolTip="تعديل" ><img src="../images/icons/edit.gif" /></asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("HonorPanelID") %>' CommandName="DeleteHonorPanel"  OnClientClick="return confirm('Are you want to delete this record?');" ToolTip="حذف" ><img src="../images/icons/delete.gif" /></asp:LinkButton>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
        <EmptyDataTemplate>
    عفواً ، لا توجد بيانات .
    </EmptyDataTemplate>
    </asp:GridView>
    <div class="clear"></div>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div><h3>تعديل لوحة الشرف</h3></div>
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
                Text="الإسم بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEnName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="uiTextBoxEnName" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

         <div class="AdminLeft">
            <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="الإسم بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxArName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="uiTextBoxArName" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

        <div class="AdminLeft">
            <asp:Label ID="uiLabelPicture" runat="server" CssClass="Label" 
                Text="الصورة :"></asp:Label>
        </div>
        <div class="AdminMiddle" style="vertical-align: top">
            <asp:FileUpload ID="uiFileUploadPicture" runat="server" ValidationGroup="UpdatePage"/> &nbsp;&nbsp;
            <asp:Image ID="uiImagePic" runat="server" Width="50px" ImageAlign="AbsBottom" />
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="uiFileUploadPicture" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

        
        <div class="AdminMiddle">
        <asp:Label ID="uiLabelEnContent" runat="server" CssClass="Label" 
                Text="التعليق بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminMiddle">
        <FCKeditorV2:FCKeditor ID="uiFCKeditorEnComment" runat="server" BasePath="~/modules/fckeditor/" Height="300px" Width="750px">
            </FCKeditorV2:FCKeditor>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>

        
        <div class="AdminMiddle">
        <asp:Label ID="uiLabelArContent" runat="server" CssClass="Label" 
                Text="التعليق بالعربية :"></asp:Label>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>

        <div class="AdminMiddle">
        <FCKeditorV2:FCKeditor ID="uiFCKeditorArComment" runat="server" BasePath="~/modules/fckeditor/" Height="300px" Width="750px">
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
                Text="Update" ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="Cancel" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        </asp:Panel>
    </div>

</asp:Content>
