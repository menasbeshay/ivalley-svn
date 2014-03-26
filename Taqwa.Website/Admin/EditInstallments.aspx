<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditInstallments.aspx.cs" Inherits="Taqwa.Website.Admin.EditInstallments" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
<asp:Panel ID="uiPanelCurrentInstallments" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<div class="AdminLeft">

                <asp:Label ID="Label14" runat="server" CssClass="Label" 
                Text="السنة الدراسية :"></asp:Label>
            </div>
            <div class="AdminMiddle">
                &nbsp;<asp:DropDownList ID="uiDropDownListSchoolYear" runat="server" 
                    Width="400px">
                </asp:DropDownList>
            </div>
            <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
            <div class="clear">
            </div>
            <div class="AdminLeft">
                    <asp:Label ID="Label9" runat="server" CssClass="Label">الصف :</asp:Label>
                </div>
                <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClasses" runat="server" 
                AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListClasses_SelectedIndexChanged" Width="400px">
                    </asp:DropDownList>
                </div>
                <div class="AdminRight">
            &nbsp;</div>
                <div class="clear">
                </div>
                <div class="AdminLeft">
                    <asp:Label ID="Label10" runat="server" CssClass="Label">الفصل :</asp:Label>
                </div>
                <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClassRooms" runat="server" Width="400px">
                    </asp:DropDownList>
                </div>
                <div class="AdminRight">
            &nbsp;</div>
                <div class="clear">
                </div>
                 <div class="AdminLeft">
                     <asp:Label ID="Label15" runat="server" CssClass="Label" Text="بحث :"></asp:Label>
                </div>
                <div class="AdminMiddle">
            &nbsp;<asp:TextBox ID="uiTextBoxSearchText" runat="server" Width="400px"></asp:TextBox>
                    &nbsp;<asp:Button ID="uiButtonSearch" runat="server" Text="بحث " 
                        onclick="uiButtonSearch_Click" />
                </div>
                <div class="AdminRight">
            &nbsp;</div>
                <div class="clear">
                </div>
            
<h3> الطلاب الحاليين</h3>
<div>
    <br />
    <asp:GridView ID="uiGridViewStudents" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="1" CellSpacing="3" 
        onpageindexchanging="uiGridViewStudents_PageIndexChanging" 
        onrowcommand="uiGridViewStudents_RowCommand">
        <AlternatingRowStyle HorizontalAlign="Center" />
        <Columns>
            <asp:BoundField DataField="ENStudentName" HeaderText="إسم الطالب بالإنجليزية" />
            <asp:BoundField DataField="ENFatherName" HeaderText="إسم الأب بالإنجليزية" />
            <asp:BoundField DataField="ArStudentName" HeaderText="إسم الطالب بالعربية" />
            <asp:BoundField DataField="ArFatherName" HeaderText="إسم الأب بالعربية" />
            <asp:CheckBoxField DataField="IsActive" HeaderText="نشط" />
            <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" 
                        CommandArgument='<%# Eval("StudentID") %>' CommandName="EditInstallments">إضافة / تعديل الأقساط</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle HorizontalAlign="Center" />
        <EmptyDataTemplate>
            عفوا ، لا توجد بيانات.
        </EmptyDataTemplate>
    </asp:GridView>
    <br /><br />
</div>
<div>
    <div class="clear"></div>
    </div>
    </asp:Panel>

     <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div><h3>تعديل المصروفات الدراسية للطالب</h3>
    
    <h4>الطالب الحالى : 
                        <asp:Label ID="uiLabelStudentName" runat="server"></asp:Label> 
                        <br /> الصف : <asp:Label ID="uiLabelClass" runat="server"></asp:Label>
    </h4>
    </div>
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMessage" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>

        <div class="AdminLeft" style="width: 250px">
            <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" 
                Text="القيمة :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxQty" runat="server" ValidationGroup="UpdatePage" 
                Width="150px">0</asp:TextBox>
        </div>
        <div class="AdminRight">

            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                runat="server" ControlToValidate="uiTextBoxQty" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>

        </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 250px">
             <asp:Label ID="Label16" runat="server" CssClass="Label" Text="التاريخ :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxDate" runat="server" ValidationGroup="UpdatePage" 
                Width="150px"></asp:TextBox>
            <cc1:CalendarExtender ID="uiTextBoxDate_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="uiTextBoxDate" Format="dd/MM/yyyy">
            </cc1:CalendarExtender>
        </div>
        <div class="AdminRight">
           
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 250px">
             <asp:Label ID="Label1" runat="server" CssClass="Label" Text="رقم الإيصال :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxPayOrderNo" runat="server" ValidationGroup="UpdatePage" 
                Width="150px"></asp:TextBox>            
        </div>
        <div class="AdminRight">
           
            &nbsp;</div>
        <div class="clear"></div>
        
        <div class="AdminLeft" style="width: 250px;">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل " ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء " />
        </div>
        <div class="AdminRight">
            &nbsp;<asp:Button ID="uiButtonNewStudent" runat="server" 
                Text="إختيار طالب جديد" onclick="uiButtonNewStudent_Click" />
        </div>
        <div class="clear"></div>
        <br />

        <div>
            <asp:GridView ID="uiGridViewStudentsInstallments" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="1" CellSpacing="3" 
                onpageindexchanging="uiGridViewStudentsInstallments_PageIndexChanging" 
                onrowcommand="uiGridViewStudentsInstallments_RowCommand">
                <AlternatingRowStyle HorizontalAlign="Center" />
                <Columns>
                    <asp:BoundField DataField="ENStudentName" HeaderText="إسم الطالب بالإنجليزية" />
                    <asp:BoundField DataField="ENFatherName" HeaderText="إسم الأب بالإنجليزية" />
                    <asp:BoundField DataField="ArStudentName" HeaderText="إسم الطالب بالعربية" />
                    <asp:BoundField DataField="ArFatherName" HeaderText="إسم الأب بالعربية" />
                    <asp:BoundField DataField="Quantity" HeaderText="القيمة" />
                    <asp:BoundField DataField="Date" HeaderText="التاريخ" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="uiLinkButtonEdit" runat="server" 
                                CommandArgument='<%# Eval("InstallmentID") %>' 
                                CommandName="EditInstallment">تعديل القسط</asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("InstallmentID") %>' CommandName="DeleteInstallment" OnClientClick="return confirm('Are you want to delete this record?');">حذف القسط</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    No records founded.
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        </asp:Panel>

</div>
</asp:Content>
