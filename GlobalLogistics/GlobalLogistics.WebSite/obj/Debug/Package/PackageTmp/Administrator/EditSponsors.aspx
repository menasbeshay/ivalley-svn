<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="EditSponsors.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditSponsors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi13").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;"> 
        <asp:Panel ID="uiPanelViewSponsors" runat="server">
        <div class="ContentLeftDiv">
                <h1>
                    الشركات الراعية الحالية
                </h1>
                <div class="Details675">
            <div class="AdminRight" style="width: 130px">
             <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة شركة راعية جديدة </asp:LinkButton>
                </div>
            </div>
            <div class="AdminMiddle">
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            
            <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch">
            
            <div class="AdminRight">
              
                &nbsp;</div>
            <div class="AdminMiddle">
             <asp:Label ID="Label5" runat="server" Text="بحث : " CssClass="Label"></asp:Label>
             &nbsp;&nbsp;
                <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="300px"></asp:TextBox>
                &nbsp;&nbsp;
                  <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" 
                    onclick="uiButtonSearch_Click" Width="60px" style="display:none;" />
                    <div class="SearchBtn">
                <asp:LinkButton ID="uiLinkButtonSearch" runat="server" 
                    onclick="uiButtonSearch_Click">بحث</asp:LinkButton>
                    </div>
            </div>
            <div class="AdminLeft">
              
            </div>
            <div class="clear10">
            </div>
            </asp:Panel>

           
            <div class="AdminMiddle" style="width:80%">
                <asp:GridView ID="uiGridViewSponsors" runat="server" AutoGenerateColumns="False"
                    OnRowCommand="uiGridViewSponsors_RowCommand" EnableModelValidation="True" 
                    AllowPaging="True" HorizontalAlign="Center" 
                    onpageindexchanging="uiGridViewSponsors_PageIndexChanging" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="EnTitle" HeaderText="الإسم بالإنجليزية" />
                        <asp:BoundField DataField="ArTitle" HeaderText="الإسم بالعربية" />
                        <asp:TemplateField HeaderText="إجراءات">
                            <ItemTemplate>
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("SponsorID") %>'
                                    CommandName="EditSponsor">تعديل</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("SponsorID") %>'
                                    CommandName="DeleteSponsor" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
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
                    تعديل الشركات الراعية</h6>
                <div class="AdminDetails728">
            <div class="AdminRight" style="width: 150px">
            </div>
            <div class="AdminMiddle">
                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى."
                    Visible="False"></asp:Label>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 150px">
                <asp:Label ID="Label1" runat="server" Text="الإسم بالإنجليزية : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxEnTitle" runat="server" ValidationGroup="EditPage"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxEnTitle" Display="Dynamic" 
                    ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 150px">
                <asp:Label ID="Label2" runat="server" Text="الإسم بالعربية :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxArTitle" runat="server" ValidationGroup="EditPage"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxArTitle" Display="Dynamic" 
                    ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 150px">
                <asp:Label ID="Label3" runat="server" Text="الصورة للموقع الإنجليزى :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:FileUpload ID="uiFileUploadEnglishPhoto" runat="server" />
            </div>
            <div class="AdminLeft">
                <asp:Image ID="uiImageEnglish" runat="server" Width="80px" />
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 150px">
                <asp:Label ID="Label4" runat="server" Text="الصورة للموقع العربى :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:FileUpload ID="uiFileUploadArabicPhoto" runat="server" />
            </div>
            <div class="AdminLeft">
                <asp:Image ID="uiImageArabic" runat="server" Width="80px" />
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 150px">
                <asp:Label ID="Label6" runat="server" Text="الرابط :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxURL" runat="server" ValidationGroup="EditPage"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 150px">
                <asp:Label ID="Label7" runat="server" Text="ترتيب الظهور :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxOrder" runat="server" ValidationGroup="EditPage"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Numbers only"
                    ValidationGroup="EditPage" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxOrder"></asp:RegularExpressionValidator>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="uiTextBoxOrder" Display="Dynamic" ErrorMessage="*" 
                    ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 150px">
            </div>
            <div class="AdminMiddle" style="text-align:center;">
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
        </asp:Panel>
    </div>
</asp:Content>
