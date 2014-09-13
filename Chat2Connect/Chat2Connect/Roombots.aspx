<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/createMaster.master" AutoEventWireup="true" CodeBehind="Roombots.aspx.cs" Inherits="Chat2Connect.Roombots" %>

<%@ Register Src="~/usercontrols/bot/WelcomeBot.ascx" TagPrefix="uc1" TagName="WelcomeBot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-lg-7 pull-right">
        <div class="col-lg-3 pull-right">
            <h5>الغرفة :</h5>
        </div>
        <div class="col-lg-5 pull-right">
            <asp:DropDownList ID="uiDropDownListMyRooms" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="col-lg-4 pull-right">
            <asp:Button ID="btnEditBots" runat="server" CssClass="btn btn-warning" Text="عرض البوتات" OnClick="btnEditBots_Click" ValidationGroup="editBots" />
        </div>
    </div>
    <div class="clearfix"></div>
    <hr style="background: #ffd800; width: 100%; margin: 5px auto;" />
    <div class="clearfix"></div>
    <asp:Panel ID="pnlStep1" runat="server" Visible="false">
        <h3>البوتات المضافة على الغرفة</h3>
        <div class="row">
            <table class="table  table-condensed right">
                <thead>
                    <tr>
                        <th></th>
                        <th>البوت</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repExistingBots" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td></td>
                                <td>
                                    <%# Eval("Bot.Title") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <h3>إضافة بوت جديد</h3>
        <div class="row">
            <table class="table">
                <thead>
                    <tr>
                        <th></th>
                        <th>البوت</th>
                        <th>النقاط المطلوبة
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repAllBots" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hdnBotID" runat="server" Value='<%# Eval("ID") %>' />
                                    <asp:CheckBox ID="chkSelectBot" runat="server" onclick='<%# Eval("Points","calcPoints(this,{0})") %>' />
                                </td>
                                <td>
                                    <%# Eval("Title") %> 
                                </td>
                                <td>
                                    <asp:Label ID="lblPoints" runat="server" Text='<%# Eval("Points") %>'></asp:Label>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <div class="col-lg-12">
            <div class="pull-right col-lg-4"></div>
            <div class="pull-right col-lg-4">
                <label class="col-lg-3 pull-right">النقاط المطلوبة</label>
                <asp:TextBox ID="txtRequiredPoints" runat="server" Text="0" Enabled="false"></asp:TextBox>
            </div>
            <div class="pull-right col-lg-4">
                <label class="col-lg-3 pull-right">رصيد النقاط</label>
                <asp:TextBox ID="txtMemberPoints" runat="server" Enabled="false"></asp:TextBox>
            </div>
        </div>
        <asp:Button ID="btnNext" runat="server" CssClass="btn btn-warning" Text="التالى" OnClick="btnNext_Click" OnClientClick="return validatePoints();"/>
    </asp:Panel>
    <asp:Panel ID="pnlStep2" runat="server" Visible="false" Width="100%">
        <asp:GridView ID="grdUC" runat="server" ShowHeader="false" AutoGenerateColumns="false" OnRowDataBound="grdUC_RowDataBound" Width="100%">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <uc1:WelcomeBot ID="ucWelcome" runat="server" Visible="false" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn btn-warning" OnClick="btnCancel_Click" ValidationGroup="cancelValidationGroup" />
        <asp:Button ID="btnSaveBots" runat="server" Text="حفظ" CssClass="btn btn-warning" OnClick="btnSaveBots_Click" ValidationGroup='<%# this.pageValidationGroup %>' />
    </asp:Panel>
    <script>
        function calcPoints(chkBox,points) {
            var requestedPoint = $('#<%= txtRequiredPoints.ClientID%>').val();
            if ($(chkBox).prop('checked'))
            {
                $('#<%= txtRequiredPoints.ClientID%>').val(Number(requestedPoint) + points);
            }
            else
            {
                $('#<%= txtRequiredPoints.ClientID%>').val(Number(requestedPoint) - points);
            }
        }
        function validatePoints()
        {
            var myPoints = $('#<%= txtMemberPoints.ClientID%>').val();
            var requestedPoint = $('#<%= txtRequiredPoints.ClientID%>').val();
            if(Number(myPoints)<Number(requestedPoint))
            {
                alert('عفوا رصيد النقاط لا يكفى لإضافة البوتات المختارة');
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
