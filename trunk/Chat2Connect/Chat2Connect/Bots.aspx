<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="Bots.aspx.cs" Inherits="Chat2Connect.Bots" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BHead" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#bots').addClass('active');
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="dvError" runat="server" visible="false">
        <div class="alert alert-danger" role="alert">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
    </div>
    <div class="form-horizontal blockBoxshadow">
        <div class="form-group">
            <div class="col-lg-2 control-label pull-right">
                رصيد نقاطى
            </div>
            <div class="col-lg-4 pull-right">
                <asp:Label ID="lblPointsBalance" runat="server"></asp:Label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-2 control-label pull-right">
                إختر الغرفة
            </div>
            <div class="col-lg-4 pull-right">
                <asp:DropDownList ID="lstRooms" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-2 control-label pull-right">
                مجموع المشتريات
            </div>
            <div class="col-lg-4 pull-right">
                <input runat="server" type="text" disabled="disabled" value="0" id="totalSelectedPoints" />
                <input type="hidden" id="selectedCount" runat="server" value="0" />
            </div>
            <div class="col-lg-2 pull-right">
                <asp:Button ID="btnSaveBots" runat="server" CssClass="btn btn-warning" Text="حفظ" OnClick="btnSaveBots_Click" disabled="disabled" />
            </div>
        </div>

        <div class="from-group">
            <table dir="rtl" class="table">
                <tr>
                    <th width="20%" class="text-right" colspan="2">إختر البوت المراد شرائه</th>
                    <th width="25%" class="text-right">البوت</th>
                    <th width="45%" class="text-right">تفاصيل</th>
                    <th width="10%" class="text-right">النقاط</th>
                </tr>
                <asp:Repeater ID="repBots" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <span width="40px" id='<%# Eval(BLL.Bot.ColumnNames.ID,"select_{0}") %>'>
                                    <asp:CheckBox ID="chkSelect" runat="server" onclick='<%# Eval(BLL.BotPoints.ColumnNames.Points,"calcPoints(this,{0})") %>' />
                                </span>
                                <span class="has-success" width="40px" id='<%# Eval(BLL.Bot.ColumnNames.ID,"take_{0}") %>'>
                                    <label class="control-label">تم الشراء</label>
                                </span>
                            </td>
                            <td>
                                <img width="35px" height="35px" src='<%# Eval(BLL.Bot.ColumnNames.IconPath,"{0}_1.png") %>' />
                                <asp:HiddenField ID="hdnBotID" runat="server" Value='<%# Eval(BLL.Bot.ColumnNames.ID) %>' />
                            </td>
                            <td><%# Eval(BLL.Bot.ColumnNames.Title) %></td>
                            <td><%# Eval(BLL.Bot.ColumnNames.Description) %></td>
                            <td>
                                <asp:Label ID="lblPoints" runat="server" Text='<%# Eval(BLL.BotPoints.ColumnNames.Points) %>'></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>

    </div>
    <script>
        var roomsBots =<%= Helper.JsonConverter.Serialize(this.RoomsBots)%>;
        function calcPoints(chkbox, value) {
            var total = Number($('#<%= totalSelectedPoints.ClientID%>').val());
            var selectedCount = Number($('#<%= selectedCount.ClientID%>').val());;
            if ($(chkbox).is(':checked')) {
                total = total + Number(value);
                selectedCount = selectedCount + 1;
            }
            else {
                selectedCount = selectedCount - 1;
                total = total - Number(value);
            }
            $('#<%= totalSelectedPoints.ClientID%>').val(total);
            $('#<%= selectedCount.ClientID%>').val(selectedCount);
            var balance = Number($('#<%= lblPointsBalance.ClientID%>').text());
            if (selectedCount == 0 || total > balance) {
                $('#<%= btnSaveBots.ClientID%>').attr('disabled', 'disabled');
            }
            else {
                $('#<%= btnSaveBots.ClientID%>').removeAttr('disabled');
            }
        }
        $().ready(function(){
            updateBots();
            $("#<%= lstRooms.ClientID%>").on("change",updateBots);
        });
        function updateBots(){
            var roomID=$("#<%= lstRooms.ClientID%>").val();
            $('#<%= totalSelectedPoints.ClientID%>').val("0");
            $('#<%= selectedCount.ClientID%>').val("0");
            $('#<%= btnSaveBots.ClientID%>').attr('disabled', 'disabled');
            $("[id^=select_]").attr('checked', false); 
            $("[id^=select_]").show();
            $("[id^=take_]").hide();
            $.each(roomsBots, function(index, element) {
                if(element.RoomID==roomID)
                {
                    $("#select_"+element.BotID).hide();
                    $("#take_"+element.BotID).show();
                }
            });
            $("#select_<%= (int)Helper.Enums.Bot.FreeRoom%>").hide();
            $("#take_<%= (int)Helper.Enums.Bot.FreeRoom%>").hide();
            $("#select_<%= (int)Helper.Enums.Bot.UpgradedRoom%>").hide();
            $("#take_<%= (int)Helper.Enums.Bot.UpgradedRoom%>").show().html("<a href='roomtypes.aspx'>ترقية</a>");
        }
    </script>
</asp:Content>
