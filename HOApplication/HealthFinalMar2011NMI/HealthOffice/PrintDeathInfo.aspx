<%@ Page Language="C#" MasterPageFile="~/MasterPages/PrintMaster.master" AutoEventWireup="true" CodeFile="PrintDeathInfo.aspx.cs" Inherits="PrintDeathInfo" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<%@ Register Src="~/UserControls/UcParentInfo.ascx" TagName="UcParentInfo" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/UcNotifierInfo.ascx" TagName="UcNotifierInfo" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/UcDeathInfo.ascx" TagName="UcDeathInfo" TagPrefix="uc4" %>
<%@ Register Src="~/UserControls/UcAddressInfo.ascx" TagName="UcAddressInfo" TagPrefix="uc5" %>
<%@ Register Src="~/UserControls/DecisionControl.ascx" TagName="DecisionControl" TagPrefix="uc4" %>
<%@ Register Src="~/UserControls/ucGeneralDeathInfo.ascx" TagName="ucGeneralDeathInfo"
    TagPrefix="uc6" %>
<%@ Register Src="~/UserControls/UcItemControl.ascx" TagName="UcItemControl" TagPrefix="uc7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<script language="javascript" type="text/javascript">

    function FillNotifierInfo(obj) {
   // debugger
        // Mother Oiginal Data
    var MotherNID = document.getElementById('ctl00_ContentPlaceHolderMain_UcMotherInfo2_txtNationalId');
    var MotherFName = document.getElementById('ctl00_ContentPlaceHolderMain_UcMotherInfo2_txtFirstName');
    var MotherSName = document.getElementById('ctl00_ContentPlaceHolderMain_UcMotherInfo2_txtFatherName');
    var Mother3Name = document.getElementById('ctl00_ContentPlaceHolderMain_UcMotherInfo2_txtFamilyName');
    var MotherNationality = document.getElementById('ctl00_ContentPlaceHolderMain_UcMotherInfo2_dropNationality') 
       
       //Notifier Data
    var NotifierNID = document.getElementById('ctl00_ContentPlaceHolderMain_UcNotifierInfo2_txtNationalId');
    var NotifierFName = document.getElementById('ctl00_ContentPlaceHolderMain_UcNotifierInfo2_txtFirstName');
    var NotifierSName = document.getElementById('ctl00_ContentPlaceHolderMain_UcNotifierInfo2_txtFatherName');
        
        var selectedValue = obj.options[obj.selectedIndex].value;

        if (selectedValue == '2') {
            if (MotherNationality.value == '13818') {
                // Mother Selected
                if (MotherNID.value != 0) {
                    NotifierNID.value = MotherNID.value;
                    NotifierFName.value = MotherFName.value;
                    NotifierSName.value = MotherSName.value + ' ' + Mother3Name.value;
                }
            }
        }
        else {
            NotifierNID.value = '';
            NotifierFName.value = '';
            NotifierSName.value = '';
        }

    }

    function ClearNotifierData(objNat) {
          //debugger
        //Notifier Data
        var NotifierType = document.getElementById('ctl00_ContentPlaceHolderMain_UcNotifierInfo2_drpNotiferRelation');
        var NotifierNID = document.getElementById('ctl00_ContentPlaceHolderMain_UcNotifierInfo2_txtNationalId');
        var NotifierFName = document.getElementById('ctl00_ContentPlaceHolderMain_UcNotifierInfo2_txtFirstName');
        var NotifierSName = document.getElementById('ctl00_ContentPlaceHolderMain_UcNotifierInfo2_txtFatherName');
        var NotifierHdnFName = document.getElementById('ctl00_ContentPlaceHolderMain_UcNotifierInfo2_hdnFirstName');
        var NotifierHdnSName = document.getElementById('ctl00_ContentPlaceHolderMain_UcNotifierInfo2_hdnFatherName');
        var NotifierPhone = document.getElementById('ctl00_ContentPlaceHolderMain_UcNotifierInfo2_txtPhoneNumber');
        var notifierNationlityId = objNat.id;
        if (notifierNationlityId.indexOf('UcFatherInfo2') != -1) {
            // Father case.
            if (NotifierType.options[NotifierType.selectedIndex].value == 1) {
                NotifierType.selectedIndex = 0;
                NotifierNID.value = '';
                NotifierFName.value = '';
                NotifierSName.value = '';
                NotifierHdnFName.value = '';
                NotifierHdnSName.value = '';
                NotifierPhone.value = '';
            }
        }
        else {
            // Mother Case
            if (NotifierType.options[NotifierType.selectedIndex].value == 2) {
                NotifierType.selectedIndex = 0;
                NotifierNID.value = '';
                NotifierFName.value = '';
                NotifierSName.value = '';
                NotifierHdnFName.value = '';
                NotifierHdnSName.value = '';
                NotifierPhone.value = '';
            }
        }
    }
