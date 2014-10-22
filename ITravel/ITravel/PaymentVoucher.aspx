<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="PaymentVoucher.aspx.cs" Inherits="ITravel.PaymentVoucher" %>
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
                <asp:GridView ID="uiGridViewVouchers" runat="server" AllowPaging="True" OnPageIndexChanging="uiGridViewVouchers_PageIndexChanging" OnRowCommand="uiGridViewVouchers_RowCommand" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="VoucherNo" HeaderText="<%$ Resources:VoucherNo %>" />
                        <asp:BoundField DataField="VoucherDate" HeaderText="<%$ Resources:VoucherDate %>" DataFormatString="{0:hh:mm tt dd/MM/yyyy}"/>
                        <asp:BoundField DataField="Reason" HeaderText="<%$ Resources:Reason %>" />
                        <asp:CheckBoxField DataField="IsChuque" HeaderText="<%$ Resources:IsCheque %>" ReadOnly="true"/>
                        <asp:BoundField DataField="Amount" HeaderText="<%$ Resources:Amount %>" />
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
                
                <label for="uiTextBoxVoucherNo">
                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:VoucherNo %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxVoucherNo" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
                </div>
             <div class="grid_3 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiTextBoxVoucherDate">
                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:VoucherDate %>"></asp:Label>
                </label>
                     <asp:TextBox ID="uiTextBoxVoucherDate" runat="server" ClientIDMode="Static" CssClass="datepicker"></asp:TextBox>
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
                
                <label for="uiTextBoxPaidFor">
                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:PaidFor %>"></asp:Label>
                </label>
                     <asp:TextBox ID="uiTextBoxPaidFor" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
                
            </div>
            <div class="clear"></div>
            <div class="grid_3 left" style="margin-right:0px;">
            <div class="field fullwidth">
                
                <label for="uiTextBoxAmount">
                    <asp:Label ID="uiLabelAmount" runat="server" Text="<%$ Resources:Amount %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxAmount" runat="server"></asp:TextBox>
            </div>
                </div>
             
            <div class="clear"></div>
            <div class="grid_2 left" style="margin-right:0px;">

            
                <div class="field fullwidth">
                    <asp:CheckBox ID="uiCheckBoxIsCheque" runat="server"  />&nbsp;<asp:Label ID="Label12" runat="server" Text="<%$ Resources:IsCheque %>"></asp:Label>
            </div>

             </div>
            <div class="grid_3 left" style="margin-right:0px;">
            <div class="field fullwidth">
                
                <label for="uiTextBoxBank">
                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:Bank %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxBank" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
                </div>
             <div class="grid_3 left" style="margin-right:0px;">
                 <div class="field fullwidth">
                
                <label for="uiTextBoxChequeDate">
                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:ChequeDate %>"></asp:Label>
                </label>
                     <asp:TextBox ID="uiTextBoxChequeDate" runat="server" ClientIDMode="Static" CssClass="datepicker">
                     </asp:TextBox>
            </div>
                
            </div>
            <div class="clear"></div>
            
            

            <div class="grid_3  left" style="margin-right:0px;">
                <div class="field fullwidth">
                
                <label for="uiTextBoxReason">
                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Reason %>"></asp:Label>
                </label>
                <asp:TextBox ID="uiTextBoxReason" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="3"></asp:TextBox>
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
       
    </asp:Panel>
</asp:Content>
