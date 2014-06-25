<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="ViewTicket.aspx.cs" Inherits="Pricing_GUI.ViewTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3 class="page-title">
	Ticket Info
</h3>

    <div class="widget">
        <div class="widget-title">
            <h4>
                <i class="icon-user"></i>Ticket Info</h4>
        </div>
        <div class="widget-body">
        <div class="span12">
            <strong>Drug Name: </strong><asp:Label ID="uiLabelDrugName" runat="server" />
        </div>
        <div class="clearfix" style="clear:both;height:5px;"></div>            
        <div class="span12" style="margin-left:0px;">
            <strong>Request : </strong><asp:Label ID="uiLabelRequestText" runat="server" />
        </div>
        <div class="clearfix" style="clear:both;height:5px;"></div>            
        </div>
    </div>

    <div class="clearfix" style="height:10px;clear:both;"></div>

    <div class="widget">
        <div class="widget-title">
            <h4>
                History
            </h4>
        </div>

        <div class="widget-body">
            <asp:Panel runat="server" ID="uiPanelResponse" Visible="false">
                <div class="row-fluid">
                    <div class="span4">
                        Response :
                        <br />
                        <asp:TextBox ID="uiTextBoxResponse" runat="server" TextMode="MultiLine" Rows="2"
                            Width="70%"></asp:TextBox>
                    </div>
                    <div class="span3" style="display:none">
                        Status :
                        <br />
                        <asp:DropDownList ID="uiDropDownListStatus" runat="server" CssClass="input-large">
                        </asp:DropDownList>
                    </div>
                    <div class="span3" >
                       Attache file :
                        <br />
                         <asp:FileUpload ID="uiFileUploadAttach" runat="server" />                                            
                    </div>
                    <div class="span2">
                        <br />
                        <asp:LinkButton ID="uiLinkButtonReply" runat="server" class="btn btn-primary" OnClick="uiLinkButtonReply_Click"> Reply</asp:LinkButton>
                    </div>
                </div>
            </asp:Panel>
        
        <asp:GridView ID="uiGridViewHistory" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                OnPageIndexChanging="uiGridViewHistory_PageIndexChanging" 
                 CssClass="table table-hover table-bordered">
                <Columns>
                    <asp:BoundField HeaderText="Response Date" DataFormatString="{0:dd/MM/yyyy}" DataField="ResponseDate" />
                   
                    <asp:TemplateField HeaderText="Response">
                        <ItemTemplate>
                            <%# Eval("ResponseText").ToString()%>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:BoundField DataField="StatusName" HeaderText="Status" />                    
                </Columns>
            </asp:GridView>
            <div class="clearfix" style="clear:both;height:5px;"></div>
        </div>
    </div>
</asp:Content>