</script>

<table align="center"><tr><td>

<input id="Button1" onclick="window.print();" value="طباعة" type="button" value="button" />
</td></tr></table>
<center>
   <div runat="server" id="DeathCaseConents" style="width:75%">
         <table id="tblType" runat="server" style="display:none;" dir="rtl" align="center">
        <tr>
            <td>
                <asp:Label ID="lblRegisterType" runat="server" Text="نوع القيد"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdTypeList" AutoPostBack="true" OnSelectedIndexChanged="rdTypeList_SelectedIndexChanged" RepeatDirection="Horizontal" 
                    runat="server" meta:resourcekey="rdTypeListResource1">
                    <asp:ListItem Selected="True" Value="0" Text="ساقط قيد"></asp:ListItem>
                    <asp:ListItem Text="مجهول الهوية" Value="1"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
            <asp:Panel runat="server" ID="pnlDeath" Direction="RightToLeft" meta:resourcekey="pnlDeathResource1">
                <uc4:UcDeathInfo ID="UcDeathInfo2" runat="server" />
            </asp:Panel>
            <br />
            <asp:Panel runat="server" ID="pnlLocation" Direction="RightToLeft" meta:resourcekey="pnlLocationResource1">
                <uc5:UcAddressInfo ID="UcAddressInfo1" runat="server" />
            </asp:Panel>
            <br />
            <asp:Panel runat="server" ID="pnlGeneralDeathInfo" Direction="RightToLeft" meta:resourcekey="pnlGeneralDeathInfoResource1">
                <uc6:ucGeneralDeathInfo ID="UcGeneralDeathInfo1" runat="server" />
            </asp:Panel>
            <br />
            <asp:Panel runat="server" ID="pnlMotherInfo" meta:resourcekey="pnlMotherInfoResource1">
                <uc2:UcParentInfo ID="UcMotherInfo2" UCType="Mother" runat="server" />
            </asp:Panel>
            <br />
            <asp:Panel runat="server" ID="pnlNotifier" Direction="RightToLeft" meta:resourcekey="pnlNotifierResource1">
                <uc3:UcNotifierInfo ID="UcNotifierInfo2" NotifierRelationCase="علاقته بالمتوفى" runat="server" />
            </asp:Panel>
            <br />
                        <div id="DivDecision" runat="server" style="display:none;">
                        <asp:Panel ID="pnlDecison" runat="server" >
                            <uc4:DecisionControl ID="DecisionControl1" runat="server" />
                        </asp:Panel>
                         </div>
            <br />
            <asp:Panel runat="server" ID="pnlSummary" Direction="RightToLeft" meta:resourcekey="pnlSummaryResource1">
                <table width="100%">
                    <tr>
                        <td width="34%">
                            <table>
                                <tr>
                                    <td width="65px">
                                        <asp:Label ID="lblHealthOffice" Text="مكتب الصحة" runat="server" 
                                            meta:resourcekey="lblHealthOfficeResource1" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblHealthOfficeValue" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblRegisterNumber" Text="رقم القيد" runat="server" 
                                            meta:resourcekey="lblRegisterNumberResource1" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRecordNumber" Text="1" MaxLength="20" runat="server" ReadOnly="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate" ID="RequiredFieldValidator5" 
            ControlToValidate="txtRecordNumber" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
           <%-- <asp:CompareValidator ID="CompareValidator14" Display="Dynamic" ValidationGroup="GenralValidate"
                                        runat="server" ControlToValidate="txtRecordNumber" ErrorMessage="ارقام فقط"
                                         Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td width="61px">
                                        <asp:Label ID="lblRecordNumber" Text="رقم الدفتر" runat="server" 
                                            meta:resourcekey="lblRecordNumberResource1" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRegestierNoList" runat="server" ReadOnly="True"></asp:TextBox>
                                        <asp:HiddenField ID="drpRegestierNoList" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblRecordDate" Text="تاريخ القيد" runat="server" 
                                            meta:resourcekey="lblRecordDateResource1" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRecordDateValue" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table dir="rtl" align="center">
                <tr>
                    <td align="center">
                        
                    </td>
                </tr>
            </table>
            <table align="center" runat="server" id="tblApprove" style="display:none">
                <tr>
                    <td>
                       
                    </td>
                </tr>
            </table>
         </div>
</center>
</asp:Content>

