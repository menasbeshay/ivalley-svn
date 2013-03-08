<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="RegisterDeathHealthInfo.aspx.cs" Inherits="RegisterDeathHealthInfo"
     %>

<%@ Register Src="~/UserControls/UcItemControl.ascx" TagName="UcItemControl" TagPrefix="uc7" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
<div id="DeathHealthContents" runat="server">
            <ajaxToolkit:TabContainer ID="TabContainerDeathInfo" ActiveTabIndex="0" runat="server"
                meta:resourcekey="TabContainerDeathInfoResource1">
                <ajaxToolkit:TabPanel runat="server" TabIndex="0" ID="TabPanelDeathHealthData" meta:resourcekey="TabPanelDeathHealthData">
                    <ContentTemplate>
                        <table dir="rtl">
                            <tr>
                                <td width="80%">
                                    <asp:Label ID="lblTitle" Font-Bold="True" runat="server" 
                                        meta:resourcekey="lblTitleResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblperiod" Font-Bold="True" runat="server" 
                                        meta:resourcekey="lblperiodResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <uc7:UcItemControl ID="ucItemControlDeathReasonA" runat="server" />
                                </td>
                            </tr>
                            </table>
                            <asp:UpdatePanel runat="server" ID="updDeathCause" UpdateMode="Conditional">
                            <ContentTemplate>  
                            <table dir="rtl">
                            <tr>
                                <td >
                                    <table>
                                        <tr>
                                            <td style="padding-right: 3px;">
                                                <asp:Label ID="ucSickReasonsB" runat="server" Font-Underline="True" meta:resourcekey="ucSickReasonsBResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td colspan="2">
                                                        <div dir="ltr" align="right">
                                                            <asp:DropDownList ID="dropICDCat" runat="server" Width="310px" 
                                                                meta:resourcekey="dropSickReasonsB1Resource1" AutoPostBack="True" 
                                                                onselectedindexchanged="dropICDCat_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        <div dir="ltr" align="right">
                                                            <asp:DropDownList ID="dropICDItem" runat="server" Width="310px" 
                                                                meta:resourcekey="dropSickReasonsB2Resource1" AutoPostBack="True" 
                                                                onselectedindexchanged="dropICDItem_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            </div>
                                                            
                                                        </td>
                                                        <td>
                                                        <asp:Label runat="server" ID="lblSelectedItem" Font-Bold="True"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                 <asp:UpdateProgress ID="UpdateProgress1" DisplayAfter="1" AssociatedUpdatePanelID="updDeathCause" runat="server">
                                    <ProgressTemplate>
                                        <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table>
                                        <tr>
                                            <td style="padding-right: 3px;">
                                                <asp:Label ID="ucSickReasonsC" runat="server" Font-Underline="True" meta:resourcekey="ucSickReasonsCResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td>
                                                        <div dir="ltr" align="right">
                                                            <asp:DropDownList ID="dropICDcode" runat="server" Width="310px" 
                                                                meta:resourcekey="dropSickReasonsCResource1" AutoPostBack="True" 
                                                                onselectedindexchanged="dropICDcode_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                        <asp:Label runat="server" ID="lblSelectedCode" Font-Bold="True"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                           </table>
                             </ContentTemplate>
                            <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dropICDCat" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="dropICDItem" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="dropICDcode" EventName="SelectedIndexChanged" />
                            </Triggers>
                            </asp:UpdatePanel>
                           <table dir="rtl">
                            <tr>
                                <td colspan="2">
                                    <uc7:UcItemControl ID="ucItemControlDeathReasonD" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <uc7:UcItemControl ID="ucItemCauseOfDeathNotRelatedA" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <uc7:UcItemControl ID="ucItemCauseOfDeathNotRelatedB" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" TabIndex="1" ID="TabPanelSmokingData" meta:resourcekey="TabPanelSmokingData">
                    <ContentTemplate>
                    <asp:UpdatePanel runat="server" ID="updSmoking" UpdateMode="Conditional">
                    <ContentTemplate>
                    <table dir="rtl">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" Text="�� ��� ������� ���� �" runat="server"></asp:Label>
                                </td>
                                <td>
                                 <asp:RadioButtonList ID="radioListISSmoker" AutoPostBack="true" OnSelectedIndexChanged="radioListISSmoker_SelectedIndexChanged" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="���" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="��" Value="2" Selected="True"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" Text="��� �������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="radioListSmokingType" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="������" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" Text="��� �������" runat="server"></asp:Label>
                                </td>
                                <td style="padding-right: 8px">
                                    <asp:TextBox ID="txtsmokingPeriod1" MaxLength="2" runat="server" Text="00" Width="30px" />
                                     <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" ValidationExpression="^([0]?[0-9]|[1][0-1])$"
                            ControlToValidate="txtsmokingPeriod1" runat="server" ErrorMessage="����� ��� �����"></asp:RegularExpressionValidator>
                            
                                    <asp:TextBox ID="txtsmokingPeriod2" MaxLength="2" runat="server" Text="00" Width="30px" />
                                    <asp:RegularExpressionValidator  Display="Dynamic" ID="RegularExpressionValidator2" ValidationExpression="^([0]?[0-9]|[1][0-9]|[2][0-9]|[3][0-9]|[4][0-9]|[5][0-9]|[6][0-9]|[7][0-9]|[8][0-9])$"
                            ControlToValidate="txtsmokingPeriod2" runat="server" ErrorMessage="����� ��� ����"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" Text="��� - ���" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="radioListISSmoker" EventName="SelectedIndexChanged" />
                    </Triggers>
                    </asp:UpdatePanel>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" TabIndex="2" ID="TabPanelAccidentData" meta:resourcekey="TabPanelAccidentData">
                    <ContentTemplate>
                    <asp:UpdatePanel runat="server" ID="updateAccedant" UpdateMode="Conditional">
                    <ContentTemplate>
                    <table dir="rtl">
                            <tr>
                                <td>
                                    <asp:Label ID="lblAccident" Text="�� ������ ���� �� ����" runat="server"></asp:Label>
                                </td>
                                <td> 
                                    <asp:RadioButtonList ID="rdCauseByAccedenc" AutoPostBack="true"
                                     OnSelectedIndexChanged="rdCauseByAccedenc_SelectedIndexChanged" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem  Text="���" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="��" Value="2" Selected="True"></asp:ListItem>
                                    </asp:RadioButtonList>
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
                                    <asp:Label ID="lblReason" Text="��� ������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpReason" Width="75px" AutoPostBack="true"  OnSelectedIndexChanged="drpReason_SelectedIndexChanged" runat="server">
                                        <asp:ListItem Text="-----" Value="0" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="���� ����" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" Text="�� ���� ��� ��� ���� �����" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAnotherReason" runat="server"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label6" Text="���� ������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAccidentLocation" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label7" Text="��� ���� ����� ���� �� ��� �������" runat="server"></asp:Label>
                                </td>
                                <td style="margin-right: 40px">
                                    <asp:DropDownList ID="dropCarType" Width="75px" AutoPostBack="true" 
                                        OnSelectedIndexChanged="dropCarType_SelectedIndexChanged" runat="server" 
                                        Enabled="False">
                                        <asp:ListItem Text="-----" Value="0" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="�����" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="������" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="Label8" Text="�� ���� ���� ���� �����" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCarType" runat="server" Enabled="False"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label9" Text="��� �������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList Width="250px" ID="RdDeadPersonType" RepeatDirection="Horizontal"
                                        runat="server" Enabled="False">
                                        <asp:ListItem Selected="True" Text="��� �����" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="��� �������" Value="4"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="rdCauseByAccedenc" EventName="SelectedIndexChanged"/>
                    </Triggers>
                    </asp:UpdatePanel>
                        
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" TabIndex="3" ID="TabPanelTumorsData" meta:resourcekey="TabPanelTumorsData">
                    <ContentTemplate>
                    
                    <asp:UpdatePanel runat="server" ID="updTumors" UpdateMode="Conditional">
                    <ContentTemplate>
                    <table dir="rtl">
                            <tr>
                                <td>
                                    <asp:Label ID="Label10" Text="�� ��� ������� ����� �����" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdTumorFlag" AutoPostBack="true"
                                    OnSelectedIndexChanged="rdTumorFlag_SelectedIndexChanged" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="���" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="��" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblLocation" Text="���� ����� ������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTumorLocation" Width="200px" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" Text="��� �����" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dropTumorType" Width="207px" runat="server">
                                        <asp:ListItem Text="��� �����" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="����" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label12" Text="����� �����" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dropTumorPhases" Width="207px" runat="server">
                                        <asp:ListItem Text="��� ����� " Value="1"></asp:ListItem>
                                        <asp:ListItem Text="��� �����" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="����� ������� ���������" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="����� ������ ���� ������" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="rdTumorFlag" EventName="SelectedIndexChanged" />
                    </Triggers>
                    </asp:UpdatePanel>
                        
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" TabIndex="4" ID="TabPanelGirlsData" meta:resourcekey="TabPanelGirlsData">
                    <ContentTemplate>
                        <table dir="rtl">
                        <tr>
                        <td colspan="4">
                            <asp:Label ID="Label21" runat="server" 
                                Text="����� ��� : ���� ������� ��������� ���������� ���� ���� ������ ��� ���� ��� ������ ( ���� ��� � ���� ������ � ���� ��� �� ������ ������� ��������� )" 
                                Font-Bold="True"></asp:Label>
                        </td>
                        </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label13" Text="�� ���� �������� ����" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdDeathThroughCarry" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="���" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="��" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <asp:Label ID="Label16" Text="�� ���� ������ ����� �������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdDeadThroughBirth" RepeatDirection="Horizontal" runat="server">
                                       <asp:ListItem Text="���" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="��" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <asp:Label ID="Label14" Text="�� ���� ����� ���� 6 ������ ����� ������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdBirthPast6Weeks" RepeatDirection="Horizontal" runat="server">
                                       <asp:ListItem Text="���" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="��" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label15" Text="�� ��� ����� ���� 6 ������ ����� ������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdAbortionPast6Weeks" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="���" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="��" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label17" Text="�� ���� ��� : �� �� ����� �������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender CssClass="custom-calendar" Format="yyyy/MM/dd" 
                                        TargetControlID="txtDate" ID="calenderDate" runat="server" Enabled="True">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Label ID="Label19" Text="���� �������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dropBirthOuput" Width="155px" runat="server">
                                        <asp:ListItem Text="����" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="����� ��" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="����� ���" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label18" Text="�� ���� ��� : �� �� ���� �������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBirthLocation" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label20" Text="������ ��������" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBirthOperator" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>
            <table dir="rtl" align="center">
                <tr>
                    <td align="center">
                        <asp:Button ID="btnAdd" Width="150px" Font-Size="Large" runat="server" 
                            meta:resourcekey="btnAddResource1" onclick="btnAdd_Click" />
                    </td>
                </tr>
            </table>
            <table align="center" runat="server" id="tblApprove" style="display:none">
                <tr>
                    <td>
                       <asp:Button runat="server" ID="btnApprove" OnClick="btnApprove_Click" Text="�����" Width="120px" />
                       <asp:Button runat="server" ID="btnBack" OnClick="btnBack_Click" Text="����" Width="120px" />
                    </td>
                </tr>
            </table>
            </div>
</asp:Content>
