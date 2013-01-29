<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Company.Master" AutoEventWireup="true"
    CodeBehind="GeneralInfo.aspx.cs" Inherits="GlobalLogistics.WebSite.Company.GeneralInfo" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <div class="ContentLeftDiv">
            <h1>
                الإعدادت العامة
            </h1>
            <div class="Details675">
                <div id="CompanyName" runat="server">
                    <div class="AdminRight" style="width: 150px">
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
                    <div class="AdminRight" style="width: 150px">
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
                </div>
                <div id="CompanyLogo" runat="server">
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label3" runat="server" Text="اللوجو :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:FileUpload ID="uiFileUploadLogoPath" runat="server" />
                        &nbsp;<asp:Image ID="uiImageLogo" runat="server" Height="50px" />
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                </div>
                <div class="AdminRight" style="width: 150px">
                    <asp:Label ID="Label13" runat="server" Text="إسم المستخدم :" CssClass="Label"></asp:Label>
                </div>
                <div class="AdminMiddle">
                    <asp:TextBox ID="uiTextBoxUserName" runat="server" ValidationGroup="EditPage" Width="350px"
                        Enabled="False"></asp:TextBox>
                </div>
                <div class="AdminLeft">
                </div>
                <div class="clear5">
                </div>
                <div class="AdminRight" style="width: 150px">
                    <asp:Label ID="Label14" runat="server" Text="كلمة المرور :" CssClass="Label"></asp:Label>
                </div>
                <div class="AdminMiddle">
                    &nbsp;<asp:LinkButton ID="uiLinkButtonResetPassword" runat="server" 
                        PostBackUrl="~/Company/ChangePassword.aspx">إعادة تحديد كلمة المرور</asp:LinkButton>
                </div>
                <div class="AdminLeft">
                </div>
                <div class="clear5">
                </div>
                <div class="AdminRight" style="width: 150px">
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
                <div class="AdminRight" style="width: 150px">
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
                <div class="AdminRight" style="width: 150px">
                    <asp:Label ID="Label11" runat="server" Text="هاتف :" CssClass="Label"></asp:Label>
                </div>
                <div class="AdminMiddle">
                    <asp:TextBox ID="uiTextBoxTele" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                </div>
                <div class="AdminLeft">
                </div>
                <div class="clear5">
                </div>
                <div class="AdminRight" style="width: 150px">
                    <asp:Label ID="Label12" runat="server" Text="فاكس :" CssClass="Label"></asp:Label>
                </div>
                <div class="AdminMiddle">
                    <asp:TextBox ID="uiTextBoxFax" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                </div>
                <div class="AdminLeft">
                </div>
                <div class="clear5">
                </div>
                <div id="CompanyWebsite" runat="server">
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label4" runat="server" Text="الموقع الإلكترونى :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxWebSite" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                </div>
                <div id="CompanyMap" runat="server">
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label17" runat="server" Text="الخريطة :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxMapURL" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle">
                        <asp:Literal ID="uiLiteralMapPreview" runat="server"></asp:Literal>
                    </div>
                    <div class="clear5">
                    </div>
                </div>
                <div id="CompanyBranches" runat="server">
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label7" runat="server" Text="الفروع بالإنجليزية :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <FCKeditorV2:FCKeditor ID="uiFCKeditorEnBranches" runat="server" BasePath="/Modules/fckeditor/"
                            Height="400px" Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label8" runat="server" Text="الفروع بالعربية :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <FCKeditorV2:FCKeditor ID="uiFCKeditorArBranches" runat="server" BasePath="/Modules/fckeditor/"
                            Height="400px" Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div id="CompanyContacts" runat="server">
                    <div class="AdminRight" style="width: 210px">
                        <asp:Label ID="Label9" runat="server" Text="بيانات شخص مسئول بالإنجليزية :" 
                            CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <FCKeditorV2:FCKeditor ID="uiFCKeditorEnContacts" runat="server" BasePath="/Modules/fckeditor/"
                            Height="400px" Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 210px">
                        <asp:Label ID="Label10" runat="server" Text="بيانات شخص مسئول بالعربية :" 
                            CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <FCKeditorV2:FCKeditor ID="uiFCKeditorArContacts" runat="server" BasePath="/Modules/fckeditor/"
                            Height="400px" Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div id="CompanyAbout" runat="server">
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label15" runat="server" Text="عن الشركة - بالإنجليزية :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <FCKeditorV2:FCKeditor ID="uiFCKeditorEnAbout" runat="server" BasePath="/Modules/fckeditor/"
                            Height="400px" Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label16" runat="server" Text="عن الشركة - بالعربية :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <FCKeditorV2:FCKeditor ID="uiFCKeditorArAbout" runat="server" BasePath="/Modules/fckeditor/"
                            Height="400px" Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                 <div class="AdminRight" style="width: 130px">
            </div>
            <div class="AdminMiddle" style="text-align: center">
                <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                            <div class="SearchBtn">
                        <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="إضافة / تعديل" 
                            ValidationGroup="EditPage" onclick="uiButtonUpdate_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SmallBtn">
                        <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="إلغاء" 
                            onclick="uiButtonCancel_Click"></asp:LinkButton></div>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            </div>
        </div>
    </div>
</asp:Content>
