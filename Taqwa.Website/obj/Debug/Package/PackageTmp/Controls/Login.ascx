<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="Taqwa.Website.Controls.Login" %>

<style type="text/css">

.style37 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: bold; color: #FFFFFF; }
</style>
<asp:Panel ID="uiPanelLogin" runat="server" Style="padding-left: 5px;">
    <table  border="0" cellspacing="0" cellpadding="0" style="direction:rtl;">
        <tr>
           
            <td> 
                    
                        <img src="../images/login.jpg" width="29" height="35" />
                
            </td>
            <td>
                <div align="center" class="tittle_blue">
                    دخول الاعضاء
                </div>
            </td>
            
            <td>
                <label for="ctl00_Login1_uiTextBoxUserName">
                    اســم الـمســتخدم</label>
                <asp:TextBox ID="uiTextBoxUserName" runat="server" ValidationGroup="LoginControl"></asp:TextBox>
               
            </td>
             <td>
             <label for="ctl00_Login1_uiTextBoxSecertCode">
                    الرقـــم الـسرى</label>
                <asp:TextBox ID="uiTextBoxSecertCode" runat="server" ValidationGroup="LoginControl"
                    TextMode="Password"></asp:TextBox>
            </td>
             
             <td width="41" >
            <asp:ImageButton ID="uiImageButtonLogin" runat="server" ImageUrl="~/images/login.png"
                    ValidationGroup="LoginControl" OnClick="uiImageButtonLogin_Click" />
                
            </td>
            
        </tr>
        
    </table>
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            $("label").inFieldLabels();
        });
	                </script>
</asp:Panel>
<asp:Panel ID="uiPanelAccount" runat="server" Style="padding-left: 5px;">
<div style="height: 8px;">
        &nbsp;</div>
    <table width="509" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="41" valign="bottom">
               <div align="center" style="text-align: left">
                    <asp:ImageButton ID="uiImageButtonLogout" runat="server" Height="21px" ImageUrl="~/images/logout.gif"
                        OnClick="uiImageButtonLogout_Click" ValidationGroup="Login" Width="64px" />
                </div>
            </td>
            <td>
                
            </td>
            <td>
                &nbsp;
            </td>
            <td>
               <div align="center" class="tittle_blue">
                    دخول الاعضاء
                </div>
            </td>
            <td>
                <asp:ImageButton ID="uiImageButtonMyAccount" runat="server" ImageUrl="~/images/myAccount.gif"
                    OnClick="uiImageButtonMyAccount_Click" ValidationGroup="Login" />
            </td>
        </tr>
        
    </table>
</asp:Panel>



                

