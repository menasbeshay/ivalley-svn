<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UcParentInfo.ascx.cs"
    Inherits="UserControls_UcFatherInfo" %>

<script language="javascript">
    function EnableTextBoxes(firstname, fatherName, familyName, nationalId, surName) {
      /*  var txtFirstName = document.getElementById(firstname);

        var txtFatherName = document.getElementById(fatherName);

        var txtFamilyName = document.getElementById(familyName);

        var txtNationalId = document.getElementById(nationalId);
        var txtSurName = document.getElementById(surName);

        if (txtNationalId.value == "0") {
            txtFirstName.disabled = false;
            txtFatherName.disabled = false;
            txtFamilyName.disabled = false;
            txtFirstName.value = '';
            txtFatherName.value = '';
            txtFamilyName.value = '';
            txtSurName.value = '';
            //txtNationalId.focus();
        }
        else {
            txtFirstName.disabled = true;
            txtFatherName.disabled = true;
            txtFamilyName.disabled = true;
        }

        if (txtFirstName.value != "" && txtFatherName.value != "" && txtFamilyName.value != "") {
            txtFirstName.value = '';
            txtFatherName.value = '';
            txtFamilyName.value = '';
            txtSurName.value = '';
        }*/
    }
    function onTextEnterButtonClick() {
        if (event.keyCode == 13)
        document.getElementById("<%= btnSearch.ClientID %>").click();
        //    alert("<%= btnSearch.ClientID %>");

    }

    function lettersOnly(evt) {
        evt = (evt) ? evt : event;
        var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
          ((evt.which) ? evt.which : 0));
        if (charCode > 31 && (charCode >= 48 && charCode < 58) ) {            
            return false;
        }
        return true;
    }

</script>

<style type="text/css">
    .style1
    {
        width: 112px;
    }
    .style2
    {
        width: 305px;
    }
</style>
<asp:UpdatePanel runat="server" ID="updatePnlParents" UpdateMode="Conditional">
<ContentTemplate>
<table dir="rtl" width="100%">
    <tr>
        <td style="width: 9%">
            <asp:Label ID="lblNationality" runat="server" meta:resourcekey="lblNationalityResource1"></asp:Label>
        </td>
        <td align="right">
            <asp:DropDownList ID="dropNationality" AutoPostBack="true" Width="157px" runat="server"
                OnSelectedIndexChanged="dropNationality_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic"
                ValidationGroup="GenralValidate" ControlToValidate="dropNationality" ID="RequiredFieldValidator8"
                InitialValue="0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
        </td>
        <td>
            <asp:Label runat="server" ID="lblError" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
<table dir="rtl" width="100%">
                <tr>
                    <td runat="server" id="NIDArea" style="display: block">
                        <table>
                            <tr>
                                <td style="padding-left:9px">
                                    <asp:Label ID="lblNationalId" runat="server" meta:resourcekey="lblNationalIdResource1"></asp:Label>
                                    <asp:TextBox ID="txtNationalId" MaxLength="14" runat="server" Width="150px" 
                                        meta:resourcekey="txtNationalIdResource1"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="txtNationalId" 
                                        ErrorMessage="أدخل رقم قومى صحيح" ValidationExpression="^([0])|(\d{14})$"></asp:RegularExpressionValidator>
                                </td>
                                
                                <td>
                                    <asp:Button ID="btnSearch" name="btnSearchParent" ValidationGroup="nationalId" 
                                        runat="server" Text="بحث"
                                        OnClick="btnSearch_Click" Width="35px" />
                                </td>
                                <td>
                                <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatePnlParents" DisplayAfter="1" ID="progParents">
                                <ProgressTemplate>
                                <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                                جارى البحث
                                </ProgressTemplate>
                                </asp:UpdateProgress>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td runat="server" id="proveArea" style="display: none">
                        <table width="100%">
                            <tr>
                                <td width="36%">
                                    <table>
                                        <tr>
                                            <td style="padding-left:13px"> 
                                                <asp:Label runat="server" ID="lblProveNo" Text="رقم الاثبات"></asp:Label>
                                                <asp:TextBox runat="server" ID="txtProveNo" MaxLength="20"></asp:TextBox>
                                            </td>
                                            
                                        </tr>
                                    </table>
                                </td>
                                <td align="right">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" ID="Label1" Width="30px" Text="نوع الاثبات"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtProveType" MaxLength="20"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
<table dir="rtl" width="100%">
    <tr>
        <td width="62px">
            <table width="12%">
                <tr>
                    <td>
                        <asp:Label ID="lblParentName" Text="الاسم" runat="server"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblFirstName" runat="server"  Text="الاول" meta:resourcekey="lblFirstNameResource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <asp:TextBox ID="txtFirstName" MaxLength="20" runat="server"  OnKeyPress="return lettersOnly(event);"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                SetFocusOnError="true" ID="RequiredFieldValidator1" ControlToValidate="txtFirstName"
                ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            
        </td>
        <td>
            <table>
                <tr>
                    <td width="18%">
                        <asp:Label ID="lblFatherName" Text="الثاني" runat="server"> </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFatherName" MaxLength="20" runat="server" 
                            meta:resourcekey="txtFatherNameResource1" OnKeyPress="return lettersOnly(event);"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                            ID="RequiredFieldValidator3" ControlToValidate="txtFatherName" ErrorMessage="*"
                            SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                            
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table>
                <tr>
                    <td width="18%">
                        <asp:Label ID="lblFamilyName" Text="الثالث" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFamilyName" MaxLength="20" runat="server" 
                            meta:resourcekey="txtFamilyNameResource1" OnKeyPress="return lettersOnly(event);"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                            ID="RequiredFieldValidator4" ControlToValidate="txtFamilyName" ErrorMessage="*"
                            SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                             
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="left">
            <asp:Label ID="lblSureName" runat="server">اللقب</asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtSureName" runat="server" MaxLength="20" meta:resourcekey="txtFamilyNameResource1" OnKeyPress="return lettersOnly(event);"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                ID="RequiredFieldValidator2" ControlToValidate="txtSureName" ErrorMessage="*"
                SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                 
        </td>
        <td>
            <table>
                <tr>
                    <td width="18%">
                        <asp:Label ID="lblReligion" runat="server" meta:resourcekey="lblReligionResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="dropReligion" Width="155px" runat="server" meta:resourcekey="txtReligionResource1">
                            <asp:ListItem Selected="True" Value="0">اختر الديانة</asp:ListItem>
                            <asp:ListItem Value="1">مسلم</asp:ListItem>
                            <asp:ListItem Value="2">مسيحى</asp:ListItem>
                            <asp:ListItem Value="3">يهودى</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                            SetFocusOnError="true" ControlToValidate="dropReligion" ID="RequiredFieldValidator5"
                            InitialValue="0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table>
                <tr>
                    <td width="18%">
                        <asp:Label ID="lblPosition" runat="server" meta:resourcekey="lblPositionResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPosition" MaxLength="50" runat="server" meta:resourcekey="txtPositionResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                            SetFocusOnError="true" ID="RequiredFieldValidator6" ControlToValidate="txtPosition"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
<asp:AsyncPostBackTrigger ControlID="dropNationality" EventName="SelectedIndexChanged" />
</Triggers>
</asp:UpdatePanel>