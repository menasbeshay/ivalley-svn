<%@ Page Title="Search Engine Marketing (SEM)" Language="C#" MasterPageFile="~/MasterPages/Inner.Master"
    AutoEventWireup="true" CodeBehind="SEM.aspx.cs" Inherits="Website.Services.SEM" %>

<%@ Register Src="../controls/RequestService.ascx" TagName="RequestService" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="requestForm" title="Request service">
        <uc1:requestservice id="RequestService1" runat="server" />
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
            Search Engine Marketing (SEM)</p>
        <span>
            <p>
                S</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
        <div class="citer">
            <p>
        Search engine marketing (SEM) is a form of e-marketing that seeks to promote websites
        by increasing their visibility in Search Engine Result Pages (SERPs) through the
        use of contextual advertising, paid inclusion and Pay-Per-Click (PPC). PPC is the
        sponsored links. The sponsored links are the first results appear in the colored
        box in SERPs and/or the right column of SERPs. The Search engine displays the ads
        in response to the initial search query and the advertiser, only pays once the ads
        are clicked on. This makes PPC an efficient way of advertising, even for smaller
        businesses. Search engine marketing (SEM) provides companies with several advantages:
        <ul>
        <li>Ability to target (Ability to deliver the right offer to the right user at the right
            time)</li>
            <li>Fast</li>
            <li>Measurable results </li>
            <li>Flexible</li>
            <li>Less production time and lower costs </li>
            <li>Higher ROI relative to other media</li>
        </ul>
        </p></div>
        <%--<div style="width: 49%; border: 3px solid #FF6600 !important; border-radius: 15px !important;
            -moz-border-radius: 15px !important; -webkit-border-radius: 15px !important;
            padding: 15px; text-align: center; font-weight: bold; font-size: 18px;">  --%>
        <div id="buttons" style="margin: 0 auto; width: 380px;">
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
