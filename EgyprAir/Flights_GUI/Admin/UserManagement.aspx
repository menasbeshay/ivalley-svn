<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="Flights_GUI.Admin.UserManagement" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .checker + label {
        display:inline !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span12 clearfix">

        <asp:panel runat="server" ID="uiPanelAll">
            <div class="span12 clearfix">
                <div class="span2 pull-right">
                    <asp:LinkButton runat="server" ID="uiLinkButtonAdd" CssClass="btn btn-primary" OnClick="uiLinkButtonAdd_Click">Add new user</asp:LinkButton>
                </div>
            </div>
            <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch" CssClass="span12 clearfix">
                        
                        <div class="span2">
                            <asp:Label ID="Label5" runat="server" Text="Search : " CssClass="Label"></asp:Label>
                            </div>
                            <div class="span5">
                            <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="300px"></asp:TextBox>
                            </div>
                        <div class="span2">
                            <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" OnClick="uiButtonSearch_Click"
                                Width="60px" Style="display: none;" />
                            
                                <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click" CssClass="btn btn-primary">Search</asp:LinkButton>
                            
                        </div>
                        
                    </asp:Panel>
            <div class="span12 clearfix">
                <telerik:radgrid id="uiRadGridUsers" runat="server" allowpaging="True" autogeneratecolumns="False"
                        cellspacing="0" horizontalalign="Center" skin="Office2007" width="90%" 
                        onpageindexchanged="uiRadGridUsers_PageIndexChanged" onpagesizechanged="uiRadGridUsers_PageSizeChanged" OnItemCommand="uiRadGridUsers_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="UserName" HeaderText="User name">
                                </telerik:GridBoundColumn>                                                                                                


                                <telerik:GridTemplateColumn HeaderText="Actions">
                                    <ItemTemplate>
                                         <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("UserName") %>'
                                            CommandName="EditUser">Edit</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("UserName") %>'
                                            CommandName="DeleteUser" OnClientClick="return confirm('Are you want to delete this record?');">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:radgrid>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </asp:panel>
        <asp:panel runat="server" ID="uiPanelEdit" CssClass="span12 clearfix">
            <div class="span12 clearfix">
             <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" Text="An error occured. please try again later."
                            Visible="False" CssClass="Label"></asp:Label>
                </div>
            <div class="span12 clearfix">
                <div class="span2">
                    Username : 
                </div>
                <div class="span4">
                    <asp:TextBox ID="uiTextBoxUserName" runat="server" Width="250px" ValidationGroup="EditUser"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxUserName" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="span12 clearfix">
                <div class="span2">
                    Password : 
                </div>
                <div class="span4">
                    <asp:TextBox ID="uiTextBoxPass" runat="server" Width="250px" ValidationGroup="EditUser"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxPass" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="span12 clearfix">
                <div class="span2">
                    Confirm password : 
                </div>
                <div class="span4">
                    <asp:TextBox ID="uiTextBoxConfirm" runat="server" Width="250px" ValidationGroup="EditUser"></asp:TextBox>
                    <asp:CompareValidator runat="server" ErrorMessage="*" ID="CompareValidator1"
                            ControlToValidate="uiTextBoxConfirm" Display="Dynamic" ValidationGroup="EditUser" ControlToCompare="uiTextBoxPass" ></asp:CompareValidator>
                        
                </div>
            </div>
             <div class="span12 clearfix">
                <div class="span2">
                   Roles :
                </div>
                <div class="span10">
                    <asp:CheckBoxList ID="uiCheckBoxListRoles" runat="server" CellPadding="5" CellSpacing="5"
                            RepeatColumns="5">
                        </asp:CheckBoxList>   
                </div>
            </div>
            
            <div class="span12 clearfix">
                <div class="span2">
                   &nbsp;
                </div>
                <div class="span4">
                    <asp:LinkButton runat="server" ID="uiLinkButtonSave" CssClass="btn btn-primary" OnClick="uiButtonUpdate_Click">Save</asp:LinkButton>
                    &nbsp;<asp:LinkButton runat="server" ID="uiLinkButtonCancel" CssClass="btn btn-primary" OnClick="uiButtonCancel_Click">Cancel</asp:LinkButton>   
                </div>
            </div>
            <div class="clearfix"></div>
        </asp:panel>
        <div class="clearfix"></div>
    </div>
</asp:Content>
