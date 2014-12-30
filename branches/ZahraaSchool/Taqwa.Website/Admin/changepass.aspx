<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="changepass.aspx.cs" Inherits="Taqwa.Website.Admin.changepass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="form-horizontal" style="padding:10px;">
         <div class="AdminMiddle">
         <h2>تغيير كلمة المرور الخاصة  بالأدمن</h2>
             </div>
         <div class="clearfix" style="height:1px;"></div>
         <asp:Panel ID="uiPanelLogin" runat="server" DefaultButton="uiLinkButtonSave">
             <div class="form-body">
       
           <div class="row">					
            
            <asp:Panel ID="uiPanelError" runat="server" Visible="false">
									
                        <asp:Label ID="uiLabelMsg" runat="server" Text="تم تغيير كلمة المرور بنجاح" ForeColor="Green" Font-Bold="true" ></asp:Label>                                                            
					
                </asp:Panel>                   
				</div>  
            <div class="form-group ">
                <div class="AdminLeft">
				كلمة المرور الجديدة</div>
				<div class="AdminMiddle">
											
						<asp:TextBox ID="uiTextBoxPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="كلمة المرور"></asp:TextBox>
                       
					
				</div>
                 <div class="AdminRight">
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPassword" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
			</div>

                  <div class="form-group last">
				<div class="AdminLeft">إعادة كلمة المرور</div>
				<div class="AdminMiddle">
						
						<asp:TextBox ID="uiTextBoxRePass" runat="server" CssClass="form-control" TextMode="Password" placeholder="أعد كلمة المرور"></asp:TextBox>
                      
				</div>
                 <div class="AdminRight">
                     <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="كلمة المرور غير متطابقة" ValidationGroup="signup" ForeColor="Red" ControlToValidate="uiTextBoxRePass" ControlToCompare="uiTextBoxPassword" ></asp:CompareValidator>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxRePass" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
			</div>
            			
					                                        
				    
        <div class="form-actions fluid">	
            <div class="AdminLeft">&nbsp;</div>
					<div class="AdminMiddle">						
                        <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="btn btn-default" OnClick="uiLinkButtonSave_Click" ValidationGroup="signup">تغيير كلمة المرور</asp:LinkButton>										
                       
					</div>                     
				</div>
                 </div>
        </asp:Panel>
    </section>
</asp:Content>
