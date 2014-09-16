<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AREduMaster.Master" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="EduMontreal.ar.Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="note note-success" id="ResponseSuccess"  style="position:relative;">
                                 تم قبول الدفع الخاص بك مع رقم العملية :
                                <asp:Label ID="uiLabeltrx" runat="server" ></asp:Label>
                                <div class="clearfix" style="clear:both;height:10px;"></div>
                                سوف إدارة االمعهد  بمراجعة عملية الدفع الخاصة بك والاتصال بك قريبا.
                                <div class="clearfix" style="clear:both;height:10px;"></div>
                                <a href="checkapp" class="btn btn-primary" style="margin:0 auto;">الإستمرار للخطوة التالية</a>

                                <i class="fa fa-check pull-right" style="color:green;font-size:6em;position:absolute;top:30px;right:30%;"></i>
                            </div>
</asp:Content>
