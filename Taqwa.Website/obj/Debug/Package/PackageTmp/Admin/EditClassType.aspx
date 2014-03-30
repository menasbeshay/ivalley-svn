<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditClassType.aspx.cs" Inherits="Taqwa.Website.Admin.Edit_ClassType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="../js/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
    <link href="../css/jquery-ui-1.8.20.custom.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminMain">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
<asp:Panel ID="uiPanelCurrentClassType" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<h3> المراحل التعليمية الحالية</h3>
<div>
    <asp:LinkButton ID="uiLinkButtonAdd" Font-Underline="True" runat="server" 
        onclick="uiLinkButtonAdd_Click" style="font-size:15px;">إضافة مرحلة تعليمية جديدة</asp:LinkButton>
    <br />
</div>
<div>
    <asp:GridView ID="uiGridViewClassType" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewClassType_RowCommand" 
        AllowPaging="true" onpageindexchanging="uiGridViewClassType_PageIndexChanging" Visible="false">   
        <AlternatingRowStyle HorizontalAlign="Center" />     
    <Columns>
    
    <asp:BoundField  HeaderText="الإسم بالإنجليزية" DataField="EnName" />
    <asp:BoundField  HeaderText="الإسم بالعربية" DataField="ArName" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    &nbsp;
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ClassTypeID") %>' CommandName="EditClassType" >تعديل</asp:LinkButton>
    &nbsp;&nbsp;
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ClassTypeID") %>' CommandName="DeleteClassType"  OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
    &nbsp;
    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
    عفواً ، لا توجد بيانات.
    </EmptyDataTemplate>
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>

    <asp:DataList ID="uiDataListClasses" runat="server" HorizontalAlign="Center" DataKeyField="ClassTypeID"
        oncancelcommand="uiDataListClasses_CancelCommand" 
        oneditcommand="uiDataListClasses_EditCommand" RepeatColumns="5" 
        RepeatDirection="Horizontal" RepeatLayout="Flow" Width="100%" 
        ondeletecommand="uiDataListClasses_DeleteCommand" 
        onupdatecommand="uiDataListClasses_UpdateCommand" >
    <ItemTemplate>
    <div style="width:18%;margin:5px;padding:15px;float:right;text-align:center;background-color:#cfcfcf;border:1px solid black;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;">
   

    <div style="float:right;top:0px;right:0px;width:20px;">
      <asp:LinkButton id="EditButton"
                 CommandName="Edit"
                 runat="server">
<img src="../images/icons/Pencil.png" title="تعديل"/>
      </asp:LinkButton>
    </div>

    <div style="float:right;top:0px;right:55px;width:20px;">
      <asp:LinkButton id="uiLinkButtonDelete" 
                 CommandName="Delete"
                 runat="server" OnClientClick="return confirm('Are you want to delete this record?');">
<img src="../images/icons/Delete.png" title="حذف"/>
      </asp:LinkButton>
    </div>

    <div class="clear"></div>
     <%# Eval("ArName")%>
    </div>
    </ItemTemplate>
    <EditItemTemplate>
    <div style="width:18%;margin:5px;padding:15px;float:right;text-align:center;background-color:#cfcfcf;border:1px solid black;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;">
       
    

    <div style="float:right;top:0px;right:0px;width:20px;">
      <asp:LinkButton id="updateButton"                  
                 CommandName="Update"
                 runat="server">
                 <img src="../images/icons/Save.png" title="حفظ"/>
      </asp:LinkButton>
    </div>

    <div style="float:right;top:0px;right:55px;width:20px;">
      <asp:LinkButton id="uiLinkButtonCancel"
                 CommandName="Cancel"
                 runat="server">
<img src="../images/icons/Delete.png" title="إلغاء"/>
      </asp:LinkButton>
    </div>
    <div class="clear"></div>
     <asp:TextBox ID="uiTextBoxArName" runat="server" Text='<%# Eval("ArName")%>'></asp:TextBox>
    </div>
    </EditItemTemplate>
    </asp:DataList>
    <div class="clear"></div>

    
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div><h3>تعديل المرحلة التعليمية</h3></div>
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
                Text="إضافة / حذف" ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        </asp:Panel>
    </div>

</asp:Content>
