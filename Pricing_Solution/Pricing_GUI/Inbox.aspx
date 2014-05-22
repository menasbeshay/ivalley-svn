<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="Pricing_GUI.Inbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <h3 class="page-title">
							Inbox							
						</h3>
                        <div class="row-fluid">
        <div class="span12">
 <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-tasks"></i>Inbox</h4>
                </div>
                <div class="widget-body">
                    <asp:GridView ID="uiGridViewInbox" runat="server" AllowPaging="True" AutoGenerateColumns="False"  
                 CssClass="table table-hover table-bordered">
                <Columns>               
                    <asp:BoundField HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" DataField="SubmissionDate" />
                    <asp:BoundField DataField="CompNameEng" HeaderText="Company Name" />
                    <asp:BoundField DataField="CommitteType" HeaderText="Committe Type" />                       
                    <asp:BoundField DataField="TradeName" HeaderText="Trade Name" />    
                    <asp:BoundField DataField="Dosage_form" HeaderText="Dosage form" />                                                                
                    <asp:BoundField DataField="Status" HeaderText="Status" />  
                    <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <a class="btn btn-primary" href="#Addmodal" data-toggle="modal">....</a>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                    <span class="space5"></span>
                </div>
            </div>
            </div>
            </div>


            <div id="Addmodal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel1"
                        aria-hidden="true">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                ×</button>
                            <h3 id="myModalLabel1">
                                Product pricing status details</h3>
                        </div>
                        <div class="modal-body">
                            Product pricing status details
                        </div>
                    </div>
</asp:Content>
