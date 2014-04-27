<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="ManageRoom.aspx.cs" Inherits="Chat2Connect.Admin.ManageRoom" %>

<%@ Register Src="~/Admin/UserControls/Room/RoomStatus.ascx" TagPrefix="uc1" TagName="RoomStatus" %>
<%@ Register Src="~/Admin/UserControls/Room/RoomType.ascx" TagPrefix="uc1" TagName="RoomType" %>

 
  
<%@ Register src="UserControls/Room/RoomInfo.ascx" tagname="RoomInfo" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
      <script src="../js/dreamcodes.js"></script>
    <link href="../css/tsc_pricingtables.css" rel="stylesheet" />
    <script src="../js/tsc_pricingtables.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="row">
        <div class="pull-right ">
            إدارة غرفة
        </div>
        <div class="form-group">
            <asp:DropDownList ID="drpRooms" runat="server" AppendDataBoundItems="true">
                <asp:ListItem Value="" Text=""></asp:ListItem>
            </asp:DropDownList>
            <asp:LinkButton ID="lnkLoadRoom" runat="server" CssClass="icon icon-search" OnClick="lnkLoadRoom_Click"></asp:LinkButton>
        </div>
    </div>
    <div class="row">            
            <uc2:RoomInfo ID="ctrlRoomInfo" runat="server" />
    </div>
    <div class="row">
        <%if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_RoomStatus.ToString()))
          {%>
        <div class="col-xs-12">
            <uc1:RoomStatus runat="server" ID="ctrlRoomStatus" Visible="false" />
        </div>
        <%} %>
       
    </div>
    <div class="clear" style="height:10px;"></div>
    <div class="row">
         <%if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_RoomType.ToString()))
          {%>
        <div class="col-xs-12">
            <uc1:RoomType runat="server" ID="ctrlRoomType" Visible="false" />
        </div>
        <%} %>

    </div>
</asp:Content>
