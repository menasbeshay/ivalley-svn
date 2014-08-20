<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AREduMaster.Master" AutoEventWireup="true" CodeBehind="checkapp.aspx.cs" Inherits="EduMontreal.ar.checkapp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="col-md-12 col-left">
        <h4>
             الحالة الحالية
         </h4>
         <asp:Image ID="uiImageCurrentStatus" runat="server" />
     </section>
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
                                                    <h3>الدفع</h3>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-horizontal blockBox">
                                                        <h3>
                                                            برجاء الاستمرار لدفع المصاريف الدراسية 
                                                        </h3>
                                                        <a href="AppPayment" class="btn btn-primary"> الاستمرار لدفع المصاريف الدراسية </a>
                                                    </div>
                                                </div>                                               
                                                <div class="modal-footer">
                                                    <a href="#" class="btn " data-dismiss="modal" style="text-decoration: none;">close</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
</asp:Content>
