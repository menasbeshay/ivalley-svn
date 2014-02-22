<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MessageMaster.master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="Chat2Connect.Messages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Panel ID="uiPanelMsgList" runat="server">
        <asp:GridView ID="uiGridViewMessages" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" OnPageIndexChanging="uiGridViewMessages_PageIndexChanging" OnRowDataBound="uiGridViewMessages_RowDataBound" HeaderStyle-CssClass="MsgHeader">
            <Columns>
                <asp:TemplateField HeaderText="الراسل" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="uiLabelSenderName"></asp:Label>                        
                    </ItemTemplate>                    
                </asp:TemplateField>
                <asp:BoundField HeaderText="العنوان" DataField="MessageSubject" ItemStyle-HorizontalAlign="Right"/>
                <asp:TemplateField HeaderText="التاريخ والوقت" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <span style="direction:rtl">                        
                            <asp:Label ID="uiLabelDate" runat="server" ></asp:Label>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>                
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:Panel ID="uiPanelCreateFolder" runat="server">

    </asp:Panel>

    <asp:Panel ID="uiPanelCreateMsg" runat="server">

    </asp:Panel>
</asp:Content>
