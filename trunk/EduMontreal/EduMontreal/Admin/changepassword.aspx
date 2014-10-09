<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="EduMontreal.Admin.changepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="form-horizontal">
         <asp:Panel ID="uiPanelLogin" runat="server" DefaultButton="uiLinkButtonSave">
             <div class="form-body">
       
           <div class="row">					
            
            <asp:Panel ID="uiPanelError" runat="server" Visible="false">
					<div class="col-md-12 note note-success">						
                        <asp:Label ID="uiLabelMsg" runat="server" Text="Password changed successfully" ForeColor="Green" Font-Bold="true" ></asp:Label>                                                            
					</div>  
                </asp:Panel>                   
				</div>  
            <div class="form-group ">
				<label class="col-md-3 control-label">New password</label>
				<div class="col-md-4">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-lock"></i>
						</span>
						<asp:TextBox ID="uiTextBoxPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="new Password"></asp:TextBox>
                       
					</div>
				</div>
                 <div class="col-md-1">
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPassword" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
			</div>

                  <div class="form-group last">
				<label class="col-md-3 control-label">Retype new Password</label>
				<div class="col-md-4">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-lock"></i>
						</span>
						<asp:TextBox ID="uiTextBoxRePass" runat="server" CssClass="form-control" TextMode="Password" placeholder="retype new Password"></asp:TextBox>
                       
					</div>
				</div>
                 <div class="col-md-1">
                     <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="Password don't match" ValidationGroup="signup" ForeColor="Red" ControlToValidate="uiTextBoxRePass" ControlToCompare="uiTextBoxPassword" ></asp:CompareValidator>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxRePass" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
			</div>
            			
					                                        
				    
        <div class="form-actions fluid">					
					<div class="col-md-offset-3 col-md-9">						
                        <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="btn btn-info" OnClick="uiLinkButtonSave_Click" ValidationGroup="signup">Change password</asp:LinkButton>										
                       
					</div>                     
				</div>
                 </div>
        </asp:Panel>
    </section>
</asp:Content>
