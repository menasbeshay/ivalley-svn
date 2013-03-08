<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UcAddressInfo.ascx.cs"
    Inherits="UserControls_UcAddressInfo" %>
<%--<table dir="rtl" width="100%">
    <tr>
        <td>--%>
            <asp:Label ID="Label1" Font-Underline="True" runat="server" meta:resourcekey="lblLocationResource1"></asp:Label>
        <%--</td>
        <td>
        </td>
        <td>
       <td>
        </td>
         <td>
        </td>
    </tr>
    </table>--%>
    <div style="width: 100%">
    <asp:UpdatePanel runat="server" ID="updateAddressInfo">
    <ContentTemplate>
    
    
    <table dir="rtl" width="100%">
    <tr>
        <td width="79px">
            <asp:Label ID="lblNumber" runat="server" meta:resourcekey="lblNumberResource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtNumber" runat="server" MaxLength="10" meta:resourcekey="txtNumberResource1"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic" ValidationGroup="GenralValidate"
                    ID="reqName" ControlToValidate="txtNumber" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            <table width="100%" cellspacing="0">
                <tr>
                    <td width="30%" align="left" style="padding-right:40px;">
                        <asp:Label ID="lblStreet" runat="server" meta:resourcekey="lblStreetResource1"></asp:Label>
                    </td>
                    <td style="padding-right:10px;">
                        <asp:TextBox ID="txtStreet" MaxLength="50" runat="server" meta:resourcekey="txtStreetResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic" ValidationGroup="GenralValidate"
                    ID="RequiredFieldValidator1" ControlToValidate="txtStreet" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table width="100%" cellspacing="0">
                <tr>
                    <td width="40%" style="padding-right:40px;">
                        <asp:Label ID="lblSign" runat="server" meta:resourcekey="lblSignResource1"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtSign" MaxLength="50" runat="server" meta:resourcekey="txtSignResource1"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic" ValidationGroup="GenralValidate"
                    ID="RequiredFieldValidator2" ControlToValidate="txtSign" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="drpState" Width="155px" runat="server" 
                meta:resourcekey="drpStateResource1" AutoPostBack="True" 
                onselectedindexchanged="drpState_SelectedIndexChanged">
                <asp:ListItem meta:resourcekey="ListItemResource1"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server"  SetFocusOnError="true" Display="Dynamic" ValidationGroup="GenralValidate"
                    ID="RequiredFieldValidator3" ControlToValidate="drpState" InitialValue="0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            <table cellspacing="0" width="100%">
                <tr>
                    <td width="30%" align="left" style="padding-left:3px;">
                        <asp:Label ID="lblSection" runat="server" meta:resourcekey="lblSectionResource1"></asp:Label>
                    </td>
                    <td style="padding-right:10px;">
                    
                        <asp:DropDownList ID="dropSection" Width="155px" runat="server" 
                            meta:resourcekey="dropSectionResource1" AutoPostBack="True" 
                            onselectedindexchanged="dropSection_SelectedIndexChanged">
                            <asp:ListItem meta:resourcekey="ListItemResource2"></asp:ListItem>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator runat="server"  SetFocusOnError="true" Display="Dynamic" ValidationGroup="GenralValidate"
                    ID="RequiredFieldValidator4" ControlToValidate="dropSection" InitialValue="0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table width="100%" cellspacing="0">
                <tr>
                    <td width="40%" style="padding-right:40px;">
                        <asp:Label ID="lblSubSection" runat="server" meta:resourcekey="lblSubSectionResource1"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:DropDownList ID="drpSubSection" Width="155px" runat="server" meta:resourcekey="drpSubSectionResource1">
                            <asp:ListItem meta:resourcekey="ListItemResource3"></asp:ListItem>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator runat="server"  SetFocusOnError="true" Display="Dynamic" ValidationGroup="GenralValidate"
                    ID="RequiredFieldValidator5" ControlToValidate="drpSubSection" InitialValue="0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                   
                    </td>
                </tr>
            </table>
        </td>
         <td>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblPhone" runat="server" meta:resourcekey="lblPhoneResource1"></asp:Label>
            
        </td>
        <td>
        <asp:TextBox ID="txtPhone" runat="server" MaxLength="11" meta:resourcekey="txtPhoneResource1"></asp:TextBox>
        </td>
        <td>
            <table width="100%" cellspacing="0">
                <tr>
                    <td width="30%" align="left" style="padding-left:3px;">
                        <asp:Label ID="lblPosition" runat="server" meta:resourcekey="lblPositionResource1"></asp:Label>
                    </td>
                    <td  style="padding-right:10px;">
                        <asp:TextBox ID="txtPosition" MaxLength="50" runat="server" meta:resourcekey="txtPositionResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"  SetFocusOnError="true" Display="Dynamic" ValidationGroup="GenralValidate"
                    ID="RequiredFieldValidator6" ControlToValidate="txtPosition" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table width="100%" cellspacing="0">
                <tr>
                    <td width="40%" align="right" >
                        <asp:Label ID="lblFamilyPhoneNo" runat="server" meta:resourcekey="lblFamilyPhoneNoResource1"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtFamilyPhoneNo" MaxLength="50" runat="server" meta:resourcekey="txtFamilyPhoneNoResource1"></asp:TextBox>                       
                    </td>
                </tr>
            </table>
        </td>
         <td>
             <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updateAddressInfo" DisplayAfter="1"
                 ID="progParents">
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