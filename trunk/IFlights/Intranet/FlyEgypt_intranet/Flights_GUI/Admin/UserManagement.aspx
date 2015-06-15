<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ExceptionLight.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="Flights_GUI.Admin.UserManagement" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/ExceptionLight.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .checker + label {
            display: inline !important;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.notify-row .btn-inverse').removeClass("active");
            $('#mi_top_Manage_Users').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cell-12 clearfix">
        <asp:Panel runat="server" ID="uiPanelAll">
            <div class="cell-12 clearfix margin-bottom-10" style="padding-left:0px !important">
                <div class="cell-2 pull-right">
                    <asp:LinkButton runat="server" ID="uiLinkButtonAdd" CssClass="btn btn-primary" OnClick="uiLinkButtonAdd_Click">Add new user</asp:LinkButton>
                </div>
            </div>

            <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch" CssClass="cell-12 clearfix margin-bottom-10">

                <div class="cell-1" style="padding-left:0px !important;padding-top:7px;">
                    <asp:Label ID="Label5" runat="server" Text="Search : " CssClass="Label"></asp:Label>
                </div>
                <div class="cell-4">
                    <asp:TextBox ID="uiTextBoxSearch" runat="server" style="padding:5px;width:95%"></asp:TextBox>
                </div>
                <div class="cell-1">
                    <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" OnClick="uiButtonSearch_Click"
                        Width="60px" Style="display: none;" />

                    <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click" CssClass="btn btn-primary">Search</asp:LinkButton>

                </div>

            </asp:Panel>
            <div class="cell-12 clearfix">
                <telerik:RadGrid ID="uiRadGridUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellSpacing="0" HorizontalAlign="Center" EnableEmbeddedSkins="False" Width="90%"
                    OnPageIndexChanged="uiRadGridUsers_PageIndexChanged" OnPageSizeChanged="uiRadGridUsers_PageSizeChanged" OnItemCommand="uiRadGridUsers_ItemCommand">
                    <AlternatingItemStyle HorizontalAlign="Center" />
                    <MasterTableView>
                        <Columns>
                            <telerik:GridBoundColumn DataField="UserName" HeaderText="User name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FullName" HeaderText="Full name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Email" HeaderText="Email">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="Roles">
                                <ItemTemplate>
                                    <%# string.Join("," ,Roles.GetRolesForUser(Eval("UserName").ToString())) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="lastactivitydate" HeaderText="Last login date" DataFormatString="{0:dd/MM/yyyy HH:mm}">
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
                </telerik:RadGrid>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </asp:Panel>
        <asp:Panel runat="server" ID="uiPanelEdit" CssClass="cell-12 clearfix">
            <div class="cell-12 clearfix">
                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" Text="An error occured. please try again later."
                    Visible="False" CssClass="Label"></asp:Label>
            </div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Username : 
                </div>
                <div class="cell-4">
                    <asp:TextBox ID="uiTextBoxUserName" runat="server" Width="250px" ValidationGroup="EditUser"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                        ControlToValidate="uiTextBoxUserName" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                </div>
                <div class="cell-2"></div>
                <div class="cell-4">
                    <img id="userImg" style="position:absolute;max-height:200px"  runat="server" src="../img/noImg.gif" />
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Password : 
                </div>
                <div class="cell-4">
                    <asp:TextBox ID="uiTextBoxPass" runat="server" Width="250px" ValidationGroup="EditUser" TextMode="Password"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                        ControlToValidate="uiTextBoxPass" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Confirm password : 
                </div>
                <div class="cell-4">
                    <asp:TextBox ID="uiTextBoxConfirm" runat="server" Width="250px" ValidationGroup="EditUser" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator runat="server" ErrorMessage="*" ID="CompareValidator1"
                        ControlToValidate="uiTextBoxConfirm" Display="Dynamic" ValidationGroup="EditUser" ControlToCompare="uiTextBoxPass"></asp:CompareValidator>

                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Full Name : 
                </div>
                <div class="cell-4">
                    <asp:TextBox ID="txtFullName" runat="server" Width="250px" ValidationGroup="EditUser"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                        ControlToValidate="txtFullName" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Email : 
                </div>
                <div class="cell-4">
                    <asp:TextBox ID="txtEmail" runat="server" Width="250px" ValidationGroup="EditUser"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                        ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Telephone : 
                </div>
                <div class="cell-4">
                    <asp:TextBox ID="txtTelephone" runat="server" Width="250px" ValidationGroup="EditUser"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                        ControlToValidate="txtTelephone" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Photo 
                </div>
                <div class="cell-4">
                    <asp:FileUpload ID="fileUploadPhoto" runat="server" />
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                        ControlToValidate="fileUploadPhoto" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Group : 
                </div>
                <div class="cell-4">
                    <asp:DropDownList ID="DropDownListGroups" runat="server"></asp:DropDownList>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                        ControlToValidate="DropDownListGroups" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    Roles :
                </div>
                <div class="cell-10">
                    <asp:CheckBoxList ID="uiCheckBoxListRoles" runat="server" CellPadding="5" CellSpacing="5"
                        RepeatColumns="2">
                    </asp:CheckBoxList>
                </div>
            </div>
            <div style="clear: both; height: 5px;"></div>
            <div class="cell-12 clearfix">
                <div class="cell-2">
                    &nbsp;
                </div>
                <div class="cell-4">
                    <asp:LinkButton runat="server" ID="uiLinkButtonSave" CssClass="btn btn-primary" OnClick="uiButtonUpdate_Click" ValidationGroup="EditUser">Save</asp:LinkButton>
                    &nbsp;<asp:LinkButton runat="server" ID="uiLinkButtonCancel" CssClass="btn btn-primary" OnClick="uiButtonCancel_Click">Cancel</asp:LinkButton>
                </div>
            </div>
            <div class="clearfix"></div>
        </asp:Panel>
        <div class="clearfix"></div>
    </div>
</asp:Content>
