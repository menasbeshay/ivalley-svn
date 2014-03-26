<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditSchoolBus.aspx.cs" Inherits="Taqwa.Website.Admin.EditSchoolBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
<div class="AdminMain">
<asp:Panel ID="uiPanelCurrentSchoolBus" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<div><h3>سيارات المدرسة الحالية</h3></div>
<div>
    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" 
        onclick="uiLinkButtonAdd_Click" style="font-size:15px;">إضافة سيارة </asp:LinkButton>
</div>
<div>
    <asp:GridView ID="uiGridViewSchoolBus" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" 
        onrowcommand="uiGridViewSchoolBus_RowCommand" AllowPaging="True" 
        onpageindexchanging="uiGridViewSchoolBus_PageIndexChanging" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="إسم الخط بالإنجليزية" DataField="EnLineName" />
    <asp:BoundField  HeaderText="إسم الخط بالعربية" DataField="ArLineName" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("SchoolBusID") %>' CommandName="EditSchoolBus" >تعديل</asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("SchoolBusID") %>' CommandName="DeleteSchoolBus"  OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
        <EmptyDataTemplate>
    عفواً، لا توجد بيانات.
    </EmptyDataTemplate>
    </asp:GridView>
    <div class="clear"></div>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div><h3>تعديل سيارة المدرسة</h3></div>
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMessage" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>

        <div class="AdminLeft" style="width: 190px">
            <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" 
                Text="إسم الخط بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEnName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="uiTextBoxEnName" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 190px">
            <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="إسم الخط بالعربية ك"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxArName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="uiTextBoxArName" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 190px">
            <asp:Label ID="Label1" runat="server" CssClass="Label" 
                Text="إسم السائق بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxENDriverName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 190px">
            <asp:Label ID="Label2" runat="server" CssClass="Label" 
                Text="إسم السائق بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxARDriverName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 190px">
            <asp:Label ID="Label3" runat="server" CssClass="Label" 
                Text="رقم تليفون السائق :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxDriverTele" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage=" أرقام فقط"
                    ValidationGroup="UpdatePage" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxDriverTele"
                    ForeColor="#ff0000" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 190px">
            <asp:Label ID="Label4" runat="server" CssClass="Label" 
                Text="إسم المشرف بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxENSupName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 190px">
            <asp:Label ID="Label5" runat="server" CssClass="Label" 
                Text="إسم المشرف بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxARSupName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 190px">
            <asp:Label ID="Label6" runat="server" CssClass="Label" 
                Text="رقم تليفون المشرف : "></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxSupTele" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" 
                runat="server" ControlToValidate="uiTextBoxSupTele" Display="Dynamic" 
                ErrorMessage="أرقام فقط " ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
        </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 190px">
            <asp:Label ID="Label7" runat="server" CssClass="Label" 
                Text="ملاحظات بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxENNotes" runat="server" ValidationGroup="UpdatePage" 
                Width="400px" Height="84px" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 190px">
            <asp:Label ID="Label8" runat="server" CssClass="Label" 
                Text="ملاحظات بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxARNotes" runat="server" ValidationGroup="UpdatePage" 
                Width="400px" Height="84px" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

        <div class="AdminLeft" style="width: 190px">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل :" ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء :" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        </asp:Panel>
    </div>
</asp:Content>
