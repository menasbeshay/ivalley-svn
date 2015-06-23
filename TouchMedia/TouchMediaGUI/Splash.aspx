<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAr.Master" AutoEventWireup="true" CodeBehind="Splash.aspx.cs" Inherits="TouchMediaGUI.Splash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <h3 class="JF">الرئيسية
            </h3>
            <ul class="breadcrumb">
                <li>
                    <a href="#"><i class="icon-home"></i></a><span class="divider divider-last">&nbsp;</span>
                </li>
            </ul>
            <div class="clearfix" style="height: 10px"></div>
        </div>
        <div class="row-fluid circle-state-overview" style="text-align: center">
            <div class="span2"></div>
            <div class="span8">
                <div class="row-fluid">
                    <div class="span4 responsive clearfix" data-tablet="span4" data-desktop="span4">
                        <a href="JobOrders.aspx" style="text-decoration:none;">
                            <div class="circle-wrap">
                                <div class="stats-circle turquoise-color" style="height:140px;width:140px">
                                    <i class="icon-briefcase" style="font-size:5em"></i>
                                </div>
                                <p>
                                    <strong>اوامر الشغل</strong>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="span4 responsive clearfix" data-tablet="span4" data-desktop="span4">
                        <a href="DeliveryOrder.aspx" style="text-decoration:none;">
                            <div class="circle-wrap">
                                <div class="stats-circle red-color" style="height:140px;width:140px">
                                    <i class="icon-truck" style="font-size:5em"></i>
                                </div>
                                <p>
                                    <strong>اوامر النقل</strong>
                                </p>
                            </div>
                        </a>
                    </div>
                    <div class="span4 responsive clearfix" data-tablet="span4" data-desktop="span4">
                        <a href="#" style="text-decoration:none;">
                            <div class="circle-wrap">
                                <div class="stats-circle green-color" style="height:140px;width:140px">
                                    <i class="icon-shopping-cart" style="font-size:5em"></i>
                                </div>
                                <p>
                                    <strong>اوامر الشراء</strong>
                                </p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <%--<div class="row-fluid metro-overview-cont">
            <div data-desktop="span2" data-tablet="span4" class="span2 responsive">
                <div class="metro-overview turquoise-color clearfix">
                    <div class="display">
                        <i class="icon-group"></i>
                        <div class="percent">+55%</div>
                    </div>
                    <div class="details">
                        <div class="numbers">530</div>
                        <div class="title">New Users</div>
                    </div>
                    <div class="progress progress-info">
                        <div style="width: 55%" class="bar"></div>
                    </div>
                </div>
            </div>
            <div data-desktop="span2" data-tablet="span4" class="span2 responsive">
                <div class="metro-overview red-color clearfix">
                    <div class="display">
                        <i class="icon-tags"></i>
                        <div class="percent">+36%</div>
                    </div>
                    <div class="details">
                        <div class="numbers">5440 $</div>
                        <div class="title">Monthly Sales</div>
                        <div class="progress progress-warning">
                            <div style="width: 36%" class="bar"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div data-desktop="span2" data-tablet="span4" class="span2 responsive">
                <div class="metro-overview green-color clearfix">
                    <div class="display">
                        <i class="icon-shopping-cart"></i>
                        <div class="percent">+46%</div>
                    </div>
                    <div class="details">
                        <div class="numbers">1000</div>
                        <div class="title">New Orders</div>
                        <div class="progress progress-success">
                            <div style="width: 46%" class="bar"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div data-desktop="span2" data-tablet="span4 fix-margin" class="span2 responsive">
                <div class="metro-overview gray-color clearfix">
                    <div class="display">
                        <i class="icon-comments-alt"></i>
                        <div class="percent">+26%</div>
                    </div>
                    <div class="details">
                        <div class="numbers">170</div>
                        <div class="title">Comments</div>
                        <div class="progress progress-warning">
                            <div style="width: 26%" class="bar"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div data-desktop="span2" data-tablet="span4" class="span2 responsive">
                <div class="metro-overview purple-color clearfix">
                    <div class="display">
                        <i class="icon-eye-open"></i>
                        <div class="percent">+72%</div>
                    </div>
                    <div class="details">
                        <div class="numbers">1130</div>
                        <div class="title">Unique Visitor</div>
                        <div class="progress progress-danger">
                            <div style="width: 72%" class="bar"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div data-desktop="span2" data-tablet="span4" class="span2 responsive">
                <div class="metro-overview blue-color clearfix">
                    <div class="display">
                        <i class="icon-bar-chart"></i>
                        <div class="percent">+20%</div>
                    </div>
                    <div class="details">
                        <div class="numbers">170</div>
                        <div class="title">Updates</div>
                        <div class="progress progress-success">
                            <div style="width: 20%" class="bar"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>
