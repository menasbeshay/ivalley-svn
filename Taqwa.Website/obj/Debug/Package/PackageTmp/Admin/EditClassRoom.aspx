<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditClassRoom.aspx.cs" Inherits="Taqwa.Website.Admin.EditClassRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
<div class="AdminMain">
<asp:Panel ID="uiPanelCurrentClasses" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<div><h3>الفصول الحالية</h3></div>
<div>
    
</div>
<div>

 <div class="AdminLeft">
        <asp:Label ID="Label2" runat="server" CssClass="Label">الصف :</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClasses" runat="server" 
                AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListClasses_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft">
        
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:LinkButton ID="uiLinkButtonAdd" runat="server" 
        onclick="uiLinkButtonAdd_Click">إضافة فصل جديد</asp:LinkButton>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>

    <asp:GridView ID="uiGridViewClassRooms" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewClasses_RowCommand" 
        AllowPaging="true" 
        onpageindexchanging="uiGridViewClasses_PageIndexChanging" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="الإسم بالإنجليزية" DataField="EnName" />
    <asp:BoundField  HeaderText="الإسم بالعربية" DataField="ArName" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ClassRoomID") %>' CommandName="EditClassRoom" >تعديل</asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ClassRoomID") %>' CommandName="DeleteClassRoom"  OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
    عفواً ، لا توجد بيانات.
    </EmptyDataTemplate>
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    <div class="clear"></div>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div><h3>تعديل الفصل</h3></div>
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
