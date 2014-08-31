<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/createMaster.master" AutoEventWireup="true" CodeBehind="Roombots.aspx.cs" Inherits="Chat2Connect.Roombots" %>

<%@ Register Src="~/usercontrols/bot/WelcomeBot.ascx" TagPrefix="uc1" TagName="WelcomeBot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Panel ID="pnlStep1" runat="server">
        <h3>بوتات الغرفة</h3>
        <div class="row">
            <table>
                <thead>
                    <tr>
                        <th></th>
                        <th>البوت</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repExistingBots" runat="server">
                        <ItemTemplate>
                        </ItemTemplate>
                        <ItemTemplate>
                            <%# Eval("Bot.Title") %>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <h3>إضافة بوت جديد</h3>
        <div class="row">
            <table>
                <thead>
                    <tr>
                        <th></th>
                        <th>البوت</th>
                        <%--<th>النقاط المطلوبة
                        </th>--%>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repAllBots" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hdnBotID" runat="server" Value='<%# Eval("ID") %>' />
                                    <asp:CheckBox ID="chkSelectBot" CssClass="form-control" Text='<%# Eval("Title") %>' runat="server" />
                                </td>
                            </tr>
                        </ItemTemplate>

                        <%--<ItemTemplate>
                            <%# Eval("Points") %>
                        </ItemTemplate>--%>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <asp:Button ID="btnNext" runat="server" CssClass="btn btn-warning" Text="التالى" OnClick="btnNext_Click" />
    </asp:Panel>
    <asp:Panel ID="pnlStep2" runat="server" Visible="false">
        <asp:GridView ID="grdUC" runat="server" ShowHeader="false" AutoGenerateColumns="false" OnRowDataBound="grdUC_RowDataBound">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <uc1:WelcomeBot ID="ucWelcome" runat="server" Visible='<%# Helper.TypeConverter.ToInt32(Eval("BotID")) == (int)Helper.Enums.Bot.Welcome %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnSaveBots" runat="server" Text="حفظ" CssClass="btn btn-warning" OnClick="btnSaveBots_Click" />
    </asp:Panel>
</asp:Content>
