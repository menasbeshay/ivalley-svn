<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="SectorCabinCrew.aspx.cs" Inherits="Flights_GUI.Operation.SectorCabinCrew" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../Common/Controls/SectorInfo.ascx" tagname="SectorInfo" tagprefix="uc1" %>
<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
           
.seprator
{
    color: #FFFFFF;
    font-weight: bold;    
    font-family: Tahoma, Geneva, sans-serif;
    text-align: left;
    background-color: #79BCFF;
    padding: 2px;
    display: block;
    clear: both;
    padding-left:30px;
    margin:10px 0;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
       
        <div class="Details900">
            <div class="whiteArea">
            <asp:UpdatePanel ID="uiUpdatePanel" runat="server">
                <ContentTemplate>
                    
                        <asp:LinkButton ID="uiLinkButtonBack" runat="server" OnClick="uiLinkButtonBack_Click" CssClass="btn btn-primary pull-right">Back to flight list</asp:LinkButton>
                    
                               
                    <div>                    
                        <uc1:SectorInfo ID="SectorInfo1" runat="server" />
                    </div>
                    <div class="clear" style="height: 5px;">
                    </div>
                                    <div class="seprator">
                                       Manage Cabin Crew
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div style="float:left;padding:15px;width:40%;">
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label28" runat="server" Text="Crew Member" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCrew" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                    <div class="AdminRight">
                                    </div>
                                   <div class="clear" style="height:5px;">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label29" runat="server" CssClass="Label" Text="Position"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCrewPos" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear" style="height:5px;">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        &nbsp;</div>
                                    <div class="AdminMiddle">
                                        <div class="More" style="float: left; height: 15px;">
                                            <asp:LinkButton ID="uiLinkButtonAddCrew" runat="server" OnClick="uiLinkButtonAddCrew_Click" CssClass="btn btn-primary">Add crew Member</asp:LinkButton></div>
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    <div class="clear10">
                                    </div>
                                    </div>
                                    <div class="AdminMiddle" style="text-align: center; width: 100%;">
                                        <asp:GridView ID="uiGridViewCrew" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                            OnRowCommand="uiGridViewCrew_RowCommand" OnRowDataBound="uiGridViewCrew_RowDataBound"
                                            Width="80%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Staff No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelStaffNo" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelName" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Position">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelPosition" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Actions">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ReportCrewID") %>'
                                                            CommandName="DeleteCrew">
                                        <img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" />
                                                        </asp:LinkButton></ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                    <div class="clear">
                                    </div>                                
                </ContentTemplate>
                <Triggers>                    
                    <asp:PostBackTrigger ControlID="uiLinkButtonBack" />
                </Triggers>
            </asp:UpdatePanel>
            </div>
        </div>
        </div>
</asp:Content>
