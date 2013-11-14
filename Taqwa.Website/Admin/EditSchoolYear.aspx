<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditSchoolYear.aspx.cs" Inherits="Taqwa.Website.Admin.EditSchoolYear" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminMain">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
<asp:Panel ID="uiPanelCurrentSchoolYear" runat="server" Visible= "true"  style="direction:rtl;padding-right:20px;">
<h3> السنوات الدراسية الحالية</h3>
<div>
    <asp:LinkButton ID="uiLinkButtonAdd" Font-Underline="True" runat="server" 
        onclick="uiLinkButtonAdd_Click" style="font-size:15px;">إضافة سنة دراسية جديدة</asp:LinkButton>
    <br /><br />
</div>
<div>
    <asp:GridView ID="uiGridViewSchoolYears" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewSchoolYears_RowCommand" 
        AllowPaging="true" 
        onpageindexchanging="uiGridViewSchoolYears_PageIndexChanging" >   
        <AlternatingRowStyle HorizontalAlign="Center" />     
    <Columns>

    <asp:BoundField  HeaderText="الإسم بالإنجليزية " DataField="EnName" />
    <asp:BoundField  HeaderText="الإسم بالعربية" DataField="ArName" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    &nbsp;
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("SchoolYearID") %>' CommandName="EditSchoolYear" ToolTip="تعديل" ><img src="../images/icons/edit.gif" /></asp:LinkButton>
    &nbsp;&nbsp;
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("SchoolYearID") %>' CommandName="DeleteSchoolYear"  OnClientClick="return confirm('Are you want to delete this record?');" ToolTip="حذف"><img src="../images/icons/delete.gif" /></asp:LinkButton>
    &nbsp;
    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
        <EmptyDataTemplate>
    عفواً ، لا توجد بيانات.
    </EmptyDataTemplate>
    </asp:GridView>
    <div class="clear"></div>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;" >
    <div><h3>تعديل السنة الدراسية</h3></div>
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
            <asp:Label ID="Label1" runat="server" CssClass="Label" 
                Text="السنة الحالية:"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:CheckBox ID="uiCheckBoxCurrentYear" runat="server" />
        </div>
        <div class="AdminRight">
           
        </div>
        <div class="clear"></div>
        
        <div class="AdminLeft">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل" ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="Cancel" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        </asp:Panel>
    </div>

</asp:Content>
