<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="JobOrders.aspx.cs" Inherits="TouchMediaGUI.JobOrders" %>
<%@ MasterType VirtualPath="~/MasterAr.Master" %>
<%@ Register src="usercontrols/ucEditJO.ascx" tagname="ucEditJO" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tabs-right > ul li {
            position:relative;
        }

        .tabs-right > ul li a .current {
             width:5px;
            display:inline-block;
            position:absolute;
            right:0px;
            height:38px;
            top:0;
            background-color:transparent;
            border-radius:0px 5px 5px 0px;
        }
        .tabs-right > ul li.active a .current {
           
            background-color:#A5D16C;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row-fluid">
        <div class="span12">

            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-reorder"></i>أوامر الشغل</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a href="javascript:;" class="icon-remove"></a>
                    </span>
                    
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">

                            <asp:Panel ID="uiPanelAll" runat="server"></asp:Panel>
                            <asp:Panel ID="uiPanelEdit" runat="server">
                                <uc1:ucEditJO ID="ucEditJO" runat="server" />
                            </asp:Panel>

                        </div>
                    </div>
                </div>

            </div>





        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScripts" runat="server">
    <script src="assets/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <link href="assets/bootstrap-wizard/prettify.css" rel="stylesheet" />
    <script src="assets/bootstrap-wizard/prettify.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#rootwizard').bootstrapWizard({ 'tabClass': 'nav nav-tabs' });
    });
</script>
</asp:Content>
