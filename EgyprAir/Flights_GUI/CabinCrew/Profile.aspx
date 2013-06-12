<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CabinCrew.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Flights_GUI.CabinCrew.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi2").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="ContentLeftDiv">
            <h4>
                My Profile</h4>
            <div class="Details900">
                
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label15" runat="server" Text="Name" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelName" runat="server" Text="" CssClass="Label"></asp:Label></div>
                <div class="AdminRight" style="width: 40px">
                    
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label13" runat="server" Text="Username" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelUsername" runat="server" Text="" CssClass="Label"></asp:Label>
                   </div>
                <div class="AdminRight" style="width: 40px">
                   
                </div>
                <div class="clear" style="height: 5px">
                </div>                
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label1" runat="server" Text="Staff No." CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelStaffNo" runat="server" Text="" CssClass="Label"></asp:Label></div>
                <div class="AdminRight" style="width: 40px">
                   
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label2" runat="server" Text="License No." CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelLicenseNo" runat="server" Text="" CssClass="Label"></asp:Label></div>
                <div class="AdminRight" style="width: 40px">
                  
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label3" runat="server" Text="Competenecy Check" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelCompetencyCheck" runat="server" Text="" CssClass="Label"></asp:Label>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 24%; padding-right: 0px;">
                    <asp:Label ID="Label4" runat="server" Text="Medical License Expiry " CssClass="Label"></asp:Label></div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 88px; padding-right: 0px;">
                    &nbsp;</div>
                <div class="AdminMiddle">
                    <asp:Label ID="Label12" runat="server" Text="From : " CssClass="Label"></asp:Label>
                    &nbsp;<asp:Label ID="uiLabelFrom" runat="server" Text="" CssClass="Label"></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label5" runat="server" Text="To : " CssClass="Label"></asp:Label>
                    &nbsp;<asp:Label ID="uiLabelTo" runat="server" Text="" CssClass="Label"></asp:Label>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label6" runat="server" Text="Instructor Renewal" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelInstructorRenewal" runat="server" Text="" CssClass="Label"></asp:Label>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label7" runat="server" Text="Transition Course" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabeltransitionCourse" runat="server" Text="" CssClass="Label"></asp:Label>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label8" runat="server" Text="Recurrent 12" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelRecurrent12" runat="server" Text="" CssClass="Label"></asp:Label>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label10" runat="server" Text="Recurrent 24" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelRecurrent24" runat="server" Text="" CssClass="Label"></asp:Label>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label11" runat="server" Text="SMS" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelSMS" runat="server" Text="" CssClass="Label"></asp:Label>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label9" runat="server" Text="Security" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelSecurity" runat="server" Text="" CssClass="Label"></asp:Label>
                </div>
                <div class="clear" style="height: 5px">
                </div>
            </div>
        </div>
    
</asp:Content>
