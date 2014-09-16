<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AREduMaster.Master" AutoEventWireup="true" CodeBehind="paymentmethod.aspx.cs" Inherits="EduMontreal.ar.paymentmethod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="col-md-12 col-left">
         <asp:Panel runat="server" ID="start">
             <div class="note note-success">
         تم حفظ طلبك بنجاح . من فضلك قم بدفع مبلغ 1500 CAD كرسوم إشترك ولإنهاء طلبك.
                 </div>
             </asp:Panel>
        <h4>
            من فضلك قم بإختيار أحد طرق الدفع الآتية :
        </h4>
         <div class="clearfix" style="height:20px;"></div>
         <div class="col-lg-4">
             <a href="AppPayment" class="paymentlink">
             <img src="../Images/visamaster.jpg" />
                 </a>
         </div>
         <div class="col-lg-4">
             <a href="#" class="paymentlink">
             <img src="../Images/paypal-logo.png" />
                 </a>
         </div>
         <div class="col-lg-4">
             <a href="wireTransefer" class="paymentlink">
             <img src="../Images/direct-bank-transfer.jpg" />
                </a>
         </div>
    </section>
</asp:Content>
