<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="checkapp.aspx.cs" Inherits="EduMontreal.checkapp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.datetimepicker').datetimepicker({               
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="col-md-12 col-left">
        <h4>Current Status
        </h4>
        <asp:Label ID="uiLabelStatusName" runat="server"></asp:Label>
        <br />
        <asp:Image ID="uiImageCurrentStatus" runat="server" />
    </section>
    <div style="clear: both; height: 10px;"></div>
    <asp:Panel runat="server" ID="uiPanelVisaResult">
        <section class="col-md-12 col-left">
            <div class="control-label">Visa Result : </div>
            <div class="form-control">
                <asp:FileUpload ID="uiFileUploadVisaResult" runat="server" />
                <asp:LinkButton ID="uiLinkButtonUploadVisaResult" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonUploadVisaResult_Click">Upload</asp:LinkButton>
            </div>
            <asp:Panel runat="server" ID="uiPanelVisaSucc" Visible="false">
            <div class="alert-success">
                Visa result uploaded successfully.
            </div>
                </asp:Panel>
            <asp:Panel runat="server" ID="uiPanelVisaFail" Visible="false">
            <div class="alert-danger">
                Visa result uploaded failed. Try again please.
            </div>
                </asp:Panel>
        </section>
    </asp:Panel>
    
     <div style="clear: both; height: 10px;"></div>
    <asp:Panel runat="server" ID="uiPanelVisaSchedule">
        <section class="col-md-6 col-left">
            <div class="control-label">Visa Schedule Appointment : </div>
            
                <div class=" datetimepicker col-md-6">                                        
                    <div class="input-group date datetimepicker" data-time-icon="fa fa-time" data-date-icon="fa fa-calendar">
                        <asp:TextBox ID="uiTextBoxVisaDate" runat="server" CssClass="form-control"></asp:TextBox>
                        <span class="input-group-addon add-on"><i  class="fa fa-calendar"></i></span>
                    </div>                                        
                </div>                
                <asp:LinkButton ID="uiLinkButtonSaveDate" runat="server" CssClass="btn btn-primary col-md-6" OnClick="uiLinkButtonSaveDate_Click">Save Appointment Date</asp:LinkButton>
            
            <asp:Panel runat="server" ID="uiPanelVSSucess" Visible="false">
            <div class="alert-success">
                Visa Appointment Date saved successfully.
            </div>
                </asp:Panel>
            <asp:Panel runat="server" ID="uiPanelVSFail" Visible="false">
            <div class="alert-danger">
                An error accured. Try again please.
            </div>
                </asp:Panel>
        </section>
    </asp:Panel>
    

    <div style="clear: both; height: 10px;"></div>
    <section class="col-md-12 col-left">
        <h4>Update History
        </h4>
        <asp:GridView ID="uiGridViewStatusHistory" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" Width="100%" CssClass="table table-hover ">
            <AlternatingRowStyle HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="30%" />
                <asp:BoundField DataField="StatusComment" HeaderText="Comment" ItemStyle-Width="40%" />
                <asp:BoundField DataField="StatusDate" HeaderText="Last Updated Date" DataFormatString="{0:dd/MM/yyyy}" />

            </Columns>
        </asp:GridView>
    </section>

    <div class="modal fade" id="paymentPopup">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <asp:Panel runat="server" ID="TuitionFeesTitle">
                        <h3>Tuition Fees Payment</h3>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="AppPaymentTitle">
                        <h3>Fill Application Payment</h3>
                    </asp:Panel>
                </div>
                <div class="modal-body">
                    <asp:Panel runat="server" ID="uiPanelTuitionFeesBody">
                        <h5>
                        In order to finalize your tuition fees payment please choose one from the following payment methods :
                    </h5>
                     <div class="clearfix" style="height:20px;"></div>
                    <div class="col-11">
                        You're going to pay : <asp:Label ID="uiLabelAmount" runat="server" ></asp:Label> CAD
                    </div>
                     <div class="clearfix" style="height:10px;"></div>
                    </asp:Panel>
                     <asp:Panel runat="server" ID="uiPanelAppPayment">
                        <h5>
                        In order to finalize your application please choose one from the following payment methods :
                    </h5>
                     <div class="clearfix" style="height:20px;"></div>
                    <div class="col-11">
                        You're going to pay : <asp:Label ID="uiLabelAppAmount" runat="server" ></asp:Label> CAD
                    </div>
                     <div class="clearfix" style="height:10px;"></div>
                    </asp:Panel>
                     <div class="col-lg-4">
                         <a href="AppPayment" class="paymentlink">
                         <img src="Images/visamaster.jpg" style="max-width:150px;"/>
                             </a>
                     </div>
                     <div class="col-lg-4">
                         <a href="#" class="paymentlink">
                         <img src="Images/paypal-logo.png" style="max-width:150px;"/>
                             </a>
                     </div>
                     <div class="col-lg-4">
                         <a href="wireTransefer" class="paymentlink">
                         <img src="Images/direct-bank-transfer.jpg" style="max-width:150px;"/>
                            </a>
                     </div>
                    <div class="clearfix" style="height:20px;"></div>
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
