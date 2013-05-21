<%@ Page Title="E-mail marketing" Language="C#" MasterPageFile="~/MasterPages/Inner.Master" AutoEventWireup="true" CodeBehind="EmailMarketing.aspx.cs" Inherits="Website.Services.EmailMarketing" %>

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
            Email Marketing</p>
        <span>
            <p>
                E</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
        <div class="citer">
            <p>
        E-mail Marketing Is a form of direct marketing, which uses electronic mail as a
        means of commercial communicating. In its broadest sense, every e-mail sent to a
        potential or current customer could be considered e-mail marketing. 
        <span class="CompanyName">
            I-Valley</span>
        have
        very good product to help you in sending bulk mails to more than 10,000 of customers
        with unlimited mails each day … you can contact us for more information about how
        to use our email marketing software.
        </p>
        <div style="float: left; width: 50%">
            <a style="display: block;float:left; margin: 5px;" href="../images/8-services/mailmarketing/1.jpg" rel="prettyPhoto">
                <img src="../images/8-services/mailmarketing/1.jpg" style="display: block; border: 2px solid #FF6600 !important;
                    border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;width:120px;height:120px" />
            </a><a style="display: block;float:left; margin: 5px;" href="../images/8-services/mailmarketing/2.jpg" rel="prettyPhoto">
                <img src="../images/8-services/mailmarketing/2.jpg" style="display: block; border: 2px solid #FF6600 !important;
                    border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                    width:120px;height:120px" />
            </a><a style="display: block;float:left; margin: 5px;" href="../images/8-services/mailmarketing/3.jpg" rel="prettyPhoto">
                <img src="../images/8-services/mailmarketing/3.jpg" style="display: block; border: 2px solid #FF6600 !important;
                    border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                    width:120px;height:120px" />
            </a><a style="display: block;float:left; margin: 5px;" href="../images/8-services/mailmarketing/4.jpg" rel="prettyPhoto">
                <img src="../images/8-services/mailmarketing/4.jpg" style="display: block; border: 2px solid #FF6600 !important;
                    border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                    width:120px;height:120px" />
            </a><a style="display: block;float:left; margin: 5px;" href="../images/8-services/mailmarketing/5.jpg" rel="prettyPhoto">
                <img src="../images/8-services/mailmarketing/5.jpg" style="display: block; border: 2px solid #FF6600 !important;
                    border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                    width:120px;height:120px" />
            </a><a style="display: block;float:left; margin: 5px;" href="../images/8-services/mailmarketing/6.jpg" rel="prettyPhoto">
                <img src="../images/8-services/mailmarketing/6.jpg" style="display: block; border: 2px solid #FF6600 !important;
                    border-radius: 5px !important; -moz-border-radius: 5px !important; -webkit-border-radius: 5px !important;
                    width:120px;height:120px" />
            </a>
        </div>
        <div style="float: left; width: 49%; border: 3px solid #FF6600 !important; border-radius: 15px !important;
            -moz-border-radius: 15px !important; -webkit-border-radius: 15px !important;padding:15px;text-align:center;font-weight:bold;font-size:18px;">
            you can get all these features and with            
            10000 mails 
            <br />
            All for 100 EGP/mo.
            
            <div id="buttons">
                <a class="largeButton" id="requestButton" style="margin-left: 100px; margin-right: 100px;
                    margin-top: 5px; font-weight: normal; cursor: pointer; line-height: 0px">Requesting service </a>
                <div class="clear-fix" style="height: 5px;">
                </div>
            </div>

            <div class="clear-fix">
            </div>
            </div>
        
        <div class="clear-fix"></div>
        </div>
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
