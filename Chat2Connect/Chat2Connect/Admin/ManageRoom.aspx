<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="ManageRoom.aspx.cs" Inherits="Chat2Connect.Admin.ManageRoom" %>
<%@ Register Src="~/Admin/UserControls/Room/RoomStatus.ascx" TagPrefix="uc1" TagName="RoomStatus" %>
<%@ Register src="UserControls/Room/RoomInfo.ascx" tagname="RoomInfo" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
      <script src="../js/dreamcodes.js"></script>
    <link href="../css/tsc_pricingtables.css" rel="stylesheet" />
    <script src="../js/tsc_pricingtables.js"></script>
    <script src="../js/jquery.tokeninput.js"></script>
    <link href="../css/token-input-facebook.css" rel="stylesheet" />
     <script type="text/javascript">
         $(document).ready(function () {
             
                 $("#<%= txtRoomName.ClientID%>").tokenInput("../Services/Services.asmx/SearchRoomsForTypes", {
                      theme: "facebook",
                      preventDuplicates: true,
                      hintText: "",
                      noResultsText: "لا يوجد",
                      searchingText: "بحث فى الغرف...",
                      tokenLimit: 1,
                      onAdd: function (item) {
                          $('#<%= hdnRoomID.ClientID%>').val(item.id);
                },
            });
            
         });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="row">
        <div class="pull-right ">
            إدارة غرفة
        </div>
        <div class="col-lg-4 pull-right">
             <input type="hidden" id="hdnRoomID" runat="server" />
            <asp:TextBox ID="txtRoomName" runat="server" CssClass="form-control" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="يجب إدخال إسم الغرفة" Display="Dynamic" ForeColor="Red" Font-Bold="true" ControlToValidate="txtRoomName" ValidationGroup="roomvalidate"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="drpRooms" runat="server" AppendDataBoundItems="true" Visible="false">
                <asp:ListItem Value="" Text=""></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-lg-1 pull-right">
             <asp:LinkButton ID="lnkLoadRoom" runat="server" CssClass="btn btn-default" OnClick="lnkLoadRoom_Click" ValidationGroup="roomvalidate">
                 <i class="icon icon-search"></i>
             </asp:LinkButton>
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
</asp:Content>
