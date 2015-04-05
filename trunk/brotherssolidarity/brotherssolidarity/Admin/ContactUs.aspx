<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="brotherssolidarity.Admin.ContactUs" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-envelope-alt"></i>Contact Us Page</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span10">
                            <table>
                              
                                <tr>
                                    <td>
                                        <asp:Label CssClass="label-mini" ID="lblContactInfo" runat="server" Text="Contact Information"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="ContactValGroup" runat="server" ID="RequiredAddress" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTelephone" runat="server" Text="Telephones"></asp:Label>
                                    </td>
                                    <td style="margin-left: 40px">
                                        <asp:TextBox ID="txtTelephone" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="ContactValGroup" runat="server" ID="RequiredTelephone" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="txtTelephone"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblEMail" runat="server" Text="E-Mail"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEMail" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="ContactValGroup" runat="server" ID="RequiredMail" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="txtEMail"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDurationTime" runat="server" Text="Duration Time"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDurationTime" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="ContactValGroup" runat="server" ID="RequiredFieldValidator1" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="txtDurationTime"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSkype" runat="server" Text="Skype"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSkype" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTwitter" runat="server" Text="Twitter"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTwitter" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFacebook" runat="server" Text="Facebook"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFacebook" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                      
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblYoutube" runat="server" Text="Youtube"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtYoutube" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                     
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Inestgram"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtInestgram" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                                                                 
                                    </td>
                                </tr>
                                   <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Google Map"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtGoogleMap" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                                                                 
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" Width="100" ValidationGroup="ContactValGroup" CssClass="btn btn-success" OnClick="btnSave_Click" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="100" CssClass="btn btn-danger" OnClick="btnCancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
