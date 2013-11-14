<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Taqwa.Website.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                OnRowDataBound="GridView1_RowDataBound">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Panel ID="pnl" runat="server">
                    <%# Container.DataItemIndex + 1 %>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<br />
<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
</asp:Content>
