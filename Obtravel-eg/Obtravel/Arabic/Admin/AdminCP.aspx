<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARNoBanner.Master" AutoEventWireup="true" CodeBehind="AdminCP.aspx.cs" Inherits="Obtravel.Arabic.Admin.AdminCP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminCP">

    <h1>لوحة التحكم </h1>
    <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="../../Admin/ChooseLanguage.aspx">العودة إلى الرئيسية</a>
                            </div>                           
                        </div>
    
     <div class="btn" style="display:none"><asp:LinkButton ID="uiLinkButtonEditAboutPage" runat="server" 
            onclick="uiLinkButtonEditAboutPage_Click" style="float:right">تعديل من نحن</asp:LinkButton>
    </div>
    
    <div class="clear10px"></div>
    <div class="btn">
        <asp:LinkButton ID="uiLinkButtonEditCompanyProfile" runat="server" onclick="uiLinkButtonEditCompanyProfile_Click" 
            style="float:right" >تعديل نبذة عن الشركة</asp:LinkButton>
    </div>
    <div class="clear10px"></div>
    <div class="btn">
        <asp:LinkButton ID="uiLinkButtonEditMissionVision" runat="server" onclick="uiLinkButtonEditMissionVision_Click" 
            style="float:right" >تعديل الرؤية والرسالة</asp:LinkButton>
    </div>
    <div class="clear10px"></div>
    <div class="btn">
        <asp:LinkButton ID="uiLinkButtonEditKeyPersons" runat="server" onclick="uiLinkButtonEditKeyPersons_Click" 
             style="float:right">تعديل  key Persons</asp:LinkButton>
    </div>
    <div class="clear10px"></div>
    <div class="btn" >
        <asp:LinkButton ID="uiLinkButtonEditConactPage" runat="server" onclick="uiLinkButtonEditConactPage_Click" 
            style="float:right">تعديل إتصل بنا </asp:LinkButton>
    </div>
    <div class="clear10px"></div>

    <div class="btn"><asp:HyperLink ID="uiHyperLinkHomeBlocks" runat="server" 
            NavigateUrl="~/Arabic/Admin/EditHomeBlocks.aspx" style="float:right">تعديل الصفحة الرئيسية</asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkEditServices" runat="server" 
            NavigateUrl="~/Arabic/Admin/EditServices.aspx" style="float:right">تعديل الخدمات</asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkEditTourismLists" runat="server" 
            NavigateUrl="~/Arabic/Admin/EditTourismList.aspx" style="float:right">تعديل الرحلات</asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkEditTicker" runat="server" 
            NavigateUrl="~/Arabic/Admin/EditTicker.aspx" style="float:right">تعديل شريط الأخبار</asp:HyperLink>
    </div>
<div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkViewContactSubmit" runat="server" 
            NavigateUrl="~/Arabic/Admin/ContactForm.aspx" style="float:right">بيانات المتصلين </asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkEditMusic" runat="server" 
            NavigateUrl="~/Arabic/Admin/UploadSiteMusic.aspx" style="float:right">تعديل موسيقى الموقع</asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkBookingMails" runat="server" 
            NavigateUrl="~/Arabic/Admin/BookingMails.aspx"  style="float:right">تعديل البريد الإلكترونى الخاص بالحجز</asp:HyperLink>
    </div>
</div>
</asp:Content>
