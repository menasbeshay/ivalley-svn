<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UcBornInfo.ascx.cs" Inherits="UserControls_uiBornInfo" %>

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
                        <td>
                            <table dir="rtl" border="0">
                                <tr>
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
                                <tr>
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
                            </table>
                        </td>
                        <td valign="middle">
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
