<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARNoBanner.Master" AutoEventWireup="true" CodeBehind="UploadSiteMusic.aspx.cs" Inherits="Obtravel.Arabic.Admin.UploadStieMusic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div><h1> تحميل موسيقى الموقع</h1>
    <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">العودة إلى لوحة التحكم</a>
                            </div>                           
                        </div>
    </div>
<div class="clear10px"></div>

<div style="width:130px;margin-top:4px;float : right;direction:rtl;">إختر الملف (Mp3) :</div>
<div class="smallrightHeight">
    <asp:FileUpload ID="uiFileUpload" runat="server" />
    </div>
    <div style="float:right; margin-right:5px;">
        <asp:Label ID="uiLabelError" runat="server" Text="من فضلك إختر ملف للتحميل" Visible="false"></asp:Label>
    </div>
    <div class="clear"></div>
    <div style="float : right;width:130px;">&nbsp;</div>
<div class="smallrightHeight">
    <asp:Button ID="uiButtonUpload" runat="server" Text="تحميل" 
        onclick="uiButtonUpload_Click" />
    </div>
</asp:Content>
