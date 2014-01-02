<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UcDeathInfo.ascx.cs" Inherits="UserControls_UcDeathInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<script language="javascript">
    function EnableTextBoxesForDeath(firstname, fatherName, familyName, nationalId) {
        //debugger;
       /* var txtFirstName = document.getElementById(firstname);

        var txtFatherName = document.getElementById(fatherName);

        var txtFamilyName = document.getElementById(familyName);

        var txtNationalId = document.getElementById(nationalId);


        if (txtNationalId.value == "0") {
            txtFirstName.value = '';
            txtFatherName.value = '';
            txtFamilyName.value = '';

            txtFirstName.disabled = false;
            txtFatherName.disabled = false;
            txtFamilyName.disabled = false;


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

        }*/
    }

</script>

<asp:UpdatePanel ID="updateDeathInfo" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div style="width: 100%">
            <table width="100%" cellspacing="0" dir="rtl">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td width="80px">
                                    <asp:Label ID="lblNationality" runat="server" meta:resourcekey="lblNationalityResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpNationality" Width="156px" AutoPostBack="true" runat="server"
                                        meta:resourcekey="drpNationalityResource1" OnSelectedIndexChanged="drpNationality_SelectedIndexChanged">
                                        <asp:ListItem meta:resourcekey="ListItemResource3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                      <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updateDeathInfo" DisplayAfter="1" ID="progParents">
                                <ProgressTemplate>
                                <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                                جارى التحميل
                                </ProgressTemplate>
                                </asp:UpdateProgress>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" width="100%">
                        <table width="100%">
                            <tr>
                                <td runat="server" id="NIDArea" style="display: block">
                                    <table cellpadding="0">
                                        <tr>
                                            <td width="80px">
                                                <asp:Label ID="lblNationalId" runat="server" meta:resourcekey="lblNationalIdResource1"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtNationalId" MaxLength="14" runat="server" 
                                                    meta:resourcekey="txtNationalIdResource1" AutoPostBack="True" 
                                                    ontextchanged="txtNationalId_TextChanged"></asp:TextBox>
                                                <%--<asp:CompareValidator ID="CompareValidator2" Display="Dynamic" ValidationGroup="GenralValidate"
                                        runat="server" ControlToValidate="txtNationalId" ErrorMessage="ارقام فقط"
                                         Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>--%>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                                    ControlToValidate="txtNationalId" ErrorMessage="أدخل رقم قومى صحيح" 
                                                    ValidationExpression="^([0])|(\d{14})$"></asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnSearch" runat="server" Text="بحث" OnClick="btnSearch_Click" 
                                                    Width="35px" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td runat="server" id="proveArea" style="display: none" width="100%">
                                    <table width="100%">
                                        <tr>
                                            <td width="35%">
                                                <table>
                                                    <tr>
                                                        <td width="73px">
                                                            <asp:Label runat="server" ID="lblProveNo" Text="رقم الاثبات"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox MaxLength="20" runat="server" Width="150px" ID="txtProveNo"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" ID="Label2" Width="60px" Text="نوع الاثبات"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox MaxLength="20" runat="server" ID="txtProveType"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblError" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td width="82px">
                                    <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFirstName" MaxLength="20" runat="server" 
                                        meta:resourcekey="txtFirstNameResource1"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                        ID="reqName" ControlToValidate="txtFirstName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table cellspacing="0" width="100%">
                            <tr>
                                <td width="80px" align="left">
                                    <asp:Label ID="lblFatherName" runat="server" meta:resourcekey="lblFatherNameResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFatherName" MaxLength="20" runat="server" 
                                        meta:resourcekey="txtFatherNameResource1"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                        ID="RequiredFieldValidator1" ControlToValidate="txtFatherName" ErrorMessage="*"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table cellspacing="0" width="100%">
                            <tr>
                                <td width="80px" align="left">
                                    <asp:Label ID="lblFamilyName" runat="server" meta:resourcekey="lblFamilyNameResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFamilyName" MaxLength="20"  runat="server" 
                                        meta:resourcekey="txtFamilyNameResource1"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                        ID="RequiredFieldValidator2" ControlToValidate="txtFamilyName" ErrorMessage="*"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td width="80px"> 
                                    <asp:Label ID="Label1" runat="server" meta:resourcekey="lblTitleResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTitle" MaxLength="20" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                        ID="RequiredFieldValidator3" ControlToValidate="txtTitle" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2">
                        <table cellspacing="0" width="100%">
                            <tr>
                                <td width="80px" align="left">
                                    <asp:Label ID="lblBirthday" runat="server" meta:resourcekey="lblBirthdayResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBirthDate" MaxLength="20" runat="server"></asp:TextBox>
                                    <ajaxtoolkit:calendarextender CssClass="custom-calendar" Format="yyyy/MM/dd" TargetControlID="txtBirthDate"
                        ID="calenderStartDate" runat="server">
                    </ajaxtoolkit:calendarextender>
                                    <%-- <a onclick="showCalendarControl(document.getElementById('ctl00_ContentPlaceHolderMain_UcGeneralDeathInfo1_txtBirthDate'))" href="#">
            <img src="Images/calendar.gif" style="width: 20px; height: 20px" border="0" id="imgCalender" > </img> </a>--%>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true"
                                        ValidationGroup="GenralValidate" ID="RequiredFieldValidator7" ControlToValidate="txtBirthDate"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ErrorMessage="*"  ValidationGroup="GenralValidate" 
                                        ControlToValidate="txtBirthDate" Display="Dynamic" 
                                        
                                        ValidationExpression="(0?[1-9]|[12][0-9]|3[01])[/](0?[1-9]|1[12])[/](19[0-9]{2}|[2][0-9][0-9]{2})$" 
                                        Enabled="False"></asp:RegularExpressionValidator>
                                    <asp:ImageButton runat="server" ID="btnCalender" ImageUrl="~/Images/calendar.gif"
                                        Height="20px" Width="20px" 
                                        OnClientClick="showCalendarControl(document.getElementById('ctl00_ContentPlaceHolderMain_UcDeathInfo2_txtBirthDate'));return false;" 
                                        Visible="False" />
                                </td>                                                                                          
                            </tr>
                        </table>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="0">
                            <tr>
                                <td width="80px">
                                    <asp:Label ID="lblReglion" runat="server" meta:resourcekey="lblReglionResource1"></asp:Label>
                                </td>
                                <td style="padding-right:5px;">
                                    <asp:DropDownList ID="drpReglion" Width="155px" runat="server" meta:resourcekey="drpReglionResource1">
                                        <asp:ListItem Text="اختر الديانة" Value="0"></asp:ListItem>
                                        <asp:ListItem Value="1">مسلم</asp:ListItem>
                                        <asp:ListItem Value="2">مسيحى</asp:ListItem>
                                        <asp:ListItem Value="3">يهودى</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                        ID="RequiredFieldValidator5" ControlToValidate="drpReglion" InitialValue="0"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table cellspacing="0" width="100%">
                            <tr>
                                <td width="80px" align="left">
                                    <asp:Label ID="lblMartialStatus" runat="server" meta:resourcekey="lblMartialStatusResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpMartialStatus" Width="155px" runat="server">
                                        <asp:ListItem Text="اختر الحالة الاجتماعية" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="اعزب" Value="1"></asp:ListItem>
                                        <asp:ListItem Value="2">متزوج</asp:ListItem>
                                        <asp:ListItem Value="3">مطلق</asp:ListItem>
                                        <asp:ListItem Value="4">ارمل</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                        ID="RequiredFieldValidator6" ControlToValidate="drpMartialStatus" InitialValue="0"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table cellspacing="0" width="100%">
                            <tr>
                                <td width="80px" align="left">
                                    <asp:Label ID="lblGender" runat="server" meta:resourcekey="lblGenderResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dropGender" AutoPostBack="true" Width="160px" runat="server"
                                        OnSelectedIndexChanged="dropGender_SelectedIndexChanged">
                                        <asp:ListItem Text="اختر النوع" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="ذكر" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="انثي" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                        ID="RequiredFieldValidator4" ControlToValidate="dropGender" InitialValue="0"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblIdCard" runat="server" meta:resourcekey="lblIdCardResource1"></asp:Label>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td width="80px">
                                    <asp:Label ID="lblCardNumber" runat="server" meta:resourcekey="lblCardNumberResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCardNumber" MaxLength="20" runat="server">0</asp:TextBox>
                                </td>
                                <td>
                                    <asp:CompareValidator ID="CompareValidator4" Display="Dynamic" ValidationGroup="GenralValidate"
                                        runat="server" ControlToValidate="txtCardNumber" ErrorMessage="ارقام فقط" Operator="DataTypeCheck"
                                        Type="Integer"></asp:CompareValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table cellspacing="0" width="100%">
                            <tr>
                                <td width="80px" align="left">
                                    <asp:Label ID="lblCardType" runat="server" meta:resourcekey="lblCardTypeResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpCardType" Width="155px" runat="server">
                                        <asp:ListItem Text="شخصية " Value="1"></asp:ListItem>
                                        <asp:ListItem Text="عائلية" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table width="100%" cellspacing="0">
                            <tr>
                                <td width="80px" align="left">
                                    <asp:Label ID="lblCardLocation" runat="server" meta:resourcekey="lblCardLocationResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCardLocation"  MaxLength="20"  runat="server" meta:resourcekey="txtCardLocationResource1"
                                        Text="-"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="drpNationality" EventName="SelectedIndexChanged" />
        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
