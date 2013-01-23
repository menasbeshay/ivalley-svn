<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeBehind="RequestService.aspx.cs" Inherits="YMC_Website.RequestService1" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MContent" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAllPages" runat="server" Visible="true">
            <div class="ContentLeftDiv">
                <h1>
                    الطلبات السابقة
                </h1>
                <div class="Details675">
                    <div class="AdminRight" style="width: 150px">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة طلب جديد</asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear" style="height: 10px;">
                    </div>
                    <div class="AdminMiddle" style="width: 90%">
                        <asp:GridView ID="uiGridViewNews" runat="server" AutoGenerateColumns="false" AllowPaging="True"
                            HorizontalAlign="Center" Width="100%" EmptyDataText="لا يوجد بيانات متاحة " OnPageIndexChanging="uiGridViewNews_PageIndexChanging"
                            OnRowCommand="uiGridViewNews_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="RequestTitle" HeaderText="العنوان" />                                
                                <asp:CheckBoxField DataField="IsAnswered" HeaderText="تم الرد عليه" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("RequestID") %>'
                                            CommandName="EditNews">تعديل</asp:LinkButton>&nbsp;                                        
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
                    تعديل الطلبات</h1>
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
                        <asp:Label ID="Label1" runat="server" Text="رفع ملف  : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:FileUpload ID="uiFileUploadRequest" runat="server" />
                        </div>
                    <div class="AdminLeft">                        
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label4" runat="server" Text="التفاصيل :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    
                    <div class="clear">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <fckeditorv2:fckeditor id="uiFCKeditorContent" runat="server" basepath="~/Modules/fckeditor/"
                            height="500px">
                        </fckeditorv2:fckeditor>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight">
                        <asp:Label ID="Label3" runat="server" Text="الرد :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <asp:Literal ID="uiLiteralReply" runat="server"></asp:Literal>
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
