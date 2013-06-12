<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CabinCrew.Master" AutoEventWireup="true" CodeBehind="Activities.aspx.cs" Inherits="Flights_GUI.CabinCrew.Activities" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi6").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:Panel ID="uiPanelViewAll" runat="server">
    <div class="ContentLeftDiv">
        <h4>
            Activities
        </h4>
        <div class="Details900">
        <div class="More" style="float: left;">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new activity</asp:LinkButton>
                </div>
                <div class="clear10">
                </div>
                <div class="AdminMiddle" style="width: 100%;padding-left:5%;">
                <telerik:RadGrid ID="uiRadGridActivities" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" Skin="Office2007" Width="90%"                         
                        onpageindexchanged="uiRadGridActivities_PageIndexChanged"                          
                        onitemcommand="uiRadGridActivities_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="Name"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="ShortName" HeaderText="Shor Name"></telerik:GridBoundColumn>                        
                        <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>                                
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ActivityID") %>'
                                        CommandName="EditActivity"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ActivityID") %>'
                                        CommandName="DeleteActivity" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:RadGrid>
                </div>
                <div class="clear5">
                </div>
        </div>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelEdit" runat="server">
    <div class="ContentLeftDiv">
        <h4>
           Edit Activities
        </h4>
        <div class="Details900">
            <div class="AdminLeft" style="width: 120px">
                <asp:Label ID="Label1" runat="server" Text="Name" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxName" runat="server"></asp:TextBox>
            </div>
            <div class="AdminRight">
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="uiTextBoxName" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red" ValidationGroup="Activities"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminLeft" style="width: 120px">
                <asp:Label ID="Label2" runat="server" Text="Short Name" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxShortName" runat="server"></asp:TextBox>
            </div>
            <div class="AdminRight">
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="uiTextBoxShortName" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red" ValidationGroup="Activities"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>

            <div class="AdminLeft" style="width: 120px">
                &nbsp;&nbsp;</div>
            <div class="AdminMiddle">
                <div class="More" style="float: left;">
                    <asp:LinkButton ID="uiButtonSave" runat="server" Text="Save" 
                        OnClick="uiButtonSave_Click" ValidationGroup="Activities"></asp:LinkButton></div>
                &nbsp;<div class="More" style="float: left; margin-left: 10px;">
                    <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="Cancel" OnClick="uiLinkButtonCancel_Click"></asp:LinkButton></div>
            </div>
            <div class="AdminRight">
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    </asp:Panel>
</asp:Content>
