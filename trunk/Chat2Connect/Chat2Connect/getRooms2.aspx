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
                    <div class="headerRow">
                        <div class="col-lg-4 pull-right">إسم الغرفة</div>
                        <div class="pull-right center" style="width: 21%; padding: 0 5px;">المتواجدين الأن</div>                        
                        <div class="pull-right center" style="width: 15%; padding: 0 5px;">كاميرات</div>
                        <div class="pull-right center" style="width: 15%; padding: 0 5px;">تقييم</div>
                    </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="ContentRow">
                    <div class="col-lg-4 pull-right"><a href="#" class="OpenRoom type_<%# Eval("RoomTypeID") %>" data-related="<%# Eval("RoomID").ToString() %>" data-name='<%# Eval("Name") %>'><%# Eval("Name") %></a></div>
                    <div class="pull-right center" style="width: 21%; padding: 0 5px;">
                        <asp:Label ID="uiLabelMemberCount" runat="server" ></asp:Label>
                    </div>                    
                    <div class="pull-right center" style="width: 15%; padding: 0 5px;"><%# string.IsNullOrEmpty(Eval("OpenCams").ToString()) || Eval("OpenCams").ToString() == "0" ? "لا يوجد" : Eval("OpenCams").ToString() %></div>
                    <div class="pull-right center" style="width: 15%; padding: 0 5px;">
                        <asp:Literal ID="uiLiteralRate" runat="server"></asp:Literal></div>
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
                    addChatRoom(r, n);
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
