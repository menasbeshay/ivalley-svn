<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AREduMaster.Master" AutoEventWireup="true" CodeBehind="checkapp.aspx.cs" Inherits="EduMontreal.ar.checkapp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/jquery.datetimepicker.css" rel="stylesheet" />    
    <script src="../js/jquery.datetimepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.datetimepicker').datetimepicker();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="col-md-12 col-left">
        <h4>
             الحالة الحالية
         </h4>
        <asp:Label ID="uiLabelStatusName" runat="server"></asp:Label>
         <br />
         <asp:Image ID="uiImageCurrentStatus" runat="server" />
     </section>
    <div style="clear: both; height: 10px;"></div>
    <asp:Panel runat="server" ID="uiPanelVisaResult">
        <section class="col-md-12 col-left">
            <div class="control-label">نتيجة الفيزا : </div>
            <div class="form-control">
                <asp:FileUpload ID="uiFileUploadVisaResult" runat="server" />
                <asp:LinkButton ID="uiLinkButtonUploadVisaResult" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonUploadVisaResult_Click" OnClientClick="$('#progressModal').modal('show');">إرسال</asp:LinkButton>
            </div>
            <asp:Panel runat="server" ID="uiPanelVisaSucc">
            <div class="alert-success">
                تم إرسال الملف بنجاح.
            </div>
                </asp:Panel>
            <asp:Panel runat="server" ID="uiPanelVisaFail">
            <div class="alert-danger">
                حدث خطأ . من فضلك حاول مرة أخرى 
            </div>
                </asp:Panel>
        </section>
    </asp:Panel>
    <div style="clear:both;height:10px;"></div>
    <asp:Panel runat="server" ID="uiPanelVisaSchedule">
        <section class="col-md-6 col-left">
            <div class="control-label">تحديد ميعاد للمقابلة بخصوص الفيزا : </div>
            
                <div class="  col-md-6">                                        
                    <div class="input-group date " >
                        <asp:TextBox ID="uiTextBoxVisaDate" runat="server" CssClass="form-control datetimepicker"></asp:TextBox>
                        <span class="input-group-addon add-on"><i  class="fa fa-calendar"></i></span>
                    </div>                                        
                </div>                
                <asp:LinkButton ID="uiLinkButtonSaveDate" runat="server" CssClass="btn btn-primary col-md-6" OnClick="uiLinkButtonSaveDate_Click">حفظ</asp:LinkButton>
            
            <asp:Panel runat="server" ID="uiPanelVSSucess" Visible="false">
            <div class="alert-success">
               تم حفظ الميعاد بنجاح
            </div>
                </asp:Panel>
            <asp:Panel runat="server" ID="uiPanelVSFail" Visible="false">
            <div class="alert-danger">
                حدث خطأ . من فضلك أعد المحاولة.
            </div>
                </asp:Panel>
        </section>
    </asp:Panel>
    <div style="clear:both;height:10px;"></div>
     <section class="col-md-12 col-left">
       
                            <h4>
                                أخر التحديثات
                            </h4>
                            <asp:GridView ID="uiGridViewStatusHistory" runat="server"  AutoGenerateColumns="False" HorizontalAlign="Center"  Width="100%" CssClass="table table-hover "  >
                                <AlternatingRowStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" />                    
                        <Columns>                                                        
                            <asp:BoundField DataField="Status" HeaderText="الحالة" ItemStyle-Width="30%"/>
                            <asp:BoundField DataField="StatusComment" HeaderText="التعليق" ItemStyle-Width="40%"/>
                            <asp:BoundField DataField="StatusDate" HeaderText="تاريخ أخر تحديث" DataFormatString="{0:dd/MM/yyyy}" />     
                            
                        </Columns>
                            </asp:GridView>
                      
     </section>

    <div id='paymentPopup' class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <a class="close pull-right" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                    
                    <asp:Panel runat="server" ID="TuitionFeesTitle">
                       <h3>دفع الرسوم الدراسية</h3>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="AppPaymentTitle">
                        <h3>رسوم ملء الطلب</h3>
                    </asp:Panel>
                </div>
                <div class="modal-body">
                    

                    <asp:Panel runat="server" ID="uiPanelTuitionFeesBody">
                       <h5>من أجل دفع الرسوم الدراسية يرجى اختيار واحدة من وسائل الدفع التالية:
                    </h5>
                    <div class="clearfix" style="height: 20px;"></div>
                    <div class="col-11">
                        سوف تقوم بدفع :
                        <asp:Label ID="uiLabelAmount" runat="server"></asp:Label>
                        CAD
                    </div>
                    <div class="clearfix" style="height: 10px;"></div>
                    </asp:Panel>
                     <asp:Panel runat="server" ID="uiPanelAppPayment">
                        <h5>
                        من أجل دفع رسوم ملء الطلب يرجى اختيار واحدة من وسائل الدفع التالية:
                    </h5>
                     <div class="clearfix" style="height:20px;"></div>
                    <div class="col-11">
                       سوف تقوم بدفع : <asp:Label ID="uiLabelAppAmount" runat="server" ></asp:Label> CAD
                    </div>
                     <div class="clearfix" style="height:10px;"></div>
                    </asp:Panel>

                    <div class="col-lg-4">
                        <a href="AppPayment" class="paymentlink">
                            <img src="../Images/visamaster.jpg" style="max-width: 150px;" />
                        </a>
                    </div>
                    <div class="col-lg-4">
                        <a href="#" class="paymentlink">
                            <img src="../Images/paypal-logo.png" style="max-width: 150px;" />
                        </a>
                    </div>
                    <div class="col-lg-4">
                        <a href="wireTransefer" class="paymentlink">
                            <img src="../Images/direct-bank-transfer.jpg" style="max-width: 150px;" />
                        </a>
                    </div>
                    <div class="clearfix" style="height: 20px;"></div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn " data-dismiss="modal" style="text-decoration: none;">close</a>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="progressModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">                    
                    <h3>رجاء الإنتظار... </h3>
                </div>
                <div class="modal-body">
                    جارى العمل على طلبك . برجاء الإنتظار...
                    <img src="../assets/img/loading.gif" />
                    </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>
