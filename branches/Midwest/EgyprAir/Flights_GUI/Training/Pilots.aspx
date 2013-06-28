<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Training.Master" AutoEventWireup="true" CodeBehind="Pilots.aspx.cs" Inherits="Flights_GUI.Training.Pilots" %>

<%@ MasterType VirtualPath="~/MasterPages/E_Training.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row-fluid">
        <div class="span12">
            <!-- BEGIN EXAMPLE TABLE widget-->
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        Pilots</h4>
                    <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                        class="icon-remove"></a></span>
                </div>
                <div class="widget-body">

                    <asp:Repeater ID="uiRepeaterPilots" runat="server" 
                        onitemdatabound="uiRepeaterPilots_ItemDataBound">
                    <HeaderTemplate>
                        <table class="table table-striped table-bordered" id="sample_1">
                            <thead>
                                <tr>
                                <th style="display:none"></th>
                                    <th class="hidden-phone center">
                                        Pilot
                                    </th>
                                    <th class="hidden-phone center">
                                        Short Name
                                    </th>
                                    <th class="hidden-phone center">
                                        License Code
                                    </th>
                                    <th class="hidden-phone center">
                                        Airport class
                                    </th>
                                    <th class="hidden-phone center">
                                        License Status
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="odd gradeX">
                        <td style="display: none"></td>
                            <td class="hidden-phone center">
                                <a href='PilotHome.aspx?pid=<%# Eval("PilotID") %>' ><%# Eval("FirstName").ToString() + " " + Eval("SureName").ToString()%></a>
                            </td>
                            <td class="hidden-phone center">
                                <%# Eval("ShortName").ToString()%>
                            </td>
                            <td class="hidden-phone center">
                                <%# Eval("LicenseNo").ToString()%>
                            </td>
                            <td class="center hidden-phone">
                                <asp:Label ID="uiLabelClass" runat="server" ></asp:Label>
                            </td>
                            <td class="hidden-phone center">
                                <asp:Literal ID="uiLiteralStatus" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="even gradeX">
                                <td style="display: none">
                                </td>
                                <td class="hidden-phone center">
                                    <a href='PilotHome.aspx?pid=<%# Eval("PilotID") %>'>
                                        <%# Eval("FirstName").ToString() + " " + Eval("SureName").ToString()%></a>
                                </td>
                                <td class="hidden-phone center">
                                    <%# Eval("ShortName").ToString()%>
                                </td>
                                <td class="hidden-phone center">
                                    <%# Eval("LicenseNo").ToString()%>
                                </td>
                                <td class="center hidden-phone">
                                    <asp:Label ID="uiLabelClass" runat="server"></asp:Label>
                                </td>
                                <td class="hidden-phone center">
                                    <asp:Literal ID="uiLiteralStatus" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>

                    <FooterTemplate>
                        </tbody> </table>
                    </FooterTemplate>
                    </asp:Repeater>
                    
                </div>
            </div>
            <!-- END EXAMPLE TABLE widget-->
        </div>
    </div>
</asp:Content>
