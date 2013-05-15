<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ArInner.Master" AutoEventWireup="true" CodeBehind="webdevelopment.aspx.cs" Inherits="Website.ar.services.webdevelopment" %>
<%@ Register src="../../controls/RequestService.ascx" tagname="RequestService" tagprefix="uc1" %>
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
    <div id="banner" class="webdevelopmentBanner">
        <p style="color: #a82743;">
            Web Development</p>
        <span>
        <p>
                W</p>
        </span>
    </div>
    <div id="InnerContentWrapper" class="row">
        <div class="citer">
            <p>
                With <span class="CompanyName">I-Valley</span> you have multiple options to develop your web solution, our web development
                packages not only focus in website development but also we interested in doing system
                application development via web system such like office automations, Document Archiving,
                Portals, CRM solutions and more … On I-Valley our web solutions divided into the
                following services:
            </p>
            <div class="large-6 columns webDev" style="padding: 5px; border-right: 2px solid #a82743">
                <h4>
                    Custom web development</h4>
                <p>
                    <br />It's many benefits for your business to develop your business needs in such software,
                    <span class="CompanyName">I-Valley</span> help you to do that by providing it's
                    experience in tailoring your needs in software implementing your needs, we doing
                    that in professional way by implementing the full software Development Life Cycle
                    (SDLC) :
                </p>
                <div class="clear-fix">
                </div>
                <div style="width: 100%; text-align: center;">
                    <img src="../../images/8-services/w1.png" /></div>
                <div class="clear-fix">
                </div>
                <p>
                    In the custom development we can implement any idea you suggest in order to upgrade
                    and enhance your business such like:
                    </p>
                <ul style="margin-left:10px;list-style-position:inside !important;">
                    <li>Web site development </li>
                    <li>Office automation </li>
                    <li>Business process management </li>
                    <li>Document Archiving </li>
                    <li>Customer Relationship Management (CRM) </li>
                    <li>Enterprise Resource Planning (ERP)</li>
                </ul>
                <br />
                <p>
                    All what you need to do just contacting our sales team by Requesting service then
                    we can handle it with your from the initial phase of requirement engineering till
                    your software deploy and delivery. 
                    
                    <div id="buttons">
                        <a class="largeButton" id="requestButton" style="margin-left:120px;width:190px;cursor:pointer;line-height:0px">Requesting service
                        </a>
                        <div class="clear-fix" style="height: 15px;">
                        </div>
                </div>
                    
                    Also you can know more about what we have by
                    visiting:
                    <div class="clear-fix" style="height: 15px;">
                </div>
                <div id="buttons">
                    <div class="clear-fix" style="height: 5px;">
                    </div>
                    <a class="largeButton" style="margin-left: 70px; width: 320px; line-height: 0px"
                            href="Technologies.aspx">Our Tools and Technologies
                            we know
                        </a>
                    <div class="clear-fix" style="height: 5px;">
                    </div>
                    <a class="largeButton" style="margin-left: 100px; width: 230px; line-height: 0px"
                            href="../Portfolio.aspx">Enjoy with our portfolio</a>
                </div>
                </p>
            </div>
            <div class="large-6 columns webDev" style="padding: 5px;">
                <h4>
                    CMS websites customization 
                </h4>
                <p>
                    <br />By choosing Content Management System website customization you are putted your
                    hand on the faster, easy to use, cheaper and most powerful way to develop your organization
                    website. With CMS websites you can have the following :
                </p>
                <ul style="margin-left: 20px;">
                    <li>Manage your website contents and data including (products – galleries – html contents).</li>
                    <li>Add new website sections without back to the website developer</li>
                    <li>Add new pages with its contents.</li>
                    <li>Complete Search Engine Optimization for your contents</li>
                    <li>Flexible design templates (you can change your full website design with minimum
                        efforts)</li>
                    <li>I-valley will provide complete website administration manual in order to enable
                        your team to manage everything without paying any extra fees. </li>
                </ul>
                <div class="clear-fix">
                </div>
                <br />
                <div style="width: 100%; text-align: center;">
                    <img src="../../images/8-services/wordpress-icon.png" style="width: 100px" />
                    <img src="../../images/8-services/DNN1.png" style="width: 100px" />
                    <img src="../../images/8-services/joomla.png" style="width: 100px" />
                    <div class="clear-fix">
                    </div>
                </div>
                <div class="clear-fix" style="height:10px;">
                </div>
                <p>
                    <span class="CompanyName">I-Valley</span> can provide it's CMS websites developing and customization into the following
                three technologies : 
                </p>
                <ul style="margin-left: 20px;">
                    <li>Joomla</li>
                    <li>WordPress</li>
                    <li>DotNetNuke</li>
                </ul>
                <p>
                    In order to start getting this service from <span class="CompanyName">I-Valley</span> you need to go into the following 3 steps:
                </p>
                <ol style="margin-left: 20px;">
                    <li>Choose your template design</li>
                    <li>Choose your price package</li>
                    <li>Request Service from <span class="CompanyName">I-Valley</span></li>
                </ol>
                <div id="buttons" style="margin-left:160px;">
                    <div class="clear-fix" style="height: 5px;">
                    </div>
                    <a class="largeButton" style="width: 250px; line-height: 0px" 
                        href="CMSWizard.aspx">Start your website now</a>
                </div>
            </div>
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
