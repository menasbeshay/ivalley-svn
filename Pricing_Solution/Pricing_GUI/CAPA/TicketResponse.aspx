<%@ Page Title="" Language="C#" MasterPageFile="~/CAPA/Site.Master" AutoEventWireup="true" CodeBehind="TicketResponse.aspx.cs" Inherits="Pricing_GUI.CAPA.TicketResponse" %>
<%@ MasterType virtualpath="~/CAPA/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="widget">
     
        <div class="widget-body">
        <div class="span12">
            <strong>Drug Name: </strong><asp:Label ID="uiLabelDrugName" runat="server" />
        </div>
        <div class="clearfix" style="clear:both;height:5px;"></div>            
        <div class="span12" >
            <strong>Request : </strong><asp:Label ID="uiLabelRequestText" runat="server" />
        </div>
        <div class="clearfix" style="clear:both;height:5px;"></div>  
         <div class="span12">
             <asp:Literal ID="uiLiteralAttach" runat="server" />
        </div>
        <div class="clearfix" style="clear:both;height:5px;"></div>            
        </div>
    </div>

    <div class="clearfix" style="height:10px;clear:both;"></div>

    <div class="widget">
        <div class="widget-title">
            <h2>
                History
            </h2>
        </div>

        <div class="widget-body">
        <asp:Panel runat="server" ID="uiPanelResponse" Visible="false">
                <div class="row-fluid">
                    <div class="span7">
                        Response :
                        <br />
                        <asp:TextBox ID="uiTextBoxResponse" runat="server" TextMode="MultiLine" Rows="2"
                            Width="70%"></asp:TextBox>
                    </div>
                    <div class="span3">
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
