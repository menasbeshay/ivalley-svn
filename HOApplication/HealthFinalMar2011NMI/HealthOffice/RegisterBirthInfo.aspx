<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="RegisterBirthInfo.aspx.cs" Inherits="RegisterBirthdayInfo"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<%@ Register Src="~/UserControls/UcBornInfo.ascx" TagName="UcBornInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/UcParentInfo.ascx" TagName="UcParentInfo" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/UcNotifierInfo.ascx" TagName="UcNotifierInfo" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/DecisionControl.ascx" TagName="DecisionControl"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <script language="javascript">
       function EnableTextBoxesHealth(firstname, fatherName, nationalId) {
        
           var txtFirstName = document.getElementById(firstname);
           var txtFatherName = document.getElementById(fatherName);
           var txtNationalId = document.getElementById(nationalId);


           if (txtNationalId.value == "0") {
               txtFirstName.disabled = false;
               txtFatherName.disabled = false;
               txtFirstName.value = '';
               txtFatherName.value = '';
               // txtNationalId.focus();
           }
           else {
               txtFirstName.disabled = true;
               txtFatherName.disabled = true;
           }

           if (txtFirstName.value != "" && txtFatherName.value != "") {
               txtFirstName.value = '';
               txtFatherName.value = '';
           }
       }

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <script language="javascript" type="text/javascript">

        function FillNotifierInfo(obj) {
            // debugger
            // Father Oiginal Data
            var FatherNID = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcFatherInfo2_txtNationalId');                                                     
            var FatherFName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcFatherInfo2_txtFirstName');
            var FatherSName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcFatherInfo2_txtFatherName');
            var Father3Name = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcFatherInfo2_txtFamilyName');
            var FatherNationality = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcFatherInfo2_dropNationality')

            // Mother Oiginal Data
            var MotherNID = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcMotherInfo2_txtNationalId');
            var MotherFName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcMotherInfo2_txtFirstName');
            var MotherSName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcMotherInfo2_txtFatherName');
            var Mother3Name = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcMotherInfo2_txtFamilyName');
            var MotherNationality = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcMotherInfo2_dropNationality')

            //Notifier Data
            var NotifierNID = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_txtNationalId');
            var NotifierFName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_txtFirstName');
            var NotifierSName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_txtFatherName');
            var NotifierHdnFName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_hdnFirstName');
            var NotifierHdnSName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_hdnFatherName');

            var selectedValue = obj.options[obj.selectedIndex].value;

            if (selectedValue == '1') {
                if (FatherNationality.value == '13818') {
                    // Father selected
                    if (FatherNID.value != 0) {
                        NotifierNID.value = FatherNID.value;
                        NotifierFName.value = FatherFName.value;
                        NotifierHdnFName.value = FatherFName.value;
                        NotifierSName.value = FatherSName.value + ' ' + Father3Name.value;
                        NotifierHdnSName.value = FatherSName.value + ' ' + Father3Name.value;
                    }
                }
            }
            else if (selectedValue == '2') {
                if (MotherNationality.value == '13818') {
                    // Mother Selected
                    if (MotherNID.value != 0) {
                        NotifierNID.value = MotherNID.value;
                        NotifierFName.value = MotherFName.value;
                        NotifierHdnFName.value = MotherFName.value;
                        NotifierSName.value = MotherSName.value + ' ' + Mother3Name.value;
                        NotifierHdnSName.value = FatherSName.value + ' ' + Father3Name.value;
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
            var NotifierType = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_drpNotiferRelation');
            var NotifierNID = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_txtNationalId');
            var NotifierFName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_txtFirstName');
            var NotifierSName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_txtFatherName');
            var NotifierHdnFName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_hdnFirstName');
            var NotifierHdnSName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_hdnFatherName');
            var NotifierPhone = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_txtPhoneNumber');
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
    
    function ClearFields()
    {
        var NotifierType = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_drpNotiferRelation');        
        var NotifierFName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_txtFirstName');
        var NotifierSName = document.getElementById('ctl00_ContentPlaceHolderMain_TabContainerBirthInfo_TabPanelBasicData_UcNotifierInfo1_txtFatherName');
        
        if (NotifierFName.value != '' && NotifierSName.value !='')
        {
            NotifierFName.value = '';
            NotifierSName.value = '';
            NotifierType.selectedIndex = 0;
        }
    }

    </script>
   

   <div runat="server" id="divBirthPage">
            <table id="tblType" runat="server" style="display: none;" dir="rtl" align="center">
                <tr>
                    <td>
                        <asp:Label ID="lblRegisterType" runat="server" Text="äæÚ ÇáÞíÏ"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rdTypeList" AutoPostBack="true" OnSelectedIndexChanged="rdTypeList_SelectedIndexChanged"
                            RepeatDirection="Horizontal" runat="server" meta:resourcekey="rdTypeListResource1">
                            <asp:ListItem Selected="True" Value="0" Text="ÓÇÞØ ÞíÏ"></asp:ListItem>
                            <asp:ListItem Text="ãÚËæÑ Úáíå" Value="1"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <ajaxToolkit:TabContainer ID="TabContainerBirthInfo" ActiveTabIndex="0" runat="server"
                AutoPostBack="false" OnActiveTabChanged="TabContainerBirthInfo_ActiveTabChanged"
                TabIndex="1">
                <ajaxToolkit:TabPanel ID="TabPanelBasicData" TabIndex="0" runat="server" meta:resourcekey="TabPanelBasicData">
                    <ContentTemplate>
                        <asp:Panel runat="server" Width="100%" ID="pnlbornInfo" Direction="RightToLeft" meta:resourcekey="pnlbornInfoResource1">
                            <uc1:UcBornInfo ID="UcBornInfo1" runat="server" />
                        </asp:Panel>
                        <br />
                        <asp:Panel runat="server" ID="pnlFatherInfo" Direction="RightToLeft" meta:resourcekey="pnlFatherInfoResource1">
                            <div style="width: 100%">
                                <uc2:UcParentInfo  ID="UcFatherInfo2" UCType="Father" runat="server" />
                            </div>
                        </asp:Panel>
                        <br />
                        <asp:Panel runat="server" ID="pnlMotherInfo" Direction="RightToLeft" meta:resourcekey="pnlMotherInfoResource1">
                        <div style="width: 100%">
                            <uc2:UcParentInfo ID="UcMotherInfo2" UCType="Mother" runat="server" />
                            </div>
                        </asp:Panel>
                        <br />
                        <asp:Panel runat="server" ID="pnlNotifier" Direction="RightToLeft" meta:resourcekey="Panel1Resource1">
                            <uc3:UcNotifierInfo ID="UcNotifierInfo1" UCType="Born" runat="server" />
                        </asp:Panel>
                        <br />
                        <div id="DivDecision" runat="server" style="display: none;">
                            <asp:Panel ID="pnlDecison" runat="server" Direction="RightToLeft">
                                <uc4:DecisionControl ID="DecisionControl1" runat="server" />
                            </asp:Panel>
                        </div>
                        <br />
                        <asp:Panel runat="server" ID="pnlSummary" Direction="RightToLeft" meta:resourcekey="pnlSummaryResource1">
                            <table width="100%">
                                <tr>
                                    <td width="33%">
                                        <table>
                                            <tr>
                                                <td width="61px">
                                                    <asp:Label ID="lblHealthOffice" Font-Bold="True" runat="server" 
                                                        meta:resourcekey="lblHealthOfficeResource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblHealthOfficeValue" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td width="45px">
                                                    <asp:Label ID="lblRegisterNumber" Font-Bold="True" runat="server" 
                                                        meta:resourcekey="lblRegisterNumberResource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRecordNumber" Text="1" MaxLength="20" TabIndex="100" 
                                                        runat="server" Visible="False"></asp:TextBox>
                                                    <asp:Label ID="lblRecordNumberValue" Font-Bold="True" runat="server" Text="1"></asp:Label>
                                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                                        ID="RequiredFieldValidator5" ControlToValidate="txtRecordNumber" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator14" Display="Dynamic" ValidationGroup="GenralValidate"
                                                        runat="server" ControlToValidate="txtRecordNumber" ErrorMessage="ÇÑÞÇã ÝÞØ" Operator="DataTypeCheck"
                                                        Type="Integer"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td width="61px">
                                                    <asp:Label ID="lblRecordNumber" Font-Bold="True" runat="server" 
                                                        meta:resourcekey="lblRecordNumberResource1"></asp:Label>
                                                </td>
                                                <td align="right">
                                                    <asp:TextBox ID="txtRegestierNoList" runat="server" ReadOnly="True" 
                                                        TabIndex="101" ></asp:TextBox>
                                                        <asp:HiddenField runat="server" ID="drpRegestierNoList" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblRecordDate" Font-Bold="True" runat="server" 
                                                        meta:resourcekey="lblRecordDateResource1"></asp:Label>
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
                        <br />
                        <br />
                        <div style="text-align: center">
                            <asp:Button ID="btnSaveBornInfo" ValidationGroup="GenralValidate" Font-Size="Large"
                                Width="150px" Text="ÇÖÇÝÉ ÈíÇäÇÊ ÇáæÇÞÚÉ" runat="server" OnClick="btnSaveBornInfo_Click" />
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="TabPanelHealthData" Enabled="false" meta:resourcekey="TabPanelHealthData"
                    runat="server">
                    <ContentTemplate>
                    <asp:UpdatePanel runat="server" ID="updteBornHealthInfo" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlHealthInfo" runat="server" meta:resourcekey="pnlHealthInfoResource1">
                            <table width="100%" dir="rtl">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBirthLocation" runat="server" Font-Underline="True" meta:resourcekey="lblBirthLocationResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBirthLocation" TabIndex="1" MaxLength="30" runat="server" meta:resourcekey="txtBirthLocationResource1"></asp:TextBox>
                                        <asp:RequiredFieldValidator SetFocusOnError="True" runat="server" Display="Dynamic"
                                            ValidationGroup="MedicalInfoValidate" ID="RequiredFieldValidator6" ControlToValidate="txtBirthLocation"
                                            ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBirthWeight" runat="server" Font-Underline="True" meta:resourcekey="lblBirthWeightResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:DropDownList runat="server" ID="drpBornWieght">
                                                    <asp:ListItem Text="ØÈíÚì" Value="1" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="ÃÚáì ãä ÇáØÈíÚì" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="ÃÞá ãä ÇáØÈíÚì" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                        
                                                </td>
                                                
                                                    
                                                
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblKilo" runat="server" meta:resourcekey="lblKiloResource1"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMotherCurrentInterval" runat="server" Font-Underline="True" meta:resourcekey="lblMotherCurrentIntervalResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtCurrentInterval1" MaxLength="2" Width="50px" runat="server" meta:resourcekey="txtCurrentInterval1Resource1"
                                                        TabIndex="5">0</asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                                        ID="RequiredFieldValidator3" ControlToValidate="txtCurrentInterval1" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator3" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                                        runat="server" ControlToValidate="txtCurrentInterval1" ErrorMessage="ÇÑÞÇã ÝÞØ"
                                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCurrentInterval2" MaxLength="2" Width="50px" runat="server" meta:resourcekey="txtCurrentInterval2Resource1"
                                                        TabIndex="4"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                                        ID="RequiredFieldValidator4" ControlToValidate="txtCurrentInterval2" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator4" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                                        runat="server" ControlToValidate="txtCurrentInterval2" ErrorMessage="ÇÑÞÇã ÝÞØ"
                                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                        </table>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" ControlToValidate="txtCurrentInterval2"
                                                        ErrorMessage="ÛíÑ ÕÍíÍ" ValidationGroup="MedicalInfoValidate" ValidationExpression="^([0-9]?[0-9])$"
                                                        runat="server"></asp:RegularExpressionValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" ControlToValidate="txtCurrentInterval1"
                                                        ValidationGroup="MedicalInfoValidate" ErrorMessage="ÛíÑ ÕÍíÍ" ValidationExpression="^([0]?[0-9]|[0-1][0-1])$"
                                                        runat="server"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblYearMonth1" runat="server" meta:resourcekey="lblYearMonth1Resource1"></asp:Label>
                                    </td>
                                </tr>
                                
                             <tr runat="server" id="tr1" visible="false">
                                    <td>
                                        <asp:Label ID="lblMotherPastInterval" runat="server" Font-Underline="True" meta:resourcekey="lblMotherPastIntervalResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtPastInterval1" Width="50px" runat="server" meta:resourcekey="txtPastInterval1Resource1"
                                                        TabIndex="7">0</asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPastInterval2" Width="50px" runat="server" meta:resourcekey="txtPastInterval2Resource1"
                                                        TabIndex="6">0</asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="regYear" ControlToValidate="txtPastInterval2"
                                                        ErrorMessage="ÛíÑ ÕÍíÍ" ValidationGroup="MedicalInfoValidate" ValidationExpression="^([0-9]?[0-9])$"
                                                        runat="server"></asp:RegularExpressionValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtPastInterval1"
                                                        ValidationGroup="MedicalInfoValidate" ErrorMessage="ÛíÑ ÕÍíÍ" ValidationExpression="^([0]?[0-9]|[0-1][0-1])$"
                                                        runat="server"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblYearMonth2" runat="server" meta:resourcekey="lblYearMonth2Resource1"></asp:Label>
                                    </td>
                                </tr>
                                <tr runat="server" id="tr2" visible="false">
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblVariatyBorn" runat="server" Font-Underline="True" meta:resourcekey="lblVariatyBornResource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblAlive1" runat="server" meta:resourcekey="lblAlive1Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTwinsNo" OnTextChanged="txtTwinsNo_TextChanged" AutoPostBack="True"
                                            runat="server" Text="0" meta:resourcekey="txtVariatyBorn1Resource1" TabIndex="8"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator7" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                            runat="server" ControlToValidate="txtTwinsNo" ErrorMessage="ÇÑÞÇã ÝÞØ" Operator="DataTypeCheck"
                                            Type="Integer"></asp:CompareValidator>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblTotal1" runat="server" meta:resourcekey="lblTotal1Resource1"></asp:Label></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTotal1" Width="50px" runat="server" meta:resourcekey="txtTotal1Resource1"
                                                        ReadOnly="True" TabIndex="21"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator8" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                                        runat="server" ControlToValidate="txtTotal1" ErrorMessage="ÇÑÞÇã ÝÞØ" Operator="DataTypeCheck"
                                                        Type="Integer"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server" id="tr3" visible="false">
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblCurrentNoOfChildren" runat="server" Font-Underline="True" meta:resourcekey="lblCurrentNoOfChildrenResource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblAlive2" runat="server" meta:resourcekey="lblAlive2Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOldBornNo" OnTextChanged="txtOldBornNo_TextChanged" AutoPostBack="True"
                                            Text="0" runat="server" meta:resourcekey="txtCurrentNoOfChildrenResource1" TabIndex="9"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator9" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                            runat="server" ControlToValidate="txtOldBornNo" ErrorMessage="ÇÑÞÇã ÝÞØ" Operator="DataTypeCheck"
                                            Type="Integer"></asp:CompareValidator>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblTotal2" runat="server" meta:resourcekey="lblTotal2Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTotal2" Width="50px" runat="server" meta:resourcekey="txtTotal2Resource1"
                                                        ReadOnly="True" TabIndex="22"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator10" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                                        runat="server" ControlToValidate="txtTotal2" ErrorMessage="ÇÑÞÇã ÝÞØ" Operator="DataTypeCheck"
                                                        Type="Integer"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server" id="tr4" visible="false">
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblPastNoOfChildrent" runat="server" Font-Underline="True" meta:resourcekey="lblPastNoOfChildrentResource1"></asp:Label>
                                                    <asp:Label ID="lblAlive3" runat="server" meta:resourcekey="lblAlive3Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtXOldBornNo" OnTextChanged="txtXOldBornNo_TextChanged" AutoPostBack="True"
                                            Text="0" runat="server" meta:resourcekey="txtPastNoOfChildrentResource1" TabIndex="10"></asp:TextBox>
                                        <asp:CompareValidator ID="ValidateXOldBornNo" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                            runat="server" ControlToValidate="txtXOldBornNo" ErrorMessage="ÇÑÞÇã ÝÞØ" Operator="DataTypeCheck"
                                            Type="Integer"></asp:CompareValidator>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblTotal3" runat="server" meta:resourcekey="lblTotal3Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTotal3" Width="50px" runat="server" meta:resourcekey="txtTotal3Resource1"
                                                        ReadOnly="True" TabIndex="23"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator11" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                                        runat="server" ControlToValidate="txtTotal3" ErrorMessage="ÇÑÞÇã ÝÞØ" Operator="DataTypeCheck"
                                                        Type="Integer"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server" id="tr5" visible="false">
                                    <td>
                                        <asp:Label ID="lblPastDeadNoOfChildrent" runat="server" Font-Underline="True" meta:resourcekey="lblPastDeadNoOfChildrentResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPastDeadNoOfChildrent" Text="0" runat="server" meta:resourcekey="txtPastDeadNoOfChildrentResource1"
                                            TabIndex="11"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator12" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                            runat="server" ControlToValidate="txtPastDeadNoOfChildrent" ErrorMessage="ÇÑÞÇã ÝÞØ"
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    </td>
                                    <td>
                                    </td>
                                </tr> 
                                
                                <tr runat="server" id="tr6" visible="false">
                                    <td align="center">
                                        <asp:Label ID="lblNationalNumber" runat="server" Font-Underline="True" meta:resourcekey="lblNationalNumberResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNationalNumber"  runat="server"
                                            meta:resourcekey="txtNationalNumberResource1" MaxLength="14"  TabIndex="12"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator13" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                            runat="server" ControlToValidate="txtNationalNumber" ErrorMessage="ÇÑÞÇã ÝÞØ"
                                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                            ID="RequiredFieldValidator7" ControlToValidate="txtNationalNumber" ErrorMessage="*"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSearch" Width="50px" OnClick="btnSearch_Click" runat="server"
                                            meta:resourcekey="btnSearchResource1" TabIndex="14" />
                                    </td>
                                </tr>
                                <tr runat="server" id="tr7" visible="false">
                                    <td align="center">
                                        <asp:Label ID="lblName" runat="server" Font-Underline="True" meta:resourcekey="lblNameResource1"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <table dir="rtl" class="TableBorderBlue">
                                            <tr>
                                                <td align="center">
                                                    <asp:Label ID="lblFirstName" runat="server" meta:resourcekey="lblFirstNameResource1"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblRemainName" runat="server" meta:resourcekey="lblRemainNameResource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtFirstName" Enabled="false" runat="server" meta:resourcekey="txtFirstNameResource1"
                                                        ></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                                        ID="RequiredFieldValidator8" ControlToValidate="txtFirstName" ErrorMessage="*"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRemainName" Enabled="false" runat="server" meta:resourcekey="txtRemainNameResource1"
                                                        ></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                                        ID="RequiredFieldValidator9" ControlToValidate="txtRemainName" ErrorMessage="*"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblRelation" runat="server" meta:resourcekey="lblRelationResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drpRelation" runat="server" Width="157px" meta:resourcekey="drpRelationResource1"
                                            TabIndex="16">
                                            <asp:ListItem Text="------" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="ØÈíÈ" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="ããÑÖÉ" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="ÏÇíÉ" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="ÇÎÑì" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="MedicalInfoValidate"
                                            ID="RequiredFieldValidator10" ControlToValidate="drpRelation" ErrorMessage="*"
                                            InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                            <div style="text-align: center">
                                <asp:Button ID="btnSaveMedicalInfo" ValidationGroup="MedicalInfoValidate" Font-Size="Large"
                                    Width="150px" Text="ÇÖÇÝÉ ÇáÈíÇäÇÊ ÇáÕÍíÉ" runat="server" OnClick="btnSaveMedicalInfo_Click"
                                    TabIndex="17" />
                            </div>
                        </asp:Panel>
                           </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="txtTwinsNo" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="txtOldBornNo" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="txtXOldBornNo" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                    </Triggers>
                    </asp:UpdatePanel>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>
            <table align="center" runat="server" id="tblApprove" style="display: none">
                <tr>
                    <td>
                        <asp:Button runat="server" ID="btnApprove" OnClick="btnApprove_Click" Text="ÊæËíÞ"
                            Width="120px" />
                        <asp:Button runat="server" ID="btnBack" OnClick="btnBack_Click" Text="ÑÌæÚ" Width="120px" />
                    </td>
                </tr>
            </table>
            </div>
</asp:Content>

