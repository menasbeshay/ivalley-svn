<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testrad.aspx.cs" Inherits="Flights_GUI.Test.testrad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <telerik:RadEditor ID="RadEditor1" runat="server"><Content>
</Content>
            <ImageManager DeletePaths="~/FileUploads" UploadPaths="~/FileUploads" ViewPaths="~/FileUploads" />
            <SilverlightManager DeletePaths="~/FileUploads" UploadPaths="~/FileUploads" ViewPaths="~/FileUploads" />
        </telerik:RadEditor>
        <telerik:RadGrid ID="uiRadGrid" runat="server" AutoGenerateColumns="False" 
                            HorizontalAlign="Center" Width="95%" AllowPaging="True" CellSpacing="0" 
                            Skin="Default" PageSize="3" 
            onpageindexchanged="uiRadGrid_PageIndexChanged">
                        
                        <MasterTableView HierarchyDefaultExpanded="false" HierarchyLoadMode="Client"
                             Width="100%" >                            
                            <Columns>
                            <telerik:GridBoundColumn DataField="FlightNo" HeaderText="Flight No."></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReportDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ReportID") %>'
                                        CommandName="EditReport"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ReportID") %>'
                                        CommandName="DeleteReport" OnClientClick="return confirm('Are you want to delete this record?');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            </Columns>                                                                                                                
                        </MasterTableView>                                      
                        <HeaderStyle HorizontalAlign="Center" />
                    </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
