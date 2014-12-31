<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="activate.aspx.cs" Inherits="EduMontreal.activate" %>
<%@ MasterType VirtualPath="~/MasterPages/EduMaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="col-md-12 col-left">
        <asp:Panel ID="uiPanelActivated" runat="server" Visible="false">
            <div class="row">			
                
					<div class="col-md-12 note note-success">	
                        <h4 class="has-success">Thanks</h4>					
                        your account has been activated successfully. <a href="Default.aspx" class="btn btn-primary">Continue</a>
					</div>                     
				</div>
        </asp:Panel>
        <asp:Panel ID="uiPanelReActivate" runat="server" Visible="false" >
            <asp:Panel ID="uiPanelActivateSuccess" runat="server" Visible="false">
            <div class="row">			
                
					<div class="col-md-12 note note-success">	
                        <h4 class="has-success">Thanks</h4>					
                        Activation Email has been sent successfully. <a href="Default.aspx" class="btn btn-primary">Continue</a>
					</div>                     
				</div>
        </asp:Panel>
            <div class="row">					
					<div class="col-md-9">						
                        <asp:Label ID="uiLabelUserError" runat="server" Text="Can't find your mail in our database.Please enter a valid registred mail." ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label>                        
					</div>                     
				</div>
               <div class="row">					
					<div class="col-md-9">						
                       You will get an activation mail shortly. <p>If you can't get it , please fill below form to resend activation mail.</p>
					</div>                     
				</div>
            <div class="row">					
                	<div class="col-md-5">
						<label class="control-label">Email (username) <span class="required">* </span></label>
                        <asp:TextBox ID="uiTextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxEmail" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="invalid email format" ValidationGroup="signup" ForeColor="Red" ControlToValidate="uiTextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					</div>                   
					<div class="col-md-3">	
                        <label class="control-label">&nbsp;</label>	
                        <div class="clearfix"></div>
                        <asp:LinkButton ID="uiLinkButtonActivate" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonActivate_Click" ValidationGroup="signup">Get activation mail</asp:LinkButton>
					</div>                     
				</div>

        </asp:Panel>
        
    </section>
    
</asp:Content>
