<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AREduMaster.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="EduMontreal.ar.userlogin" %>
<%@ MasterType VirtualPath="~/MasterPages/AREduMaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="form-horizontal">
         <asp:Panel ID="uiPanelLogin" runat="server" DefaultButton="uiLinkButtonSignIn">
             <div class="form-body">
        <div class="row">					
            
            <asp:Panel ID="uiPanelError" runat="server" Visible="false">
					<div class="col-md-12 note note-danger">						
                        <asp:Label ID="uiLabelError" runat="server" Text="خطأ. من فضلك تأكد من إسم المستخدم وكلمة المرور." ForeColor="Red" Font-Bold="true" ></asp:Label>                                                            
					</div>  
                </asp:Panel>                   
				</div>      
        
        	
            <div class="form-group">
				<label class="col-md-3 control-label pull-right">البريد الإلكترونى (إسم المستخدم)</label>
				<div class="col-md-4 pull-right">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-envelope"></i>
						</span>
						 <asp:TextBox ID="uiTextBoxEmail" runat="server" CssClass="form-control" placeholder="البريد الإلكترونى"></asp:TextBox>                         
					</div>
				</div>
                <div class="col-md-1 pull-right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxEmail" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="invalid email format" ValidationGroup="signup" ForeColor="Red" ControlToValidate="uiTextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
			</div>
            <div class="form-group last">
				<label class="col-md-3 control-label pull-right">كلمة المرور</label>
				<div class="col-md-4 pull-right">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-lock"></i>
						</span>
						<asp:TextBox ID="uiTextBoxPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="كلمة المرور"></asp:TextBox>
                       
					</div>
				</div>
                 <div class="col-md-1 pull-right">
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPassword" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
			</div>
            			
					                                        
				    
        <div class="form-actions fluid">					
					<div class="col-md-offset-3 col-md-9 pull-right">						
                        <asp:LinkButton ID="uiLinkButtonSignIn" runat="server" CssClass="btn btn-info" OnClick="uiLinkButtonSignIn_Click" ValidationGroup="signup">دخول</asp:LinkButton>										
                        <a href="signup" Class="btn btn-default" >إنشاء حساب جديد</a>
					</div>                     
				</div>
                 </div>
        </asp:Panel>
    </section>

</asp:Content>
