<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMonthlyReport.ascx.cs" Inherits="Taqwa.Website.Admin.Controls.ucMonthlyReport" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div>
    
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
                Text="التفاصيل  :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxDetails" runat="server" ValidationGroup="UpdatePage" 
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
            &nbsp;
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
                    
                    <asp:TemplateField HeaderText="إسم الطالب ">
                    <ItemTemplate>
                        <%# Eval("ArStudentName")%>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="إسم الأب ">
                    <ItemTemplate>
                        <%# Eval("ArFatherName")%>
                    </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:BoundField DataField="Date" HeaderText="التاريخ" DataFormatString="{0:dd/MM/yyyy}" />                
                    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="uiLinkButtonEdit" runat="server" 
                                CommandArgument='<%# Eval("MonthlyReportID") %>' 
                                CommandName="EditReports">تعديل </asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("MonthlyReportID") %>' CommandName="DeleteReports" OnClientClick="return confirm('Are you want to delete this record?');">حذف </asp:LinkButton>
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
        </ContentTemplate>
</asp:UpdatePanel>
