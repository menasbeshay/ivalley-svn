<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="BookTicket.aspx.cs" Inherits="ITravel.BookTicket" %>
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
                    <asp:TextBox ID="uiTextBoxSearch" runat="server" data-icon="search" ></asp:TextBox>
                    <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiLinkButtonSearch_Click" style="display:none;">search</asp:LinkButton>
                </div>

            </asp:Panel>
            <div class="grid_2 right">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="bt blue" OnClick="uiLinkButtonAdd_Click">
                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:AddNew %>"></asp:Label></asp:LinkButton>
            </div>
            <div class="clear"></div>
            <div class="grid_11 table">
                <asp:GridView ID="uiGridViewTickets" runat="server" AllowPaging="True" OnPageIndexChanging="uiGridViewTickets_PageIndexChanging" OnRowCommand="uiGridViewTickets_RowCommand" AutoGenerateColumns="false" OnRowDataBound="uiGridViewTickets_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="TicketNo" HeaderText="<%$ Resources:TicketNo %>" />
                        <asp:BoundField DataField="FromDate" HeaderText="<%$ Resources:Date %>" DataFormatString="{0:hh:mm tt dd/MM/yyyy}"/>
                       <asp:TemplateField HeaderText="<%$ Resources:From %>">
                           <ItemTemplate>
                               <asp:Label ID="uiLabelFrom" runat="server" ></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="<%$ Resources:To %>">
                           <ItemTemplate>
                               <asp:Label ID="uiLabelTo" runat="server" ></asp:Label>
                           </ItemTemplate>  
                       </asp:TemplateField>
                        <asp:CheckBoxField DataField="IsCanceled" HeaderText="<%$ Resources:Canceled %>" ReadOnly="true"/>
                        <asp:CheckBoxField DataField="IsConfirmed" HeaderText="<%$ Resources:Confirmed %>" ReadOnly="true"/>
                        <asp:TemplateField HeaderText="<%$ Resources:Actions %>">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="EditR" CommandArgument='<%# Eval("TicketID") %>'>
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Edit %>"></asp:Label>
                                </asp:LinkButton>
                                &nbsp;|&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="DeleteR" CommandArgument='<%# Eval("TicketID") %>'>
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
            <div class="grid_3 left" style="margin-right:0px;">
            <div class="field fullwidth">
                
                <label for="uiDropDownListCustomer">
                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Customer %>"></asp:Label>
                </label>
                <asp:DropDownList ID="uiDropDownListCustomer" runat="server" ClientIDMode="Static"></asp:DropDownList>
            </div>
                </div>
            <div class="clear"></div>
            <div class="grid_3 left" style="margin-right:0px;">
            <div class="field fullwidth">
                
                <label for="uiTextBoxTicketNo">
                    <asp:Label ID="uiLabelTicketNo" runat="server" Text="<%$ Resources:TicketNo %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxTicketNo" runat="server"></asp:TextBox>
            </div>
                </div>
             <div class="grid_3 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiDropDownListAirLine">
                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:AirLine %>"></asp:Label>
                </label>
                     <asp:DropDownList ID="uiDropDownListAirLine" runat="server" ClientIDMode="Static"></asp:DropDownList>
            </div>
                
            </div>
            <div class="clear"></div>
            <div class="grid_3 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiDropDownListFrom">
                    <asp:Label ID="uiLabelFrom" runat="server" Text="<%$ Resources:From %>"></asp:Label>
                </label>
                     <asp:DropDownList ID="uiDropDownListFrom" runat="server" ClientIDMode="Static"></asp:DropDownList>
            </div>
                
            </div>
            <div class="grid_3  left" style="margin-right:0px;">
                <div class="field fullwidth">
                
                <label for="uiDropDownListTo">
                    <asp:Label ID="uiLabelTo" runat="server" Text="<%$ Resources:To %>"></asp:Label>
                </label>
                <asp:DropDownList ID="uiDropDownListTo" runat="server" ClientIDMode="Static"></asp:DropDownList>
            </div>
                
            </div>

            <div class="grid_3  left" style="margin-right:0px;">
                <div class="field fullwidth">
                
                <label for="uiTextBoxFromDate">
                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:DateTime %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxFromDate" runat="server" ClientIDMode="Static" CssClass="datetimepicker"></asp:TextBox>
            </div>
                
            </div>

            
           <div class="clear"></div>
             <div class="grid_3 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiTextBoxActualPrice">
                    <asp:Label ID="uiLabelActualPrice" runat="server" Text="<%$ Resources:ActualPrice %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxActualPrice" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>

                 </div>

            <div class="grid_3 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiTextBoxFinalPrice">
                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:FinalPrice %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxFinalPrice" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>

                 </div>

            <div class="grid_3 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiTextBoxAddedValue">
                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:AddedValue %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxAddedValue" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>

                 </div>

            <div class="grid_3 left" style="margin-right:0px;margin-left:0px;">
                 <div class="field fullwidth">
                
                <label for="uiTextBoxAddedPercentage">
                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:AddedPercentage %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxAddedPercentage" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>

                 </div>
            <div class="clear" ></div>
             <div class="grid_1 left">

            
                <div class="field fullwidth">
                    <asp:CheckBox ID="uiCheckBoxIsCanceld" runat="server"  />&nbsp;<asp:Label ID="Label12" runat="server" Text="<%$ Resources:Canceled %>"></asp:Label>
            </div>

             </div>
            <div class="grid_1 left">

            
                <div class="field fullwidth">
                    <asp:CheckBox ID="uiCheckBoxIsRefunded" runat="server"  />&nbsp;<asp:Label ID="Label13" runat="server" Text="<%$ Resources:Refunded %>"></asp:Label>
            </div>

             </div>
            <div class="grid_1 left">

            
                <div class="field fullwidth">
                    <asp:CheckBox ID="uiCheckBoxIsConfirmed" runat="server"  />&nbsp;<asp:Label ID="Label14" runat="server" Text="<%$ Resources:Confirmed %>"></asp:Label>
            </div>

             </div>
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
        <div class="divider"></div>
        <h4>
            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:History %>"></asp:Label>
        </h4>
        <div class="grid_11 table">
                <asp:GridView ID="uiGridViewHistory" runat="server" AllowPaging="True" OnPageIndexChanging="uiGridViewHistory_PageIndexChanging" AutoGenerateColumns="false" OnRowDataBound="uiGridViewHistory_RowDataBound">
                    <Columns>                        
                        <asp:BoundField DataField="FromDate" HeaderText="<%$ Resources:Date %>" DataFormatString="{0:hh:mm tt dd/MM/yyyy}"/>
                       <asp:TemplateField HeaderText="<%$ Resources:From %>">
                           <ItemTemplate>
                               <asp:Label ID="uiLabelFrom" runat="server" ></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="<%$ Resources:To %>">
                           <ItemTemplate>
                               <asp:Label ID="uiLabelTo" runat="server" ></asp:Label>
                           </ItemTemplate>  
                       </asp:TemplateField>
                        <asp:CheckBoxField DataField="IsCanceled" HeaderText="<%$ Resources:Canceled %>" ReadOnly="true"/>
                        <asp:CheckBoxField DataField="IsConfirmed" HeaderText="<%$ Resources:Confirmed %>" ReadOnly="true"/>
                        <asp:CheckBoxField DataField="IsRefunded" HeaderText="<%$ Resources:Refunded %>" ReadOnly="true"/>
                        <asp:BoundField DataField="UpdatedDate" HeaderText="<%$ Resources:UpdatedDate %>" DataFormatString="{0:hh:mm tt dd/MM/yyyy}"/>
                    </Columns>
                </asp:GridView>
            </div>
    </asp:Panel>
</asp:Content>
