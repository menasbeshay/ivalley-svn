<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="creditcards.aspx.cs" Inherits="ITravel.creditcards" %>
<%@ MasterType VirtualPath="~/MasterPages/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel ID="uiPanelAll" runat="server">
        <div class="box grid_12">
        <header>
            <div class="inner">
                <div class="left title">
                    <h1>
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:PageTitle %>"></asp:Label></h1>

                </div>
                <div class="right">
                    <a href="#" class="close">
                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Close %>"></asp:Label></a>
                </div>
            </div>
        </header>

        <div class="box-content">
            
            <div class="grid_2 right">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="bt blue" OnClick="uiLinkButtonAdd_Click">
                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:AddNew %>"></asp:Label></asp:LinkButton>
            </div>
            <div class="clear"></div>
            <div class="grid_11 table">
                <asp:GridView ID="uiGridViewCards" runat="server" AllowPaging="True" OnPageIndexChanging="uiGridViewCards_PageIndexChanging" OnRowCommand="uiGridViewCards_RowCommand" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="CardNumber" HeaderText="<%$ Resources:CardNumber %>" />
                        <asp:BoundField DataField="Name" HeaderText="<%$ Resources:Name %>" />
                        <asp:TemplateField HeaderText="<%$ Resources:Actions %>">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="EditR" CommandArgument='<%# Eval("CreditCardID") %>'>
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Edit %>"></asp:Label>
                                </asp:LinkButton>
                                &nbsp;|&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="DeleteR" CommandArgument='<%# Eval("CreditCardID") %>'>
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Delete %>"></asp:Label>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
                <div class="clear"></div>
        </div>
            </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelEdit" runat="server">
        <div class="box grid_12">
        <header>
            <div class="inner">
                <div class="left title">
                    <h1>
                        <asp:Label ID="uiLabelTitle" runat="server" Text="<%$ Resources:PageTitle %>"></asp:Label></h1>

                </div>
                <div class="right">
                    <a href="#" class="close">
                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Close %>"></asp:Label></a>
                </div>
            </div>
        </header>

        <div class="box-content ">

            <div class="grid_4 left" style="margin-right:0px;">
            <div class="field fullwidth">
                
                <label for="uiTextBoxName">
                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:Name %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxName" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
                </div>
            <div class="clear"></div>
             <div class="grid_4 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiTextBoxCardNumber">
                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:CardNumber %>"></asp:Label>
                </label>
                     <asp:TextBox ID="uiTextBoxCardNumber" runat="server" ClientIDMode="Static" ></asp:TextBox>
            </div>
                
            </div>
            <div class="clear"></div>

            <div class="grid_3 left" style="margin-right:0px;">
            <div class="field fullwidth">
                
                <label for="uiTextBoxExpiry">
                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:ExpiryDate %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxExpiry" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
                </div>

            <div class="clear"></div>
            <div class="grid_3 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiTextBoxCCV">
                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:CCV %>"></asp:Label>
                </label>
                     <asp:TextBox ID="uiTextBoxCCV" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
                
            </div>
            <div class="clear"></div>
            
           
             <div class="grid_3 left">
            <div class="field fullwidth">
                <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="bt green large" OnClick="uiLinkButtonSave_Click">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Save %>"></asp:Label>
                </asp:LinkButton>
            </div>
                </div>
            <div class="grid_3 left">
            <div class="field fullwidth">
                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="bt grey large" OnClick="uiLinkButtonCancel_Click">
                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Cancel %>"></asp:Label>
                </asp:LinkButton>
            </div>
                </div>
            <div class="clear" ></div>
            
            
        </div>
    </div>
       
    </asp:Panel>
</asp:Content>
