<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditQuotes.aspx.cs" Inherits="Website.Admin.EditQuotes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewQuotes" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    أقوال الأنبا إرميا
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة جديد</asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminMiddle" style="width: 100%">
                        <asp:GridView ID="uiGridViewQuotes" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewQuotes_RowCommand"
                            AllowPaging="True" OnPageIndexChanging="uiGridViewQuotes_PageIndexChanging" EnableModelValidation="True"
                            HorizontalAlign="Center" Width="95%">
                            <Columns>                                
                                <asp:TemplateField HeaderText="المحتوى">
                                    <ItemTemplate>
                                    <%# Server.HtmlDecode(Eval("ArContent").ToString()) %>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                <asp:BoundField DataField="PostedDate" HeaderText="تاريخ النشر" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("QuotesID") %>'
                                            CommandName="EditQuotes">تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("QuotesID") %>'
                                            CommandName="DeleteQuotes" OnClientClick="return confirm('هل تريد حذف هذا السجل?');">حذف</asp:LinkButton>
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
        <asp:Panel ID="uiPanelEdit" runat="server">
            <div class="ContentLeftDiv">
                <h6>
                    تعديل الأقوال الحالية</h6>
                <div class="AdminDetails728">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle">
                        <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                            Visible="False"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>                    
                    
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label8" runat="server" Text="الصورة الرئيسية  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:FileUpload ID="uiFileUploadMainPicturePath" runat="server" />
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight">
                        التاريخ
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxDate" runat="server" ValidationGroup="UpdateReadings" Columns="50"></asp:TextBox>
                        <asp:CalendarExtender ID="uiTextBoxDate_CalendarExtender" runat="server" DaysModeTitleFormat="dd/MM/yyyy"
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="uiTextBoxDate" TodaysDateFormat="dd/MM/yyyy">
                        </asp:CalendarExtender>
                    </div>
                    <div style="margin-top: 8px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                            ControlToValidate="uiTextBoxDate" ForeColor="#C76E1F" ValidationGroup="UpdateReadings"></asp:RequiredFieldValidator></div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label5" runat="server" Text="المحتوى  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <telerik:radeditor id="uiRadEditorPageContent" runat="server" cssclass="">
                                <Content>
                                </Content>
                                <ImageManager UploadPaths="~/UploadedFiles/Images" ViewPaths="~/UploadedFiles/Images" />
                                <DocumentManager UploadPaths="~/UploadedFiles/Docs" ViewPaths="~/UploadedFiles/Docs" />
                                <FlashManager UploadPaths="~/UploadedFiles/Flash" ViewPaths="~/UploadedFiles/Flash" />
                                <MediaManager UploadPaths="~/UploadedFiles/Media" ViewPaths="~/UploadedFiles/Media" />
                                <TemplateManager UploadPaths="~/UploadedFiles/Templates" ViewPaths="~/UploadedFiles/Templates" />
                                <CssFiles>
                                <telerik:EditorCssFile Value="~/css/RadEditor.css" />
                                </CssFiles>
                            </telerik:radeditor>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                    </div>
                    <div class="AdminMiddle" style="text-align: center">
                        <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                                OnClick="uiLinkButtonUpdateReadings_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SmallBtn">
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="إلغاء" 
                                OnClick="uiLinkButtonCancelReadings_Click"></asp:LinkButton></div>
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
