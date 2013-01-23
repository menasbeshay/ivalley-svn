<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="YMC_Website.Departments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAllPages" runat="server" Visible="true">
            <div class="ContentLeftDiv">
                <h1>
                    قائمة الادارات
                </h1>
                <div class="Details675">
                    
                    <div class="AdminMiddle" style="width: 90%">
                        <asp:DataList ID="uiDataListDepts" runat="server" HorizontalAlign="Center" 
                            RepeatColumns="2" RepeatLayout="Flow">
                        <HeaderTemplate>
                            <div id="lastnews">
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                            <a href='Departments.aspx?did=<%# Eval("DepartementID") %>'><%# Eval("Name") %></a> </li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </ul>
                        </div>
                        </FooterTemplate>
                        </asp:DataList>                        
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server" Visible="false">
            <div class="ContentLeftDiv">
                <h1>
                    <asp:Label ID="uiLabelTitle" runat="server" ></asp:Label></h1>
                    <div class="clear"></div>
                <table border="0" cellspacing="2" cellpadding="2" valign="top" width="100%">
                    <tbody>
                        
                        <tr>
                            <td style="background-color: #DCE5EC;">
                                &nbsp;&nbsp;&nbsp;<a href="#"><font size="2" color="#000066">خطة
                                    عمل الإدارة</font></a>&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;<a href="#"><font
                                        size="2" color="#000066">انجازات</font></a>&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;<a
                                            href="#"><font size="2" color="#000066">التقارير</font></a>&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;<a href="#"><font size="2" color="#000066">محاضر
                                    الإجتماعات</font></a>&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;<a href="#"><font
                                        size="2" color="#000066">الفعاليات</font></a>&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;<a
                                            href="#"><font size="2" color="#000066">موظفي الإدارة</font></a>
                                &nbsp;-&nbsp;<a href="#"><font color="#000066" size="2">الإصدارات </font></a>&nbsp; -&nbsp;&nbsp;&nbsp;<a 
                                    href="#"><font color="#000066" size="2">الأخبار الصحفية</font></a>&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;<a 
                                    href="#"><font color="#000066" size="2">اللوائح و التعاميم</font></a>&nbsp;&nbsp; -&nbsp;
                                <a href="#"><font color="#000066" size="2">خدمات الإدارة</font></a>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
                <div class="AdminDetails728">
                   
                    <div class="AdminMiddle">
                        <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                    </div>
                    <div class="clear">
                    </div>
                    
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
