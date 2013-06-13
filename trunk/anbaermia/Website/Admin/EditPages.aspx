<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditPages.aspx.cs" Inherits="Website.Admin.EditPages" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $('#tabs').tabs();
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAllPages" runat="server" Visible="true">
            <div class="ContentLeftDiv">
                <h1>
                    الصفحات الحالية
                </h1>
                <div class="Details675">
                    
                    <div class="AdminMiddle" style="width: 90%">
                        <asp:GridView ID="uiGridViewPages" runat="server" AutoGenerateColumns="false" OnRowCommand="uiGridViewPages_RowCommand"
                             HorizontalAlign="Center" Width="100%" >
                            <Columns>                                
                                <asp:BoundField DataField="ArTitle" HeaderText="العنوان " />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("PageID") %>'
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
        <asp:Panel ID="uiPanelEdit" runat="server" Visible="true">
            <div class="ContentLeftDiv">
                <h6>
                    تعديل الصفحات</h6>
            <div id="tabs" >
                <ul>
                    <li><a href="#tabs-1">المحتوى</a></li>
                    <li><a href="#tabs-2">ملفات متعلقة</a></li>
                    <li><a href="#tabs-3">فيديوهات متعلقة</a></li>                    
                    <li><a href="#tabs-4">مقالات متعلقة</a></li>
                    <li><a href="#tabs-5">صور متعلقة</a></li>
                </ul>
                <div id="tabs-1">
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
                            <asp:Label ID="Label3" runat="server" Text="الصورة الرئيسية للصفحة  :" CssClass="Label"></asp:Label>
                        </div>
                        <div class="AdminMiddle">
                            <asp:FileUpload ID="uiFileUploadMainImage" runat="server" />
                        </div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear">
                        </div>
                        <div class="AdminRight">
                            <asp:Label ID="Label5" runat="server" Text="المحتوى  :" CssClass="Label"></asp:Label>
                        </div>
                        <div class="AdminMiddle">
                        </div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear">
                        </div>
                        <div class="AdminMiddle" style="width: 95%">
                            <telerik:RadEditor ID="uiRadEditorPageContent" runat="server" CssClass="">
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
                            </telerik:RadEditor>
                        </div>
                        <div class="AdminRight">
                            <asp:Label ID="Label1" runat="server" Text="نوع محتوى الصفحة  :" CssClass="Label"></asp:Label>
                        </div>
                        <div class="AdminMiddle">
                            <asp:CheckBoxList ID="uiCheckBoxListPageType" runat="server" CellPadding="10" 
                                CellSpacing="2" RepeatColumns="2" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">عرض المحتوى</asp:ListItem>
                                <asp:ListItem Value="1">عرض الفيديوهات المتعلقة</asp:ListItem>
                                <asp:ListItem Value="2">عرض الملفات المتعلقة</asp:ListItem>
                                <asp:ListItem Value="3">عرض المقالات المتعلقة</asp:ListItem>
                                <asp:ListItem Value="4">عرض الصور المتعلقة</asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear">
                        </div>                        
                        <div class="AdminRight">
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
                <div id="tabs-2">
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanelFiles">
                        <ProgressTemplate>
                            <div style="background-color: transparent; z-index: 10000; text-align: center; position: absolute;
                                width: 95%; height: 70%; -ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=70);
                                filter: alpha(opacity=70); -moz-opacity: 0.7 -khtml-opacity: 0.7; opacity: 0.7;
                                background-color: #fff;">
                                <div style="height: 30%;">
                                    &nbsp;</div>
                                <div style="-ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100); filter: alpha(opacity=100);
                                    -moz-opacity: 1; -khtml-opacity: 1; opacity: 1;">
                                    <img src="../images/ajax-loader.gif" style="vertical-align: middle;" />
                                </div>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanelFiles" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="uiPanelAllFiles" runat="server">
                                <div class="ContentLeftDiv">
                                    <h1>
                                        الملفات الحالية
                                    </h1>
                                    <div class="Details675">
                                        <div class="AdminRight">
                                            <asp:Label ID="Label20" runat="server" Text="قسم :" CssClass="Label"></asp:Label>
                                        </div>
                                        <div class="AdminMiddle" style="width: 30%">
                                            <asp:DropDownList ID="uiDropDownListAllCategories" runat="server" OnSelectedIndexChanged="uiDropDownListAllCategories_SelectedIndexChanged"
                                                Width="200px" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <div class="AdminRight">
                                            <asp:Label ID="Label21" runat="server" Text="القسم الفرعى :" CssClass="Label"></asp:Label>
                                        </div>
                                        <div class="AdminMiddle" style="width: 30%">
                                            <asp:DropDownList ID="uiDropDownListsubCats" runat="server" OnSelectedIndexChanged="uiDropDownListsubCats_SelectedIndexChanged"
                                                Width="200px" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminLeft">
                                            <div class="AdminMore" style="width: 150px">
                                                <asp:LinkButton ID="uiLinkButtonAddFiles" runat="server" OnClick="uiLinkButtonAddFiles_Click">إضافة ملف جديد</asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <div class="AdminMiddle" style="width: 90%">
                                            <asp:GridView ID="uiGridViewFiles" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewFiles_RowCommand"
                                                EnableModelValidation="True" AllowPaging="True" HorizontalAlign="Center" Width="100%"
                                                OnPageIndexChanging="uiGridViewFiles_PageIndexChanging">
                                                <Columns>
                                                    <asp:BoundField DataField="ArTitle" HeaderText="الإسم " />
                                                    <asp:TemplateField HeaderText="إجراءات">
                                                        <ItemTemplate>                 
                                                            <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("RelatedContentID") %>'
                                                                CommandName="EditFile">تعديل</asp:LinkButton>&nbsp;                                          
                                                            <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("RelatedContentID") %>'
                                                                CommandName="DeleteFile" OnClientClick="return confirm('هل تريد حذف هذا الملف?');">حذف</asp:LinkButton>
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
                            <asp:Panel ID="uiPanelEditFiles" runat="server">
                                <div class="ContentLeftDiv">
                                    <h6>
                                        إضافة ملف</h6>
                                    <div class="AdminDetails728">
                                        <div class="AdminRight" style="width: 120px">
                                        </div>
                                        <div class="AdminMiddle">
                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى."
                                                Visible="False"></asp:Label>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                            <asp:Label ID="Label8" runat="server" Text="الإسم  : " CssClass="Label"></asp:Label>
                                        </div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxFileName" runat="server" ValidationGroup="EditFile" Width="350px"></asp:TextBox>
                                        </div>
                                        <div class="AdminLeft">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                                ControlToValidate="uiTextBoxFileName" Display="Dynamic" ValidationGroup="EditFile"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                            <asp:Label ID="Label10" runat="server" Text="الملف :" CssClass="Label"></asp:Label>
                                        </div>
                                        <div class="AdminMiddle">                                            
                                            <asp:AsyncFileUpload ID="uiFileUploadFiles" runat="server" 
                                                onuploadedcomplete="uiFileUploadFiles_UploadedComplete" />
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                            <asp:Label ID="Label12" runat="server" Text="الوصف :" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxDescFile" runat="server" ValidationGroup="EditFile" TextMode="MultiLine"
                                                Height="70px" Width="400px"></asp:TextBox>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                        </div>
                                        <div class="AdminMiddle" style="text-align: center;">
                                            <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditVideo"
                            OnClick="uiButtonUpdate_Click" />--%>
                                            <div class="SearchBtn">
                                                <asp:LinkButton ID="uiLinkButtonUpdateFile" runat="server" Text="إضافة / تعديل" ValidationGroup="EditFile"
                                                    OnClick="uiLinkButtonUpdateFile_Click"></asp:LinkButton></div>
                                            &nbsp; &nbsp; &nbsp;
                                            <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                                            <div class="SmallBtn">
                                                <asp:LinkButton ID="uiLinkButtonCancelFile" runat="server" Text="إلغاء" OnClick="uiLinkButtonCancelFile_Click"></asp:LinkButton></div>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                        
                    </asp:UpdatePanel>
                </div>
                <div id="tabs-3">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="uiUpdatepanelVideos">
                        <ProgressTemplate>
                            <div style="background-color: transparent; z-index: 10000; text-align: center; position: absolute;
                                width: 95%; height: 70%; -ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=70);
                                filter: alpha(opacity=70); -moz-opacity: 0.7 -khtml-opacity: 0.7; opacity: 0.7;
                                background-color: #fff;">
                                <div style="height: 30%;">
                                    &nbsp;</div>
                                <div style="-ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100); filter: alpha(opacity=100);
                                    -moz-opacity: 1; -khtml-opacity: 1; opacity: 1;">
                                    <img src="../images/ajax-loader.gif" style="vertical-align: middle;" />
                                </div>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="uiUpdatepanelVideos" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="uiPanelViewAllVideos" runat="server">
                                <div class="ContentLeftDiv">
                                    <h1>
                                        الفيديوهات الحالية
                                    </h1>
                                    <div class="Details675">
                                        <div class="AdminRight">
                                        </div>
                                        <div class="AdminMiddle">
                                            <div class="AdminMore" style="width: 150px">
                                                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة فيديو جديد</asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <div class="AdminMiddle" style="width: 90%">
                                            <asp:GridView ID="uiGridViewVideos" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewVideos_RowCommand"
                                                EnableModelValidation="True" AllowPaging="True" HorizontalAlign="Center" Width="100%"
                                                OnPageIndexChanging="uiGridViewVideos_PageIndexChanging">
                                                <Columns>
                                                    <asp:BoundField DataField="ArTitle" HeaderText="الإسم " />
                                                    <asp:TemplateField HeaderText="إجراءات">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("RelatedContentID") %>'
                                                                CommandName="EditVideo">تعديل</asp:LinkButton>&nbsp;
                                                            <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("RelatedContentID") %>'
                                                                CommandName="DeleteVideo" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
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
                            <asp:Panel ID="uiPanelEditVideos" runat="server">
                                <div class="ContentLeftDiv">
                                    <h6>
                                        تعديل فيديو</h6>
                                    <div class="AdminDetails728">
                                        <div class="AdminRight" style="width: 120px">
                                        </div>
                                        <div class="AdminMiddle">
                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى."
                                                Visible="False"></asp:Label>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                            <asp:Label ID="Label6" runat="server" Text="الإسم  : " CssClass="Label"></asp:Label>
                                        </div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="EditVideo" Width="350px"></asp:TextBox>
                                        </div>
                                        <div class="AdminLeft">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                                ControlToValidate="uiTextBoxName" Display="Dynamic" ValidationGroup="EditVideo"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                            <asp:Label ID="Label9" runat="server" Text="الرابط :" CssClass="Label"></asp:Label>
                                        </div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxURL" runat="server" ValidationGroup="EditVideo" Width="350px"></asp:TextBox>
                                            <br />
                                        </div>
                                        <div class="AdminLeft">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                                ControlToValidate="uiTextBoxURL" Display="Dynamic" ValidationGroup="EditVideo"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                            <asp:Label ID="Label11" runat="server" Text="الوصف :" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxArDesc" runat="server" ValidationGroup="EditVideo" TextMode="MultiLine"
                                                Height="70px" Width="400px"></asp:TextBox>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                        </div>
                                        <div class="AdminMiddle" style="text-align: center;">
                                            <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditVideo"
                            OnClick="uiButtonUpdate_Click" />--%>
                                            <div class="SearchBtn">
                                                <asp:LinkButton ID="uiLinkButtonUpdateVideo" runat="server" Text="إضافة / تعديل"
                                                    ValidationGroup="EditVideo" OnClick="uiLinkButtonUpdateVideo_Click"></asp:LinkButton></div>
                                            &nbsp; &nbsp; &nbsp;
                                            <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                                            <div class="SmallBtn">
                                                <asp:LinkButton ID="uiLinkButtonCancelVideo" runat="server" Text="إلغاء" OnClick="uiLinkButtonCancelVideo_Click"></asp:LinkButton></div>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div id="tabs-4">
                    <asp:UpdateProgress ID="UpdateProgress3" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanelFiles">
                        <ProgressTemplate>
                            <div style="background-color: transparent; z-index: 10000; text-align: center; position: absolute;
                                width: 95%; height: 70%; -ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=70);
                                filter: alpha(opacity=70); -moz-opacity: 0.7 -khtml-opacity: 0.7; opacity: 0.7;
                                background-color: #fff;">
                                <div style="height: 30%;">
                                    &nbsp;</div>
                                <div style="-ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100); filter: alpha(opacity=100);
                                    -moz-opacity: 1; -khtml-opacity: 1; opacity: 1;">
                                    <img src="../images/ajax-loader.gif" style="vertical-align: middle;" />
                                </div>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="uiPanelAllCMS" runat="server">
                                <div class="ContentLeftDiv">
                                    <h1>
                                        المقالات الحالية
                                    </h1>
                                    <div class="Details675">
                                        <div class="AdminRight">
                                            <asp:Label ID="Label22" runat="server" Text="قسم :" CssClass="Label"></asp:Label>
                                        </div>
                                        <div class="AdminMiddle" style="width: 30%">
                                            <asp:DropDownList ID="uiDropDownListAllCMSCats" runat="server" OnSelectedIndexChanged="uiDropDownListAllCMSCats_SelectedIndexChanged"
                                                Width="200px" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <div class="AdminRight">
                                            <asp:Label ID="Label23" runat="server" Text="القسم الفرعى :" CssClass="Label"></asp:Label>
                                        </div>
                                        <div class="AdminMiddle" style="width: 30%">
                                            <asp:DropDownList ID="uiDropDownListCMSSubCats" runat="server" OnSelectedIndexChanged="uiDropDownListCMSSubCats_SelectedIndexChanged"
                                                Width="200px" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                        
                                        <div class="AdminLeft">
                                            <div class="AdminMore" style="width: 150px">
                                                <asp:LinkButton ID="uiLinkButtonAddCMS" runat="server" OnClick="uiLinkButtonAddCMS_Click">إضافة مقال جديد</asp:LinkButton>
                                            </div>
                                        </div>                                        
                                        <div class="clear">
                                        </div>
                                        <div class="AdminMiddle" style="width: 90%">
                                            <asp:GridView ID="uiGridViewCMS" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewCMS_RowCommand"
                                                EnableModelValidation="True" AllowPaging="True" HorizontalAlign="Center" Width="100%"
                                                OnPageIndexChanging="uiGridViewCMS_PageIndexChanging">
                                                <Columns>
                                                    <asp:BoundField DataField="ArTitle" HeaderText="الإسم " />
                                                    <asp:TemplateField HeaderText="إجراءات">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("RelatedContentID") %>'
                                                                CommandName="DeleteCMS" OnClientClick="return confirm('هل تريد حذف هذا المقال?');">حذف</asp:LinkButton>
                                                            &nbsp;<asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("RelatedContentID") %>'
                                                                CommandName="EditCMS">تعديل</asp:LinkButton>
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
                            <asp:Panel ID="uiPanelEditCMS" runat="server">
                                <div class="ContentLeftDiv">
                                    <h6>
                                        إضافة / تعديل مقال</h6>
                                    
                    <div class="AdminDetails728">
                        <div class="AdminRight">
                        </div>
                        <div class="AdminMiddle">
                            <asp:Label ID="uiLabelErrorArtcile" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                                Visible="False"></asp:Label></div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear">
                        </div>
                        <div class="AdminRight">
                            <asp:Label ID="Label14" runat="server" Text="العنوان  : " CssClass="Label"></asp:Label>
                        </div>
                        <div class="AdminMiddle">
                            <asp:TextBox ID="uiTextBoxCMSTitle" runat="server" ValidationGroup="EditCMS" Width="400px"></asp:TextBox></div>
                        <div class="AdminLeft">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                ControlToValidate="uiTextBoxCMSTitle" Display="Dynamic" ValidationGroup="EditCMS"></asp:RequiredFieldValidator>
                        </div>
                        <div class="clear">
                        </div>
                        <div class="AdminRight">
                            <asp:Label ID="Label13" runat="server" Text="الصورة الرئيسية للمقال  :" CssClass="Label"></asp:Label>
                        </div>
                        <div class="AdminMiddle">
                            <asp:AsyncFileUpload ID="AsyncFileUploadMainImage" runat="server" 
                                onuploadedcomplete="AsyncFileUploadMainImage_UploadedComplete" />
                        </div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear">
                        </div>
                        <div class="AdminRight">
                            <asp:Label ID="Label16" runat="server" Text="المحتوى  :" CssClass="Label"></asp:Label>
                        </div>
                        <div class="AdminMiddle">
                        </div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear">
                        </div>
                        <div class="AdminMiddle" style="width: 95%">
                            <telerik:RadEditor ID="uiRadEditorCMSContent" runat="server" CssClass="">
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
                            </telerik:RadEditor>
                        </div>                        
                        <div class="AdminRight">
                        </div>
                        <div class="AdminMiddle" style="text-align: center">
                            <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                            <div class="SearchBtn">
                                <asp:LinkButton ID="uiLinkButtonUpdateCMS" runat="server" Text="إضافة / تعديل" ValidationGroup="EditCMS"
                                    OnClick="uiLinkButtonUpdateCMS_Click"></asp:LinkButton></div>
                            &nbsp; &nbsp; &nbsp;
                            <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                            <div class="SmallBtn">
                                <asp:LinkButton ID="uiLinkButtonCancelCMS" runat="server" Text="إلغاء" OnClick="uiLinkButtonCancelCMS_Click"></asp:LinkButton></div>
                        </div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    </div>
                    </asp:Panel>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </div>
                <div id="tabs-5">
                    <asp:UpdateProgress ID="UpdateProgress4" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanelPics">
                        <ProgressTemplate>
                            <div style="background-color: transparent; z-index: 10000; text-align: center; position: absolute;
                                width: 95%; height: 70%; -ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=70);
                                filter: alpha(opacity=70); -moz-opacity: 0.7 -khtml-opacity: 0.7; opacity: 0.7;
                                background-color: #fff;">
                                <div style="height: 30%;">
                                    &nbsp;</div>
                                <div style="-ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100); filter: alpha(opacity=100);
                                    -moz-opacity: 1; -khtml-opacity: 1; opacity: 1;">
                                    <img src="../images/ajax-loader.gif" style="vertical-align: middle;" />
                                </div>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanelPics" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="uiPanelAllPics" runat="server">
                                <div class="ContentLeftDiv">
                                    <h1>
                                        الصور الحالية
                                    </h1>
                                    <div class="Details675">
                                        <div class="AdminRight">
                                        </div>
                                        <div class="AdminMiddle">
                                            <div class="AdminMore" style="width: 150px">
                                                <asp:LinkButton ID="uiLinkButtonAddPics" runat="server" OnClick="uiLinkButtonAddPics_Click">إضافة صورة جديدة</asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <div class="AdminMiddle" style="width: 90%">
                                            <asp:GridView ID="uiGridViewPics" runat="server" AutoGenerateColumns="False" 
                                                OnRowCommand="uiGridViewPics_RowCommand" AllowPaging="True" 
                                                HorizontalAlign="Center" Width="100%"
                                                OnPageIndexChanging="uiGridViewPics_PageIndexChanging">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="الصورة">
                                                        <ItemTemplate>
                                                        <img src='../Images.aspx?Inner=photo&Image=<%# Eval("URL") %>' />
                                                        </ItemTemplate>
                                                        </asp:TemplateField>                                                    

                                                    <asp:TemplateField HeaderText="إجراءات">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("RelatedContentID") %>'
                                                                CommandName="DeletePic" OnClientClick="return confirm('هل تريد حذف هذا السجل?');">حذف</asp:LinkButton>
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
                            <asp:Panel ID="uiPanelEditPics" runat="server">
                                <div class="ContentLeftDiv">
                                    <h6>
                                        إضافة صورة</h6>
                                    <div class="AdminDetails728">
                                        <div class="AdminRight" style="width: 120px">
                                        </div>
                                        <div class="AdminMiddle">
                                            <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى."
                                                Visible="False"></asp:Label>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                            <asp:Label ID="Label17" runat="server" Text="الإسم  : " CssClass="Label"></asp:Label>
                                        </div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxPicName" runat="server" ValidationGroup="EditPic" Width="350px"></asp:TextBox>
                                        </div>
                                        <div class="AdminLeft">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                                ControlToValidate="uiTextBoxPicName" Display="Dynamic" ValidationGroup="EditPic"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                            <asp:Label ID="Label18" runat="server" Text="الصورة :" CssClass="Label"></asp:Label>
                                        </div>
                                        <div class="AdminMiddle">
                                            <asp:AsyncFileUpload ID="uiAsyncFileUploadPics" runat="server" OnUploadedComplete="uiAsyncFileUploadPics_UploadedComplete" />
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                            <asp:Label ID="Label19" runat="server" Text="الوصف :" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxPicDesc" runat="server" ValidationGroup="EditPic" TextMode="MultiLine"
                                                Height="70px" Width="400px"></asp:TextBox>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                        <div class="AdminRight" style="width: 120px">
                                        </div>
                                        <div class="AdminMiddle" style="text-align: center;">
                                            <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditVideo"
                            OnClick="uiButtonUpdate_Click" />--%>
                                            <div class="SearchBtn">
                                                <asp:LinkButton ID="uiLinkButtonUpdatePic" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPic"
                                                    OnClick="uiLinkButtonUpdatePic_Click"></asp:LinkButton></div>
                                            &nbsp; &nbsp; &nbsp;
                                            <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                                            <div class="SmallBtn">
                                                <asp:LinkButton ID="uiLinkButtonCancelPic" runat="server" Text="إلغاء" OnClick="uiLinkButtonCancelPic_Click"></asp:LinkButton></div>
                                        </div>
                                        <div class="AdminLeft">
                                        </div>
                                        <div class="clear5">
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                </div>
            
                
            </div>
        </asp:Panel>
    </div>
</asp:Content>
