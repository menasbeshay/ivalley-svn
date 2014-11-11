<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cleandb.aspx.cs" Inherits="Chat2Connect.Admin.Cleandb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2> Rooms</h2>
        <asp:GridView ID="uiGridViewRoom" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="uiGridViewRoom_PageIndexChanging" PageSize="20" OnRowCommand="uiGridViewRoom_RowCommand">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Room Name" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="DeleteBots" CommandArgument='<%# Eval("RoomID") %>'>Delete Bots</asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DeleteMessages" CommandArgument='<%# Eval("RoomID") %>'>Delete Msgs</asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="DeleteMembers" CommandArgument='<%# Eval("RoomID") %>'>Delete members</asp:LinkButton> | 
                        <asp:LinkButton ID="LinkButton5" runat="server" CommandName="DeleteBannedmembers" CommandArgument='<%# Eval("RoomID") %>'>Delete Banned</asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="DeleteTypes" CommandArgument='<%# Eval("RoomID") %>'>Delete Types</asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DeleteRoom" CommandArgument='<%# Eval("RoomID") %>'>Delete Room</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div style="clear:both;height:30px;"></div>

        <h2> Members</h2>
        <asp:GridView ID="uiGridViewMembers" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="uiGridViewMembers_PageIndexChanging" PageSize="20" OnRowCommand="uiGridViewMembers_RowCommand">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Member Name" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="DeleteFriends" CommandArgument='<%# Eval("MemberID") %>'>Delete Friends</asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DeleteGifts" CommandArgument='<%# Eval("MemberID") %>'>Delete Gifts</asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="DeleteLog" CommandArgument='<%# Eval("MemberID") %>'>Delete Log</asp:LinkButton> | 
                        <asp:LinkButton ID="LinkButton5" runat="server" CommandName="DeleteMessages" CommandArgument='<%# Eval("MemberID") %>'>Delete Msgs</asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="DeletePics" CommandArgument='<%# Eval("MemberID") %>'>Delete Pics</asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DeleteSettings" CommandArgument='<%# Eval("MemberID") %>'>Delete Settings</asp:LinkButton>| 
                        <asp:LinkButton ID="LinkButton7" runat="server" CommandName="DeleteMsgFolder" CommandArgument='<%# Eval("MemberID") %>'>Delete MsgFolder</asp:LinkButton>| 
                        <asp:LinkButton ID="LinkButton8" runat="server" CommandName="DeleteProfileLike" CommandArgument='<%# Eval("MemberID") %>'>Delete Likes</asp:LinkButton>| 
                        <asp:LinkButton ID="LinkButton9" runat="server" CommandName="DeleteTypes" CommandArgument='<%# Eval("MemberID") %>'>Delete Types</asp:LinkButton>| 
                        <asp:LinkButton ID="LinkButton10" runat="server" CommandName="DeleteMember" CommandArgument='<%# Eval("MemberID") %>'>Delete Member</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        
    </div>
    </form>
</body>
</html>
