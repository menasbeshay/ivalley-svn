<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AREduMaster.Master" AutoEventWireup="true" CodeBehind="activate.aspx.cs" Inherits="EduMontreal.ar.activate" %>
<%@ MasterType VirtualPath="~/MasterPages/AREduMaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .note {
            border-left:0px;
            border-right:5px solid #eee; 
        }
        .note-success {
            border-color:#3cc051; 
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="col-md-12 col-left">
        <asp:Panel ID="uiPanelActivated" runat="server" Visible="false">
            <div class="row">			
                
					<div class="col-md-12 note note-success">	
                        <h4 class="has-success">شكراً</h4>					
                        تم تأكيد حسابك بنجاح . يمكنك الأن الدخول إلى حسابك                         
					</div>                     
				</div>
        </asp:Panel>
        <asp:Panel ID="uiPanelReActivate" runat="server" Visible="false" >
             <asp:Panel ID="uiPanelActivateSuccess" runat="server" Visible="false">
            <div class="row">			
                
					<div class="col-md-12 note note-success">	
                        <h4 class="has-success">شكراً</h4>					
                        تم إرسال رسالة التأكيد على البريد الإلكترونى. <a href="Default.aspx" class="btn btn-primary">إستمرار</a>
					</div>                     
				</div>
        </asp:Panel>
            <div class="row">					
					<div class="col-md-9">						
                        <asp:Label ID="uiLabelUserError" runat="server" Text="البريد الإلكترونى غير مسجل لدينا. من فضلك قم بإدخال بريد إلكترونى مسجل." ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label>                        
					</div>                     
				</div>
               <div class="row">					
					<div class="col-md-9">				
                        سوف يصلك رسالة على بريدك الإلكترونى لتأكيد حسابك. <p>إذا لم تصلك رسالة التأكيد ، من فضلك أدخل بريدك الإلكترونى لإعادة إرسال الرسالة.</p>		                       
					</div>                     
				</div>
            <div class="row">					
                	<div class="col-md-5">
						<label class="control-label">البريد الإلكترونى (إسم المستخدم) <span class="required">* </span></label>
                        <asp:TextBox ID="uiTextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxEmail" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="invalid email format" ValidationGroup="signup" ForeColor="Red" ControlToValidate="uiTextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					</div>                   
					<div class="col-md-3">	
                        <label class="control-label">&nbsp;</label>	
                        <div class="clearfix"></div>
                        <asp:LinkButton ID="uiLinkButtonActivate" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonActivate_Click" ValidationGroup="signup">إعادة إرسال</asp:LinkButton>
					</div>                     
				</div>

        </asp:Panel>
        
    </section>

</asp:Content>
