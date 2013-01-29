<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsLetter.ascx.cs" Inherits="GlobalLogistics.WebSite.Controls.NewsLetter" %>
<!-- News Letter -->
<asp:Panel ID="EnPanel" runat="server">
                <div class="ContentRightDiv">
                    <h3>
                        News Letter</h3>
                    <div class="Details300">
                        Please enter your E-mail:<br />
                        <br />
                        <asp:TextBox ID="uiTextBoxEnMail" runat="server" CssClass="NewsEmailBox" 
                            ValidationGroup="ENSUB"></asp:TextBox>                        
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                            runat="server" ControlToValidate="uiTextBoxEnMail" Display="Dynamic" 
                            ErrorMessage="*" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="ENSUB"></asp:RegularExpressionValidator>
                        <div class="SmallBtn">
                            <asp:LinkButton ID="uiLinkButtonSend" runat="server" 
                                onclick="uiLinkButtonSend_Click" ValidationGroup="ENSUB" style="margin-top:-13px;">send</asp:LinkButton>      
                            </div>   
                        <asp:Label ID="uiLabelMessage" runat="server" Text="Saved successfully." ForeColor="#00CC00" Visible="false"></asp:Label>                   
                        <div class="clear">
                        </div>
                    </div>
                </div>
</asp:Panel>
<asp:Panel ID="ArPanel" runat="server">
<div class="ContentRightDiv">
                	<h3>نشرة الأخبار الدورية</h3>
                    <div class="Details300">
                    	من فضلك أدخل بريدك الإلكترونى:<br /><br />
                        <asp:TextBox ID="uiTextBoxArMail" runat="server" CssClass="NewsEmailBox" 
                            ValidationGroup="ARSUB"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                            runat="server" ControlToValidate="uiTextBoxArMail" Display="Dynamic" 
                            ErrorMessage="*" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="ARSUB"></asp:RegularExpressionValidator>
                        <div class="SmallBtn">
                            <asp:LinkButton ID="uiLinkButtonArSend" runat="server" 
                                onclick="uiLinkButtonArSend_Click" ValidationGroup="ARSUB">إرسل</asp:LinkButton></div>
                                <asp:Label ID="uiLabelArMessage" runat="server" Text="تم الحفظ بنجاح." ForeColor="#00CC00" Visible="false"></asp:Label>                   
                        <div class="clear"></div>
                  </div>
                </div>
</asp:Panel>