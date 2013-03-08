<%@ Page Language="C#" MasterPageFile="~/MasterPages/PrintMaster.master" AutoEventWireup="true" CodeFile="PrintMedicalDeathInfo.aspx.cs" Inherits="PrintMedicalDeathInfo" Title="Untitled Page" %>

<%@ Register Src="~/UserControls/UcItemControl.ascx" TagName="UcItemControl" TagPrefix="uc7" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<center>
<div id="DeathHealthContents" style="width:75%;" runat="server">
           <table align="center"><tr><td>

<input id="Button1" onclick="window.print();" value="طباعة" type="button" value="button" />
</td></tr></table>
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
                            <tr>
                                <td colspan="2" align="right">
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
                                                        <td>
                                                        <div dir="ltr" align="right">
                                                            
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                        <div dir="ltr" align="right">
                                                            
                                                            </div>
                                                            <asp:Label runat="server" ID="lblSelectedItem" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table align="right">
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
                  
                    <asp:UpdatePanel runat="server" ID="updSmoking" UpdateMode="Conditional">
                    <ContentTemplate>
                    
                    <asp:Panel ID="uiPnlSmoking" GroupingText="<b>بيانات التدخين</b>" runat="server">
                    <table dir="rtl" align="right">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" Text="هل كان المتوفي يدخن ؟" runat="server"></asp:Label>
                                </td>
                                <td>
                                 <asp:RadioButtonList ID="radioListISSmoker" AutoPostBack="true" OnSelectedIndexChanged="radioListISSmoker_SelectedIndexChanged" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="نعم" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="لا" Value="2" Selected="True"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" Text="نوع التدخين" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="radioListSmokingType" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="سيجارة" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="شيشة" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="اخري" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" Text="مدة التدخين" runat="server"></asp:Label>
                                </td>
                                <td style="padding-right: 8px">
                                    <asp:TextBox ID="txtsmokingPeriod1" MaxLength="2" runat="server" Text="00" Width="30px" />
                                     <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" ValidationExpression="^([0]?[0-9]|[1][0-1])$"
                            ControlToValidate="txtsmokingPeriod1" runat="server" ErrorMessage="الشهر غير صحيحة"></asp:RegularExpressionValidator>
                            
                                    <asp:TextBox ID="txtsmokingPeriod2" MaxLength="2" runat="server" Text="00" Width="30px" />
                                    <asp:RegularExpressionValidator  Display="Dynamic" ID="RegularExpressionValidator2" ValidationExpression="^([0]?[0-9]|[1][0-9]|[2][0-9]|[3][0-9]|[4][0-9]|[5][0-9]|[6][0-9]|[7][0-9]|[8][0-9])$"
                            ControlToValidate="txtsmokingPeriod2" runat="server" ErrorMessage="السنة غير صحيح"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" Text="شهر - سنة" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                     </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="radioListISSmoker" EventName="SelectedIndexChanged" />
                    </Triggers>
                    </asp:UpdatePanel>
                    <asp:Panel ID="Panel1" GroupingText="<b>بيانات الحوادث</b>" runat="server">
                    <asp:UpdatePanel runat="server" ID="updateAccedant" UpdateMode="Conditional">
                    <ContentTemplate>
                    <table dir="rtl">
                            <tr>
                                <td>
                                    <asp:Label ID="lblAccident" Text="هل الوفاة نتجت عن حادث" runat="server"></asp:Label>
                                </td>
                                <td> 
                                    <asp:RadioButtonList ID="rdCauseByAccedenc" AutoPostBack="true"
                                     OnSelectedIndexChanged="rdCauseByAccedenc_SelectedIndexChanged" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem  Text="نعم" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="لا" Value="2" Selected="True"></asp:ListItem>
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
                                    <asp:Label ID="lblReason" Text="سبب الحادث" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpReason" Width="75px" AutoPostBack="true"  OnSelectedIndexChanged="drpReason_SelectedIndexChanged" runat="server">
                                        <asp:ListItem Text="-----" Value="0" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="حادث طريق" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="تسمم" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="حروق" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="اخرى" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" Text="في حالة سبب اخر اكتب السبب" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAnotherReason" runat="server"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label6" Text="مكان الحادث" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAccidentLocation" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label7" Text="اذا كانت حادثة طريق ما نوع المركبة" runat="server"></asp:Label>
                                </td>
                                <td style="margin-right: 40px">
                                    <asp:DropDownList ID="dropCarType" Width="75px" AutoPostBack="true" 
                                        OnSelectedIndexChanged="dropCarType_SelectedIndexChanged" runat="server" 
                                        Enabled="False">
                                        <asp:ListItem Text="-----" Value="0" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="سيارة" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="قطار" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="موتسكل" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="اخرى" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="Label8" Text="في حالة اخري اكتب النوع" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCarType" runat="server" Enabled="False"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label9" Text="صفة المتوفي" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList Width="250px" ID="RdDeadPersonType" RepeatDirection="Horizontal"
                                        runat="server" Enabled="False">
                                        <asp:ListItem Selected="True" Text="لا يوجد" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="سائق" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="راكب" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="مار بالطريق" Value="4"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="rdCauseByAccedenc" EventName="SelectedIndexChanged"/>
                    </Triggers>
                    </asp:UpdatePanel>
                    </asp:Panel>
                   
                    
                    <asp:UpdatePanel runat="server" ID="updTumors" UpdateMode="Conditional">
                    <ContentTemplate>
                     <asp:Panel ID="Panel2" GroupingText="<b>بيانات الاورام</b>" runat="server">
                    <table dir="rtl" align="right" >
                            <tr>
                                <td>
                                    <asp:Label ID="Label10" Text="هل كان المتوفي يعاني اورام" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdTumorFlag" AutoPostBack="true"
                                    OnSelectedIndexChanged="rdTumorFlag_SelectedIndexChanged" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="نعم" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="لا" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblLocation" Text="موقع الورم بالجسم" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTumorLocation" Width="200px" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" Text="نوع الورم" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dropTumorType" Width="207px" runat="server">
                                        <asp:ListItem Text="لايوجد" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="حميد" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="خبيث" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label12" Text="مرحلة الورم" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dropTumorPhases" Width="207px" runat="server">
                                        <asp:ListItem Text="لايوجد" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="ورم موضعى" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="منتشر بالجهاز الليمفاوى" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="منتشر باعضاء اخرى بالجسم" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                     </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="rdTumorFlag" EventName="SelectedIndexChanged" />
                    </Triggers>
                    </asp:UpdatePanel>
                        
                     <asp:Panel ID="Panel3" GroupingText="<b>بيانات الولادة</b>" runat="server">
                        <table align="right">
                            <tr>
                                <td>
                                    <asp:Label ID="Label13" Text="هل حدثت الوفاة اثناء الحمل" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdDeathThroughCarry" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="نعم" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="لا" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label15" Text="هل حدث اجهاض خلال 6 اسابيع سابقة للوفاة" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdAbortionPast6Weeks" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="نعم" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="لا" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label16" Text="هل حدثت الوفاة اثناء الولادة" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdDeadThroughBirth" RepeatDirection="Horizontal" runat="server">
                                       <asp:ListItem Text="نعم" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="لا" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label14" Text="هل حدثت ولادة خلال 6 اسابيع سابقة للوفاة" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdBirthPast6Weeks" RepeatDirection="Horizontal" runat="server">
                                       <asp:ListItem Text="نعم" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="لا" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label17" Text="في حالة نعم : ما هو تاريخ الولاده" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender CssClass="custom-calendar" Format="yyyy/MM/dd" TargetControlID="txtDate" ID="calenderDate" runat="server">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Label ID="Label19" Text="ناتج الولادة" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dropBirthOuput" Width="155px" runat="server">
                                        <asp:ListItem Text="اختر" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="مولود حى" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="مولود ميت" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label18" Text="في حالة نعم : ما هو مكان الولاده" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBirthLocation" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label20" Text="القائم بالولادة" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBirthOperator" runat="server"></asp:TextBox>
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

