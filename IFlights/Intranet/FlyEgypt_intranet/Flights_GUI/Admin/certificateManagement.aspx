<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ExceptionLight.Master" AutoEventWireup="true" CodeBehind="certificateManagement.aspx.cs" Inherits="Flights_GUI.Admin.certificateManagement" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/ExceptionLight.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel ID="uiPanelViewAll" runat="server">
        <div class="cell-2 clearfix pull-right">
            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonAdd_Click">Add new certificate</asp:LinkButton>
            <div class="clearfix">&nbsp;  </div>
        </div>
        <div class="cell-12 clearfix">
            <telerik:RadGrid ID="uiRadGridcirculars" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" CellSpacing="0"
                HorizontalAlign="Center" EnableEmbeddedSkins="False" Width="90%"
                OnPageIndexChanged="uiRadGridcirculars_PageIndexChanged"
                OnItemCommand="uiRadGridcirculars_ItemCommand">
                <AlternatingItemStyle HorizontalAlign="Center" />
                <MasterTableView>

                    <Columns>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="Title"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UserName" HeaderText="Created By"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="createdDate" HeaderText="Created Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("CertificateID") %>'
                                    CommandName="EditCir"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CertificateID") %>' Visible='<%# (Membership.GetUser().ProviderUserKey.ToString() == Eval("CreatedBy").ToString()) %>'
                                        CommandName="DeleteCir" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />

            </telerik:RadGrid>
        </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelEdit" runat="server">
        <div class="cell-12 clearfix">
            <div class="cell-2">Title</div>
            <div class="cell-4">
                <asp:TextBox ID="uiTextBoxTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ValidationGroup="add" ControlToValidate="uiTextBoxTitle"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="clear: both; height: 5px;"></div>
        
        <div class="cell-12 clearfix" style="margin-left: 0">
            <div class="cell-2">
                <asp:Label Visible="false" ID="lblCurrentFile" runat="server" Text="Current File"></asp:Label>
            </div>
            <div class="cell-10">
                <asp:TextBox Visible="false" ID="txtCurrentFile" CssClass="cell-3 marginRight" Enabled="false" runat="server"></asp:TextBox>
                <asp:LinkButton Visible="false" OnClick="btnDeleteCurrentFile_Click" OnClientClick="return confirm('Are you want to delete this file? ');" ID="btnDeleteCurrentFile" runat="server" Text="" CssClass=""><i style="color:red;font-size:20px" class="fa fa-trash"></i></asp:LinkButton>
            </div>
        </div>
        <div style="clear: both; height: 5px;"></div>

        <div class="cell-12 clearfix" style="margin-left: 0">
            <div class="cell-2">Upload File</div>
            <div class="cell-10">
                <iframe src="../uiUpload.html" style="border: 0; width: 80%; overflow: hidden; height: 100px;"></iframe>
            </div>
        </div>

        <div style="clear: both; height: 5px;"></div>
        <div class="cell-12 clearfix" style="margin-left: 0; display: none;">
            <div class="cell-2">Created By</div>
            <div class="cell-4">
                <asp:TextBox ID="uiTextBoxCreatedBy" runat="server"></asp:TextBox>
            </div>
        </div>
        <div style="clear: both; height: 5px;"></div>
        
        <div class="cell-12 clearfix" style="margin-left: 0; margin-top: 10px;">
            <div class="cell-2"></div>
            <div class="cell-2">
                <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="btn btn-primary" OnClick="uiButtonSave_Click" ValidationGroup="add">Save</asp:LinkButton>
            </div>
            <div class="cell-4">
                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
            </div>
        </div>

    </asp:Panel>
</asp:Content>
