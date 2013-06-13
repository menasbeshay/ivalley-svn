<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditNews.aspx.cs" Inherits="Website.Admin.EditNews" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validateTextLength(oSrc, args) {
            args.IsValid = (args.Value.length <= 500);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewNews" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    الأخبار الحالية
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة خبر جديد</asp:LinkButton>
                        </div>
                        
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    
                    <div class="AdminMiddle" style="width: 100%">
                        <asp:GridView ID="uiGridViewNews" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewNews_RowCommand"
                            AllowPaging="True" OnPageIndexChanging="uiGridViewNews_PageIndexChanging" EnableModelValidation="True"
                            HorizontalAlign="Center" Width="95%">
                            <Columns>
                                <asp:BoundField DataField="ArTitle" HeaderText="العنوان " />
                                <%--<asp:BoundField DataField="CreatedDate" HeaderText="تاريخ النشر" DataFormatString="{0:dd/MM/yyyy}" />--%>
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("NewsID") %>'
                                            CommandName="EditNews">تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("NewsID") %>'
                                            CommandName="DeleteNews" OnClientClick="return confirm('هل تريد حذف هذا السجل?');">حذف</asp:LinkButton>
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
                    تعديل الأخبار الحالية</h6>
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
                        <asp:Label ID="Label3" runat="server" Text="عنوان الخبر  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxArTitle" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxArTitle" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label1" runat="server" Text="تاريخ الخبر  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="width: 75%">
                        <asp:TextBox ID="uiTextBoxDate" runat="server" ValidationGroup="EditPage" 
                            Width="300px"></asp:TextBox>
                        <asp:CalendarExtender ID="uiTextBoxDate_CalendarExtender" runat="server" DaysModeTitleFormat="dd/MM/yyyy"
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="uiTextBoxDate" TodaysDateFormat="dd/MM/yyyy">
                        </asp:CalendarExtender>
                        &nbsp;
                        <asp:Label ID="Label2" runat="server" Text="الساعة  :" CssClass="Label"></asp:Label>
                        
                        <asp:DropDownList ID="uiDropDownListHours" runat="server">
                        </asp:DropDownList>
                        :
                        <asp:DropDownList ID="uiDropDownListMins" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxDate" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                    
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label7" runat="server" Text="المختصر :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxBrief" runat="server" TextMode="MultiLine" Rows="6" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="uiTextBoxBrief"
                            Display="Dynamic" ClientValidationFunction="validateTextLength" ErrorMessage="لا يمكن كتابة أكثر من 500 حرف"
                            ValidationGroup="EditPage"></asp:CustomValidator>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label8" runat="server" Text="الصورة الرئيسية للخبر :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:FileUpload ID="uiFileUploadMainPicturePath" runat="server" />
                    </div>
                    <div class="AdminLeft">
                    </div>
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
                                OnClick="uiButtonUpdate_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SmallBtn">
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click"></asp:LinkButton></div>
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
