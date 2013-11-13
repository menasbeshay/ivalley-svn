<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCourses.ascx.cs" Inherits="Taqwa.Website.Admin.Controls.ucCourses" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
        
        
        <div class="AdminLeft">
        <asp:Label ID="Label5" runat="server" Text="الصف :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelClass" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
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
         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label4" runat="server" CssClass="Label" 
                Text="الإسم بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEnName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>
        </div>
         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label7" runat="server" CssClass="Label" 
                Text="الإسم  :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxArName" runat="server" ValidationGroup="UpdatePage" 
                Width="250px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>
        
        
         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label1" runat="server" CssClass="Label" 
                Text="النهاية الصغرى :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxMinGrade" runat="server" ValidationGroup="UpdatePage"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>
        
        
         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label2" runat="server" CssClass="Label" 
                Text="النهاية العظمى :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxMaxGrade" runat="server" ValidationGroup="UpdatePage"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>
        
        <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label3" runat="server" CssClass="Label" 
                Text="المادة داخل المجموع :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:CheckBox ID="uiCheckBoxInTotal" runat="server" Text=" " />
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>         

        <div class="AdminLeft" style="width: 190px">
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
        <div class="clear" style="height:20px;"></div>


        <div >
        <asp:GridView ID="uiGridViewCourses" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" width="80%"
        onrowcommand="uiGridViewCourses_RowCommand" AllowPaging="True" 
        onpageindexchanging="uiGridViewCourses_PageIndexChanging" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
        <asp:BoundField  HeaderText="الإسم " DataField="ARName" />                   
        
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("CourseID") %>' CommandName="EditCourse" >تعديل</asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CourseID") %>' CommandName="DeleteCourse"  OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
    عفواً ، لا توجد بيانات.
    </EmptyDataTemplate>
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
        </div>

        </asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>