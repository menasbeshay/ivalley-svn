<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditVideoCats.aspx.cs" Inherits="Website.Admin.EditVideoCats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewCategories" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    أقسام مكتبة الفيديو
                </h1>
                <div class="Details675">
                    <div class="AdminRight" style="width: 150px">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة قسم جديد</asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    
                    <div class="AdminMiddle" style="width: 100%">
                        <asp:GridView ID="uiGridViewCategories" runat="server" AutoGenerateColumns="false"
                            OnRowCommand="uiGridViewCategories_RowCommand" AllowPaging="True" HorizontalAlign="Center"
                            OnPageIndexChanging="uiGridViewCategories_PageIndexChanging" Width="80%">
                            <Columns>                                
                                <asp:BoundField DataField="Title" HeaderText="الإسم " />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("CategoryID") %>'
                                            CommandName="EditCategory">تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CategoryID") %>'
                                            CommandName="DeleteCategory" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div class="clear10">
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server">
            <div class="ContentLeftDiv">
                <h6>
                    تعديل أقسام مكتبة الفيديو
                </h6>
                <div class="AdminDetails728">
                    <div class="AdminRight" style="width: 120px">
                    </div>
                    <div class="AdminMiddle">
                        <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                            Visible="False"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    
                    <div class="AdminRight" style="width: 120px">
                        <asp:Label ID="Label2" runat="server" Text="الإسم :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxArName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxArName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label8" runat="server" Text="لوجو القسم :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:FileUpload ID="uiFileUploadPicturePath" runat="server" />
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 120px">
                    </div>
                    <div class="AdminMiddle" style="text-align: center;">
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
        </asp:Panel>
    </div>
</asp:Content>
