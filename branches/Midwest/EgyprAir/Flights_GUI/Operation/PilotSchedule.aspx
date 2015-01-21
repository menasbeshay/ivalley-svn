<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true" CodeBehind="PilotSchedule.aspx.cs" Inherits="Flights_GUI.Operation.PilotSchedule" %>
    <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType  VirtualPath="~/MasterPages/E_Admin.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
.hidebr br
{
display:none; 
}  
    </style>

<script type="text/javascript">
   /* $(document).ready(function () {
        $('.Schedule br').replaceWith("<div style='clear:both;'></div>");
    });

    $(function () {
        $("#mi35").addClass("selected");
    });
    */
</script>

<script type="text/javascript">
    function printme() {
        var popup =
          window.open('', '',
                'scrollbars=no,menubar=no,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
        popup.document.write("<style type='text/css'>body {font-family:Tahoma, Geneva, sans-serif; font-size:12px; color:#5c5c5c;line-height:18px;}</style><link href='../Styles/style.css' rel='stylesheet' type='text/css'><script type='text/javascript'>function hideme() { document.getElementById('uiButtonPrint').style.display = 'none'; window.print();document.getElementById('uiButtonPrint').style.display = 'block'; }" + "</" + "script>" + "<div class='clear10'></div><input type='button' value='Print' onclick='hideme()' id='uiButtonPrint' /><div class='clear10'></div>" + document.getElementById("PrintArea").innerHTML);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
        
        <div class="Details900" >
        <div class="span12 clearfix" >
            <div class="span2">
                <asp:Label ID="Label31" runat="server" Text="Select Pilot" CssClass="Label"></asp:Label>
            </div>
            <div class="span4">
                                <asp:DropDownList ID="uiDropDownListPilots" runat="server" Width="150px">
                                </asp:DropDownList>&nbsp;
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ErrorMessage="Please select a pilot" ControlToValidate="uiDropDownListPilots" 
                                    Display="Dynamic" ForeColor="Red" Operator="NotEqual" 
                                    ValidationGroup="Schedule" ValueToCompare="0"></asp:CompareValidator>
                </div>
            <div class="span5"></div>
                            </div>
            <div class="span12 clearfix" style="margin-left:0px;">
                <div class="span2"><asp:Label ID="Label2" runat="server" Text="From :" CssClass="Label"></asp:Label></div>
                <div class="span2"><asp:TextBox ID="uiTextBoxFrom" runat="server" Width="150px"></asp:TextBox>
                                <asp:CalendarExtender ID="uiTextBoxFrom_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="uiTextBoxFrom" Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="uiTextBoxFrom" Display="Dynamic" ErrorMessage="*" 
                                    ForeColor="Red" ValidationGroup="Schedule"></asp:RequiredFieldValidator></div>
                <div class="span1"><asp:Label ID="Label3" runat="server" Text="To :" CssClass="Label"></asp:Label></div>
                <div class="span2"><asp:TextBox ID="uiTextBoxTo" runat="server" Width="150px"></asp:TextBox>
                                <asp:CalendarExtender ID="uiTextBoxTo_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="uiTextBoxTo"  Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="uiTextBoxTo" Display="Dynamic" ErrorMessage="*" 
                                    ForeColor="Red" ValidationGroup="Schedule"></asp:RequiredFieldValidator></div>
                <div class="span3"><asp:LinkButton ID="uiLinkButtonView" runat="server" Text="View Status" CssClass="btn btn-primary pull-right"
                        onclick="uiLinkButtonView_Click" ValidationGroup="Schedule"></asp:LinkButton></div>
            </div>
     
            
            <div class="AdminMiddle" style="width: 100%;display:none;" id="PrintArea">

            
            <div runat="server" style="float:left;padding:3px;border:1px solid black" id="Header">
            <div style="height:35px;margin-bottom:5px;font-weight:bold;border-bottom:1px solid black;margin:-3px;padding-top:2px; padding-bottom:2px;padding-left:3px;">Name</div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:4px;padding-left:4px;padding-right:4px;height:70px;">
                <asp:Label ID="uiLabelShortName" runat="server" Font-Bold="true"></asp:Label>
            
            <div class="clear"></div>
            
                <asp:Label ID="uiLabelFullName" runat="server" Font-Bold="true"></asp:Label>
                </div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;">
                Company
                </div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;">
                CAA
                </div>
            <div class="clear"></div>
            <div style="margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;">
                Duty Hours
                </div>
            </div>
            
    <asp:DataList ID="uiDataListSchedule" runat="server" RepeatLayout="Flow" 
                    CssClass="Schedule" RepeatDirection="Vertical" 
                    onitemdatabound="uiDataListSchedule_ItemDataBound" style="float:left">    
    <ItemTemplate>
    <div style="float:left;padding:3px;border:1px solid black;border-left:0px;">
    <div style="height:35px;font-weight:bold;text-align:center;margin-bottom:5px;border-bottom:1px solid black;margin:-3px;padding-top:2px; padding-bottom:2px;padding-left:3px;padding-right:3px;">
     <%# displayday(Eval("SectorDate").ToString())%>     
     </div>
     <div class="clear"></div>
     <div style="height:70px;margin-left:-3px;margin-right:-3px;padding-left:3px;padding-right:3px;" runat="server" id="Detail">
     <div style="text-align:center;margin-top:3px;">
    <%# Eval("From_TO") %>
    </div>
     <div class="clear"></div>
     <div style="width:90px;">
     <div style="float:left;"><%# String.Format("{0:HH:mm}",Eval("STD")) %> </div>
     <div style="float:right;"><%# String.Format("{0:HH:mm}",Eval("STA")) %></div>
     </div>
     </div>
     <div class="clear"></div>
     <div style="border-bottom:1px solid black;border-top:1px solid black;margin-left:-3px;margin-right:-3px;padding-bottom:4px;padding-left:4px;text-align:center;">
        <asp:Label ID="uiLabelCompany" runat="server" Text="&nbsp;"></asp:Label>
        </div>
         <div class="clear"></div>
         <div style="border-bottom:1px solid black;margin-left:-3px;margin-right:-3px;padding-bottom:3px;padding-left:4px;text-align:center;">
        <asp:Label ID="uiLabelCAA" runat="server" Text="&nbsp;" ></asp:Label>
        </div>
         <div class="clear"></div>
         <div style="padding-left:4px;text-align:center;">
        <asp:Label ID="uiLabelDutyHours" runat="server" Text="&nbsp;"></asp:Label>
        </div>
     </div>
    </ItemTemplate>
    
    </asp:DataList>
     

     <div runat="server" style="float:left;padding:3px;border:1px solid black;border-left:0px;width:6%" id="totals">
            <div style="height:35px;margin-bottom:5px;font-weight:bold;border-bottom:1px solid black;margin:-3px;padding-top:2px; padding-bottom:2px;padding-left:3px;text-align:center;">Total</div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:4px;padding-left:4px;padding-right:4px;height:70px;">
               
            
            <div class="clear"></div>
            
                
                </div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;margin-left:-1px;text-align:center;" runat="server" id="DIVcompanyTotal">
                <asp:Label ID="uiLabelCompanyTotal" runat="server" ></asp:Label>
                </div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;margin-left:-1px;text-align:center;" runat="server" id="DIVCAATotal">
                <asp:Label ID="uiLabelCAATotal" runat="server" ></asp:Label>
                </div>
            <div class="clear"></div>
            <div style="margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;margin-left:-1px;text-align:center;" runat="server" id="DIVDutyTotal">
               <asp:Label ID="uiLabelDutyTotal" runat="server" ></asp:Label>
                </div>
            </div>


            <div runat="server" style="float:left;padding:3px;border:1px solid black;border-left:0px;width:6%" id="CurrentMonthTotal">
            <div style="height:35px;margin-bottom:5px;font-weight:bold;border-bottom:1px solid black;margin:-3px;padding-top:2px; padding-bottom:2px;padding-left:3px;text-align:center;">Current Month Total</div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:4px;padding-left:4px;padding-right:4px;height:70px;">
               
            
            <div class="clear"></div>
            
                
                </div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;margin-left:-1px;text-align:center;" runat="server" id="DIV2">
                <asp:Label ID="uiLabelCurrentMCompantTotal" runat="server" ></asp:Label>
                </div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;margin-left:-1px;text-align:center;" runat="server" id="DIV3">
                <asp:Label ID="uiLabelCurrentMCAATotal" runat="server" ></asp:Label>
                </div>
            <div class="clear"></div>
            <div style="margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;margin-left:-1px;text-align:center;" runat="server" id="DIV4">
               <asp:Label ID="uiLabelCurrentMDutyTotal" runat="server" ></asp:Label>
                </div>
            </div>

            <div runat="server" 
                    style="float:left;padding:3px;border:1px solid black;border-left:0px;width:6%" 
                    id="AverageTotals">
            <div style="height:35px;margin-bottom:5px;font-weight:bold;border-bottom:1px solid black;margin:-3px;padding-top:2px; padding-bottom:2px;padding-left:3px;text-align:center;">Average Total</div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:4px;padding-left:4px;padding-right:4px;height:70px;">
               
            
            <div class="clear"></div>
            
                
                </div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;margin-left:-1px;text-align:center;" runat="server" id="DIV6">
                <asp:Label ID="uiLabelAverageCompany" runat="server" ></asp:Label>
                </div>
            <div class="clear"></div>
            <div style="border-bottom:1px solid black;margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;margin-left:-1px;text-align:center;" runat="server" id="DIV7">
                <asp:Label ID="uiLabelAverageCAA" runat="server" ></asp:Label>
                </div>
            <div class="clear"></div>
            <div style="margin:-3px;margin-top:3px;padding-bottom:3px;padding-left:4px;margin-left:-1px;text-align:center;" runat="server" id="DIV8">
               <asp:Label ID="uiLabelAverageDuty" runat="server" ></asp:Label>
                </div>
            </div>

                <div class="clear10">
            </div>

            <div runat="server" id="grandTotal">
    <div class="AdminLeft" style="width:200px" >
    
    </div>
    <div class="AdminMiddle" style="width:400px;">
    <div style="border:1px solid black;padding-bottom:3px;padding-left:4px;width:290px;height:20px" >
                <asp:Label ID="uiLabelGrandTotal" runat="server" ></asp:Label>
                </div>
            
            <div style="border:1px solid black;border-top:0px;padding-bottom:3px;padding-left:4px;width:290px;height:20px" >
               <asp:Label ID="uiLabelLastTotal" runat="server" ></asp:Label>
                </div>                 
            <div class="clear"></div>
        
    </div>

    <div class="AdminRight" style="width:150px;"></div>
     <div class="clear10">
            </div>
    </div>

    <div class="clear10">
            </div>

            <div runat="server" id="guide">
                <div style="border:1px solid black;background-color:Green;float:left;width:70px;color:White;text-align:center;">
                    SU-MWE</div>
                <div style="border:1px solid black;background-color:Yellow;float:left;width:70px;color:Black;text-align:center;">
                    SU-MWF</div>
            </div>
            <div class="clear10">
            </div>

    </div>

            <div class="span12 clearfix">
                <telerik:RadGrid ID="uiRadGridTrx" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" Skin="Office2007" Width="90%"                         
                        onpageindexchanged="uiRadGridTrx_PageIndexChanged" >
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="day" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>   
                        <telerik:GridBoundColumn DataField="StatusDay" HeaderText="Day" ></telerik:GridBoundColumn>                                                                                                    
                        <telerik:GridTemplateColumn HeaderText="Status">
                            <ItemTemplate>
                                <%# string.IsNullOrEmpty(Eval("PilotID").ToString()) ? "Day Off" :  Eval("StatusType").ToString() %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                                                                                                                               
                            <telerik:GridBoundColumn DataField="FlightNo" HeaderText="Flight No." ></telerik:GridBoundColumn>   
                            <telerik:GridBoundColumn DataField="Route" HeaderText="Route" ></telerik:GridBoundColumn>   
                        <telerik:GridBoundColumn DataField="STD" HeaderText="STD" DataFormatString="{0:HH:mm}"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="STA" HeaderText="STA" DataFormatString="{0:HH:mm}"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="City" HeaderText="Night city" ></telerik:GridBoundColumn>                                                                                                                        
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:RadGrid>
            </div>

            <input id="Button1" type="button" value="Print preview" onclick="printme()" style="display:none;" />
             <div class="clear10">
            </div>

          
    </div>
    </div>

    
</asp:Content>
