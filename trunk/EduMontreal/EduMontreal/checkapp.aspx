<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="checkapp.aspx.cs" Inherits="EduMontreal.checkapp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="col-md-12 col-left">
         <h4>
             Current Status
         </h4>
         <asp:Image ID="uiImageCurrentStatus" runat="server" />
     </section>
    <div style="clear:both;height:10px;"></div>
     <section class="col-md-12 col-left">
                            <h4>
                                Update History
                            </h4>
                            <asp:GridView ID="uiGridViewStatusHistory" runat="server"  AutoGenerateColumns="False" HorizontalAlign="Center"  Width="100%" CssClass="table table-hover "  >
                                <AlternatingRowStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" />                    
                        <Columns>                                                        
                            <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="30%"/>
                            <asp:BoundField DataField="StatusComment" HeaderText="Comment" ItemStyle-Width="40%"/>
                            <asp:BoundField DataField="StatusDate" HeaderText="Last Updated Date" DataFormatString="{0:dd/MM/yyyy}" />     
                            
                        </Columns>
                            </asp:GridView>
     </section>

    <div class="modal fade" id="paymentPopup">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h3>Go to payment</h3>
                </div>
                <div class="modal-body">
                    <h3>Please proceed with the payment
                    </h3>
                    <a href="AppPayment" class="btn btn-primary">Proceed to payment</a>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>
