<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENNoBanner.Master" AutoEventWireup="true" CodeBehind="UploadSiteMusic.aspx.cs" Inherits="Obtravel.Admin._UploadSiteMusic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div><h1> Upload Site Music</h1>
    <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">Back to Admin CP</a>
                            </div>                           
                        </div>
    </div>
<div class="clear10px"></div>

<div style="width:130px;margin-top:4px;float : left;">Choose your MP3 file :</div>
<div class="smallrightHeight">
    <asp:FileUpload ID="uiFileUpload" runat="server" />
    </div>
    <div style="float:left; margin-left:110px;">
        <asp:Label ID="uiLabelError" runat="server" Text="No file seletced" Visible="false"></asp:Label>
    </div>
    <div class="clear"></div>
    <div style="float : left;width:130px;">&nbsp;</div>
<div class="smallrightHeight">
    <asp:Button ID="uiButtonUpload" runat="server" Text="Upload" 
        onclick="uiButtonUpload_Click" />
    </div>
</asp:Content>
