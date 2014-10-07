<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="ITravel.Customer" %>
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
            <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiLinkButtonSearch" CssClass="grid_9 left">
                <div class="field">
                    <asp:TextBox ID="uiTextBoxSearch" runat="server" data-icon="search"></asp:TextBox>
                    <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiLinkButtonSearch_Click" style="display:none;">search</asp:LinkButton>
                </div>

            </asp:Panel>
            <div class="grid_2 right">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="bt blue" OnClick="uiLinkButtonAdd_Click">
                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:AddNew %>"></asp:Label></asp:LinkButton>
            </div>
            <div class="clear"></div>
            <div class="grid_11 table">
                <asp:GridView ID="uiGridViewCustomers" runat="server" AllowPaging="True" OnPageIndexChanging="uiGridViewCustomers_PageIndexChanging" OnRowCommand="uiGridViewCustomers_RowCommand" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="FirstName" HeaderText="<%$ Resources:FirstName %>" />
                        <asp:BoundField DataField="LastName" HeaderText="<%$ Resources:LastName %>" />
                        <asp:BoundField DataField="Email" HeaderText="<%$ Resources:Mail %>" />
                        <asp:TemplateField HeaderText="<%$ Resources:Actions %>">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="EditR" CommandArgument='<%# Eval("PassengerID") %>'>
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Edit %>"></asp:Label>
                                </asp:LinkButton>
                                &nbsp;|&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="DeleteR" CommandArgument='<%# Eval("PassengerID") %>'>
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
            <div class="field small">
                
                <label for="uiDropDownListTitle">
                    <asp:Label ID="uiLabelCustomerTitle" runat="server" Text="<%$ Resources:Title %>"></asp:Label>
                </label>
                <asp:DropDownList ID="uiDropDownListTitle" runat="server" ClientIDMode="Static"></asp:DropDownList>
            </div>

            <div class="grid_6 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiTextBoxFN">
                    <asp:Label ID="uiLabelFN" runat="server" Text="<%$ Resources:FirstName %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxFN" runat="server" ClientIDMode="Static" ></asp:TextBox>
            </div>
                
            </div>
            <div class="grid_5">
                <div class="field fullwidth">
                
                <label for="uiTextBoxLN">
                    <asp:Label ID="uiLabelLN" runat="server" Text="<%$ Resources:LastName %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxLN" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
                
            </div>
           
             <div class="grid_6 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiTextBoxMobile">
                    <asp:Label ID="uiLabelMobile" runat="server" Text="<%$ Resources:Mobile %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxMobile" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
                 </div>
             <div class="grid_5">

            
                <div class="field fullwidth">
                
                <label for="uiTextBoxMail">
                    <asp:Label ID="uiLabelMail" runat="server" Text="<%$ Resources:Mail %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxMail" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div></div>
            <div class="clear" ></div>
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
