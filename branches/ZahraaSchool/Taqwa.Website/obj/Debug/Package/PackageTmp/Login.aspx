<%@ Page Title="" Language="C#" MasterPageFile="~/ZahraaAr.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Taqwa.Website.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="mainContent" style="background-color:#fff;width:980px;">
<table width="509" border="0" cellspacing="0" cellpadding="0" dir="ltr">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td width="41" rowspan="2" valign="bottom">
                                <img src="../images/login_icon.png" width="29" height="35" />
                            </td>
                            <td>
                                <div align="center" class="style37">
                                    دخول الاعضاء
                                </div>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td width="82">
                                &nbsp;
                            </td>
                            <td width="144">
                               
                               <label for="ctl00_ContentPlaceHolder1_uiTextBoxUserName">اســــم الــمســتخدم</label>	                               
                                <asp:TextBox ID="uiTextBoxUserName" runat="server"  ValidationGroup="Login"></asp:TextBox>
                                <label for="ctl00_ContentPlaceHolder1_uiTextBoxSecertCode">الــرقـــم الـــسرى</label>	
                                <asp:TextBox ID="uiTextBoxSecertCode" runat="server" 
                                    ValidationGroup="Login" TextMode="Password"></asp:TextBox>
                                
                            </td>
                            <td width="13">
                                <br />
                            </td>
                            <td width="66">
                                <%--<img src="images/login.png" width="64" height="21" />--%>
                            </td>
                            <td width="163">
                                &nbsp;
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="4">
                                &nbsp;  
                                
                                <div align="center"><asp:ImageButton ID="uiImageButtonLogin" runat="server" 
                                    ImageUrl="~/images/login.gif" 
                                    ValidationGroup="Login" onclick="uiImageButtonLogin_Click"/>
                                </div>
                                
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <script type="text/javascript" charset="utf-8">
                        $(document).ready(function () {
                            $("label").inFieldLabels();
                        });
	                </script>
                    </div>
</asp:Content>
