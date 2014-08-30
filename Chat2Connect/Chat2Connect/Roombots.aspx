<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/createMaster.master" AutoEventWireup="true" CodeBehind="Roombots.aspx.cs" Inherits="Chat2Connect.Roombots" %>

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
                            <%# Eval("Title") %>
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
                        <th>النقاط المطلوبة
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repAllBots" runat="server">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelectBot" runat="server" />
                        </ItemTemplate>
                        <ItemTemplate>
                            <%# Eval("Title") %>
                        </ItemTemplate>
                        <ItemTemplate>
                            <%# Eval("Points") %>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <asp:Button ID="btnNext" runat="server" CssClass="btn btn-warning" Text="التالى" />
    </asp:Panel>
    <asp:Panel ID="pnlStep2" runat="server" Visible="false">
        <asp:PlaceHolder ID="plcControls" runat="server">

        </asp:PlaceHolder>
        <asp:Button ID="btnSaveBots" runat="server" Text="حفظ" CssClass="btn btn-warning" />
    </asp:Panel>
</asp:Content>
