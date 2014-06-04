<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getRooms2.aspx.cs" Inherits="Chat2Connect.getRooms2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="uiRepeaterRooms" runat="server" OnItemDataBound="uiRepeaterRooms_ItemDataBound">
            <HeaderTemplate>
                <div class="SScroll" data-height="500px">
                    <div class="headerRow col-lg-12">
                        <div class="col-lg-3 pull-right">إسم الغرفة</div>
                        <div class="pull-right center col-lg-2" style="padding: 0 5px;">المتواجدين الأن</div>
                        <div class="pull-right center col-lg-1" style="padding: 0 5px;">كاميرات</div>
                        <div class="pull-right center col-lg-2" style="padding: 0 5px;">تقييم</div>
                        <div class="col-lg-4 pull-right"></div>
                    </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="ContentRow col-lg-12">
                    <div class="col-lg-3 pull-right">
                        <a href="#" class="OpenRoom" data-related="<%# Eval("RoomID").ToString() %>" data-name='<%# Eval("Name") %>'><%# Eval("Name") %></a>
                    </div>
                    <div class="pull-right center col-lg-2" style="padding: 0 5px;">
                        <%# Eval("ExistingMembersCount") %>
                    </div>
                    <div class="pull-right center col-lg-1" style="padding: 0 5px;"><%# string.IsNullOrEmpty(Eval("OpenCams").ToString()) || Eval("OpenCams").ToString() == "0" ? "لا يوجد" : Eval("OpenCams").ToString() %></div>
                    <div class="pull-right center col-lg-2" style="padding: 0 5px;">
                        <%# GetRoomRate(Convert.ToInt32(Eval("RoomRate"))) %>
                    </div>
                    <div class="col-lg-4 pull-right">
                        <a href="#" class="OpenRoom" data-related="<%# Eval("RoomID").ToString() %>" data-hidden='true'>دخول مخفى</a>
                        <asp:Repeater ID="repLoginTypes" runat="server">
                            <ItemTemplate>
                                /<a href="#" class="OpenRoom" data-related="<%# Eval("RoomID").ToString() %>" data-level='<%# Eval("ID") %>'><%# Eval("Name") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <script type="text/javascript">
            $(document).ready(function () {
                $(".OpenRoom").click(function () {
                    r = $(this).attr("data-related");
                    n = $(this).attr("data-name");
                    addChatRoom(r, n, 'Room',false, $(this).attr("data-hidden"), $(this).attr("data-level"));
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
