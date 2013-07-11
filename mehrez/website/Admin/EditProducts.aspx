<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditProducts.aspx.cs" Inherits="website.Admin.EditProducts" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain">
        <asp:Panel ID="uiPanelViewProducts" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    Products
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle" style="width: 30%">

                        Category : 
                        <asp:DropDownList ID="uiDropDownListCats" runat="server" AutoPostBack="true" 
                            onselectedindexchanged="uiDropDownListCats_SelectedIndexChanged">
                        </asp:DropDownList>

                    </div>
                    <div class="AdminLeft">
                        <div class="AdminMore" >
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new product</asp:LinkButton>
                        </div>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 100%">
                        <asp:GridView ID="uiGridViewProducts" runat="server" AutoGenerateColumns="False"
                            OnRowCommand="uiGridViewProducts_RowCommand" AllowPaging="True" OnPageIndexChanging="uiGridViewProducts_PageIndexChanging"
                            EnableModelValidation="True" HorizontalAlign="Center" Width="95%">
                            <Columns>
                                <asp:BoundField DataField="ProductName" HeaderText="Name" />
                                <%--<asp:BoundField DataField="CreatedDate" HeaderText="&#1578;&#1575;&#1585;&#1610;&#1582; &#1575;&#1604;&#1606;&#1588;&#1585;" DataFormatString="{0:dd/MM/yyyy}" />--%>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ProductID") %>'
                                            CommandName="EditProduct">Edit</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ProductID") %>'
                                            CommandName="DeleteProduct" OnClientClick="return confirm('do you want to delete this record ?');">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server">
            <div class="ContentLeftDiv">
                <h4>
                    Edit products</h4>
                <div class="AdminDetails728">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle">
                        <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="An error occured.please try again."
                            Visible="False"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label3" runat="server" Text="Name  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                    
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label8" runat="server" Text="Main picture :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:FileUpload ID="uiFileUploadMainPicturePath" runat="server" />
                    </div>
                    <div class="AdminLeft">
                    </div>
                                        
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        &nbsp;
                    </div>
                    <div class="AdminMiddle" style="text-align: center">
                        <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="&#1573;&#1590;&#1575;&#1601;&#1577; / &#1578;&#1593;&#1583;&#1610;&#1604;" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="Add / Edit" ValidationGroup="EditPage"
                                OnClick="uiButtonUpdate_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="&#1573;&#1604;&#1594;&#1575;&#1569;" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="Cancel" OnClick="uiButtonCancel_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        
                        <div class="AdminMore" style="width:120px;">
                            <asp:LinkButton ID="uiLinkButtonBack" runat="server" Text="Back to products" OnClick="uiLinkButtonBack_Click"></asp:LinkButton></div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    <asp:Panel ID="uiPanelAllItems" runat="server">
                        <div class="ContentLeftDiv">
                            <h4>
                                Items
                            </h4>
                            <div class="Details675">
                                <div class="AdminRight">
                                    <asp:Label ID="Label1" runat="server" Text="Name  :" CssClass="Label"></asp:Label>
                                </div>
                                <div class="AdminMiddle" style="width: 30%">
                                    <asp:TextBox ID="uiTextBoxItemName" runat="server" ValidationGroup="EditItem" Width="200px"></asp:TextBox>
                                </div>
                                <div class="AdminLeft">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                        ControlToValidate="uiTextBoxItemName" Display="Dynamic" ValidationGroup="EditItem"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear5">
                                </div>
                                <div class="AdminRight">
                                    <asp:Label ID="Label2" runat="server" Text="Dimension  :" CssClass="Label"></asp:Label>
                                </div>
                                <div class="AdminMiddle" style="width: 30%">
                                    <asp:TextBox ID="uiTextBoxDim" runat="server" ValidationGroup="EditItem" Width="200px"></asp:TextBox>
                                </div>
                                <div class="AdminLeft">
                                </div>
                                <div class="clear5">
                                </div>
                                <div class="AdminRight">
                                    <asp:Label ID="Label4" runat="server" Text="Code  :" CssClass="Label"></asp:Label>
                                </div>
                                <div class="AdminMiddle" style="width: 30%">
                                    <asp:TextBox ID="uiTextBoxCode" runat="server" ValidationGroup="EditItem" Width="200px"></asp:TextBox>
                                    
                                </div>
                                <div class="AdminLeft">
                                    <div class="AdminMore">
                                        <asp:LinkButton ID="uiLinkButtonAddItems" runat="server" OnClick="uiLinkButtonAddItems_Click"
                                            ValidationGroup="EditItem">Add new item</asp:LinkButton>
                                    </div>
                                </div>
                                <div class="clear5">
                                </div>
                                <div class="AdminMiddle" style="width: 100%">
                                    <asp:GridView ID="uiGridViewItems" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewItems_RowCommand"
                                        AllowPaging="True" OnPageIndexChanging="uiGridViewItems_PageIndexChanging" EnableModelValidation="True"
                                        HorizontalAlign="Center" Width="95%">
                                        <Columns>
                                            <asp:BoundField DataField="ItemName" HeaderText="Name" />
                                            <asp:BoundField DataField="Dimension" HeaderText="Dimension" />
                                            <asp:BoundField DataField="Code" HeaderText="Code" />
                                            <%--<asp:BoundField DataField="CreatedDate" HeaderText="&#1578;&#1575;&#1585;&#1610;&#1582; &#1575;&#1604;&#1606;&#1588;&#1585;" DataFormatString="{0:dd/MM/yyyy}" />--%>
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ItemID") %>'
                                                        CommandName="EditItem">Edit</asp:LinkButton>&nbsp;
                                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ItemID") %>'
                                                        CommandName="DeleteDelete" OnClientClick="return confirm('do you want to delete this record ?');">Delete</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" />
                                    </asp:GridView>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
