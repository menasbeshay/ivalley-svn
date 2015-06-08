<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="testgui.aspx.cs" Inherits="Flights_GUI.testgui" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
                label, input { display:block; }
        input.text { margin-bottom:12px; width:95%; padding: .4em; }
        fieldset { padding:0; border:0; margin-top:25px; }
                    
                    .style2
                    {
                        font-weight: bold;
                        text-align: center;
                    }
                    
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div id="Hpage">
                <div id="Board">
                    <%--<div id="Board_Right">
                        
                       
                        
                        <div id="Board_Sections" style="display: block;">
                            <div id="Board_Section1">
                                <h1>
                                    Cheap Flights, Airfares and Hotels</h1>
                                <p>
                                    Airfare.com provides cheap flights, cheap hotels reservations, and cheap tickets
                                    through its "discount airline consolidation" strategy. By buying in bulk we are
                                    able to offer specially negotiated, deeply discounted airline tickets up to 70%
                                    off.
                                </p>
                            </div>
                            <div id="Board_Section2">
                                <h2>
                                    Exclusive Airfare Discounts</h2>
                                <p>
                                    Join "Airfare.com’s Preferred Access" to receive exclusive discounted rates. You
                                    should be a member of this website to access these special fares.
                                </p>
                                <h3>
                                    <a href="http://www.airfare.com/airfare5/BusinessPartners/BusinessPartners/BusinessPartnerslogin.aspx"
                                        title="Join Airfare to Get Cheap Flights">Join Airfare Now!</a></h3>
                            </div>
                        </div>
                    </div>--%>
                    <div id="Board_Tabs">
                    <div id="PassengerTabs">
                    <a title="Cheap Hotels" onclick="setVisibility(&#39;PassengerDiv&#39;, &#39;block&#39;);setVisibility(&#39;FlightAgentsDiv&#39;, &#39;none&#39;);setVisibility(&#39;PassengerTabs&#39;, &#39;block&#39;);setVisibility(&#39;FlightAgentsTabs&#39;, &#39;none&#39;);">
                                        <img border="0" src="images/Theme/images/PassengersTabon.gif" align="right" alt="Passengers"
                                            width="120" height="78"></a>
                            <a id="login" title="Cheap Flights" onclick="setVisibility(&#39;FlightAgentsDiv&#39;, &#39;block&#39;);setVisibility(&#39;PassengerDiv&#39;, &#39;none&#39;);setVisibility(&#39;FlightAgentsTabs&#39;, &#39;block&#39;);setVisibility(&#39;PassengerTabs&#39;, &#39;none&#39;);">
                                <img border="0" src="images/Theme/images/AgentsTaboff.gif" align="right" alt="Flight Agents"
                                    width="120" height="78"></a> 
                        </div>
                        <div id="FlightAgentsTabs"  style="display: none;">
                        <a title="Cheap Hotels" onclick="setVisibility(&#39;PassengerDiv&#39;, &#39;block&#39;);setVisibility(&#39;FlightAgentsDiv&#39;, &#39;none&#39;);setVisibility(&#39;PassengerTabs&#39;, &#39;block&#39;);setVisibility(&#39;FlightAgentsTabs&#39;, &#39;none&#39;);">
                                        <img border="0" src="images/Theme/images/PassengersTaboff.gif" align="right" alt="Passengers"
                                            width="120" height="78"></a>
                            <a title="Cheap Flights" onclick="setVisibility(&#39;FlightAgentsDiv&#39;, &#39;block&#39;);setVisibility(&#39;PassengerDiv&#39;, &#39;none&#39;);setVisibility(&#39;FlightAgentsTabs&#39;, &#39;block&#39;);setVisibility(&#39;PassengerTabs&#39;, &#39;none&#39;);">
                                <img border="0" src="images/Theme/images/AgentsTabOn.gif" align="right" alt="Flight Agents"
                                    width="120" height="78"></a> 
                        </div>
                        
                    </div>
                    <div id="Board_Left">
                        <div id="SocialNetworks">
                            <a href="http://www.facebook.com/Airfarecom?ref=ts" title="Airfare on Facebook" target="_blank">
                                <img src="images/Theme/images/facebook2.gif" alt="Airfare on Facebook" border="0" width="26"
                                    height="26"></a>&nbsp; <a href="http://twitter.com/Airfaredotcom" title="Airfare on Twitter"
                                        target="_blank">
                                        <img src="images/Theme/images/twitter2.gif" alt="Airfare on Twitter" border="0" width="26"
                                            height="26"></a>&nbsp; <a href="http://www.flickr.com/groups/airfaredotcom" title="Airfare on Flickr"
                                                target="_blank">
                                                <img src="images/Theme/images/flickr2.gif" alt="Airfare on Flickr" border="0" width="26"
                                                    height="26"></a>&nbsp; <a href="http://www.linkedin.com/company/airfare.com" title="Airfare on Linkedin"
                                                        target="_blank">
                                                        <img src="images/Theme/images/linkedin2.gif" alt="Airfare on Linkedin" border="0" width="26"
                                                            height="26"></a>&nbsp; <a href="https://plus.google.com/u/0/110130876970737866758/"
                                                                title="Airfare on Google+" target="_blank">
                                                                <img src="images/Theme/images/google2.gif" alt="Airfare on Google+" border="0" width="26"
                                                                    height="26"></a>
                        </div>
                        <div id="FlightAgentsDiv" style="display: none;">
                            <h2>
                                Find Flights</h2>
                                <div style="float:left; border-right:1px solid black;">
                            <table border="0" cellspacing="0" cellpadding="2" id="TripOptions">
                                <tbody>
                                    <tr>
                                        <td>
                                            <input id="round" onclick="showround()" value="round" type="radio" name="ty" checked="checked">
                                        </td>
                                        <td style="padding-right: 25px;">
                                            <label for="round">
                                                Round trip</label>
                                        </td>
                                        <td>
                                            <input id="oneway" onclick="showoneway()" value="oneway" type="radio" name="ty">
                                        </td>
                                        <td style="padding-right: 25px;">
                                            <label for="oneway">
                                                One way</label>
                                        </td>
                                        <td>
                                            <input id="multi" onclick="showmulti()" value="multi" type="radio" name="ty">
                                        </td>
                                        <td>
                                            <label for="multi">
                                                Multiple cities</label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="5">
                                <tbody>
                                    <tr>
                                        <td class="searchhead">
                                            Departing From
                                        </td>
                                        <td>
                                            <input id="c1" name="c1" autocomplete="off" tabindex="1">
                                            <span id="star1" style="color: Red; display: none;">*</span>
                                            <div id="divcity1" style="display: none;">
                                            </div>
                                            <span id="Framecity1" style="display: none;"></span>
                                            <script language="javascript" type="text/javascript">                                                var MyAutoComplete = new AutoComplete('c1', 'divcity1', 'Framecity1', '', '', '/airfare5/flights/AirportsSearch.ashx');</script>
                                        </td>
                                        <td>
                                            <a id="ctl00_body_default1_HLinkCity1" title="Airfare - Airport Codes" class="smlinks2"
                                                onclick="window.open(&#39;/airfare5/flights/Lookup.aspx?CID=c1&amp;FormID=aspnetForm&#39;,&#39;Lookup&#39;,&#39;toolbar=no,location=no,border=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=350,top=310,left=675&#39;);return false">
                                                <img src="images/Theme/images/airport.gif" border="0" alt="Airfare - Airport Codes" width="23"
                                                    height="23"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="searchhead">
                                            Going To
                                        </td>
                                        <td>
                                            <input id="c2" name="c2" autocomplete="off" tabindex="2">
                                            <span id="star2" style="color: Red; display: none;">*</span>
                                            <div id="divcity2" style="display: none;">
                                            </div>
                                            <span id="Framecity2" style="display: none;"></span>
                                            <script language="javascript" type="text/javascript">                                                var MyAutoComplete = new AutoComplete('c2', 'divcity2', 'Framecity2', '', '', '/airfare5/flights/AirportsSearch.ashx');</script>
                                        </td>
                                        <td>
                                            <a id="ctl00_body_default1_HLinkCity2" title="Airfare - Airport Codes" class="smlinks2"
                                                onclick="window.open(&#39;/airfare5/flights/Lookup.aspx?CID=c2&amp;FormID=aspnetForm&#39;,&#39;Lookup&#39;,&#39;toolbar=no,location=no,border=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=350,top=310,left=675&#39;);return false">
                                                <img src="images/Theme/images/airport.gif" border="0" alt="Airfare - Airport Codes" width="23"
                                                    height="23"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="searchhead">
                                            Departure Date
                                        </td>
                                        <td>
                                            <input id="dd" name="dd" tabindex="3" style="width: 100px;float:left" onfocus="this.select();lcs(this);"
                                                onclick="event.cancelBubble=true;this.select();lcs(this)">
                                            <select id="ctl00_body_default1_firsttime" name="ctl00$body$default1$firsttime" style="width: 100px;"
                                                onfocus="document.getElementById(&#39;fc_all&#39;).style.display = &#39;none&#39;;g_o(&#39;b_s&#39;).style.visibility =&#39;hidden&#39;;g_o(&#39;b_a&#39;).style.visibility = &#39;hidden&#39;;g_o(&#39;b_close&#39;).style.visibility = &#39;hidden&#39;;">
                                                <option selected="selected" value="0">Any Time</option>
                                                <option value="1">1:00 AM</option>
                                                <option value="2">2:00 AM</option>
                                                <option value="3">3:00 AM</option>
                                                <option value="4">4:00 AM</option>
                                                <option value="5">5:00 AM</option>
                                                <option value="6">6:00 AM</option>
                                                <option value="7">7:00 AM</option>
                                                <option value="8">8:00 AM</option>
                                                <option value="9">9:00 AM</option>
                                                <option value="10">10:00 AM</option>
                                                <option value="11">11:00 AM</option>
                                                <option value="12">Noon</option>
                                                <option value="13">1:00 PM</option>
                                                <option value="14">2:00 PM</option>
                                                <option value="15">3:00 PM</option>
                                                <option value="16">4:00 PM</option>
                                                <option value="17">5:00 PM</option>
                                                <option value="18">6:00 PM</option>
                                                <option value="19">7:00 PM</option>
                                                <option value="20">8:00 PM</option>
                                                <option value="21">9:00 PM</option>
                                                <option value="22">10:00 PM</option>
                                                <option value="23">11:00 PM</option>
                                                <option value="24">Midnight</option>
                                            </select>
                                            <iframe id="iframe_firstdate" style="display: none;"></iframe>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr id="returndate" style="">
                                        <td class="searchhead">
                                            Returning Date
                                        </td>
                                        <td>
                                            <input id="rd" name="rd" tabindex="4" style="width: 100px;float:left" onfocus="this.select();lcs(this)"
                                                onclick="event.cancelBubble=true;this.select();lcs(this)">
                                            <select id="ctl00_body_default1_secondtime" name="ctl00$body$default1$secondtime"
                                                style="width: 100px;" onfocus="document.getElementById(&#39;fc_all&#39;).style.display = &#39;none&#39;;g_o(&#39;b_s&#39;).style.visibility = &#39;hidden&#39;;g_o(&#39;b_a&#39;).style.visibility=&#39;hidden&#39;;g_o(&#39;b_close&#39;).style.visibility = &#39;hidden&#39;; ">
                                                <option selected="selected" value="0">Any Time</option>
                                                <option value="1">1:00 AM</option>
                                                <option value="2">2:00 AM</option>
                                                <option value="3">3:00 AM</option>
                                                <option value="4">4:00 AM</option>
                                                <option value="5">5:00 AM</option>
                                                <option value="6">6:00 AM</option>
                                                <option value="7">7:00 AM</option>
                                                <option value="8">8:00 AM</option>
                                                <option value="9">9:00 AM</option>
                                                <option value="10">10:00 AM</option>
                                                <option value="11">11:00 AM</option>
                                                <option value="12">Noon</option>
                                                <option value="13">1:00 PM</option>
                                                <option value="14">2:00 PM</option>
                                                <option value="15">3:00 PM</option>
                                                <option value="16">4:00 PM</option>
                                                <option value="17">5:00 PM</option>
                                                <option value="18">6:00 PM</option>
                                                <option value="19">7:00 PM</option>
                                                <option value="20">8:00 PM</option>
                                                <option value="21">9:00 PM</option>
                                                <option value="22">10:00 PM</option>
                                                <option value="23">11:00 PM</option>
                                                <option value="24">Midnight</option>
                                            </select>
                                            <iframe id="iframe_seconddate" style="display: none;"></iframe>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="5" id="multicity" style="display: none;">
                                <tbody>
                                    <tr>
                                        <td class="searchhead">
                                            Departing From
                                        </td>
                                        <td>
                                            <input id="c3" name="c3" autocomplete="off">
                                            <span id="star3" style="color: Red; display: none;">*</span>
                                            <div id="divcity3" style="display: none;">
                                            </div>
                                            <span id="Framecity3" style="display: none;"></span>
                                            <script language="javascript" type="text/javascript">                                                var MyAutoComplete = new AutoComplete('c3', 'divcity3', 'Framecity3', '', '', '/Airfare5/flights/AirportsSearch.ashx');</script>
                                        </td>
                                        <td>
                                            <a id="ctl00_body_default1_HLinkCity3" title="Airfare - Airport Codes" class="smlinks2"
                                                onclick="window.open(&#39;/airfare5/flights/Lookup.aspx?CID=c3&amp;FormID=aspnetForm&#39;,&#39;Lookup&#39;,&#39;toolbar=no,location=no,border=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=350,top=310,left=675&#39;);return false">
                                                <img src="./Airfare_files/airport.gif" border="0" alt="Airfare - Airport Codes" width="23"
                                                    height="23"></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="5" id="multidate" style="display: none;">
                                <tbody>
                                    <tr>
                                        <td class="searchhead">
                                            Going To
                                        </td>
                                        <td>
                                            <input id="c4" name="c4" autocomplete="off">
                                            <span id="star4" style="color: Red; display: none;">*</span>
                                            <div id="divcity4" style="display: none;">
                                            </div>
                                            <span id="Framecity4" style="display: none;"></span>
                                            <script language="javascript" type="text/javascript">                                                var MyAutoComplete = new AutoComplete('c4', 'divcity4', 'Framecity4', '', '', '/Airfare5/flights/AirportsSearch.ashx');</script>
                                        </td>
                                        <td>
                                            <a id="ctl00_body_default1_HLinkCity4" title="Airfare - Airport Codes" class="smlinks2"
                                                onclick="window.open(&#39;/airfare5/flights/Lookup.aspx?CID=c4&amp;FormID=aspnetForm&#39;,&#39;Lookup&#39;,&#39;toolbar=no,location=no,border=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=350,top=310,left=675&#39;);return false">
                                                <img src="./Airfare_files/airport.gif" border="0" alt="Airfare - Airport Codes" width="23"
                                                    height="23"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="searchhead">
                                            Returning Date
                                        </td>
                                        <td>
                                            <input id="secondmultidate" name="secondmultidate" style="width: 100px;" onfocus="this.select();lcs(this)"
                                                onclick="event.cancelBubble=true;this.select();lcs(this)" onblur="document.getElementById(&#39;fc_all&#39;).style.display = &#39;none&#39;;g_o(&#39;b_s&#39;).style.visibility =&#39;hidden&#39;;g_o(&#39;b_a&#39;).style.visibility = &#39;hidden&#39;;g_o(&#39;b_close&#39;).style.visibility = &#39;hidden&#39;;"
                                                value="03/23/2010">
                                            <select id="ctl00_body_default1_multitime" name="ctl00$body$default1$multitime" style="width: 100px;">
                                                <option selected="selected" value="0">Any Time</option>
                                                <option value="1">1:00 AM</option>
                                                <option value="2">2:00 AM</option>
                                                <option value="3">3:00 AM</option>
                                                <option value="4">4:00 AM</option>
                                                <option value="5">5:00 AM</option>
                                                <option value="6">6:00 AM</option>
                                                <option value="7">7:00 AM</option>
                                                <option value="8">8:00 AM</option>
                                                <option value="9">9:00 AM</option>
                                                <option value="10">10:00 AM</option>
                                                <option value="11">11:00 AM</option>
                                                <option value="12">Noon</option>
                                                <option value="13">1:00 PM</option>
                                                <option value="14">2:00 PM</option>
                                                <option value="15">3:00 PM</option>
                                                <option value="16">4:00 PM</option>
                                                <option value="17">5:00 PM</option>
                                                <option value="18">6:00 PM</option>
                                                <option value="19">7:00 PM</option>
                                                <option value="20">8:00 PM</option>
                                                <option value="21">9:00 PM</option>
                                                <option value="22">10:00 PM</option>
                                                <option value="23">11:00 PM</option>
                                                <option value="24">Midnight</option>
                                            </select>
                                            <iframe id="iframe_multidate" style="display: none;"></iframe>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="5">
                                <tbody>
                                    <tr>
                                        <td class="searchhead">
                                            Passengers
                                            <br>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <select id="ad" name="ad" style="width: 87px;">
                                                <option selected="selected" value="1">1 Adult</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                            </select>
                                            <select id="ch" name="ch" style="width: 87px;">
                                                <option selected="selected" value="0">0 Child</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                            </select>
                                            <select id="in" name="in" style="width: 87px;">
                                                <option selected="selected" value="0">0 Infant</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                            </select>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" id="AgeRangeHint">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            12+ Years
                                                        </td>
                                                        <td>
                                                            2-11 Years
                                                        </td>
                                                        <td>
                                                            0-23 Months
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="OptionalInfo">
                                                Optional Information</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="searchhead">
                                            Flexible Days
                                        </td>
                                        <td>
                                            <select id="dr" name="dr" style="width: 200px;">
                                                <option selected="selected" value="ExactDays">Exact days</option>
                                                <option value="OneDayBeforeAndAfter">One day before and after</option>
                                                <option value="OneDayBefore">One day before</option>
                                                <option value="OneDayAfter">One day after</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="searchhead">
                                            Cabin Class
                                        </td>
                                        <td>
                                            <select id="cs" name="cs" style="width: 100px;">
                                                <option selected="selected" value="Y">Economy</option>
                                                <option value="C">Business</option>
                                                <option value="F">First</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <input id="searchbtn" type="submit" value="Search For Flights" tabindex="5" name="ctl00$body$default1$search"
                                                onfocus="document.getElementById(&#39;fc_all&#39;).style.display = &#39;none&#39;;g_o(&#39;b_s&#39;).style.visibility =&#39;hidden&#39;;g_o(&#39;b_a&#39;).style.visibility = &#39;hidden&#39;;g_o(&#39;b_close&#39;).style.visibility = &#39;hidden&#39;; this.style.backgroundImage=&#39;url(/airfare5/master/images/btn_Mid_H.gif)&#39;; this.style.borderColor=&#39;#AF3B20&#39;;"
                                                onblur="this.style.backgroundImage=&#39;url(/airfare5/master/images/btn_Mid.gif)&#39;; this.style.borderColor=&#39;#144E88&#39;;"
                                                onkeydown="if(event.keyCode==13){submit()}" onclick="return searchbtn_onclick()">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                            <div style="border:1px none black; width:340px; float:left;margin:5px; padding:3px;text-align:center;" >
                            <h2 style="margin-top:0px;">Flights booked by Agent 1.</h2>                                

                                <table align="center" cellpadding="2" cellspacing="2" border="1" style="border-collapse:collapse">
                                    <tr>
                                        <td class="style2">
                                            Flight No.</td>
                                        <td class="style2">
                                            Date</td>
                                        <td class="style2">
                                            From</td>
                                        <td class="style2">
                                            To </td>
                                        <td class="style2">
                                            No. of Passengers </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;">
                                            SAI 776</td>
                                        <td style="text-align:center;">
                                            12/9/2012</td>
                                        <td style="text-align:center;">
                                            LHM</td>
                                        <td style="text-align:center;">
                                            DMM</td>
                                        <td style="text-align:center;">
                                            123</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;">
                                            SAI 666</td>
                                        <td style="text-align:center;">
                                            14/9/2012</td>
                                        <td style="text-align:center;">
                                            LHE</td>
                                        <td style="text-align:center;">
                                            SHJ</td>
                                        <td style="text-align:center;">
                                            222</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;">
                                            SAI 234</td>
                                        <td style="text-align:center;">
                                            15/9/2012</td>
                                        <td style="text-align:center;">
                                            LYP</td>
                                        <td style="text-align:center;">
                                            KWI</td>
                                        <td style="text-align:center;">
                                            159</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;">
                                            SAI 768</td>
                                        <td style="text-align:center;">
                                            16/9/2012</td>
                                        <td style="text-align:center;">
                                            SKT</td>
                                        <td style="text-align:center;">
                                            MHD</td>
                                        <td style="text-align:center;">
                                            300</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;">
                                            SAI 222</td>
                                        <td style="text-align:center;">
                                            18/9/2012</td>
                                        <td style="text-align:center;">
                                            AAN</td>
                                        <td style="text-align:center;">
                                            CAI</td>
                                        <td style="text-align:center;">
                                            156</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div id="PassengerDiv" >
                            <h2>
                                Find Flights</h2>
                            <table border="0" cellspacing="0" cellpadding="2" id="Table1">
                                <tbody>
                                    <tr>
                                        <td>
                                            <input id="Radio1" onclick="showround()" value="round" type="radio" name="ty" checked="checked">
                                        </td>
                                        <td style="padding-right: 25px;">
                                            <label for="round">
                                                Round trip</label>
                                        </td>
                                        <td>
                                            <input id="Radio2" onclick="showoneway()" value="oneway" type="radio" name="ty">
                                        </td>
                                        <td style="padding-right: 25px;">
                                            <label for="oneway">
                                                One way</label>
                                        </td>
                                        <td>
                                            <input id="Radio3" onclick="showmulti()" value="multi" type="radio" name="ty">
                                        </td>
                                        <td>
                                            <label for="multi">
                                                Multiple cities</label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="5">
                                <tbody>
                                    <tr>
                                        <td class="searchhead">
                                            Departing From
                                        </td>
                                        <td>
                                            <input id="Text1" name="c1" autocomplete="off" tabindex="1">
                                            <span id="Span1" style="color: Red; display: none;">*</span>
                                            <div id="div1" style="display: none;">
                                            </div>
                                            <span id="Span2" style="display: none;"></span>
                                            <script language="javascript" type="text/javascript">                                                var MyAutoComplete = new AutoComplete('c1', 'divcity1', 'Framecity1', '', '', '/airfare5/flights/AirportsSearch.ashx');</script>
                                        </td>
                                        <td>
                                            <a id="A1" title="Airfare - Airport Codes" class="smlinks2"
                                                onclick="window.open(&#39;/airfare5/flights/Lookup.aspx?CID=c1&amp;FormID=aspnetForm&#39;,&#39;Lookup&#39;,&#39;toolbar=no,location=no,border=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=350,top=310,left=675&#39;);return false">
                                                <img src="images/Theme/images/airport.gif" border="0" alt="Airfare - Airport Codes" width="23"
                                                    height="23"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="searchhead">
                                            Going To
                                        </td>
                                        <td>
                                            <input id="Text2" name="c2" autocomplete="off" tabindex="2">
                                            <span id="Span3" style="color: Red; display: none;">*</span>
                                            <div id="div2" style="display: none;">
                                            </div>
                                            <span id="Span4" style="display: none;"></span>
                                            <script language="javascript" type="text/javascript">                                                var MyAutoComplete = new AutoComplete('c2', 'divcity2', 'Framecity2', '', '', '/airfare5/flights/AirportsSearch.ashx');</script>
                                        </td>
                                        <td>
                                            <a id="A2" title="Airfare - Airport Codes" class="smlinks2"
                                                onclick="window.open(&#39;/airfare5/flights/Lookup.aspx?CID=c2&amp;FormID=aspnetForm&#39;,&#39;Lookup&#39;,&#39;toolbar=no,location=no,border=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=350,top=310,left=675&#39;);return false">
                                                <img src="images/Theme/images/airport.gif" border="0" alt="Airfare - Airport Codes" width="23"
                                                    height="23"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="searchhead">
                                            Departure Date
                                        </td>
                                        <td>
                                            <input id="Text3" name="dd" tabindex="3" style="width: 100px;float:left;margin-right:3px;" onfocus="this.select();lcs(this);"
                                                onclick="event.cancelBubble=true;this.select();lcs(this)">
                                            <select id="Select1" name="ctl00$body$default1$firsttime" style="width: 100px;"
                                                onfocus="document.getElementById(&#39;fc_all&#39;).style.display = &#39;none&#39;;g_o(&#39;b_s&#39;).style.visibility =&#39;hidden&#39;;g_o(&#39;b_a&#39;).style.visibility = &#39;hidden&#39;;g_o(&#39;b_close&#39;).style.visibility = &#39;hidden&#39;;">
                                                <option selected="selected" value="0">Any Time</option>
                                                <option value="1">1:00 AM</option>
                                                <option value="2">2:00 AM</option>
                                                <option value="3">3:00 AM</option>
                                                <option value="4">4:00 AM</option>
                                                <option value="5">5:00 AM</option>
                                                <option value="6">6:00 AM</option>
                                                <option value="7">7:00 AM</option>
                                                <option value="8">8:00 AM</option>
                                                <option value="9">9:00 AM</option>
                                                <option value="10">10:00 AM</option>
                                                <option value="11">11:00 AM</option>
                                                <option value="12">Noon</option>
                                                <option value="13">1:00 PM</option>
                                                <option value="14">2:00 PM</option>
                                                <option value="15">3:00 PM</option>
                                                <option value="16">4:00 PM</option>
                                                <option value="17">5:00 PM</option>
                                                <option value="18">6:00 PM</option>
                                                <option value="19">7:00 PM</option>
                                                <option value="20">8:00 PM</option>
                                                <option value="21">9:00 PM</option>
                                                <option value="22">10:00 PM</option>
                                                <option value="23">11:00 PM</option>
                                                <option value="24">Midnight</option>
                                            </select>
                                            <iframe id="iframe1" style="display: none;"></iframe>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr id="Tr1" style="">
                                        <td class="searchhead">
                                            Returning Date
                                        </td>
                                        <td>
                                            <input id="Text4" name="rd" tabindex="4" style="width: 100px;float:left;margin-right:3px;" onfocus="this.select();lcs(this)"
                                                onclick="event.cancelBubble=true;this.select();lcs(this)">
                                            <select id="Select2" name="ctl00$body$default1$secondtime"
                                                style="width: 100px;" onfocus="document.getElementById(&#39;fc_all&#39;).style.display = &#39;none&#39;;g_o(&#39;b_s&#39;).style.visibility = &#39;hidden&#39;;g_o(&#39;b_a&#39;).style.visibility=&#39;hidden&#39;;g_o(&#39;b_close&#39;).style.visibility = &#39;hidden&#39;; ">
                                                <option selected="selected" value="0">Any Time</option>
                                                <option value="1">1:00 AM</option>
                                                <option value="2">2:00 AM</option>
                                                <option value="3">3:00 AM</option>
                                                <option value="4">4:00 AM</option>
                                                <option value="5">5:00 AM</option>
                                                <option value="6">6:00 AM</option>
                                                <option value="7">7:00 AM</option>
                                                <option value="8">8:00 AM</option>
                                                <option value="9">9:00 AM</option>
                                                <option value="10">10:00 AM</option>
                                                <option value="11">11:00 AM</option>
                                                <option value="12">Noon</option>
                                                <option value="13">1:00 PM</option>
                                                <option value="14">2:00 PM</option>
                                                <option value="15">3:00 PM</option>
                                                <option value="16">4:00 PM</option>
                                                <option value="17">5:00 PM</option>
                                                <option value="18">6:00 PM</option>
                                                <option value="19">7:00 PM</option>
                                                <option value="20">8:00 PM</option>
                                                <option value="21">9:00 PM</option>
                                                <option value="22">10:00 PM</option>
                                                <option value="23">11:00 PM</option>
                                                <option value="24">Midnight</option>
                                            </select>
                                            <iframe id="iframe2" style="display: none;"></iframe>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="5" id="Table2" style="display: none;">
                                <tbody>
                                    <tr>
                                        <td class="searchhead">
                                            Departing From
                                        </td>
                                        <td>
                                            <input id="Text5" name="c3" autocomplete="off">
                                            <span id="Span5" style="color: Red; display: none;">*</span>
                                            <div id="div3" style="display: none;">
                                            </div>
                                            <span id="Span6" style="display: none;"></span>
                                            <script language="javascript" type="text/javascript">                                                var MyAutoComplete = new AutoComplete('c3', 'divcity3', 'Framecity3', '', '', '/Airfare5/flights/AirportsSearch.ashx');</script>
                                        </td>
                                        <td>
                                            <a id="A3" title="Airfare - Airport Codes" class="smlinks2"
                                                onclick="window.open(&#39;/airfare5/flights/Lookup.aspx?CID=c3&amp;FormID=aspnetForm&#39;,&#39;Lookup&#39;,&#39;toolbar=no,location=no,border=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=350,top=310,left=675&#39;);return false">
                                                <img src="./Airfare_files/airport.gif" border="0" alt="Airfare - Airport Codes" width="23"
                                                    height="23"></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="5" id="Table3" style="display: none;">
                                <tbody>
                                    <tr>
                                        <td class="searchhead">
                                            Going To
                                        </td>
                                        <td>
                                            <input id="Text6" name="c4" autocomplete="off">
                                            <span id="Span7" style="color: Red; display: none;">*</span>
                                            <div id="div4" style="display: none;">
                                            </div>
                                            <span id="Span8" style="display: none;"></span>
                                            <script language="javascript" type="text/javascript">                                                var MyAutoComplete = new AutoComplete('c4', 'divcity4', 'Framecity4', '', '', '/Airfare5/flights/AirportsSearch.ashx');</script>
                                        </td>
                                        <td>
                                            <a id="A4" title="Airfare - Airport Codes" class="smlinks2"
                                                onclick="window.open(&#39;/airfare5/flights/Lookup.aspx?CID=c4&amp;FormID=aspnetForm&#39;,&#39;Lookup&#39;,&#39;toolbar=no,location=no,border=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=350,top=310,left=675&#39;);return false">
                                                <img src="./Airfare_files/airport.gif" border="0" alt="Airfare - Airport Codes" width="23"
                                                    height="23"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="searchhead">
                                            Returning Date
                                        </td>
                                        <td>
                                            <input id="Text7" name="secondmultidate" style="width: 100px;float:left" onfocus="this.select();lcs(this)"
                                                onclick="event.cancelBubble=true;this.select();lcs(this)" onblur="document.getElementById(&#39;fc_all&#39;).style.display = &#39;none&#39;;g_o(&#39;b_s&#39;).style.visibility =&#39;hidden&#39;;g_o(&#39;b_a&#39;).style.visibility = &#39;hidden&#39;;g_o(&#39;b_close&#39;).style.visibility = &#39;hidden&#39;;"
                                                value="03/23/2010">
                                            <select id="Select3" name="ctl00$body$default1$multitime" style="width: 100px;">
                                                <option selected="selected" value="0">Any Time</option>
                                                <option value="1">1:00 AM</option>
                                                <option value="2">2:00 AM</option>
                                                <option value="3">3:00 AM</option>
                                                <option value="4">4:00 AM</option>
                                                <option value="5">5:00 AM</option>
                                                <option value="6">6:00 AM</option>
                                                <option value="7">7:00 AM</option>
                                                <option value="8">8:00 AM</option>
                                                <option value="9">9:00 AM</option>
                                                <option value="10">10:00 AM</option>
                                                <option value="11">11:00 AM</option>
                                                <option value="12">Noon</option>
                                                <option value="13">1:00 PM</option>
                                                <option value="14">2:00 PM</option>
                                                <option value="15">3:00 PM</option>
                                                <option value="16">4:00 PM</option>
                                                <option value="17">5:00 PM</option>
                                                <option value="18">6:00 PM</option>
                                                <option value="19">7:00 PM</option>
                                                <option value="20">8:00 PM</option>
                                                <option value="21">9:00 PM</option>
                                                <option value="22">10:00 PM</option>
                                                <option value="23">11:00 PM</option>
                                                <option value="24">Midnight</option>
                                            </select>
                                            <iframe id="iframe3" style="display: none;"></iframe>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <div style="text-align:center;margin-top:20px;">
                            <img src="images/SU-MWD.jpg" style="float:none;display:inline;-moz-border-radius: 10px;border-radius: 10px;"/>
                            </div>
                            
                        </div>
                    </div>
                    <div class="clear">
                    </div>

                </div>
                
                <div id="dialog-form" title="Login">
                    <p class="validateTips">All form fields are required.</p>
                    <fieldset>
                        <label for="name">UserName</label>
                        <input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />                        
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all" />
                    </fieldset> 
                </div>
                <%--<div class="Panel1">
                    <div class="Panel1_Top">
                    </div>
                    <div class="Panel1_Mid">
                       
                    </div>
                    <div class="Panel1_Btm">
                    </div>
                </div>
                <div class="Panel1">
                    <div class="Panel1_Top">
                    </div>
                    <div class="Panel1_Mid">
                        
                    </div>
                    <div class="Panel1_Btm">
                    </div>
                </div>--%>
                <div class="clear">
                </div>
                <script type="text/javascript">
                    $("#dialog-form").dialog({
                        autoOpen: false,
                        height: 300,
                        width: 350,
                        modal: true,
                        buttons: { "Login": function () {
                            $(this).dialog("close");
                        }, Cancel: function () {
                            $(this).dialog("close");
                        }
                        }
                    });

                $("#login")                    
                    .click(function () {
                        $("#dialog-form").dialog("open");
                    });
                </script>
            </div>

</asp:Content>
