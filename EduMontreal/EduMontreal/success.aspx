<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="success.aspx.cs" Inherits="EduMontreal.success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="note note-success" id="ResponseSuccess"  style="position:relative;">
                                Your payment has been approved with transaction id :
                                <asp:Label ID="uiLabeltrx" runat="server" ></asp:Label>
                                <div class="clearfix" style="clear:both;height:10px;"></div>
                                Edu Montreal administration will review your payment and contact you soon.
                                <div class="clearfix" style="clear:both;height:10px;"></div>
                                <a href="checkapp" class="btn btn-primary" style="margin:0 auto;">Proceed to next step</a>

                                <i class="fa fa-check pull-right" style="color:green;font-size:6em;position:absolute;top:30px;right:30%;"></i>
                            </div>
</asp:Content>
