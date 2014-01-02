<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" 
EnableEventValidation="false" 
CodeFile="Reports.aspx.cs" Inherits="Admin_Reports" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table border="0px" dir="rtl" cellpadding="5px" cellspacing="0px" width="100%">
            <tr>
                <td align="center" colspan="2" style="padding-bottom:10px; font-weight: bold;">
                 ﬁ«—Ì— «·„Ê«·Ìœ Ê«·Ê›Ì« 
                </td>
            </tr>
            <tr>
                <td style="width:20%">
                <asp:Label runat="server" ID="lblGoves" Text="«·„œÌ—Ì… «·’ÕÌ…" BackColor="#efefef" ></asp:Label>
                </td>
                <td style="width:80%">
                    <asp:DropDownList ID="drpGov" Width="150px" AutoPostBack="true" runat="server" OnSelectedIndexChanged="drpGov_SelectedIndexChanged">
                        <asp:ListItem Value="-1">Ã„Ì⁄ «·„œÌ—Ì« </asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label runat="server" ID="lblCivilOffice" Text="«·√œ«—… «·’ÕÌ…" ></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpCivil" Width="150px" AutoPostBack="true" runat="server"
                        OnSelectedIndexChanged="drpCivil_SelectedIndexChanged">
                        <asp:ListItem Value="-1">Ã„Ì⁄ «·«œ«—« </asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label runat="server" ID="lblHealthOffice" Text="„ﬂ » «·’Õ…" ></asp:Label>
                    
                </td>
                <td>
                    <asp:DropDownList ID="drpHealthOffice" Width="150px" runat="server">
                        <asp:ListItem Value="-1">Ã„Ì⁄ «·„ﬂ« »</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr runat="server" id="guiFromArea" style="display:none">
                <td>
                 <asp:Label runat="server" ID="lblFrom" Text="«·› —… „‰" ></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                    <ajaxtoolkit:calendarextender CssClass="custom-calendar" Format="yyyy/MM/dd" TargetControlID="txtStartDate"
                        ID="calenderStartDate" runat="server">
                    </ajaxtoolkit:calendarextender>
                    <asp:RegularExpressionValidator ID="regexpName" runat="server"     
                                ErrorMessage="«· «—ÌŒ €Ì— ’ÕÌÕ." 
                                ControlToValidate="txtStartDate"     
                                ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$" />
                </td>
            </tr>
            <tr runat="server" id="guiToArea" style="display:none">
                <td>
                <asp:Label runat="server" ID="lblTo" Text="«·› —… ≈·Ï" ></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                    <ajaxtoolkit:calendarextender CssClass="custom-calendar" Format="yyyy/MM/dd" TargetControlID="txtEndDate"
                        ID="calenderEndDate" runat="server">
                    </ajaxtoolkit:calendarextender>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"     
                                ErrorMessage="«· «—ÌŒ €Ì— ’ÕÌÕ." 
                                ControlToValidate="txtEndDate"     
                                ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$" />
                </td>
            </tr>
            <tr runat="server" id="guiYearArea" style="display:block">
                <td>
                <asp:Label runat="server" ID="lblYear" Text="«·⁄«„" ></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtReportYear" runat="server"></asp:TextBox>
                       <asp:RegularExpressionValidator Enabled="false" ID="regYear" runat="server" ErrorMessage="«·⁄«„ €Ì— ’ÕÌÕ" ValidationExpression="^([1][9]\d\d|[2][0]\d\d)$" 
                            ControlToValidate="txtReportYear" ></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    «· ﬁ—Ì—
                </td>
                <td>
                    <asp:DropDownList ID="drpReports" AutoPostBack="true" runat="server" 
                        onselectedindexchanged="drpReports_SelectedIndexChanged">
                        <asp:ListItem Value="1"> ﬁ—Ì— «·„Ê«·Ìœ „Ê“⁄… Õ”» ‘ÂÊ— «·”‰…</asp:ListItem>
                        <asp:ListItem Value="2"> ﬁ—Ì— «·Ê›Ì«  „Ê“⁄… Õ”» ‘ÂÊ— «·”‰…</asp:ListItem>
                        <asp:ListItem Value="3"> ﬁ—Ì— «·Ê›Ì«  Õ”» «·”‰ Ê«·‰Ê⁄ Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="4"> ﬁ—Ì— «·Ê›Ì«  Õ”» «·”‰ Ê«·‰Ê⁄ ÿ»ﬁ« ··√Ê—«„ Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="5"> ﬁ—Ì— «·Ê›Ì«  Õ”» «·”‰ Ê«·‰Ê⁄ ÿ»ﬁ« ·· œŒÌ‰ Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="6"> ﬁ—Ì— «·Ê›Ì«  Õ”» «·”‰ Ê«·‰Ê⁄ ÿ»ﬁ« ··ÕÊ«œÀ Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="7"> ﬁ—Ì— »⁄œœ «·„Ê«·Ìœ ·√» „’—Ì Ê€Ì— „’—Ì Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="8"> ﬁ—Ì— »⁄œœ «·„Ê«·Ìœ –ﬂÊ— Ê ≈‰«À Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="9">   ﬁ—Ì— «·„Ê«·Ìœ „‰ œ«Œ· ÊŒ«—Ã œ«∆—… „ﬂ » «·’Õ… Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="10"> ﬁ—Ì— »„⁄œ·«  Ê›Ì«  √ﬁ· „‰ 7 √Ì«„ ÊÕœÌÀÌ «·Ê·«œ… Ê«·√ÿ›«·</asp:ListItem>
                        <asp:ListItem Value="11">«Õ’«∆Ì… «œŒ«· «·„Ê«·Ìœ »„œÌ—Ì… Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="12">«Õ’«∆Ì… «œŒ«· «·„Ê«·Ìœ »«œ«—… ’ÕÌ… Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="13">«Õ’«∆Ì… «œŒ«· «·„Ê«·Ìœ »„ﬂ » ’Õ… Œ·«· › —… («·«”»Ê⁄Ì…)</asp:ListItem>
                        <asp:ListItem Value="14"> Ê“Ì⁄ «·Ê›Ì«  Õ”» ”»» «·Ê›«…</asp:ListItem>
                        <asp:ListItem Value="15">«Õ’«∆Ì… «œŒ«· «·Ê›Ì«  »„œÌ—Ì… Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="16">«Õ’«∆Ì… «œŒ«· «·Ê›Ì«  »«œ«—… ’ÕÌ… Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="17">«Õ’«∆Ì… «œŒ«· «·Ê›Ì«  »„ﬂ » ’Õ… Œ·«· › —… («·«”»Ê⁄Ì…)</asp:ListItem>
                        
                        <asp:ListItem Value="18">≈Õ’«∆Ì… ≈œŒ«· «·„Ê«·Ìœ »Ã„Ì⁄ «·„œÌ—Ì«  Œ·«· › —…  </asp:ListItem>
                        <asp:ListItem Value="19">»Ì«‰«  «·Ê›Ì«  Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="20">»Ì«‰ »⁄œœ «·„Ê«·Ìœ –ﬂÊ— Ê ≈‰«À »Ã„Ì⁄ «·„œÌ—Ì«  Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="21">»Ì«‰ »⁄œœ «·„Ê«·Ìœ «·„Ê“⁄… Õ÷— Ê —Ì› »Ã„Ì⁄ «·„œÌ—Ì«  Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="22">»Ì«‰ »⁄œœ «·„Ê«·Ìœ „Ê Ï »Ã„Ì⁄ «·„œÌ—Ì«  Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="23"> Ê“Ì⁄ «·Ê›Ì«  Õ”» «·”‰ Ê«·‰Ê⁄  Œ·«· › —…</asp:ListItem>
                        <asp:ListItem Value="24">”Ã·«  «Œÿ«— «·„Ê«·Ìœ</asp:ListItem>
                        <asp:ListItem Value="25">”Ã·«  «Œÿ«— «·Ê›Ì« </asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table style="display: none"  runat="server" id="tblCauseOfDeathArea" dir="rtl">
                        <tr>
                            <td width="144px">
                                <asp:Label runat="server" ID="lblDeadType" Text="‰Ê⁄ «·„ Ê›Ï"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:DropDownList runat="server" Width="150px" ID="drpDeadType">
                                    <asp:ListItem Text="–ﬂÊ— + «‰«À" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="–ﬂÊ—" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="«‰«À" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                        <td>
                        <asp:Label runat="server" ID="lblDeathCause" Text="”»» «·Ê›«…"></asp:Label>
                        </td>
                        <td align="right">
                        <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="radioLstDeathCause">
                        <asp:ListItem Text="√" Value="A" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="»" Value="B" ></asp:ListItem>
                        <asp:ListItem Text="Ã" Value="C" ></asp:ListItem>
                        <asp:ListItem Text="œ" Value="D" ></asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
                        </tr>
                    </table>
                    
                </td>
                
            </tr>
            <tr>
            <td colspan="2">  
              <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
             <%--<asp:CompareValidator runat="server" ID="compareDates" Display="Dynamic" ControlToCompare="txtEndDate" 
                                      ControlToValidate="txtStartDate" Type="Date" ErrorMessage="«·› —… „‰ ÌÃ» «‰  ﬂÊ‰ «ﬁ· „‰ «Ê  ”«ÊÏ «·› —… «·Ï" 
                                      Operator="LessThanEqual"></asp:CompareValidator>--%>
            </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnReportShow" runat="server" Text="⁄—÷ «· ﬁ—Ì—" 
                        onclick="btnReportShow_Click" />
                </td>
            </tr>
          
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

