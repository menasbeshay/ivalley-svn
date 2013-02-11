<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENNoBanner.Master" AutoEventWireup="true" CodeBehind="AdminCP.aspx.cs" Inherits="Obtravel.Admin.AdminCP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminCP">

    <h1>Admin Control Panel</h1>
    <div class="ServicesControls AdminCP" style="width:140px">
                            <div class="btn">
                                <a href="ChooseLanguage.aspx">Back to admin home</a>
                            </div>                           
                        </div>
    
    <div class="btn" style="display:none;"><asp:LinkButton ID="uiLinkButtonEditAboutPage" runat="server" 
            onclick="uiLinkButtonEditAboutPage_Click" >Edit About Us</asp:LinkButton>
    </div>
    <div class="clear10px"></div>
    <div class="btn">
        <asp:LinkButton ID="uiLinkButtonEditCompanyProfile" runat="server" onclick="uiLinkButtonEditCompanyProfile_Click" 
             >Edit Company Profile</asp:LinkButton>
    </div>
    <div class="clear10px"></div>
    <div class="btn">
        <asp:LinkButton ID="uiLinkButtonEditMissionVision" runat="server" onclick="uiLinkButtonEditMissionVision_Click" 
             >Edit Mission & Vision</asp:LinkButton>
    </div>
    <div class="clear10px"></div>
    <div class="btn">
        <asp:LinkButton ID="uiLinkButtonEditKeyPersons" runat="server" onclick="uiLinkButtonEditKeyPersons_Click" 
             >Edit key Persons</asp:LinkButton>
    </div>
    <div class="clear10px"></div>
    <div class="btn">
        <asp:LinkButton ID="uiLinkButtonEditConactPage" runat="server" onclick="uiLinkButtonEditConactPage_Click" 
            >Edit Conact Us</asp:LinkButton>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkHomeBlocks" runat="server" 
            NavigateUrl="~/Admin/EditHomeBlocks.aspx">Edit Home Page </asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkEditServices" runat="server" 
            NavigateUrl="~/Admin/EditServices.aspx">Edit Services</asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkEditPackages" runat="server" 
            NavigateUrl="~/Admin/EditPackages.aspx">Edit Packages</asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkEditTicker" runat="server" 
            NavigateUrl="~/Admin/EditTicker.aspx">Edit Ticker</asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkViewContactSubmit" runat="server" 
            NavigateUrl="~/Admin/ContactForm.aspx">View Contact Submits</asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkEditMusic" runat="server" 
            NavigateUrl="~/Admin/UploadSiteMusic.aspx">Edit Site Music</asp:HyperLink>
    </div>
    <div class="clear10px"></div>
    <div class="btn"><asp:HyperLink ID="uiHyperLinkBookingMails" runat="server" 
            NavigateUrl="~/Admin/BookingMails.aspx">Edit Booking Emails</asp:HyperLink>
    </div>
</div>
</asp:Content>
