<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminCP.aspx.cs" Inherits="Taqwa.Website.Admin.AdminCP" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminMain">
<h3 style="direction:rtl;padding-right:20px;">
    لوحة التحكم الرئيسية&nbsp;</h3>
    
    <div style="direction:rtl;padding-right:20px;">
    
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
</div>
</asp:Content>
