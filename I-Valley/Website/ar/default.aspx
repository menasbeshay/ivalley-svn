<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ArSite.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Website.ar._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="postsContainer" class="row">
        <div class="large-12 columns recTitle">
            <h4>
                منتجات</h4>
        </div>
        <div class="large-6 columns postContainer">
            <div class="post-num">
                <img src="../images/flights.gif" alt="Blog Image">
                <p class="posterName">
                <p class="postDate">
                    I-Flights</p>
            </div>
            <div class="postInfo">
                <img src="../images/opFlights.gif" alt="Posted By" style="border-radius: 10px; -moz-border-radius: 10px;
                    -webkit-border-radius: 10px;">
                <p class="postInfo">
                    نحن نقدم لك نظام إدارة الخطوط الجوية الأكثر استقرارا يمكنك من التعامل مع&nbsp; 
                    قسمك التجاري، إدارة العمليات، طاقم الطائرة، والهندسة، والمحطة وقسم التدريب مع 
                    القدرة على استخراج كافة التقارير اللازمة بما في ذلك جدولة تقارير وزارة&nbsp; 
                    الطيران&nbsp; </p>
            </div>
            <div class="blogHover">
                <a href="Products/I-Flights.aspx">Link</a>
            </div>
        </div>
        <div class="large-6 columns postContainer">
            <div class="post-num">
                <img src="../images/finance.gif" alt="Blog Image">
                <p class="postDate">
                    I-Finance</p>
            </div>
            <div class="postInfo">
                <img src="../images/opFinance.gif" alt="Posted By" style="border-radius: 10px; -moz-border-radius: 10px;
                    -webkit-border-radius: 10px;">
                <p class="postInfo">
                    IValley توفير حل مناسب للشركات الصغيرة ومتوسطة الحجم للقسم المالى الخاص بهم - من خلال IFinance لدينا نحن نقدم نظام محاسبي كامل بما في ذلك إدارة المخازن و إدارة المبيعات واكثر، الآن سوف تكون قادر على إزالة جميع الفواتير اليدوية واستخدام النظام المالي الاقوى.</p>
            </div>
            <div class="blogHover">
                <a href="Products/I-Finance.aspx">Link</a>
            </div>
        </div>
    </div>
</asp:Content>
