<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="ManageNewsLetter.aspx.cs" Inherits="YMC_Website.Admin.ManageNewsLetter" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAllPages" runat="server" Visible="true">
            <div class="ContentLeftDiv">
                <div class="AdminRight" style="width: 150px">
                    <div class="AdminMore">
                        <asp:LinkButton ID="uiLinkButtonSend" runat="server" OnClick="uiLinkButtonSend_Click">إرسال أخبار</asp:LinkButton>
                    </div>
                </div>
                <div class="AdminMiddle">
                </div>
                <div class="AdminLeft">
                </div>
                <div class="clear" >
                </div>
                <div class="AdminRight">
                </div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelSuccess" runat="server" Font-Bold="True" ForeColor="Green" Text="تم الإرسال بنجاح ."
                        Visible="False"></asp:Label></div>
                <div class="AdminLeft">
                </div>
                <div class="clear">
                </div>

                <div class="Details675">
                   
                    <h1>
                        المشتركين الحاليين
                    </h1>
                    <div class="AdminMiddle" style="width: 90%">
                        <asp:GridView ID="uiGridViewUsers" runat="server" AutoGenerateColumns="false" AllowPaging="True"
                            HorizontalAlign="Center" Width="100%" EmptyDataText="لا يوجد بيانات متاحة " OnPageIndexChanging="uiGridViewUsers_PageIndexChanging"
                            OnRowCommand="uiGridViewUsers_RowCommand">
                            <Columns>                                
                                <asp:BoundField DataField="Email" HeaderText="البريد الإلكترونى" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>                                        
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
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server" Visible="false">
            <div class="ContentLeftDiv">
                <h1>
                    إرسال أخبار</h1>
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
                        <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxTitle" Display="Dynamic" ValidationGroup="EditPage"
                            Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                    
                    <div class="AdminRight">
                        <asp:Label ID="Label10" runat="server" Text="المحتوى :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <fckeditorv2:fckeditor id="uiFCKeditorPage" runat="server" basepath="~/Modules/fckeditor/"
                            height="300px" width="550px">
                        </fckeditorv2:fckeditor>
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
                            <asp:LinkButton ID="uiLinkButtonSubmit" runat="server" Text="إرسال" ValidationGroup="EditPage"
                                OnClick="uiLinkButtonSubmit_Click"></asp:LinkButton></div>
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
