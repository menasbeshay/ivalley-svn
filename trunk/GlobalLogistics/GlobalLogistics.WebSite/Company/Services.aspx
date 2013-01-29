<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Company.Master" AutoEventWireup="true"
    CodeBehind="Services.aspx.cs" Inherits="GlobalLogistics.WebSite.Company.Services" %>
    <%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewServices" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    الخدمات الحالية
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                        <asp:Label ID="Label5" runat="server" Text="نوع الخدمة :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:DropDownList ID="uiDropDownListAllServiceType" runat="server" OnSelectedIndexChanged="uiDropDownListAllServiceType_SelectedIndexChanged"
                            Width="200px" AutoPostBack="True">
                        </asp:DropDownList>
                        &nbsp;<div class="AdminMore" style="height: 17px; width: 150px;">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة خدمة جديدة</asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <asp:GridView ID="uiGridViewServices" runat="server" 
                            AutoGenerateColumns="False" OnRowCommand="uiGridViewServices_RowCommand"
                            EnableModelValidation="True" AllowPaging="True" HorizontalAlign="Center" Width="100%"
                            OnPageIndexChanging="uiGridViewServices_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="EnName" HeaderText="الإسم بالإنجليزية" />
                                <asp:BoundField DataField="ArName" HeaderText="الإسم بالعربية" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ServiceID") %>'
                                            CommandName="EditService">تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ServiceID") %>'
                                            CommandName="DeleteService" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div class="clear5">
                    </div>
                </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    تعديل الخدمات الحالية
                </h1>
                <div class="Details675">
                    <div class="AdminRight" style="width: 110px">
                        <asp:Label ID="Label2" runat="server" Text="الإسم بالإنجليزية : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxEnName" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxEnName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 110px">
                        <asp:Label ID="Label3" runat="server" Text="الإسم بالعربية :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxArName" runat="server" ValidationGroup="EditPage" Width="350px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxArName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    
                     <div class="AdminRight" style="width: 110px">
                        <asp:Label ID="Label1" runat="server" Text="الوصف بالإنجليزية :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                       <FCKeditorV2:FCKeditor ID="uiFCKeditorEnDesc" runat="server" 
                    BasePath="/Modules/fckeditor/" Height="400px" Width="100%" ></FCKeditorV2:FCKeditor>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 110px">
                        <asp:Label ID="Label4" runat="server" Text="الوصف بالعربية :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <FCKeditorV2:FCKeditor ID="uiFCKeditorArDesc" runat="server" 
                    BasePath="/Modules/fckeditor/" Height="400px" Width="100%">
                </FCKeditorV2:FCKeditor>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>

                    <div class="AdminRight" style="width: 110px">
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
        </asp:Panel>
    </div>
</asp:Content>
