<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UcBornInfo.ascx.cs" Inherits="UserControls_uiBornInfo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<style type="text/css">
    .style1
    {
        width: 195px;
    }
</style>
<div style="width: 100%">
    <table dir="rtl" width="100%">
        <tr>
            <td width="60px">
                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                <asp:RequiredFieldValidator runat="server"  SetFocusOnError="true" Display="Dynamic" ValidationGroup="GenralValidate" ID="reqName" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" SetFocusOnError="true" Display="Dynamic"
                    runat="server" ControlToValidate="txtName"  ValidationGroup="GenralValidate"
                    ErrorMessage="حروف فقط" ValidationExpression="^[^0-9()]+$"></asp:RegularExpressionValidator>
            </td>
            <td style="padding-right: 5px;" class="style1">
                <asp:TextBox ID="txtName" MaxLength="20" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                
            </td>
            <td width="50%">
                <table>
                    <tr>
                        <td style="padding-right: 10px;width:55px" align="left">
                            <asp:Label ID="lblType" runat="server" meta:resourcekey="lblTypeResource1"></asp:Label>
                            <asp:RequiredFieldValidator runat="server"  SetFocusOnError="true" Display="Dynamic" ValidationGroup="GenralValidate" ID="RequiredFieldValidator1" InitialValue="0" ControlToValidate="dropGender" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="dropGender" Width="155px" runat="server">
                                <asp:ListItem Text="-----" Value="0"></asp:ListItem>
                                <asp:ListItem Text="ذكر" Value="1"></asp:ListItem>
                                <asp:ListItem Text="انثي" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTimeOfBirth" Width="50px" runat="server" meta:resourcekey="lblTimeOfBirthResource1"></asp:Label>
            </td>
            <td colspan="3">
                <table>
                    <tr>
                        <td style="width:250px;">
                            <table dir="rtl" border="0">
                                <tr style="display:none">
                                    <td align="center">
                                        <asp:Label ID="lblDay" runat="server" meta:resourcekey="lblDayResource1"></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lblMonth" runat="server" meta:resourcekey="lblMonthResource1"></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lblYear" runat="server" meta:resourcekey="lblYearResource1"></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lblMin" runat="server" meta:resourcekey="lblMinResource1"></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lblHour" runat="server" meta:resourcekey="lblHourResource1"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="display:none">
                                    <td align="right">
                                        <asp:TextBox ID="txtDay" Width="50px" MaxLength="2" runat="server" meta:resourcekey="txtDayResource1"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic"  SetFocusOnError="true" ValidationGroup="GenralValidate" ID="RequiredFieldValidator2" ControlToValidate="txtDay" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                       <asp:CompareValidator ID="cv1" Display="Dynamic" ValidationGroup="GenralValidate"
                                        runat="server" ControlToValidate="txtDay" ErrorMessage="ارقام فقط"  SetFocusOnError="true"
                                         Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txtMonth" Width="50px" runat="server" 
                                            meta:resourcekey="txtMonthResource1" MaxLength="2"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate" ID="RequiredFieldValidator3"  SetFocusOnError="true" ControlToValidate="txtMonth" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" Display="Dynamic" ValidationGroup="GenralValidate"  SetFocusOnError="true"
                                        runat="server" ControlToValidate="txtMonth" ErrorMessage="ارقام فقط"
                                         Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txtYear" Width="50px" runat="server" 
                                            meta:resourcekey="txtYearResource1" MaxLength="4"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate" ID="RequiredFieldValidator4"  SetFocusOnError="true" ControlToValidate="txtYear" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator2" Display="Dynamic" ValidationGroup="GenralValidate"
                                        runat="server" ControlToValidate="txtYear" ErrorMessage="ارقام فقط"
                                         Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txtMin" Width="50px" runat="server" 
                                            meta:resourcekey="txtMinResource1" MaxLength="2"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate" ID="RequiredFieldValidator5"  SetFocusOnError="true" ControlToValidate="txtMin" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                         <asp:CompareValidator ID="CompareValidator3" Display="Dynamic" ValidationGroup="GenralValidate"
                                        runat="server" ControlToValidate="txtYear" ErrorMessage="ارقام فقط"
                                         Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txtHour" Width="50px" runat="server" 
                                            meta:resourcekey="txtHourResource1" MaxLength="2"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate" ID="RequiredFieldValidator6" SetFocusOnError="true" ControlToValidate="txtHour" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                         <asp:CompareValidator ID="CompareValidator4" Display="Dynamic" ValidationGroup="GenralValidate"
                                        runat="server" ControlToValidate="txtYear" ErrorMessage="ارقام فقط"
                                         Operator="DataTypeCheck" Type="Integer" ></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                <td colspan="5">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                التاريخ 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                -
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                الوقت
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                </tr>
                                <tr >

                                <td colspan="5">
                                    <asp:TextBox ID="uiTextBoxBirthDate" runat="server" Width="100"></asp:TextBox>
                                    <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="uiTextBoxBirthDate" Format="yyyy/MM/dd">
                                    </cc1:CalendarExtender>
                                    <asp:TextBox ID="uiTextBoxBirthTime" runat="server" Width="50"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="regexpName" runat="server"     
                                ErrorMessage="التاريخ غير صحيح." 
                                ControlToValidate="uiTextBoxBirthDate"     
                                ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$" />
                                    <cc1:MaskedEditExtender ID="TextBox2_MaskedEditExtender" runat="server" 
                                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                        Mask="99:99" MaskType="Time" TargetControlID="uiTextBoxBirthTime" 
                                        UserTimeFormat="TwentyFourHour">
                                    </cc1:MaskedEditExtender>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"     
                                ErrorMessage="الوقت غير صحيح." 
                                ControlToValidate="uiTextBoxBirthTime"     
                                ValidationExpression="^([0-1]?[0-9]|[2][0-3]):([0-5][0-9])$" />
                                    
                                </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="middle" style="text-align:right;">
                            <asp:Label ID="lblSystem" runat="server" meta:resourcekey="lblSystemResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblLocationOfBirth" runat="server" meta:resourcekey="lblLocationOfBirthResource1"></asp:Label>
            </td>
           
        </tr>
        
    </table>
    <asp:UpdatePanel runat="server" ID="updateBornInfoRegion">
    <ContentTemplate>
    <table dir="rtl" width="100%">
    <tr>
            <td width="55px"> 
                <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1"></asp:Label>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="GenralValidate" ControlToValidate="drpGovernate" ID="RequiredFieldValidator7" InitialValue="0"  ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="padding-right: 10px; margin-right: 40px;" class="style1">
                <asp:DropDownList runat="server" ID="drpGovernate" AutoPostBack="true" Width="155px"
                    OnSelectedIndexChanged="drpGovernate_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <table>
                    <tr>
                        <td width="30px" style="padding-right: 35px;" align="left">
                            <asp:Label ID="lblSection" runat="server" meta:resourcekey="lblSectionResource1"></asp:Label>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="GenralValidate" ControlToValidate="drpPoliceStation" ID="RequiredFieldValidator8" InitialValue="0"  ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>                            
                        </td>
                        <td>
                                         
                            <asp:DropDownList runat="server" ID="drpPoliceStation" AutoPostBack="true" Width="155px"
                                OnSelectedIndexChanged="drpPoliceStation_SelectedIndexChanged">
                            </asp:DropDownList>
                            
                            
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table>
                    <tr>
                        <td style="padding-right: 10px;">
                            <asp:Label ID="lblSubSection" runat="server" meta:resourcekey="lblSubSectionResource1"></asp:Label>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="GenralValidate" ControlToValidate="dropArea" ID="RequiredFieldValidator9" InitialValue="0"  ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>                                                        
                        </td>
                        <td>
                       
                         <asp:DropDownList runat="server" ID="dropArea" Width="155px">
                            </asp:DropDownList>
                       
                        </td>
                    </tr>
                </table>
            </td>
            <td>
             <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updateBornInfoRegion" DisplayAfter="1" ID="progParents">
                                <ProgressTemplate>
                                <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                                جارى البحث
                                </ProgressTemplate>
                                </asp:UpdateProgress>
            </td>
        </tr>
    </table>
     </ContentTemplate>
    </asp:UpdatePanel>
</div>
