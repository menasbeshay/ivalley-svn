<%@ Page Language="C#" MasterPageFile="~/MasterPages/LoginMaster.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="login" Culture="auto" meta:resourcekey="PageResource1"
    UICulture="auto" %>

<%@ MasterType VirtualPath="~/MasterPages/Admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" language="javascript">
        function setHome(obj) {
            //debugger
            HomePage = top.location.href;
            //if (document.layers) setNSHomepage(HomePage);

            obj.style.behavior = 'url(#default#homepage)';
            obj.setHomePage(HomePage);

            //else alert('Sorry, not supported in this browser,\n please change this settingmanually');
            return false;
        }
    </script>

    <style type="text/css">
        .style1
        {
            width: 507px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <div id="content_login">
        <table width="100%">
            <tr>
                <td style="padding-top: 50px;" align="center" class="style1">
                    <asp:Login ID="Login1" align="center" runat="server" meta:resourcekey="Login1Resource1"
                        OnLoggedIn="Login1_LoggedIn">
                        <LayoutTemplate>
                            <table border="0" cellpadding="1" align="center" cellspacing="0" style="border-collapse: collapse;">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <b>تسجيل الدخول </b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">الاسم:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server" Width="140px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                        ErrorMessage="مطلوب." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">كلمة المرور:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                        ErrorMessage="مطلوب." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="right">
                                                    <asp:CheckBox ID="RememberMe" runat="server" Text="تذكرني." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="دخول" ValidationGroup="Login1"
                                                        Width="100px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:Login>
                    <asp:Label ID="lblErr" ForeColor="Red" Font-Size="Large" runat="server"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <table width="100%" align="right">
                        <tr>
                            <td style="font-size: large; color: #9e0c0f;">
                                شرح برنامج تسجيل المواليد والوفيات
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: large; color: #9e0c0f;">
                                شرح استخدام الICD10
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: large; color: #9e0c0f;">
                                لائحة تسجيل المواليد والوفيات
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="430px" valign="top">
                    <asp:Repeater runat="server" ID="rptrNews" OnItemDataBound="rptrNews_ItemDataBound">
                        <HeaderTemplate>
                            <div style="font-size: xx-large; text-align: center; background-color: #9e0c0f; color: White;">
                                احدث الاخبار
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        -
                                        <asp:Label runat="server" Font-Size="20px" ForeColor="DarkBlue" ID="lblNews" Text='<%# Eval("Title") %>'></asp:Label>
                                        <asp:ImageButton runat="server" ID="lnkShowFile" OnClick="lnkShowFile_Click" CommandArgument='<%# Eval("NewsID") %>'
                                            ToolTip="عرض الملف" ImageUrl="~/Images/view.png" Width="20px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1">
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                    <table width="100%">
                        <tr>
                            <td align="center" style="font-size: x-large; margin-top: 100px;">
                                <br />
                                <a href="javascript:;" id="lnk" onclick="setHome(this);">أجعل التطبيق صفحتى الرئيسية</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
