<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AREduMaster.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="EduMontreal.ar.changepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="form-horizontal">
         <asp:Panel ID="uiPanelLogin" runat="server" DefaultButton="uiLinkButtonSave">
             <div class="form-body">
        <div class="row">					
            
            <asp:Panel ID="uiPanelError" runat="server" Visible="false">
					<div class="col-md-12 note note-success">						
                        <asp:Label ID="uiLabelError" runat="server" Text="تم تحديث كلمة المرور بنجاح." ForeColor="Green" Font-Bold="true" ></asp:Label>                                                            
					</div>  
                </asp:Panel>                   
				</div>      
        
        	
           
            <div class="form-group ">
				<label class="col-md-3 control-label pull-right"> كلمة المرور الجديدة</label>
				<div class="col-md-4 pull-right">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-lock"></i>
						</span>
						<asp:TextBox ID="uiTextBoxPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="كلمة المرور الجديدة"></asp:TextBox>
                       
					</div>
				</div>
                 <div class="col-md-1 pull-right">
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPassword" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
			</div>
                 <div class="form-group ">
				<label class="col-md-3 control-label pull-right">إعادة كلمة المرور</label>
				<div class="col-md-4 pull-right">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-lock"></i>
						</span>
						<asp:TextBox ID="uiTextBoxRePass" runat="server" CssClass="form-control" TextMode="Password" placeholder="إعادة كلمة المرور"></asp:TextBox>
                       
					</div>
				</div>
                 <div class="col-md-1 pull-right">
                     <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="Password don't match" ValidationGroup="signup" ForeColor="Red" ControlToValidate="uiTextBoxRePass" ControlToCompare="uiTextBoxPassword" ></asp:CompareValidator>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPassword" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
			</div>
            			
					                                        
				    
        <div class="form-actions fluid">					
					<div class="col-md-offset-3 col-md-9 pull-right">						
                        <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="btn btn-info" OnClick="uiLinkButtonSave_Click" ValidationGroup="signup">تغيير كلمة المرور</asp:LinkButton>										
                        
					</div>                     
				</div>
                 </div>
        </asp:Panel>
    </section>
</asp:Content>
