<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditPageContent.aspx.cs" Inherits="Taqwa.Website.Admin.EditPageContent" %>
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
<asp:Panel ID="uiPanelCurrentPages" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<div><h3>الصفحات الحالية</h3></div>
<div>
    <asp:GridView ID="uiGridViewPages" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewPages_RowCommand" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="العنزان بالإنجليزية" DataField="EnPageTitle" />
    <asp:BoundField  HeaderText="العنوان بالعربية" DataField="ArPageTitle" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("PageID") %>' CommandName="EditPage" ToolTip="تعديل" ><img src="../images/icons/edit.gif" /></asp:LinkButton>

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
    <div><h3>تعديل الصفحة</h3></div>
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
                Text="عنوان الصفحة بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEnPageTitle" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="uiTextBoxEnPageTitle" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

         <div class="AdminLeft">
            <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="عنوان الصفحة بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxArPageTitle" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="uiTextBoxArPageTitle" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
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
                Text="تعديل " ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                style="height: 26px" Text="إلغاء" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        </asp:Panel>
    </div>

</asp:Content>
