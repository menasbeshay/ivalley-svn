<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="YMC_Website.Admin.ManageUsers" %>


<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAllPages" runat="server" Visible="true">
            <div class="ContentLeftDiv">
                
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
                    <h1>
                        طلبات العضوية الحالية
                    </h1>

                    <div class="AdminMiddle" style="width: 90%">
                        <asp:GridView ID="uiGridViewUserRequests" runat="server" AutoGenerateColumns="false"
                            AllowPaging="True" HorizontalAlign="Center" Width="100%" EmptyDataText="لا يوجد بيانات متاحة "
                            OnPageIndexChanging="uiGridViewUserRequests_PageIndexChanging" OnRowCommand="uiGridViewCurrentUsers_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="UserName" HeaderText="الإسم" />
                                <asp:BoundField DataField="Email" HeaderText="البريد الإلكترونى" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="EditUser">تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="DeleteUser" OnClientClick="return confirm('هل تريد حذف هذا السجل ؟');">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div class="clear" style="height: 10px;">
                    </div>
                    <h1>
                        المستخدمين الحاليين
                    </h1>
                    <div class="AdminMiddle" style="width: 90%">
                        <asp:GridView ID="uiGridViewCurrentUsers" runat="server" AutoGenerateColumns="false"
                            AllowPaging="True" HorizontalAlign="Center" Width="100%" EmptyDataText="لا يوجد بيانات متاحة "
                            OnPageIndexChanging="uiGridViewCurrentUsers_PageIndexChanging" OnRowCommand="uiGridViewCurrentUsers_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="UserName" HeaderText="الإسم" />
                                <asp:BoundField DataField="Email" HeaderText="البريد الإلكترونى" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="EditUser">تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="DeleteUser" OnClientClick="return confirm('هل تريد حذف هذا السجل ؟');">حذف</asp:LinkButton>
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
                        <asp:Label ID="Label2" runat="server" Text="إسم المستخدم  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxUserName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxUserName" Display="Dynamic" 
                            ValidationGroup="EditPage" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label3" runat="server" Text="كلمة المرور  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxPassword" runat="server" ValidationGroup="EditPage" 
                            Width="400px" TextMode="Password"></asp:TextBox></div>
                    <div class="AdminLeft">                        
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label5" runat="server" Text="الإسم بالكامل  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxFullName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
                    <div class="AdminLeft">
                        
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label6" runat="server" Text="البريد الإلكترونى  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxMail" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
                    <div class="AdminLeft">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="أدخل البريد الإلكترونى بشكل صحيح"
                            Display="Dynamic" ValidationGroup="EditPage" 
                            ControlToValidate="uiTextBoxMail" Font-Bold="True" ForeColor="Red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label7" runat="server" Text="التليفون  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxTele" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox></div>
                    <div class="AdminLeft">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="uiTextBoxTele"
                            ErrorMessage="أرقام فقط." ValidationExpression="^\d*\.?\d*$" 
                            ValidationGroup="EditPage" Font-Bold="True" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label8" runat="server" Text="الوظيفة  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxJob" runat="server" ValidationGroup="EditPage" 
                            Width="400px"></asp:TextBox></div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label9" runat="server" Text="معلومات أخرى  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxInfo" runat="server" ValidationGroup="EditPage" 
                            Width="400px" Height="100px" TextMode="MultiLine"></asp:TextBox></div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label10" runat="server" Text="خدمات ذات صلة :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">                        
                        <FCKeditorV2:FCKeditor ID="uiFCKeditorPage" runat="server" BasePath="~/Modules/fckeditor/"
                            Height="300px" Width="540px">
                        </FCKeditorV2:FCKeditor>
                            </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label11" runat="server" Text="تفعيل العضو : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:CheckBox ID="uiCheckBoxApproved" runat="server" />
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    <div class="clear" style="height: 10px;">
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
