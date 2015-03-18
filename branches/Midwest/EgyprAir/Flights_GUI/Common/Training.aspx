<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="Training.aspx.cs" Inherits="Flights_GUI.Common.Training" %>
<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $('.notify-row .btn-inverse').removeClass("active");
             $('#mi_top_training').addClass("active");
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span12 clearfix">
        <div class="span4">
            <img src="../img/flight-procedures-1.jpg" />
        </div>
        <div class="span8">
            Give a man a fish and you feed him for a day.
Teach a man to fish and you feed him for a lifetime.<br />
            <small>
Chinese Proverb</small>
        </div>
       
        
    </div>
</asp:Content>
