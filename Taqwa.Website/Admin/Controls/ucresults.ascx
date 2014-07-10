<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucresults.ascx.cs" Inherits="Taqwa.Website.Admin.Controls.ucresults" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<div class="AdminMain" style="direction:rtl;">
    <h4>الطالب الحالى : 
                        <asp:Label ID="uiLabelStudentName" runat="server"></asp:Label> 
                        <br /> الصف : <asp:Label ID="uiLabelClass" runat="server"></asp:Label>
        <asp:HiddenField ID="uiHiddenFieldClassID" runat="server" />
                </h4>
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
            <div class="AdminLeft" style="width: 100%">
                <asp:Label ID="uiLabelError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
            <div class="clear" style="height:10px;">
            </div>    
    <asp:Repeater ID="uiRepeaterResults" runat="server" 
        onitemdatabound="uiRepeaterResults_ItemDataBound">
        <HeaderTemplate>
            <table style="width: 80%; border: 1px solid black; border-collapse: collapse;text-align:center;">
                <tr>
                    <td>
                        المادة
                    </td>
                    <td>
                        الدرجة
                    </td>
                    <td>
                        التقدير
                    </td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="uiLabelCourseName" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="uiTextBoxGrade" runat="server" Width="100"> </asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="uiDropDownListEval" runat="server">
                        <asp:ListItem Text="ضعيف جداً" />
                        <asp:ListItem Text="ضعيف " />
                        <asp:ListItem Text="جيد" />
                        <asp:ListItem Text="جيد جداً" />
                        <asp:ListItem Text="ممتاز" />
                    </asp:DropDownList>                    
                    <%--<asp:TextBox ID="uiTextBoxEvalutaion" runat="server" Width="100"> </asp:TextBox>--%>
                </td>
                <td>                    
                    <asp:HiddenField ID="uiHiddenFieldResultID" runat="server" />
                    <asp:HiddenField ID="uiHiddenFieldCourseID" runat="server" />
                    <asp:HiddenField ID="uiHiddenFieldMaxGrade" runat="server" />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
            
        </FooterTemplate>
    </asp:Repeater>
    <div class="clear" style="height: 10px;">
            </div>
            <asp:Button ID="uiButtonUpdate" runat="server" Text="تعديل / إضافة" 
        onclick="uiButtonUpdate_Click" />
    <div class="clear" style="height: 10px;">
    </div>

    <asp:GridView ID="uiGridViewStudentResults" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" AllowPaging="True" Visible="false" >
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
   عفواً ، لا توجد بيانات.
    </EmptyDataTemplate>
                </asp:GridView>
                </div>
</ContentTemplate>
</asp:UpdatePanel>