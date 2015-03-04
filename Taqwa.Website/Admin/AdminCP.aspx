<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminCP.aspx.cs" Inherits="Taqwa.Website.Admin.AdminCP" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
.MainLink
{
    display:block;width:195px;height:160px;margin:10px;padding:20px;text-align:center;border:1px solid black;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;float:right;
    font-weight:bold;
    font-size:15px;
    }
    .MainLink img{ width:110px; }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminMain">
<h3 style="direction:rtl;padding-right:20px;">
    لوحة التحكم الرئيسية&nbsp;</h3>
    
    <div style="direction:rtl;padding-right:20px;display:none;">
    
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/Admin/EditClassType.aspx">تعديل المراحل التعليمية</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/Admin/EditClass.aspx">تعديل الصفوف الدراسية</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" 
            NavigateUrl="~/Admin/EditCourses.aspx">تعديل المواد</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" 
            NavigateUrl="~/Admin/EditSchoolYear.aspx">تعديل السنوات الدراسية</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink5" runat="server" 
            NavigateUrl="~/Admin/EditSections.aspx">تعديل الحصص</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink6" runat="server" 
            NavigateUrl="~/Admin/EditSchoolBus.aspx">تعديل سيارات المدرسة</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink7" runat="server" 
            NavigateUrl="~/Admin/EditSchedule.aspx">تعديل جدول الحصص</asp:HyperLink>
        <br />
         <asp:HyperLink ID="HyperLink8" runat="server" 
            NavigateUrl="~/Admin/EditGallery.aspx">تعديل معرض الصور </asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink9" runat="server" 
            NavigateUrl="~/Admin/EditHomePageBlocks.aspx">تعديل أقسام الصفحة الرئيسية</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink10" runat="server" 
            NavigateUrl="~/Admin/EditPageContent.aspx">تعديل الصفحات</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink11" runat="server" 
            NavigateUrl="~/Admin/EditNews.aspx">تعديل الأخبار</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink12" runat="server" 
            NavigateUrl="~/Admin/EditOutStanding.aspx">تعديل المتفوقين</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink13" runat="server" 
            NavigateUrl="~/Admin/EditHonorPanal.aspx">تعديل لوحة الشرف</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink15" runat="server" 
            NavigateUrl="~/Admin/EditStudent.aspx">تعديل بيانات الطلاب</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink16" runat="server" 
            NavigateUrl="~/Admin/EditResults.aspx">تعديل نتائج الإمتحانات</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink17" runat="server" 
            NavigateUrl="~/Admin/EditMonthlyReport.aspx">تعديل التقارير الشهرية</asp:HyperLink>
    
        <br />
        <asp:HyperLink ID="HyperLink18" runat="server" 
            NavigateUrl="~/Admin/EditAttendanceReport.aspx">تعديل تقارير الغياب الشهرية</asp:HyperLink>
    
        <br />
        <asp:HyperLink ID="HyperLink19" runat="server" 
            NavigateUrl="~/Admin/EditFees.aspx">تعديل المصروفات الدراسية</asp:HyperLink>
    
        <br />
        <asp:HyperLink ID="HyperLink20" runat="server" 
            NavigateUrl="~/Admin/EditInstallments.aspx">تعديل الأقساط</asp:HyperLink>
    
    </div>

    <div style="direction:rtl;padding-right:20px;margin:0 auto;width:900px;">
    
        <a href="EditClassType.aspx" class="MainLink" >
            <img src="../images/icons/main1.jpg" />
            <br />
             المراحل التعليمية
        </a>
        <a href="EditClass.aspx" class="MainLink" >
            <img src="../images/icons/main1_1.jpg" />
            <br />
             الصفوف الدراسية
        </a>
        <a href="EditSchoolYear.aspx" class="MainLink" >
            <img src="../images/icons/main2_2.jpg" />
            <br />
             السنوات الدراسية
        </a>
        <a href="EditSections.aspx" class="MainLink" >
            <img src="../images/icons/main2_1.jpg" />
            <br />
             الحصص "أنواعها ومدتها"
        </a>
        <a href="EditSchedule.aspx" class="MainLink" >
            <img src="../images/icons/t1.jpg" style="width:90px;" />
            <br />
             جدول الحصص
        </a>

         <a href="UpdateFees.aspx" class="MainLink" >
            <img src="../images/icons/fees.gif" style="width:100px !important;" />
            <br />
             تحميل المصروفات
        </a>
        <a href="EditSchoolBus.aspx" class="MainLink" >
            <img src="../images/icons/main2_3.jpg" />
            <br />
            خطوط سيارات المدرسة
        </a>
        <a href="EditCategory.aspx" class="MainLink" >
            <img src="../images/icons/main2_4.jpg" />
            <br />
            أسماء ألبومات الصور
        </a>

        <a href="EditGallery.aspx" class="MainLink" >
            <img src="../images/icons/main2_4.jpg" />
            <br />
            رفع صور الألبومات
        </a>
         <a href="EditPageGallery.aspx" class="MainLink" >
            <img src="../images/icons/main2_4.jpg" />
            <br />
             صور الصفحات
        </a>
        <a href="EditOutStanding.aspx" class="MainLink" >
            <img src="../images/icons/main3_2.jpg" />
            <br />
            تعديل المتفوقين
        </a>


        <a href="EditHonorPanal.aspx" class="MainLink" >
            <img src="../images/icons/main3_3.jpg" />
            <br />
             لوحة الشرف
        </a>
        <a href="EditStudent.aspx" class="MainLink" >
            <img src="../images/icons/main3.jpg" />
            <br />
             بيانات الطلاب
        </a>
        <a href="EditHomePageBlocks.aspx" class="MainLink" style="display:none">
            <img src="../images/icons/pages.jpg" />
            <br />
             أقسام الصفحة الرئيسية
        </a>
        <a href="EditPageContent.aspx" class="MainLink" >
            <img src="../images/icons/pages.jpg" />
            <br />
             الصفحات
        </a>
        <a href="EditNews.aspx" class="MainLink" >
            <img src="../images/icons/pages.jpg" />
            <br />
             الأخبار
        </a>
        <a href="EditClassVideos.aspx" class="MainLink" >
            <img src="../images/icons/pages.jpg" />
            <br />
             فيديوهات
        </a>
        <a href="EditClassFiles.aspx" class="MainLink" >
            <img src="../images/icons/pages.jpg" />
            <br />
             ملفات
        </a>

        <a href="changepass.aspx" class="MainLink" >
            <img src="../images/icons/pages.jpg" />
            <br />
             تغيير كلمة مرور الأدمن
        </a>

        <a href="promotestudents.aspx" class="MainLink" >
            <img src="../images/icons/pages.jpg" />
            <br />
            نقل الطلاب الناجحين للمراحل الجديدة
        </a>

        <a href="HomePageVideos.aspx" class="MainLink" >
            <img src="../images/icons/pages.jpg" />
            <br />
             تحميل فيديوهات الصفحة الرئيسية
        </a>

         <a href="stats.aspx" class="MainLink" >
            <img src="../images/icons/pages.jpg" />
            <br />
             إحصائيات
        </a>
    </div>
</div>
</asp:Content>
