<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="Pricing_GUI.Tickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3 class="page-title">
	My tickets
</h3>

    <div class="widget">
        <div class="widget-title">
            <h4>
                <i class="icon-user"></i>My tickets</h4>
        </div>
        <div class="widget-body">
        <div class="pull-right span2">
            <a class="btn btn-primary" href="#Addmodal" data-toggle="modal">Add new ticket</a>
        </div>
        <div class="clearfix" style="clear:both;height:5px;"></div>
            <asp:GridView ID="uiGridViewTickets" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                OnPageIndexChanging="uiGridViewTickets_PageIndexChanging" OnRowCommand="uiGridViewTickets_RowCommand"
                OnRowDataBound="uiGridViewTickets_RowDataBound" CssClass="table table-hover table-bordered">
                <Columns>
                    <asp:BoundField HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" DataField="InitiateDate" />
                    <asp:TemplateField HeaderText="Trade Name">
                        <ItemTemplate>
                            <asp:Label ID="uiLabelTradeName" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Text Request">
                        <ItemTemplate>
                            <%# !string.IsNullOrEmpty(Eval("TextRequest").ToString()) ? (Eval("TextRequest").ToString().Length > 30 ? Eval("TextRequest").ToString().Substring(0, 30) + "....." : Eval("TextRequest").ToString()) : ""%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TypeName" HeaderText="Ticket Type" />
                    <asp:BoundField DataField="StatusName" HeaderText="Status" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="uiLinkButtonView" runat="server" CommandArgument='<%# Eval("TicketID").ToString() %>'
                                CommandName="ViewTicket">Open Ticket</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div id="Addmodal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel1"
                        aria-hidden="true">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                ×</button>
                            <h3 id="myModalLabel1">
                                Add ticket</h3>
                        </div>
                        <div class="modal-body">
                            <asp:UpdatePanel ID="uiUpdatePanelPrices" runat="server">
                                <ContentTemplate>
                                    <div class="form-horizontal">
                                        <div class="control-group">
                                            <label class="control-label">
                                               Ticket type</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:DropDownList ID="uiDropDownListType" runat="server" AutoPostBack="true" 
                                                        CssClass="input-large" 
                                                        onselectedindexchanged="uiDropDownListType_SelectedIndexChanged">
                                                    </asp:DropDownList>                                                         
                                                </div>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">
                                               Select drug</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:DropDownList ID="uiDropDownListDrugs" runat="server" CssClass="input-large">
                                                    </asp:DropDownList>     
                                                    <div class="clearfix" style="height:1px;"></div>
                                                    <label class="control-label">Or type Drug name </label>
                                                    <div class="clearfix" style="height:1px;clear:both;"></div>
                                                    <asp:TextBox ID="uiTextBoxTradeName" runat="server"></asp:TextBox>                                               
                                                </div>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">
                                                Request text</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:TextBox ID="uiTextBoxRequestText" runat="server" CssClass="input-large" TextMode="MultiLine" Rows="5">
                                                    </asp:TextBox>                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">
                                                Attach file</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:FileUpload ID="uiFileUploadAttach" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Panel ID="uiPanelAppeal" runat="server" Visible="true">
                                        <div class="control-group">
                                            <label class="control-label">
                                                Last Committed date</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:TextBox ID="uiTextBoxCommittedDate" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">
                                                Last Committed decision</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:TextBox ID="uiTextBoxCommittedDecision" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">
                                                Last Committed price</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:TextBox ID="uiTextBoxCommittedPrice" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        </asp:Panel>
                                        <asp:Panel ID="uiPanelPriceIncrease" runat="server" Visible="false">
                                         <div class="control-group">
                                            <label class="control-label">
                                                Current price</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:TextBox ID="uiTextBoxCurrentPrice" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="control-group">
                                            <label class="control-label">
                                                sugessted price</label>
                                            <div class="controls" style="margin-left: 100px !important;">
                                                <div class="input-append">
                                                    <asp:TextBox ID="uiTextBoxSuggestedPrice" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="clearfix" style="height: 20px;">
                                    </div>                                   
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">
                                    Cancel</button>
                                <asp:LinkButton ID="uiLinkButtonAddTicket" runat="server" class="btn btn-primary"
                                    OnClick="uiLinkButtonAddTicket_Click">
                                   Add</asp:LinkButton>
                            </div>
                        </div>
                    </div>
</asp:Content>
