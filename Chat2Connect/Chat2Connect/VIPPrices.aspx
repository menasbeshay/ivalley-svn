<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="VIPPrices.aspx.cs" Inherits="Chat2Connect.VIPPrices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BHead" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $('#vipaccounts').addClass('active');
         });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-horizontal blockBoxshadow">

        <h3>أسعار الحسابات المميزة (نكنيم)</h3>
         <div class="clearfix" style="height:10px;"></div>
        <table class="table table-hover" style="text-align:center !important;width:90%;">
            <thead>
                <tr>
                    <th style="text-align:center !important;">
                        عدد الحروف	
                    </th>
                    <th style="text-align:center !important;">
                        سعر إصداره

                    </th>
                     <th style="text-align:center !important;">
                    مميزات الحساب المميز
                    </th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>حرف</td>
                    <td>
                        <i class="icon icon-lock"></i>
                    </td>
                    <td rowspan="3" style="text-align:right;">
                        <ul style="list-style-type:decimal !important;">
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp; الحساب المميز يتم تلوينه 6 أشهر أو سنة لون ذهبى</li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp; يسمح بتعديل الحساب المميز إلى اسم ثانى برسوم 500 ريال حسب الفئة</li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp;يسمح ببيع الحساب المميز إلى شخص أخر برسوم 500 ريال </li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp;الحساب المميز يكون ملك صاحبه مدى الحياة</li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp;لا يستطيع أى شخص سحب الحساب المميز من صاحبه </li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp;يصبح عضو فى نادى التواصل تلقائياً</li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp;يتمتع بدخول أى غرفة مكتملة العدد</li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp;لا يستطيع الحساب المميز الدخول إلى الموقع إلا إذا كان مصبوغاً </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>حرفين</td>
                    <td><i class="icon icon-lock"></i></td>


                </tr>
                <tr>
                    <td>4/3 حروف أو الاسم المركب عربى وانجليزى	</td>
                    <td>1000 ريال
</td>

                </tr>

            </tbody>
        </table>
           
        <div class="clearfix" style="height:10px;"></div>

        <h3>أسعار أسماء الغرف المميزة</h3>
         <div class="clearfix" style="height:10px;"></div>
        <table class="table table-hover" style="text-align:center !important;width:98%;">
            <thead>
                <tr>
                    <th style="text-align:center !important;">
                        عدد الحروف	
                    </th>
                    <th style="text-align:center !important;">
سعر التميز فى الشهر	
                    </th>
                     <th style="text-align:center !important;">
سعر التميز فى 6 أشهر	
                    </th>
                    <th style="text-align:center !important;">
سعر التميز فى السنة	
                    </th>
                    <th style="text-align:center !important;">
                    مميزات الغرف المميزة
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>حرف</td>
                    <td><i class="icon icon-lock"></i></td>
                    <td><i class="icon icon-lock"></i></td>
                     <td><i class="icon icon-lock"></i></td>
                    <td rowspan="3" style="text-align:right;">
                        <ul style="list-style-type:decimal !important;">
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp; يتم تفعيل من غرفة عامة إلى غرفة مميزة على الغرفة العامة</li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp; تتواجد الغرفة المميزة فى قسم VIP وكذلك تتواجد فى القسم التى أنشئت فيه</li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp; الغرفة المميزة يتم تلوينها ذهبى فقط</li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp; أسماء الغرفة المميزة ليست ملك لأى حساب</li>
                            <li><i class="icon-caret-left"></i>&nbsp;&nbsp; يتم تجديد التميز لسم الغرفة بالشهر أو ستة أشهر أو سنة</li>
                            
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>حرفين</td>
                    <td><i class="icon icon-lock"></i></td>
                    <td><i class="icon icon-lock"></i></td>
                     <td><i class="icon icon-lock"></i></td>

                </tr>
                <tr>
                    <td>4/3 حروف أو الاسم المركب عربى وانجليزى	</td>
                    <td>500 ريال</td>
                     <td>1500 ريال</td>
                    <td>3000 ريال</td>
                </tr>

            </tbody>
        </table>
           
        <div class="clearfix" style="height:10px;"></div>

        <div class="alert alert-info" style="text-align:center !important;">
       <h5>     تستطيع إصدار اسم مميز عربى أو انجليزى <br />
(راجع أحد موظفى المساعدة)
           </h5>
        </div>
    </div>
</asp:Content>
