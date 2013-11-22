<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Website.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="slider-wrap">
            <%--<div class="flexslider">
                <ul class="slides">
                    <li><a href="#" title="Qualified Doctors" class="img-hover">
                        <img src="../images/health/doctors.jpg" alt="Slider Image"></a> </li>
                    <li><a href="#" title="Clinical Excellence" class="img-hover">
                        <img src="../images/health/clinical.jpg" alt="Slider Image"></a> </li>
                    <li><a href="#" title="Dental Treatment" class="img-hover">
                        <img src="../images/health/dental.jpg" alt="Slider Image"></a> </li>
                    <li><a href="#" title="Caring Staff" class="img-hover">
                        <img src="../images/health/caring-staff.jpg" alt="Slider Image"></a> </li>
                    <li><a href="#" title="Medical Counseling" class="img-hover">
                        <img src="../images/health/couseling.jpg" alt="Slider Image"></a> </li>
                </ul>
               
                <!-- end of slider nav -->
            </div>--%>

            <div class="fluid_container">
        <div class="camera_wrap camera_burgundy_skin" id="camera_wrap_1">
            <div  data-src="images/health/doctors.jpg">
            </div>
            <div  data-src="images/health/clinical.jpg">
            </div>
            <div  data-src="images/health/dental.jpg">
            </div>
            <div  data-src="images/health/caring-staff.jpg">
            </div>
            <div  data-src="images/health/couseling.jpg">
            </div>
        </div>
    </div>

             <%--<ul class="slide-nav slides-5">
                    <li class="flex-active">
                        <h4>
                            Qualified Doctors</h4>
                        <p>
                            Team of Expert Doctors</p>
                    </li>
                    <li class="">
                        <h4>
                            Clinical Excellence</h4>
                        <p>
                            Expert in Clinical Work</p>
                    </li>
                    <li class="">
                        <h4>
                            Dental Treatment</h4>
                        <p>
                            Specialized in Dental Care</p>
                    </li>
                    <li class="">
                        <h4>
                            Caring Staff</h4>
                        <p>
                            Caring Staff</p>
                    </li>
                    <li class="">
                        <h4>
                            Medical Counseling</h4>
                        <p>
                            Discuss Your Health</p>
                    </li>
                </ul>--%>
        </div>
        <!-- end of slider-wrap -->
        <div id="container">
            
            
            <!-- end of services -->
            
            <div class="official clearfix">
                <div class="home-left-side">
                <section class="slogan">
                                    <h2 style="color:#ff0303">Economic & Effictive Pharmaceutic for </h2>
                                    <h2 style="color:#ff0303">Welfare of Patients</h2>
                                </section>
                    <section class="team clearfix">
                                                    
                                                    <div class="detail" style="width:90%;padding-left:10px;">
                                                     
                                                        
                                                        <ul style="list-style-type:circle;line-height:15px;">
                                                            <li style="font-size:16px !important;">

                                                                
                                                                We would like to introduce ourselves as one of the fast growing Egyptian companies since 12 years .

                                                            </li>
                                                            <li style="font-size:16px !important;">We are an Egyptian company specialized in Vaccines& pharmaceuticals manufacturing, trading and we have international license for trading. Our professional staff ( All our staff of true experience working at multinational pharmaceutical companies as GSK, Merz, Wyeth, Bayer, Merck….etc) are doing the best to serve customers from all parts of the world.

                                                            </li>
                                                            <li style="font-size:16px !important;">We have good experience with the Egyptian & Middle East Market needs and excellent relation with Governmental authorities, MOH & Private sectors.

                                                            </li>
                                                            <li style="font-size:16px !important;">We are already agents for companies worldwide, Every solution we offer is defined by a “ value differential” that is provided by our outstanding scientific knowledge pool. Our proven capability to market high value biopharmaceuticals is an endorsement of our ability to meet global benchmarks.
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    
                                                    														
                                            </section>
                    
                    <!-- end of testi section -->
                </div>
                <!-- home left side -->
                <aside id="sidebar">
                                                                                    
                                            <section class="widget">                   
                                                <div class="appointment">
                                                    <div class="header">
                                                            <h2>Pr. Dr. Awad Tag El Din Honoring Dr. Fawzy Bebawy</h2>
                                                            
                                                    </div>
                                                    <div  id="appoint-form" style="padding:0;" >
                                                            <p>
                                                                <img src="images/Dr.-F.7.gif" title="Pr. Dr. Awad Tag El Din Honoring Dr. Fawzy Bebawy" alt="Pr. Dr. Awad Tag El Din Honoring Dr. Fawzy Bebawy"/>
                                                            </p>
                                                                                     
                                                    </div>
                                                </div>                             
                                            </section>
                                            
                                            <section class="widget"><h3 class="title">Newsletter</h3>       
                                                <div class="newsletter">                  
                                                  <div action="#" id="newsletter"  novalidate="novalidate">
                                                      <p>Sign up out newsletter to get latest updates</p>
                                                      <p>
                                                          <label class="display-ie8" for="nl_email">Email Address</label>
                                                          <input type="text" name="EMAIL" id="nl_email" class="email required" placeholder="Email Address" title="* Please enter valid Email Address">
                                                          <input type="submit" id="nl_submit" value="Go" class="readmore">
                                                      </p>
                                                      <div class="error-container"></div>
                                                  </div>
                                                </div>               
                                            </section>									
                                        </aside>
            </div>
            <!-- end of official -->
            
        </div>
        <!-- end of container -->
</asp:Content>
