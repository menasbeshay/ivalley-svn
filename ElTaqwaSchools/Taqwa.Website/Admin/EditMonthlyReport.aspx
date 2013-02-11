<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditMonthlyReport.aspx.cs" Inherits="Taqwa.Website.Admin.EditMonthlyReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<asp:Panel ID="uiPanelCurrentStudents" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<div class="AdminLeft">

            </div>
            <div class="AdminMiddle">
                &nbsp;</div>
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
                    &nbsp;<asp:Button ID="uiButtonSearch" runat="server" Text="بحث" 
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
                        CommandArgument='<%# Eval("StudentID") %>' CommandName="EditReports">إضافة / تعديل التقرير الشهرى</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle HorizontalAlign="Center" />
        <EmptyDataTemplate>
           عفواً ، لا توجد بيانات .
        </EmptyDataTemplate>
    </asp:GridView>
    <br /><br />
</div>
<div>
    <div class="clear"></div>
    </div>
    </asp:Panel>

     <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div><h3>تعديل التقرير الشهرى للطالب</h3>
    
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

        <div class="AdminLeft" style="width: 150px">
            <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" 
                Text="السنة :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:DropDownList ID="uiDropDownListYear" runat="server" Width="80px">
                <asp:ListItem>2000</asp:ListItem>
                <asp:ListItem>2001</asp:ListItem>
                <asp:ListItem>2002</asp:ListItem>
                <asp:ListItem>2003</asp:ListItem>
                <asp:ListItem>2004</asp:ListItem>
                <asp:ListItem>2005</asp:ListItem>
                <asp:ListItem>2006</asp:ListItem>
                <asp:ListItem>2007</asp:ListItem>
                <asp:ListItem>2008</asp:ListItem>
                <asp:ListItem>2009</asp:ListItem>
                <asp:ListItem>2010</asp:ListItem>
                <asp:ListItem>2011</asp:ListItem>
                <asp:ListItem>2012</asp:ListItem>
                <asp:ListItem>2013</asp:ListItem>
                <asp:ListItem>2014</asp:ListItem>
                <asp:ListItem>2015</asp:ListItem>
                <asp:ListItem>2016</asp:ListItem>
                <asp:ListItem>2017</asp:ListItem>
                <asp:ListItem>2018</asp:ListItem>
                <asp:ListItem>2019</asp:ListItem>
                <asp:ListItem>2020</asp:ListItem>
                <asp:ListItem>2021</asp:ListItem>
                <asp:ListItem>2022</asp:ListItem>
                <asp:ListItem>2023</asp:ListItem>
                <asp:ListItem>2024</asp:ListItem>
                <asp:ListItem>2025</asp:ListItem>
                <asp:ListItem>2026</asp:ListItem>
                <asp:ListItem>2027</asp:ListItem>
                <asp:ListItem>2028</asp:ListItem>
                <asp:ListItem>2029</asp:ListItem>
                <asp:ListItem>2030</asp:ListItem>
                <asp:ListItem>2031</asp:ListItem>
                <asp:ListItem>2032</asp:ListItem>
                <asp:ListItem>2033</asp:ListItem>
                <asp:ListItem>2034</asp:ListItem>
                <asp:ListItem>2035</asp:ListItem>
                <asp:ListItem>2036</asp:ListItem>
                <asp:ListItem>2037</asp:ListItem>
                <asp:ListItem>2038</asp:ListItem>
                <asp:ListItem>2039</asp:ListItem>
                <asp:ListItem>2040</asp:ListItem>                
            </asp:DropDownList>
        </div>
        <div class="AdminRight">

            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 150px">
            <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="الشهر :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:DropDownList ID="uiDropDownListMonth" runat="server" Width="80px">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
           
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 150px">
            <asp:Label ID="Label1" runat="server" CssClass="Label" 
                Text="التفاصيل بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxArDetails" runat="server" ValidationGroup="UpdatePage" 
                Width="400px" Height="100px" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="AdminRight">
           
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 150px">
            <asp:Label ID="Label2" runat="server" CssClass="Label" 
                Text="التفاصيل بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEnDetails" runat="server" ValidationGroup="UpdatePage" 
                Width="400px" Height="100px" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="AdminRight">
           
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 250px">
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
       <div class="AdminLeft" style="width: 150px;">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل" ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء" />
        </div>
        <div class="AdminRight">
            &nbsp;<asp:Button ID="uiButtonNewStudent" runat="server" 
                Text="إختيار طالب جديد" onclick="uiButtonNewStudent_Click" />
        </div>
        <div class="clear"></div>
        <br />

        <div>
            <asp:GridView ID="uiGridViewStudentsReports" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="1" CellSpacing="3" 
                onpageindexchanging="uiGridViewStudentsReports_PageIndexChanging" 
                onrowcommand="uiGridViewStudentsReports_RowCommand" Width="95%">
                <AlternatingRowStyle HorizontalAlign="Center" />
                <Columns>                    
                    <asp:TemplateField HeaderText="إسم الطالب بالإنجليزية">
                    <ItemTemplate>
                        <%# Eval("ENStudentName") %>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="إسم الأب بالإنجليزية">
                    <ItemTemplate>
                        <%# Eval("ENFatherName")%>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="إسم الطالب بالعربية">
                    <ItemTemplate>
                        <%# Eval("ArStudentName")%>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="إسم الأب بالعربية">
                    <ItemTemplate>
                        <%# Eval("ArFatherName")%>
                    </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:BoundField DataField="Date" HeaderText="التاريخ" DataFormatString="{0:dd/MM/yyyy}" />                
                    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="uiLinkButtonEdit" runat="server" 
                                CommandArgument='<%# Eval("MonthlyReportID") %>' 
                                CommandName="EditReports">تعديل التقرير الشهرى</asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("MonthlyReportID") %>' CommandName="DeleteReports" OnClientClick="return confirm('Are you want to delete this record?');">حذف التقرير الشهرى</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    عفواً ، لا توجد بيانات.
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        </asp:Panel>

</div>
</asp:Content>
