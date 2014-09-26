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
            <div class="col-lg-6 pull-right">
                <asp:Label ID="lblPointsBalance" runat="server"></asp:Label>
            </div>
        </div>
        <div class="from-group">
            <table dir="rtl" class="table table-bordered">
                <tr>
                    <th></th>
                    <th>البوت</th>
                    <th>تفاصيل</th>
                    <th>النقاط</th>
                </tr>
                <asp:Repeater ID="repBots" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <label>
                                    <asp:CheckBox ID="chkSelect" runat="server" onclick='<%# Eval(BLL.BotPoints.ColumnNames.Points,"calcPoints(this,{0})") %>' />
                                    <img width="35px" height="35px" src='<%# Eval(BLL.Bot.ColumnNames.IconPath,"{0}_1.png") %>' />
                                </label>
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
        <div class="form-group">
            <div class="col-lg-2 pull-right">
                <input runat="server" type="text" disabled="disabled" id="totalSelectedPoints" />
                <input type="hidden" id="selectedCount" runat="server" value="0" />
            </div>
            <div class="col-lg-4 pull-right">
                <asp:DropDownList ID="lstRooms" runat="server"></asp:DropDownList>
            </div>
            <div class="col-lg-2 pull-right">
                <asp:Button ID="btnSaveBots" runat="server" CssClass="btn btn-warning" Text="حفظ" OnClick="btnSaveBots_Click" disabled="disabled" />

            </div>
        </div>
    </div>
    <script>
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
            var balance = Number($('#<%= lblPointsBalance.ClientID%>').text());
            if (selectedCount == 0 || total > balance) {
                $('#<%= btnSaveBots.ClientID%>').attr('disabled', 'disabled');
            }
            else {
                $('#<%= btnSaveBots.ClientID%>').removeAttr('disabled');
            }
        }
    </script>
</asp:Content>
