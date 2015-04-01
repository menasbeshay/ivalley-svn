<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="GeneralSettings.aspx.cs" Inherits="Flights_GUI.Admin.GeneralSettings" %>
<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $('.notify-row .btn-inverse').removeClass("active");
             $('#mi_top_Manage_Settings').addClass("active");
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span12 clearfix">
             <div class="span2">Flight no. prefix</div>
             <div class="span4">
                 <asp:TextBox ID="uiTextBoxFlightNoPrefix" runat="server"></asp:TextBox></div>
         </div>         
          <div class="span12 clearfix" style="margin-left:0">
             <div class="span2">Enable flight time limitation</div>
             <div class="span4">
                 <asp:CheckBox ID="uiCheckBoxFlightTimeLimitation" runat="server" />
             </div>
         </div>
         <div class="span12 clearfix" style="margin-left:0;margin-top:10px;">
             <div class="span2"></div>
             <div class="span2">
                 <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="btn btn-primary" OnClick="uiButtonSave_Click">Save</asp:LinkButton></div>
             <div class="span4">
                 </div>
             </div>
         
</asp:Content>
