<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="OpenRegister.aspx.cs" Inherits="OpenRegister"  %>
<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <asp:UpdatePanel runat="server" ID="updRegister">
        <ContentTemplate>
        <table dir="rtl">
                        <tr>
                    <td style="padding-left:30px">
                        <asp:Label runat="server" ID="lblRegCode" Text="ﬂÊœ «·œ› —"></asp:Label>
                    </td>
                    <td>
                                            <asp:TextBox runat="server" ID="txtRegDefaultYear" ReadOnly="true" 
                            Width="35px"></asp:TextBox>
                    
                    </td>
                    <td>
                    <b>/</b>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtRegCode" Width="15px" MaxLength="1"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="reqCode" ValidationGroup="ValidateOpen"
                            ErrorMessage="*" Display="Dynamic" ControlToValidate="txtRegCode"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="validateCode" ValidationGroup="ValidateOpen" 
                        ErrorMessage="Œÿ√ ›Ï ÿ—Ìﬁ… «·«œŒ«·" Display="Dynamic" ValidationExpression="^([1-9])$" ControlToValidate="txtRegCode"></asp:RegularExpressionValidator>                            
                      <%--  <ajaxToolkit:MaskedEditExtender runat="server" TargetControlID="txtRegCode" Mask="9\/9999" MessageValidatorTip="true"
                            OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" MaskType="Number"
                            InputDirection="LeftToRight" AcceptNegative="Left" ErrorTooltipEnabled="True" />--%>
                    </td>
                    <td>
                        («·”‰…/—ﬁ„ «·œ› —)
                    </td>
                </tr>
        </table>
            <table dir="rtl">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblRegCreateDate" Text=" «—ÌŒ › Õ «·œ› —"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCreateDate1" ReadOnly="true" Width="160px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ValidationGroup="ValidateOpen"
                            ErrorMessage="*" Display="Dynamic" ControlToValidate="txtCreateDate1"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                      <%--  <ajaxToolkit:CalendarExtender CssClass="custom-calendar" runat="server" ID="clndrCreateDate" 
                        TargetControlID="txtCreateDate1"
                            Format="yyyy/MM/dd">
                        </ajaxToolkit:CalendarExtender>
                        
                        <asp:CompareValidator ID="compareValidator" runat="server" ControlToValidate="txtCreateDate1" ValidationGroup="ValidateOpen"
                          ErrorMessage=" «—ÌŒ › Õ «·œ› — ÌÃ» «‰ ÌﬂÊ‰ «ﬁ· „‰ «Ê Ì”«ÊÏ  «—ÌŒ «·ÌÊ„" Display="Dynamic" Type="Date"
                         Operator="LessThanEqual">
                         </asp:CompareValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label1" Text="‰Ê⁄ «·œ› —"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="drpRegType" Width="166px" AutoPostBack="True" 
                            onselectedindexchanged="drpRegType_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Text="„Ê«·Ìœ" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Ê›Ì« " Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label2" Text="«·œ› — «·Õ«·Ï"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkRegIsCurrent" Checked="true" Enabled="false" />
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                <td></td>
                    <td colspan="3" align="right">
                     <asp:Button ID="btnAddNewReg" runat="server" Text="«÷«›… œ› —" ValidationGroup="ValidateOpen" 
                            onclick="btnAddNewReg_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
             <tr>
                    <td>
                        <asp:Label runat="server" ID="Label3" Text="»ÕÀ »”‰… «·œ› —"></asp:Label>
                    </td>
                    <td>
                       <asp:TextBox runat="server" ID="txtRegYear" Width="160px"></asp:TextBox>
                    </td>
                    <td>
                    <asp:Button runat="server" ID="btnFilter" Text="»Õ‹‹‹‹À" 
                            onclick="btnFilter_Click" />
                    </td>
                    
            </table>
            <div>
            <asp:GridView runat="server" ID="grdReg" AutoGenerateColumns="false" 
                    onrowdatabound="grdReg_RowDataBound" EmptyDataText="·«  ÊÃœ »Ì«‰«  „ «Õ…">
            <Columns>
             <%--<asp:TemplateField HeaderText="ﬂÊœ «·œ› —">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lnkCode" CommandArgument='<%#Eval("RegisterID")%>'
                            Text='<%#Eval("RegisterCode")%>' OnClick="lnkCode_Click" ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            <asp:BoundField DataField="RegisterCode" HeaderText="ﬂÊœ «·œ› —" />    
            <asp:BoundField DataField="CreationDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText=" «—ÌŒ «·«‰‘«¡" />
            <asp:BoundField DataField="RegisterYear" HeaderText="”‰… «·œ› —" />
            <asp:BoundField DataField="RegisterType" HeaderText="‰Ê⁄ «·œ› —" />
            <asp:CheckBoxField DataField="CurrentRegister" HeaderText="«·œ› — «·Õ«·Ï" />
                <asp:TemplateField HeaderText="Õ–› œ› —">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lnkDelete" CommandArgument='<%#Eval("RegisterID")%>'
                            Text="X" OnClick="lnkDelete_Click" OnClientClick="return confirm('«‰  ⁄·Ï Ê‘ﬂ Õ–› Â–Â «·»Ì«‰« ');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
