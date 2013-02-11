<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENNoBanner.Master"
    AutoEventWireup="true" CodeBehind="EditServices.aspx.cs" Inherits="Obtravel.Admin.EditServices" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div><h1>
        Edit Services</h1>
        <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">Back to Admin CP</a>
                            </div>                           
                        </div>
                        </div>
    <asp:Panel ID="uiPanelViewServices" runat="server">
        <h2>
            Add new service
        </h2>
        <div class="smallleftHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new service</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
        <div class="clear10px">
        </div>
        <h2>
            Current services
        </h2>
        <asp:Repeater ID="uiRepeaterCurrentServices" runat="server" 
            onitemcommand="uiRepeaterCurrentServices_ItemCommand">
            <HeaderTemplate>
                <div class="services">
                    <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <div class="img">
                        <asp:Image ID="uiImageService" runat="server" ImageUrl='<%# Eval("ImagePath") %>' /></div>
                    <div class="serv_data">
                        <h4>
                            <%# Eval("Title") %></h4>
                        <%# Eval("Brief") %>
                        <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    CommandName="EditService">Edit</asp:LinkButton>
                            </div>
                            <div class="btn">
                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    CommandName="DeleteService"  OnClientClick="return confirm('Are you want to delete this record?');">Delete</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul> </div></FooterTemplate>
        </asp:Repeater>
    </asp:Panel>
    <asp:Panel ID="uiPanelEditService" runat="server">
        <div class="smallleft">
            Title</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateService" 
                Columns="50"></asp:TextBox></div>
        <div style="float: left; margin-left: 200px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" ValidationGroup="UpdateService"></asp:RequiredFieldValidator></div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            Image</div>
        <div class="smallrightHeight">
            <asp:FileUpload ID="uiFileUploadImage" runat="server" />            
            </div>
            <div style="float:left;margin-left:100px;">
                <asp:Image ID="uiImageCurrent" runat="server" Width="80px" />         
            </div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            Brief</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxBrief" runat="server" ValidationGroup="UpdateService" Columns="30"
                Rows="4" TextMode="MultiLine"></asp:TextBox></div>
        <div style="float: left; margin-left: 145px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxBrief" ForeColor="#C76E1F" ValidationGroup="UpdateService"></asp:RequiredFieldValidator></div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            Content</div>
        <div style="float:left;width:780px;height:300px;">
            <FCKeditorV2:FCKeditor ID="uiFCKeditorContent" runat="server" BasePath="~/modules/fckeditor/" Height="300px">
            </FCKeditorV2:FCKeditor>
            </div>
        
        <div class="clear10px">
        </div>
        <div class="smallleft">
            Order</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxOrder" runat="server"></asp:TextBox></div>
        <div style="float: left; margin-left: 35px; margin-top: 8px;">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Numbers only"
                ValidationGroup="UpdateService" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxOrder"
                ForeColor="#C76E1F"></asp:RegularExpressionValidator></div>
        <div>
        </div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            &nbsp;</div>
        <div class="smallrightHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" OnClick="uiLinkButtonUpdate_Click"
                    ValidationGroup="UpdateService">Update</asp:LinkButton>
            </div>
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
    </asp:Panel>
</asp:Content>
