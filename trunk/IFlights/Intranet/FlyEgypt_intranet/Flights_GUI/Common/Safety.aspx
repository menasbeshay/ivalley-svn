<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="Safety.aspx.cs" Inherits="Flights_GUI.Common.Safety" %>
<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $('.notify-row .btn-inverse').removeClass("active");
             $('#mi_top_safety').addClass("active");
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span12 clearfix">
        <div class="span4">
            <img src="../img/safety.jpg" />
        </div>
        <div class="span8">
             Safely learn from others mistakes ;
Don’t have others learn from you.<br />
As Flying is :<br />
so many parts skill,<br />
so many parts planning,<br />
so many parts knowledge,<br />
so many parts maintenance,<br />
and so many parts luck.<br />
The trick is to reduce the luck by increasing the others.
<br />
            <small>
Safety Department</small>
        </div>
       
    </div>
</asp:Content>
