<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Flights_GUI.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {        
        $('#profileTabs').tabs();        
    });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#mi32").addClass("selected");
        });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
                    <h4>
                        Pilot Profile
                    </h4>
                    <div class="Details900">
                        <div class="ItemLogoLarge">
                            <a href="Profile.htm">
                                <img src="images/defaultpic.jpg" style="width: 100px;" />
                            </a>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="ItemDetails" style="width:50%">
                            <div class="ItemValue">
                                <a href="Profile.htm">Amir Mahmoud</a></div>
                            <div class="clear">
                            </div>
                            <div class="ItemValue">
                                <input class="star" type="radio" name="test-1-rating-1" value="1" />
                                <input class="star" type="radio" name="test-1-rating-1" value="2" />
                                <input class="star" type="radio" name="test-1-rating-1" value="3" />
                                <input class="star" type="radio" name="test-1-rating-1" value="4" />
                                <input class="star" type="radio" name="test-1-rating-1" value="5" />
                                &nbsp;(Rate him)
                            </div>
                            <div class="clear">
                            </div>
                             <div class="ItemHeader" style="width:30%;float:left;">
                               <label class="Label"> License No.</label>
                             </div>
                             <div class="ItemValue" style="width:30%;float:left;">
                                ARHO5568921
                             </div>
                        </div>
                        <div class="clear10">
                        </div>
                        <div>
                            <div id="profileTabs">
                                <ul>
                                    <li><a href="#ptabs-1"><span class="ui-icon ui-icon-BInfo"></span>Basic Info</a></li>
                                    <li><a href="#ptabs-2"><span class="ui-icon ui-icon-WE"></span>Work & Experience</a></li>
                                    <li><a href="#ptabs-4"><span class="ui-icon ui-icon-Ed"></span>Education</a></li>
                                    <li><a href="#ptabs-3"><span class="ui-icon ui-icon-CInfo"></span>Contact Info</a></li>
                                </ul>
                                <div id="ptabs-1">
                                     <div class="ItemHeader" style="width:15%;float:left;">
                                       <label class="Label"> Name</label>
                                     </div>
                                     <div class="ItemValue" style="width:65%;float:left;">
                                        Amir mahmoud
                                     </div>
                                    <div class="clear">
                                    </div>
                                    <div class="ItemHeaderAlternate" style="width:15%;float:left;">
                                       <label class="Label"> Birthday</label>
                                     </div>
                                     <div class="ItemValueAlternate" style="width:65%;float:left;">
                                        August 7, 1965
                                     </div>
                                    <div class="clear">
                                    </div>
                                    <div class="ItemHeader" style="width:15%;float:left;">
                                       <label class="Label"> Sex</label>
                                     </div>
                                     <div class="ItemValue" style="width:65%;float:left;">
                                        Male
                                     </div>
                                    <div class="clear">
                                    </div>
                                    <div class="ItemHeaderAlternate" style="width:15%;float:left;">
                                       <label class="Label"> Languages</label>
                                     </div>
                                     <div class="ItemValueAlternate" style="width:65%;float:left;">
                                        English , Arabic, French and Deutsch
                                     </div>
                                    <div class="clear">
                                    </div>
                                    <div class="ItemHeader" style="width:15%;float:left;">
                                       <label class="Label"> Maritial Status</label>
                                     </div>
                                     <div class="ItemValue" style="width:65%;float:left;">
                                        Married
                                     </div>
                                    <div class="clear">
                                    </div>
                                </div>
                                <div id="ptabs-2">
                                    <b>Professional Airline Pilot at United Airlines</b>
                                    <br /><sub>February 1989 – Present (23 years 7 months)</sub>
                                    <br />
                                    <br />First Officer, B737
                                    <br />First Officer B757/767
                                    <br />First Officer B777
                                    <br />Captain B727
                                    <br />Captain Airbus A320/319
                                    <br />Captain Boeing 767/757
                                    <br />
                                    <br />Check Airman B727, B757 and 767
                                    <hr />

                                    <b>Pilot at Executive Express, Luton Airport</b>
                                    <br /><sub>1981 – 1983 (2 years)</sub>
                                    <br />
                                    <br />Corporate flying - Cessna 421 and 404. Beechcraft 200 King Air
                                    <br />Single and Multi Crew throughout Europe
                                    <hr />

                                    <b>Flying Instructor at Oxford Air Training School. Oxford, England</b>
                                    <br /><sub>1978 – 1981 (3 years)</sub>
                                    <br />
                                    <br />Teaching airline students on ab initio UK CAA CPL/IR courses. CAA approved school in Oxfordshire
                                    <div class="clear">
                                    </div>
                                </div>
                                <div id="ptabs-3">
                                    <div class="ItemHeader" style="width:15%;float:left;">
                                       <label class="Label"> Mobile</label>
                                     </div>
                                     <div class="ItemValue" style="width:65%;float:left;">
                                        0123456789 - 0112345678 - 01003456789
                                     </div>
                                    <div class="clear">
                                    </div>
                                    <div class="ItemHeaderAlternate" style="width:15%;float:left;">
                                       <label class="Label"> Email</label>
                                     </div>
                                     <div class="ItemValueAlternate" style="width:65%;float:left;">
                                        Amir@abc.com
                                     </div>
                                    <div class="clear">
                                    </div>
                                    <div class="ItemHeader" style="width:15%;float:left;">
                                       <label class="Label"> Address</label>
                                     </div>
                                     <div class="ItemValue" style="width:65%;float:left;">
                                        23 st. test , Cairo , Egypt
                                     </div>
                                    <div class="clear">
                                    </div>
                                    
                                </div>
                                <div id="ptabs-4">
                                    <b>Faculty of Aviation Engineering</b>
                                    <br /><sub>Class of 1960 · Cairo, Egypt</sub>
                                    <br />
                                    
                                    <div class="clear">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clear10">
                        </div>
                    </div>
                </div>
</asp:Content>
