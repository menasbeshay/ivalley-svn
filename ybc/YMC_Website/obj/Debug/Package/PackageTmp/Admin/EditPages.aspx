<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="EditPages.aspx.cs" Inherits="YMC_Website.Admin.EditPages" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAllPages" runat="server" Visible="true">
            <div class="ContentLeftDiv">
                <h1>
                    الصفحات الحالية
                </h1>
                <div class="Details675">                    
                    <div class="AdminMiddle" style="width: 90%">
                        <asp:GridView ID="uiGridViewPages" runat="server" AutoGenerateColumns="false"
                            AllowPaging="True" HorizontalAlign="Center" Width="100%" 
                            EmptyDataText="لا يوجد بيانات متاحة " 
                            onpageindexchanging="uiGridViewPages_PageIndexChanging" 
                            onrowcommand="uiGridViewPages_RowCommand">
                            <Columns>                                
                                <asp:BoundField DataField="TitleArabic" HeaderText="العنوان" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="EditPage">تعديل</asp:LinkButton>&nbsp;
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server" Visible="false">
            <div class="ContentLeftDiv">
                <h1>
                    تعديل الصفحات</h1>
                <div class="AdminDetails728">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle">
                        <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                            Visible="False"></asp:Label></div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    
                    <div class="AdminRight">
                        <asp:Label ID="Label2" runat="server" Text="العنوان  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxArTitle" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxArTitle" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label4" runat="server" Text="المحتوى :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        
                        <FCKeditorV2:FCKeditor ID="uiFCKeditorContent" runat="server" 
                            BasePath="~/Modules/fckeditor/" Height="500px">
                        </FCKeditorV2:FCKeditor>
                    </div>
                    <div class="clear">
                    </div>
                    
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle" style="text-align: center">
                        <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="إضافة / تعديل" 
                                ValidationGroup="EditPage" onclick="uiLinkButtonUpdate_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SmallBtn">
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="إلغاء" 
                                onclick="uiLinkButtonCancel_Click"></asp:LinkButton></div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
