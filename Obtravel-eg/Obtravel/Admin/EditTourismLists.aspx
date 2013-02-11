<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENNoBanner.Master" AutoEventWireup="true" CodeBehind="EditTourismLists.aspx.cs" Inherits="Obtravel.Admin.EditTourismLists" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div> <h1>
        Edit Tourism Lists</h1>
        <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">Back to Admin CP</a>
                            </div>                           
                        </div>
                        </div>
    <asp:Panel ID="uiPanelViewLists" runat="server">
        <h2>
            Add new Tourism List
        </h2>
        <div class="smallleftHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new tourism list</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
        <div class="clear10px">
        </div>
        <h2>
            Current tourism lists
        </h2>
        <asp:Repeater ID="uiRepeaterCurrentTourismLists" runat="server" 
            onitemcommand="uiRepeaterTourismLists_ItemCommand">
            <HeaderTemplate>
                <div class="services">
                    <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <div class="img Tourism">
                        <asp:Image ID="uiImageList" runat="server" ImageUrl='<%# Eval("ImagePath") %>' /></div>
                    <div class="serv_data">
                        <h4>
                            <%# Eval("Title") %></h4>
                        
                        <div class="TourismControls AdminCP">
                            <div class="btn">
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    CommandName="EditList">Edit</asp:LinkButton>
                            </div>
                            <div class="btn">
                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    CommandName="DeleteList"  OnClientClick="return confirm('Are you want to delete this record?');">Delete</asp:LinkButton>
                            </div>

                        </div>
                        <%# Eval("Brief") %>
                    </div>
                    <div class="clear">
                    </div>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul> </div></FooterTemplate>
        </asp:Repeater>
    </asp:Panel>
    <asp:Panel ID="uiPanelEditTourismList" runat="server">
        <div class="smallleft">
            Title</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateList" 
                Columns="50"></asp:TextBox></div>
        <div style="float: left; margin-left: 200px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" ValidationGroup="UpdateList"></asp:RequiredFieldValidator></div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            Image</div>
        <div class="smallrightHeight">
            <asp:FileUpload ID="uiFileUploadImage" runat="server" /></div>
            <div style="float:left;margin-left:100px;">
                <asp:Image ID="uiImageCurrent" runat="server" Width="80px" />         
            </div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            Brief</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxBrief" runat="server" ValidationGroup="UpdateList" Columns="30"
                Rows="4" TextMode="MultiLine"></asp:TextBox></div>
        <div style="float: left; margin-left: 145px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxBrief" ForeColor="#C76E1F" ValidationGroup="UpdateList"></asp:RequiredFieldValidator></div>
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
                ValidationGroup="UpdateList" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxOrder"
                ForeColor="#C76E1F"></asp:RegularExpressionValidator></div>
        
        <div class="clear10px">
        </div>
        <div class="smallleft">
            Show in web</div>
        <div class="smallrightHeight">
            <asp:CheckBox ID="uiCheckBoxViewInWeb" runat="server" /></div>
            <div class="clear10px"></div>
        <div class="smallleft">
            &nbsp;</div>
        <div class="smallrightHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" OnClick="uiLinkButtonUpdate_Click"
                    ValidationGroup="UpdateList">Update</asp:LinkButton>
            </div>
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
    </asp:Panel>
</asp:Content>
