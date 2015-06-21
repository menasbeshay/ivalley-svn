<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="JobOrders.aspx.cs" Inherits="TouchMediaGUI.JobOrders" %>
<%@ MasterType VirtualPath="~/MasterAr.Master" %>
<%@ Register src="usercontrols/ucEditJO.ascx" tagname="ucEditJO" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tabs-right   {
            min-height:350px;
            position:relative;
        }
         .tabs-right ul.nav-tabs  {
            min-height:350px;
        }
         .tabs-right ul.pager   {
            position:absolute;
            bottom:0;
        }
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

        .row-fluid [class*="span"] {
            margin-right:0 !important;
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

                            <asp:Panel ID="uiPanelAll" runat="server">
                                <asp:GridView ID="uiGridViewJOs" runat="server" AutoGenerateColumns="false">
                                    <Columns>                                        
                                        <asp:BoundField DataField="JobOrderCode" HeaderText="كود أمر الشغل" />
                                        <asp:BoundField DataField="JobOrderName" HeaderText="الإسم " />
                                        <asp:BoundField DataField="ClientName" HeaderText="العميل " />
                                        <asp:TemplateField HeaderText="الحالة">
                                            <ItemTemplate>
                                                <span class='label label-<%# Eval("StatusClass") %>'><%# Eval("StatusNameAr") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CreatedDate" HeaderText="التاريخ" />
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
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

    <script type="text/javascript" src="js/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxgrid.filter.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxgrid.sort.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxgrid.selection.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxgrid.edit.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxgrid.columnsresize.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxcalendar.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxradiobutton.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="js/jqwidgets/jqxcheckbox.js"></script>
    <script src="js/jqwidgets/jqxmaskedinput.js"></script>
    <script type="text/javascript" src="js/jqwidgets/globalization/globalize.js"></script>
    <script src="js/JO.js"></script>

</asp:Content>
