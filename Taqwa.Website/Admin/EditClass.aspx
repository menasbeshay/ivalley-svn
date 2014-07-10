<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditClass.aspx.cs" Inherits="Taqwa.Website.Admin.EditClass" %>
<%@ Register src="Controls/ucClassRooms.ascx" tagname="ucClassRooms" tagprefix="uc1" %>
<%@ Register src="Controls/ucCourses.ascx" tagname="ucCourses" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../js/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
    <link href="../css/jquery-ui-1.8.20.custom.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="AdminMain" id="Main">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear">&nbsp;</div>
<asp:Panel ID="uiPanelCurrentClasses" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<h3> الصفوف الحالية</h3>
<div>
    <asp:LinkButton ID="uiLinkButtonAdd" Font-Underline="True" runat="server" 
        onclick="uiLinkButtonAdd_Click" style="font-size:15px">إضافة صف جديد</asp:LinkButton>
    <br /><br />
</div>
<div class="AdminLeft"></div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelError" runat="server" Visible="false" ForeColor="Red" Font-Bold="true"></asp:Label>

        </div>
        <div class="AdminRight">

    
        </div>
        <div class="clear"></div>
<div>
    <asp:GridView ID="uiGridViewClasses" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewClasses_RowCommand" 
        AllowPaging="false" onpageindexchanging="uiGridViewClasses_PageIndexChanging" >   
        <AlternatingRowStyle HorizontalAlign="Center" />     
    <Columns>
    
    
    <asp:BoundField  HeaderText="الإسم " DataField="ArName" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    &nbsp;
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ClassID") %>' CommandName="EditClass" ToolTip="تعديل"><img src="../images/icons/edit.gif" /></asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="uiLinkButtonEditClassRooms" runat="server" CommandArgument='<%# Eval("ClassID") %>' CommandName="EditClassRoom" ToolTip="تعديل الفصول"><img src="../images/icons/classes.gif" /></asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="uiLinkButtonEditCourses" runat="server" CommandArgument='<%# Eval("ClassID") %>' CommandName="EditCourses" ToolTip="تعديل المواد الدراسية"><img src="../images/icons/manaheg.gif" /></asp:LinkButton>
    &nbsp;
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ClassID") %>' CommandName="DeleteClass"  OnClientClick="return confirm('Are you want to delete this record?');" ToolTip="حذف"><img src="../images/icons/delete.gif" /></asp:LinkButton>
    &nbsp;
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
    <div><h3>Edit Class</h3></div>
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMessage" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>

        <div class="AdminLeft">
            <asp:Label ID="Label1" runat="server" CssClass="Label" 
                Text="المرحلة التعليمية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:DropDownList ID="uiDropDownListClassType" runat="server" Width="400px">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
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
                Text="إضافة / تعديل " ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        </asp:Panel>
    </div>


    <asp:Panel ID="uiPanelClassRooms" runat="server" Visible="false">
        <div class="dialog-modal" id="classroomsdiag" title="تعديل الفصول">                        
            <uc1:ucClassRooms ID="ucClassRooms1" runat="server" />
        </div>

        </asp:Panel>


        <asp:Panel ID="uiPanelCourses" runat='server' Visible="false" >
        
        <div class="dialog-modal" id="Coursesdiag" title="تعديل المواد الدراسية ">                                    
            <uc2:ucCourses ID="ucCourses1" runat="server" />
        </div>
        </asp:Panel>

        <script type="text/javascript">

        // Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
         
             $('.ui-widget-overlay').remove();

             $("#classroomsdiag").dialog({             
                 modal: true,
                 width: 650,
                 open: function (type, data) { $(this).parent().appendTo("#Main"); },
                 /*close: function (event, ui) {
                     //this.html('');
                     $(this).dialog('close');
                     $('.ui-widget-overlay').remove();
                 }*/
             });

             $("#Coursesdiag").dialog({
                 modal: true,
                 width: 650,
                 open: function (type, data) { $(this).parent().appendTo("#Main"); },
                /* close: function (event, ui) {
                     //this.html('');
                      $(this).dialog('close');
                     $('.ui-widget-overlay').remove();
                 }*/
             });

         
        // });

    </script>
</asp:Content>
