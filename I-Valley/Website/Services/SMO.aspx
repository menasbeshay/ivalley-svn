<%@ Page Title="Social Media Optimization (SMO)" Language="C#" MasterPageFile="~/MasterPages/Inner.Master"
    AutoEventWireup="true" CodeBehind="SMO.aspx.cs" Inherits="Website.Services.SMO" %>

<%@ Register Src="../controls/RequestService.ascx" TagName="RequestService" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="requestForm" title="Request service">
        <uc1:RequestService ID="RequestService1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="display: none;">
                    <asp:Button ID="uiButtonReset" runat="server" Text="Button" OnClick="uiButtonReset_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="banner">
        <p>
            Social Media Optimization (SMO)</p>
        <span>
            <p>
                S</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
        <div class="citer">
            <p>
        Social Media Optimization (SMO) is a set of methods for generating publicity through
        social media, online communities and community websites. Methods of (SMO) include
        adding RSS feeds, social news buttons, blogging, and incorporating third party community
        functionalities like images and videos. Using Consumer Generated Media (CGM) and
        Social Networking platforms such as blogs, Facebook, MySpace, Flickr, YouTube and
        Twitter - Social Media Optimization (SMO) allows you to spread your branded message
        to the world. For the best results, <span class="CompanyName">I-Valley</span> encourages direct interaction between
        the many various Social Media platforms. Brands and consumers can communicate in
        an open, honest and personal arena, which strengthens your company's presence online
        and drives traffic to your website. Mediocre engagement doesn't breed success -
        Social Media is about capturing your markets attention and interest and softly utilizing
        it to maximum value.
        </p>
        </div>
        <%--<div style="width: 49%; border: 3px solid #FF6600 !important; border-radius: 15px !important;
            -moz-border-radius: 15px !important; -webkit-border-radius: 15px !important;
            padding: 15px; text-align: center; font-weight: bold; font-size: 18px;">  --%>         
            <div id="buttons" style="margin:0 auto;width:380px;">
                <a class="largeButton" id="requestButton" style="margin-left: 100px; margin-right: 100px;
                    margin-top: 5px; cursor: pointer; line-height: 0px">Requesting service </a>
                <div class="clear-fix" style="height: 5px;">
                </div>
            </div>
            <div class="clear-fix">
            </div>
        <%--</div>--%>

    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var dlg = $("#requestForm").dialog({
                autoOpen: false,
                width: 400,
                modal: true,
                close: function (event, ui) { $("#<%= uiButtonReset.ClientID %>").click(); }

            });

            dlg.parent().appendTo($("form:first"));

            $("#requestButton")
      .click(function () {
          $("#requestForm").dialog("open");
      });


        });
    </script>
    <style type="text/css">
#requestForm select{display:block !important;}
</style>
</asp:Content>
