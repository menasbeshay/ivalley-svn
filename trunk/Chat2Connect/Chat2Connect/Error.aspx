<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Chat2Connect.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-horizontal blockBoxshadow">
         <div class="col-lg-12" id="accountPanel">
             <h3 class="col-lg-10 pull-right">
                 خطأ
             </h3>
             <i class="icon-2x icon-remove pull-left col-lg-2">
                 </i>
             <div class="clear" style="height:1px;"></div>
              <div class="alert alert-danger" style="text-align:center !important;">
                  <div class="col-lg-9 pull-right icon-2x">
                      
                  نعتذر على هذا الخطأ <br />
                  للعودة للصفحة الرئيسية <a href="home.aspx">إضغط هنا</a>
                  </div>
                  <div class="col-lg-3 pull-left" >
                      <i class="icon-4x icon-remove-circle  ">
                 </i>
                  </div>
                  <div class="clear" style="height:10px;"></div>
        </div>
         </div>

         <div class="clear" style="height:10px;"></div>
     </div>
</asp:Content>
