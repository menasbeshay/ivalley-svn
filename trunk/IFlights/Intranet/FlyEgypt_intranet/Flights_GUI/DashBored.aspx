<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ExceptionLight.Master" AutoEventWireup="true" CodeBehind="DashBored.aspx.cs" Inherits="Flights_GUI.DashBored" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sectionWrapper">
					<div class="container">
						<h3 class="block-head">dashboard</h3>
					</div>
					<div class="fun-staff staff-1">
						<div class="container">
							<!-- staff item start -->
                          
							<div class="cell-2 " data-animate="fadeInDown" data-animation-delay="200">
                                <div class="main-border" >
                               <div class="center"> <sub>UnReaded</sub> </div>
								   <div class="fun-number"><asp:Literal ID="LitCirculars_Unreaded" runat="server"></asp:Literal></div>
								<div class="fun-text main-bg">Circulars</div>
								<div class="fun-icon"><i class="fa fa-bullhorn"></i></div>
                               <div class="center"> <sub>Readed</sub> </div>
                                <div class="fun-number"><asp:Literal ID="LitCirculars_Readed" runat="server"></asp:Literal></div>

                                </div>
							</div>
                                
							<!-- staff item end -->
							
							<!-- staff item start -->
							<div class="cell-2 " data-animate="fadeInDown" data-animation-delay="400">
                                <div class="main-border">
                                 <div class="center"> <sub>UnReaded</sub> </div>
								 <div class="fun-number"><asp:Literal ID="Litbull_Unreaded" runat="server"></asp:Literal></div>
								<div class="fun-text main-bg">Bulletins</div>
								<div class="fun-icon"><i class="fa fa-bullhorn"></i></div>
                                  <div class="center"> <sub>Readed</sub> </div>
                                <div class="fun-number"><asp:Literal ID="Litbull_Readed" runat="server"></asp:Literal></div>
                                </div>
							</div>
							
							<!-- staff item end -->
							
							<!-- staff item start -->
							<div class="cell-2 " data-animate="fadeInDown" data-animation-delay="400">
                                <div class="main-border">
                                 <div class="center"> <sub>UnReaded</sub> </div>
								<div class="fun-number"><asp:Literal ID="LitManuals_Unreaded" runat="server"></asp:Literal></div>
								<div class="fun-text main-bg">Manuals</div>
								<div class="fun-icon"><i class="fa fa-book"></i></div>
                                   <div class="center"> <sub>Readed</sub> </div>
                                <div class="fun-number"><asp:Literal ID="LitManulas_Readed" runat="server"></asp:Literal></div>
                                </div>
							</div>
							
                            <!-- staff item end -->

                            <!-- staff item start -->
							<div class="cell-2 " data-animate="fadeInDown" data-animation-delay="600">
                                <div class="main-border"> 
                                 <div class="center"> <sub>UnReaded</sub> </div>
								<div class="fun-number"><asp:Literal ID="LitForms_Unreaded" runat="server"></asp:Literal></div>
								<div class="fun-text main-bg">Forms </div>
								<div class="fun-icon"><i class="fa fa-edit "></i></div>
                                 <div class="center"> <sub>Readed</sub> </div>
                                <div class="fun-number"><asp:Literal ID="LitForms_Readed" runat="server"></asp:Literal></div>
                                    </div>
                            </div>
							
							<!-- staff item end -->
							
							<!-- staff item start -->
							<div class="cell-2 " data-animate="fadeInDown" data-animation-delay="800">
                                 <div class="main-border"> 
                               <div class="center"> <sub>UnReaded</sub> </div>
								<div class="fun-number" id="aybta3"><asp:Literal ID="LitAir_Unreaded" runat="server"></asp:Literal></div>
								<div class="fun fun-text main-bg "> Aircraft Manuals</div>
                                 
								<div class="fun-icon"><i class="fa fa-plane "></i></div>
                                   <div class="center"> <sub>Readed</sub> </div>
                                <div class="fun-number"><asp:Literal ID="LitAir_Readed" runat="server"></asp:Literal></div>
                                </div>
							</div>
							
                            
							<!-- staff item end -->
							
						</div><!-- .container end -->

					</div>
       

</div>
    </asp:Content>
