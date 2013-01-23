<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="ManageCommitee.aspx.cs" Inherits="YMC_Website.Admin.ManageCommitee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAllPages" runat="server" Visible="true">
            <div class="ContentLeftDiv">
                <h1>
                    اللجنة الوطنية 
                </h1>
                <div class="Details675">
                    <div class="AdminRight" style="width: 150px">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة عضو جديد</asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear" style="height: 10px;">
                    </div>
                    <div class="AdminMiddle" style="width: 90%">
                        <asp:GridView ID="uiGridViewPersons" runat="server" AutoGenerateColumns="false" AllowPaging="True"
                            HorizontalAlign="Center" Width="100%" EmptyDataText="لا يوجد بيانات متاحة " OnPageIndexChanging="uiGridViewPersons_PageIndexChanging"
                            OnRowCommand="uiGridViewPersons_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="الإسم" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="EditPerson">تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="DeletePerson" OnClientClick="return confirm('هل تريد حذف هذا السجل ؟');">حذف</asp:LinkButton>
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
                    تعديل الأعضاء</h1>
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
                        <asp:Label ID="Label2" runat="server" Text="الإسم  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxArTitle" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxArTitle" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label1" runat="server" Text="الصورة  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:FileUpload ID="uiFileUploadImage" runat="server" />
                        &nbsp;&nbsp;
                        <asp:Image ID="uiImage" runat="server" Width="100" ImageAlign="Top" />
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear" style="height: 10px;">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label4" runat="server" Text="التفاصيل :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxDetails" runat="server" TextMode="MultiLine" Height="100px"
                            Width="400px"></asp:TextBox>
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
                        <div class="SearchBtn" style="width: 30px;">
                            <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                                OnClick="uiLinkButtonUpdate_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SearchBtn" style="width: 30px;">
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="إلغاء" OnClick="uiLinkButtonCancel_Click"></asp:LinkButton></div>
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
