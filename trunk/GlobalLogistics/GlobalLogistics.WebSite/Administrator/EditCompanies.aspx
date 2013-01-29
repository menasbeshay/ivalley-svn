<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="EditCompanies.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditCompanies" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            // Tabs
            $('#CompanyTabs').tabs();
            $("#mi5").addClass("selected");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewCompanies" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    الشركات الحالية
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة شركة جديدة</asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch">
                    <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label16" runat="server" Text="قطاع الأعمال :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:DropDownList ID="uiDropDownListCategoryFilter" runat="server" 
                                    Width="200px" AutoPostBack="True" 
                                    onselectedindexchanged="uiDropDownListCategoryFilter_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label17" runat="server" Text="قطاع الأعمال الفرعى :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:DropDownList ID="uiDropDownListSubCategoryFilter" runat="server" 
                                    Width="200px" AutoPostBack="True" 
                                    onselectedindexchanged="uiDropDownListSubCategoryFilter_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                        <div class="AdminRight" style="width: 130px">
                        </div>
                        <div class="AdminMiddle">
                            <asp:Label ID="Label7" runat="server" Text="بحث : " CssClass="Label"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="300px"></asp:TextBox>
                            &nbsp;&nbsp;
                            <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" OnClick="uiButtonSearch_Click"
                                Width="60px" Style="display: none;" />
                            <div class="SearchBtn">
                                <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click">بحث</asp:LinkButton>
                            </div>
                        </div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear10">
                        </div>
                    </asp:Panel>
                    <div class="AdminMiddle" style="width: 95%">
                        <asp:GridView ID="uiGridViewCompanies" runat="server" AutoGenerateColumns="False"
                            OnRowCommand="uiGridViewCompanies_RowCommand" OnRowDataBound="uiGridViewCompanies_RowDataBound"
                            EnableModelValidation="True" AllowPaging="True" HorizontalAlign="Center" Width="100%"
                            OnPageIndexChanging="uiGridViewCompanies_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="EnName" HeaderText="الإسم بالإنجليزية" />
                                <asp:BoundField DataField="ArName" HeaderText="الإسم بالعربية" />
                                <asp:TemplateField HeaderText="قطاع الأعمال">
                                    <ItemTemplate>
                                        <asp:Label ID="uiLabelCategoryName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("CompanyID") %>'
                                            CommandName="EditCompany">تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CompanyID") %>'
                                            CommandName="DeleteCompany" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
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
                    تعديل الشركات
                </h6>
                <div class="AdminDetails728">
                    <div id="CompanyTabs">
                        <ul>
                            <li><a href="#CompanyTabs-1">البيانات الأساسية</a></li>
                            <li><a href="#CompanyTabs-2">بيانات الإشتراك</a></li>
                        </ul>
                        <div id="CompanyTabs-1">
                            <div class="AdminRight" style="width: 130px">
                            </div>
                            <div class="AdminMiddle">
                                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                                    Visible="False"></asp:Label>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label1" runat="server" Text="الإسم بالإنجليزية : " CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:TextBox ID="uiTextBoxEnName" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                            </div>
                            <div class="AdminLeft">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                    ControlToValidate="uiTextBoxEnName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label2" runat="server" Text="الإسم بالعربية :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:TextBox ID="uiTextBoxArName" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                            </div>
                            <div class="AdminLeft">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                    ControlToValidate="uiTextBoxArName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label3" runat="server" Text="اللوجو :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:FileUpload ID="uiFileUploadLogoPath" runat="server" />
                                &nbsp;<asp:Image ID="uiImageLogo" runat="server" Height="50px" ImageAlign="Top" />
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label13" runat="server" Text="إسم المستخدم :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:TextBox ID="uiTextBoxUserName" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label14" runat="server" Text="كلمة المرور :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:TextBox ID="uiTextBoxPassword" runat="server" ValidationGroup="EditPage" TextMode="Password"
                                    Width="230px"></asp:TextBox>
                                &nbsp;<asp:LinkButton ID="uiLinkButtonResetPassword" runat="server" PostBackUrl="~/Administrator/ChangePassword.aspx">إعادة تحديد كلمة المرور</asp:LinkButton>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label5" runat="server" Text="العنوان بالإنجليزية :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:TextBox ID="uiTextBoxEnAddress" runat="server" ValidationGroup="EditPage" Width="350px"
                                    Rows="4" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label6" runat="server" Text="العنوان بالعربية :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:TextBox ID="uiTextBoxArAddress" runat="server" ValidationGroup="EditPage" Width="350px"
                                    Rows="4" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label8" runat="server" Text="المدينة :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:DropDownList ID="uiDropDownListCity" runat="server" Width="200px">
                                </asp:DropDownList>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label9" runat="server" Text="قطاع الأعمال :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:DropDownList ID="uiDropDownListCategory" runat="server" Width="200px">
                                </asp:DropDownList>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label10" runat="server" Text="قطاع الأعمال الفرعى :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:DropDownList ID="uiDropDownListSubCategory" runat="server" Width="200px">
                                </asp:DropDownList>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label11" runat="server" Text="هاتف :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:TextBox ID="uiTextBoxTele" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                            <div class="AdminRight" style="width: 130px">
                                <asp:Label ID="Label12" runat="server" Text="فاكس :" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle">
                                <asp:TextBox ID="uiTextBoxFax" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                            </div>
                            <div class="AdminLeft">
                            </div>
                            <div class="clear5">
                            </div>
                        </div>
                        <div id="CompanyTabs-2">
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true">
                            <ProgressTemplate>
                            <div style="background-color: transparent; z-index: 10000; text-align: center;position:absolute;width:95%;height:70%;-ms-filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=70); filter: alpha(opacity=70); -moz-opacity:0.7 -khtml-opacity: 0.7; opacity: 0.7;background-color:#fff;">
                                <div style="height:30%;">&nbsp;</div>
                                <div style="-ms-filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=100); filter: alpha(opacity=100); -moz-opacity:1; -khtml-opacity: 1; opacity:1;">
                                <img src="../images/ajax-loader.gif" style="vertical-align:middle;"/>
                                </div>
                            </div>
                            </ProgressTemplate>
                            </asp:UpdateProgress>
                            <asp:UpdatePanel ID="uiUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <div class="AdminRight" style="width: 120px">
                                        <asp:Label ID="Label15" runat="server" CssClass="Label" Text="نوع الإشتراك :"></asp:Label>
                                    </div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListPackages" runat="server" Width="100px" 
                                            AutoPostBack="True" 
                                            onselectedindexchanged="uiDropDownListPackages_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="AdminLeft">
                                    </div>
                                    <div class="clear5">
                                    </div>
                                    <div class="AdminRight" style="width: 120px">
                                        <asp:Label ID="Label4" runat="server" CssClass="Label" Text="خيارات الإشتراك :"></asp:Label>
                                    </div>
                                    <div class="AdminMiddle" style="width: 550px">
                                    </div>
                                    <div class="clear5">
                                    </div>
                                    <div class="AdminMiddle" style="width: 550px">
                                        <asp:CheckBoxList ID="uiCheckBoxListPackageOptions" runat="server" CellPadding="2"
                                            CellSpacing="2" RepeatColumns="4" RepeatDirection="Horizontal">
                                        </asp:CheckBoxList>
                                    </div>
                                    <div class="clear5">
                                    </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="AdminRight" style="width: 130px">
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
                            <div class="clear5">
                            </div>
                        </div>
                    </div>
                </div>
        </asp:Panel>
    </div>
</asp:Content>
