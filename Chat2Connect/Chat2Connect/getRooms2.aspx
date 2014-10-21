<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getRooms2.aspx.cs" Inherits="Chat2Connect.getRooms2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="uiRepeaterRooms" runat="server">
            <HeaderTemplate>
               
                    <div class="headerRow">
                        <div class="col-lg-4 pull-right">إسم الغرفة</div>
                        <div class="pull-right center" style="width: 21%; padding: 0 5px;">المتواجدين الأن</div>
                        <div class="pull-right center" style="width: 15%; padding: 0 5px;">كاميرات</div>
                        <div class="pull-right center" style="width: 15%; padding: 0 5px;">تقييم</div>
                    </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="ContentRow">
                    <div class="col-lg-4 pull-right"><a href="#" class="OpenRoom" data-related="<%# Eval("RoomID").ToString() %>" data-name='<%# Eval("Name") %>' style="color:<%# Eval("Color") %>"><%# Eval("Name") %></a></div>
                    <div class="pull-right center" style="width: 21%; padding: 0 5px;">
                        <%# Eval("ExistingMembersCount") %>
                    </div>
                    <div class="pull-right center" style="width: 15%; padding: 0 5px;"><%# string.IsNullOrEmpty(Eval("OpenCams").ToString()) ? "0" : Eval("OpenCams").ToString() %></div>
                    <div class="pull-right center" style="width: 15%; padding: 0 5px;">
                        <%# !string.IsNullOrEmpty(Eval("RoomRate").ToString()) ? GetRoomRate(Convert.ToInt32(Eval("RoomRate"))) : "<i class='icon icon-star-empty GoldRate'></i><i class='icon icon-star-empty GoldRate'></i><i class='icon icon-star-empty GoldRate'></i><i class='icon icon-star-empty GoldRate'></i><i class='icon icon-star-empty GoldRate'></i>" %>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
               
            </FooterTemplate>
        </asp:Repeater>

        <script type="text/javascript">
            $(document).ready(function () {
                $(".OpenRoom").click(function () {
                    r = $(this).attr("data-related");
                    n = $(this).attr("data-name");
                    addChatRoom(r, n, 'Room');
                    $("#pGeneral").css("display", "block");
                    //setTimeout(function () {
                    //$("#room_" + r).load("LoadRoom.aspx",
                    //    { data_related: "" + r + "" },
                    //    function (content) {
                    //        $(this).hide().fadeIn("slow");
                    //        $(this).removeAttr('style');

                    //        return false;
                    //    });
                    //}, 2000);

                    $("#pGeneral").css("display", "none");
                    
                });
            });
        </script>
    </form>
</body>
</html>
