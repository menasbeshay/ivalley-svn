<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditResults.aspx.cs" Inherits="Taqwa.Website.Admin.EditResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="AdminMain">
    <div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
            Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
        <asp:Panel ID="uiPanelCurrentStudents" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
            <div>
                <h3>
                    النتائج الحالية</h3>
            </div>
            <div>
            </div>
            <div>
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
                    <asp:Label ID="Label11" runat="server" CssClass="Label">بحث :</asp:Label>
                </div>
                <div class="AdminMiddle">
            &nbsp;<asp:TextBox ID="uiTextBoxSearchText" runat="server" Width="400px"></asp:TextBox>
                </div>
                <div class="AdminRight">
            &nbsp;<asp:Button ID="uiButtonSearch" runat="server" Text="بحث" 
                onclick="uiButtonSearch_Click" />
                </div>
                <div class="clear">
                </div>
                <asp:GridView ID="uiGridViewStudents" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" 
        onrowcommand="uiGridViewStudents_RowCommand" AllowPaging="True" 
        onpageindexchanging="uiGridViewStudents_PageIndexChanging" >
                    <AlternatingRowStyle HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField  HeaderText="إسم الطالب بالإنجليزية" DataField="ENStudentName" />                        
                        <asp:BoundField  HeaderText="إسم الأب بالإنجليزية" DataField="ENFatherName" />
                        <asp:BoundField  HeaderText="إسم الطالب بالعربية" DataField="ArStudentName" />
                        <asp:BoundField  HeaderText="إسم الأب بالعربية" DataField="ArFatherName" />
                        <asp:CheckBoxField HeaderText="نشط" DataField="IsActive" />
                        <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditResults" >إضافة / تعديل النتائج</asp:LinkButton>                                
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                    <EmptyDataTemplate>
    عفواً ، لا توجد بيانات .
    </EmptyDataTemplate>
                </asp:GridView>
                <div class="clear">
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
            <div>
                <h3>
                    تعديل نتائج الطالب</h3>
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
            <div class="clear">
            </div>
            <div class="AdminLeft" style="width: 195px">
                <asp:Label ID="Label14" runat="server" CssClass="Label" 
                Text="السنة الدراسية :"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:DropDownList ID="uiDropDownListSchoolYear" runat="server" Width="400px">
                </asp:DropDownList>
            </div>
            <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
            <div class="clear">
            </div>

            
            <div class="AdminLeft" style="width: 195px">
                <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" 
                Text="المادة :"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:DropDownList ID="uiDropDownListCourses" runat="server" Width="400px">
                </asp:DropDownList>
            </div>
            <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
            <div class="clear">
            </div>
            <div class="AdminLeft" style="width: 195px">
                <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="الدرجة :"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxGrade" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
            </div>
            <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                    runat="server" ControlToValidate="uiTextBoxGrade" Display="Dynamic" 
                    ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                    ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
            </div>
            <div class="clear">
            </div>
            <div class="AdminLeft" style="width: 195px">
                <asp:Label ID="Label1" runat="server" CssClass="Label" 
                Text="التقدير :"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxEvaluation" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
            </div>
            <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
            <div class="clear">
            </div>            
            <div class="AdminLeft" style="width: 195px">
                <asp:Label ID="Label13" runat="server" CssClass="Label" 
                Text="إختبار نصف الفصل الدراسى الأول :"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label15" runat="server" CssClass="Label" 
                    Text="إختبار نصف العام :"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" CssClass="Label" 
                    Text="إختبار نصف الفصل الدراسى الثانى :"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label16" runat="server" CssClass="Label" 
                    Text="إختبار نهاية العام :"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:RadioButtonList ID="uiRadioButtonListResult" runat="server" 
                    CellPadding="6" CellSpacing="6" BorderStyle="None" 
                    style="vertical-align:middle;">
                    <asp:ListItem Value="1" Text=" "></asp:ListItem>
                    <asp:ListItem Value="2" Text=" "></asp:ListItem>
                    <asp:ListItem Value="3" Text=" "></asp:ListItem>
                    <asp:ListItem Value="4" Text=" "></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
            <div class="clear">
            </div>
                       
            <div class="AdminLeft" style="width: 195px">
        &nbsp;
            </div>
            <div class="AdminMiddle">
                <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل " ValidationGroup="UpdatePage" Height="26px" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء " />
            </div>
            <div class="AdminRight">
                &nbsp;
                <asp:Button ID="uiButtonSelectNew" runat="server" 
                    onclick="uiButtonSelectNew_Click" Text="إختيار طالب جديد" />
            </div>
            <div class="clear">
            </div>
            <br />
             <div class="clear">
            </div>
            <asp:GridView ID="uiGridViewStudentResults" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" 
        onrowcommand="uiGridViewStudentResults_RowCommand" AllowPaging="True" 
        onpageindexchanging="uiGridViewStudentResults_PageIndexChanging" >
                    <AlternatingRowStyle HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField  HeaderText="المادة" DataField="ArCourseName" />
                        <asp:BoundField  HeaderText="الدرجة" DataField="Grade" />
                        <asp:BoundField  HeaderText="التقدير" DataField="Evaluation" />                        
                        <asp:CheckBoxField HeaderText="إختبار نصف <br />الفصل الدراسى الأول" DataField="FirstHalfMidTerm" />
                        <asp:CheckBoxField HeaderText="إختبار <br /> نصف العام" DataField="FirstHalfFinal" />
                        <asp:CheckBoxField HeaderText="إختبار نصف<br />الفل الدراسى الثانى" DataField="SecondHalfMidTerm" />
                        <asp:CheckBoxField HeaderText="إختبار <br />نهاية العام" DataField="SecondHalfFinal" />
                        <asp:BoundField  HeaderText="السنة الدراسية" DataField="ArSchoolYearName" />                        
                        <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ResultID") %>' CommandName="EditResults" >تعديل </asp:LinkButton>                                
                                &nbsp;
                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ResultID") %>' CommandName="DeleteResults" OnClientClick="return confirm('Are you want to delete this record?');">حذف </asp:LinkButton>                                
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                    <EmptyDataTemplate>
   عفواً ، لا تود بيانات.
    </EmptyDataTemplate>
                </asp:GridView>


        </asp:Panel>
    </div>

</asp:Content>
