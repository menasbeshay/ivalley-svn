<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="VIP.aspx.cs" Inherits="Chat2Connect.VIP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BHead" runat="server">
    <script src="js/purl.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var t = $.url().param('t');
            if (t != "undefined") {
                switch (t) {
                    case 'a':
                        $("#VIPAcc").addClass("active");
                        $('#accountPanel').css('display', 'block');
                        $('#roomPanel').css('display', 'none');
                        break;
                    case 'r':
                        $("#VIPRoom").addClass("active");
                        $('#accountPanel').css('display', 'none');
                        $('#roomPanel').css('display', 'block');
                        break;
                    default:
                        $("#VIPAcc").addClass("active");
                        $('#accountPanel').css('display', 'block');
                        $('#roomPanel').css('display', 'none');
                        break;
                }
            }            
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div class="form-horizontal blockBoxshadow">
         <div class="col-lg-12" id="accountPanel">
             <h3>
                 إصدار حساب مميز
             </h3>
              <div class="alert alert-info" style="text-align:center !important;">
                  الحساب المميز يعنى حصولك على حساب حرف أو حرفين
       <h5>     للحصول على حساب مميز راجع أحد موظفى المساعدة (Help)
           </h5>
        </div>
         </div>

          <div class="col-lg-12" id="roomPanel">
             <h3>
                 إصدار غرفة مميزة
             </h3>
              <div class="alert alert-info" style="text-align:center !important;">
                  الغرفة المميزة يعنى حصولك على اسم غرفة حرف أو حرفين
       <h5>     للحصول على غرفة مميزة راجع أحد موظفى المساعدة (Help)
           </h5>
        </div>
         </div>
         <div class="clear" style="height:10px;"></div>
     </div>
</asp:Content>
