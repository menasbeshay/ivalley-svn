<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="wireTransefer.aspx.cs" Inherits="EduMontreal.wireTransefer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="span12 col-left">
        
        <div class="span12">
            <asp:Panel runat="server" ID="uiPanelSuccess" Visible="false">
                <div class="note note-success"  >
                                Your receipt has been uploaded successfully, please wait for the transfer verfication. <br />
                    Once verfied your application will be redirected automatically to the next phase.
                            </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="uiPanelFail" Visible="false">
                <div class="note note-danger" >
                                An error occurred. please try again later.                                               
                            </div>
            </asp:Panel>
      

                            
            <div class="clearfix" style="clear:both;height:10px;"></div>
            <div class="panel-group accordion" id="accordion1">
                
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_2"> Wire Transfer from your local bank  </a>
                        </h4>
                    </div>
                    <div id="collapse_2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="col-lg-12">
                                <h4>Check our bank info below :</h4>
                            </div>

                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Account Name: </b></label>
                                Institut Éducatif de Montréal</div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Bank: </b></label>
                                Canadian Imperial Bank of Commerce (CIBC)</div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Address: </b></label>
                                1155 René-Levesque Blvd West, Montréal QC H3B 3Z4 Canada </div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Transit number :</b></label>
                                00001 </div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Institution Number:</b></label>
                                010</div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Account number: </b></label>
                                1307312 </div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Swift Code:</b></label>
                                CIBCCATT</div>
                            <div class="clearfix" style="height: 10px;"></div>
                            <div class="col-lg-12">
                                <div class="note note-info">
                                    Please write your First and Last Name as well as your ID number in the transfer notes

                                </div>

                            </div>
                            <div class="col-lg-12">
                                <div class="note note-warning">
                                    Please upload the confirmation receipt of the bank

                                </div>

                                <div class="control-label">Receipt</div>
                                <div class="form-control">
                                    <asp:FileUpload ID="uiFileUploadReceipt" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uiFileUploadReceipt" ErrorMessage="Required" Font-Bold="true" ForeColor="Red" Display="Dynamic" ValidationGroup="upload"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-actions">
                                    <asp:LinkButton ID="uiLinkButtonUpload" runat="server" CssClass="btn btn-primary" ValidationGroup="upload" OnClick="uiLinkButtonUpload_Click">Upload</asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
