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
        .checkSections td label {
            display:inline;
            padding-right:5px;
            padding-left:10px;
        }

        .checkSections {
            margin-bottom:15px;
        }
    </style>
    <link href="js/jqwidgets/styles/jqx.base.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
        <li>
            <a href="Splash.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
        </li>
        <li>أوامر الشغل<span class="divider-last">&nbsp;</span>
        </li>
    </ul>
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
                            <asp:HiddenField runat="server" ID="uiHiddenFieldCurrentJO" ClientIDMode="Static" Value="0" />
                            <asp:Panel ID="uiPanelAll" runat="server">
                                <div class="span12 clearfix block-margin-bottom-5">
                                    <div class="span2">
                                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonAdd_Click">إضافة أمر شغل جديد</asp:LinkButton>
                                    </div>
                                </div>
                                <asp:GridView ID="uiGridViewJOs" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-condensed" EmptyDataText="لا يوجد بيانات">
                                    <Columns>                                        
                                        <asp:BoundField DataField="JobOrderCode" HeaderText="كود أمر الشغل" />
                                        <asp:BoundField DataField="JobOrderName" HeaderText="الإسم " />
                                        <asp:BoundField DataField="CreatedDate" HeaderText="التاريخ"  DataFormatString="{0:dd/MM/yyyy}"/>
                                        <asp:BoundField DataField="ClientName" HeaderText="العميل " />
                                        <asp:TemplateField HeaderText="الحالة">
                                            <ItemTemplate>
                                                <span class='label label-<%# Eval("StatusClass") %>'><%# Eval("StatusNameAr") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="إجراءات">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="btnDeleteGrdDO" OnClientClick="return confirm('هل تريد حذف هذا السجل ?')"  runat="server" CommandArgument='<%# Eval("JobOrderID") %>' CommandName="DeleteJO">حذف</asp:LinkButton>
                                            <asp:LinkButton ID="btnEditGrdDO" runat="server" CommandArgument='<%# Eval ("JobOrderID") %>' CommandName="EditJO">تعديل</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
    <script src="js/jqwidgets/jqxnumberinput.js"></script>
    <script src="js/jqwidgets/jqxmaskedinput.js"></script>
    <script type="text/javascript" src="js/jqwidgets/globalization/globalize.js"></script>
    <script src="js/jqwidgets/globalization/localization.js"></script>
    <script src="js/JO.js"></script>

</asp:Content>
