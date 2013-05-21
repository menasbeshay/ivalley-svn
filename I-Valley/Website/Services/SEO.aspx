<%@ Page Title="Search Engine Optimization (SEO)" Language="C#" MasterPageFile="~/MasterPages/Inner.Master"
    AutoEventWireup="true" CodeBehind="SEO.aspx.cs" Inherits="Website.Services.SEO" %>

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
            Search Engine Optimization (SEO)</p>
        <span>
            <p>
                S</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
        <div class="citer">
            <p>
       Search engine optimization (SEO) is the process of improving the volume and/or
        quality of traffic to a web site from search engines, via natural search results
        through increasing the positions of a web site within the search engines, using
        careful analysis and research techniques. A website needs to be written in a way
        that is considered to be friendly to Search Engines, if a website makes it easy
        for a website to be indexed (read) by the search engine spiders it has a greater
        chance of achieving good results in the Search Engine Result Pages (SERPs). The
        most critical step of a search engine optimization (SEO) is to understand how
        a search engine spider works, I-Valley know what the search engines are looking
        for and what techniques they give greater credibility to. Search engine optimization (SEO) helps companies and Agencies not only increase traffic to their websites,
        but also increase web generated sales, supported by the traffic quality and relevancy
        to the prospective buyers communities.
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
