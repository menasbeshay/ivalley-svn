<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="EditUserData.aspx.cs" Inherits="Admin_EditUserData"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
<center>
        <asp:Label ID="lblPageHeader" Font-Size="X-Large" Text="تعديل بيانات مستخدم" runat="server"></asp:Label>
        </center>
        
    <table border="0" style="font-family: Verdana; font-size: 100%; height: 365px; width: 621px;">
       
        <tr>
            <td>
                <asp:Label ID="lblRole1" Text="المسمي الوظيفي" runat="server"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="dropRole" Width="150px" runat="server" AutoPostBack="true"
                    meta:resourcekey="dropRole1Resource1" OnSelectedIndexChanged="dropRole_SelectedIndexChanged">
                   <asp:ListItem Text="مشرف وزارة" Value="FA83E65D-EC4F-4FF6-B836-3F78C7D75B5C" Selected="True"></asp:ListItem>
                   <asp:ListItem Text="مشرف مديرية" Value="6598B2CD-9CEB-441B-A605-696B9BA09399"></asp:ListItem>
                   <asp:ListItem Text="مشرف ادارة" Value="E55CB679-23CA-4C36-B94D-EFB5128EAEAC"></asp:ListItem>
                   <asp:ListItem Text="طبيب" Value="5013C55E-EE53-4AEA-A711-C7E95A4FBCDE"></asp:ListItem>
                   <asp:ListItem Text="كاتب صحة" Value="AD2EA5B6-EE94-49A2-B6E7-187667868458"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="Label1" Text="المؤهل الدراسي" runat="server"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtqulification" Width="140px" runat="server" MaxLength="30"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtqulification"
                                ErrorMessage="مطلوب." ValidationGroup="CreateUserWizard1" meta:resourcekey="ConfirmPasswordRequiredResource1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <asp:Label ID="Label2" Text="رقم الهاتف" runat="server"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtPhoneNo" MaxLength="11" Width="140px" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhoneNo"
                                ErrorMessage="مطلوب." ValidationGroup="CreateUserWizard1" meta:resourcekey="ConfirmPasswordRequiredResource1">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator2" Display="Dynamic" ValidationGroup="CreateUserWizard1"
                                runat="server" ControlToValidate="txtPhoneNo" ErrorMessage="ارقام فقط" Operator="DataTypeCheck"
                                Type="Integer"></asp:CompareValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblGov" Text="مديرية صحة" runat="server"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpGov" Width="150px" AutoPostBack="true" runat="server" OnSelectedIndexChanged="drpGov_SelectedIndexChanged">
                    <asp:ListItem Value="-1">اختر مديرية</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblCivil" Text="ادارة صحية" runat="server"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpCivil" Width="150px" AutoPostBack="true" runat="server"
                    OnSelectedIndexChanged="drpCivil_SelectedIndexChanged">
                    <asp:ListItem Value="-1">اختر ادارة</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblOffice" Text="مكتب صحة" runat="server"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpHealthOffice" Width="150px" runat="server">
                    <asp:ListItem Value="-1">اختر مكتب</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblNationalId" runat="server" Text="الرقم القومي"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtNationalId" Width="140px" MaxLength="14" runat="server" meta:resourcekey="txtNationalIdResource1"
                                AutoPostBack="True" OnTextChanged="txtNationalId_TextChanged"></asp:TextBox>
                        </td>
                        <td>
                           <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Images/Search Magnifier.png"
                                                            OnClick="btnSearch_Click" Width="25px" /> 
                        </td>
                    </tr>
                </table>
            </td>
            <td align="right">
                <asp:Label ID="Label3" runat="server">الاسم الاول:</asp:Label>
            </td>
            <td>
                <table>
                    <td>
                        <asp:TextBox ID="txtFirstName" Width="140px" runat="server" 
                            meta:resourcekey="EmailResource1" MaxLength="20" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFirstName"
                            ErrorMessage="مطلوب." ToolTip="Name is required." ValidationGroup="CreateUserWizard1"
                            meta:resourcekey="EmailRequiredResource1">*</asp:RequiredFieldValidator>
                    </td>
                </table>
            </td>
            <td>
                <asp:Label ID="lblFatherName" runat="server" Text="اسم الاب" meta:resourcekey="lblFatherNameResource1"> </asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtFatherName" Width="140px" runat="server" 
                                meta:resourcekey="txtFatherNameResource1" MaxLength="40" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                ID="RequiredFieldValidator4" ControlToValidate="txtFatherName" ErrorMessage="*"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" meta:resourcekey="EmailLabelResource1">البريد الالكتروني:</asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="Email" runat="server" Width="140px" 
                                meta:resourcekey="EmailResource1" MaxLength="30"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                ErrorMessage="مطلوب." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1"
                                meta:resourcekey="EmailRequiredResource1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <asp:Label ID="Label4" Text="حالة المشغل" runat="server"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpStatus" Width="150px" runat="server">
                    <asp:ListItem Selected="True" Value="1">يعمل</asp:ListItem>
                    <asp:ListItem Value="0">لا يعمل</asp:ListItem>
                </asp:DropDownList>
            </td>
             <td align="right">
                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" meta:resourcekey="UserNameLabelResource1">اسم المشغل:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="UserName" Width="140px" runat="server" 
                    meta:resourcekey="UserNameResource1" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                    ErrorMessage="مطلوب." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1"
                    meta:resourcekey="UserNameRequiredResource1">*</asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>
        <tr>
           
            <td align="right">
                &nbsp;</td>
            <td>
                <table>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            
                        </td>
                    </tr>
                </table>
            </td>
            <td align="right">
                &nbsp;</td>
            <td>
                <table>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="6">
                
                <asp:Label ID="lblWCFError" runat="server"></asp:Label>
                
            </td>
        </tr>
        <tr>
            <td align="center" colspan="6" style="color: Red;">
                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False" meta:resourcekey="ErrorMessageResource1"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="6" align="center">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="btnEdit" OnClick="btnEdit_Click" Text="تعديل" runat="server" 
                                style="height: 26px" />
                        </td>
                        <td>
                            <asp:Button ID="BtnBack" OnClick="BtnBack_Click" Text="رجوع" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
