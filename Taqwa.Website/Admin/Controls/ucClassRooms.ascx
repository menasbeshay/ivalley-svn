<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucClassRooms.ascx.cs" Inherits="Taqwa.Website.Admin.Controls.ucClassRooms" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

<asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
     <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="Label1" runat="server" Text="الصف :"></asp:Label>
        </div>
        <div class="AdminRight">
            <asp:Label ID="uiLabelClass" runat="server" ></asp:Label>
        </div>
        <div class="clear"></div>
        
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMessage" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        <div style="display:none;">
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
                ValidationGroup="UpdatePage" Enabled="false"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>
        </div>
         <div class="AdminLeft">
            <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="الإسم  :"></asp:Label>
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
        <div class="clear" style="height:20px;"></div>

        <div>
            <asp:GridView ID="uiGridViewClassRooms" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewClasses_RowCommand" 
        AllowPaging="true" width="80%"
        onpageindexchanging="uiGridViewClasses_PageIndexChanging" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    
    <asp:BoundField  HeaderText="الإسم " DataField="ArName" />
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

</ContentTemplate>
</asp:UpdatePanel>

