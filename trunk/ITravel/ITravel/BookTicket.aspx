<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="BookTicket.aspx.cs" Inherits="ITravel.BookTicket" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
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
                       <asp:TemplateField HeaderText="<%$ Resources:Status %>">
                           <ItemTemplate>
                               <asp:Label ID="uiLabelStatus" runat="server" ></asp:Label>
                           </ItemTemplate>  
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="<%$ Resources:Actions %>">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="EditR" CommandArgument='<%# Eval("TicketID") %>'>
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Edit %>"></asp:Label>
                                </asp:LinkButton>
                                &nbsp;|&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="DeleteR" CommandArgument='<%# Eval("TicketID") %>'>
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Delete %>"></asp:Label>
                                </asp:LinkButton>
                                &nbsp;|&nbsp;
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="SendSMS" CommandArgument='<%# Eval("TicketID") %>'>
                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:SendSMS %>"></asp:Label>
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
                
                <label for="uiDropDownListCreditCard">
                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:Card %>"></asp:Label>
                </label>
                <asp:DropDownList ID="uiDropDownListCreditCard" runat="server" ClientIDMode="Static"></asp:DropDownList>
            </div>
                </div>
             <div class="grid_3 right" style="margin-right:0px;">
            <div class="field fullwidth">
                
                <asp:LinkButton ID="uiLinkButtonPrint" runat="server" CssClass="bt blue" ClientIDMode="Static" OnClick="uiLinkButtonPrint_Click" Text="<%$ Resources:PrintTicket %>"></asp:LinkButton>
            </div>
                </div>
            <div class="clear"></div>
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
                
                <label for="uiTextBoxFlightNo">
                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:FlightNo %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxFlightNo" runat="server"></asp:TextBox>
            </div>
                </div>
            <div class="grid_3 left" style="margin-right:0px;">
            <div class="field fullwidth">
                
                <label for="uiTextBoxSeatNo">
                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:SeatNo %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxSeatNo" runat="server"></asp:TextBox>
            </div>
                </div>
             <div class="grid_3 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiDropDownListCabinType">
                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:CabinTypes %>"></asp:Label>
                </label>
                     <asp:DropDownList ID="uiDropDownListCabinType" runat="server" ClientIDMode="Static">

                         <asp:ListItem Value="First Class" Text="<%$ Resources:FirstClass %>">
                             </asp:ListItem> 
                         <asp:ListItem Value="Bussiness Class" Text="<%$ Resources:BussinessClass %>"></asp:ListItem>
                         <asp:ListItem Value="Economy Class" Text="<%$ Resources:EconomyClass %>"></asp:ListItem>
                         <asp:ListItem Value="Premuim Economy" Text="<%$ Resources:PremuimEconomy %>"></asp:ListItem>

                     </asp:DropDownList>
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
             <%--<div class="grid_1 left">

            
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

             </div>--%>

            <div class="grid_3 left">

            
               <div class="field fullwidth">
                
                <label for="uiDropDownListStatus">
                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:Status %>"></asp:Label>
                </label>
                     <asp:DropDownList ID="uiDropDownListStatus" runat="server" ClientIDMode="Static"></asp:DropDownList>
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
                      <asp:TemplateField HeaderText="<%$ Resources:Status %>">
                           <ItemTemplate>
                               <asp:Label ID="uiLabelStatus" runat="server" ></asp:Label>
                           </ItemTemplate>  
                       </asp:TemplateField>
                        
                        <asp:BoundField DataField="UpdatedDate" HeaderText="<%$ Resources:UpdatedDate %>" DataFormatString="{0:hh:mm tt dd/MM/yyyy}"/>
                    </Columns>
                </asp:GridView>
            </div>

        <div class="divider"></div>

        <rsweb:ReportViewer ID="uiReportViewerMain" runat="server" Width="100%"></rsweb:ReportViewer>
    </asp:Panel>

    <div class="box grid_5" id="ConfirmModal" hidden>
        <header>
            <div class="inner">
                <div class="left title">
                    <h1>
                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Confirm %>"></asp:Label></h1>
                </div>
                <div class="right">
                    <a href="#" class="close">X</a>
                </div>
            </div>
        </header>
                    
        <div class="box-content">
            <p>
                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:ConfirmSMS %>"></asp:Label>
            </p>
            <footer class="pane">
                <a href="#" class="close bt red">
                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Close %>"></asp:Label>
                </a>                                
            </footer>
        </div>
    </div>

    <div class="box grid_5" id="CancelModal" hidden>
        <header>
            <div class="inner">
                <div class="left title">
                    <h1>
                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:ErrorSMS %>"></asp:Label></h1>
                </div>
                <div class="right">
                    <a href="#" class="close">X</a>
                </div>
            </div>
        </header>
                    
        <div class="box-content">
            <p>
                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:ErrorSMSBody %>"></asp:Label>
            </p>
            <footer class="pane">
                <a href="#" class="close bt red">
                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:Close %>"></asp:Label>
                </a>                                
            </footer>
        </div>
    </div>

    <a href="#ConfirmModal" id="confirm" style="display:none" class="modal"></a>
    <a href="#CancelModal" id="cancel" style="display:none" class="modal"></a>
</asp:Content>
