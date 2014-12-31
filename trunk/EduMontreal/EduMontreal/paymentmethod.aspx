<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="paymentmethod.aspx.cs" Inherits="EduMontreal.paymentmethod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="col-md-12 col-left">
         <asp:Panel runat="server" ID="start">
             <div class="note note-success">
         Your application has been saved successfully . You have to go and Pay only 1500 CAD in order to finalize submission for Edu Montreal as a registration fee.
                 </div>
             </asp:Panel>
        <h4>
            Please choose one of the following payment methods:
        </h4>
         <div class="clearfix" style="height:20px;"></div>
         <div class="col-lg-4">
             <a href="AppPayment" class="paymentlink">
             <img src="Images/visamaster.jpg" />
                 </a>
         </div>
         <div class="col-lg-4">
             <a href="#" class="paymentlink">
             <img src="Images/paypal-logo.png" />
                 </a>
         </div>
         <div class="col-lg-4">
             <a href="wireTransefer" class="paymentlink">
             <img src="Images/direct-bank-transfer.jpg" />
                </a>
         </div>
    </section>
</asp:Content>
