﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="EditPages.aspx.cs" Inherits="website.Admin.EditPages" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain">
        <asp:Panel ID="uiPanelViewPages" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    Pages
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new page</asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 100%">
                        <asp:GridView ID="uiGridViewPages" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewPages_RowCommand"
                            AllowPaging="True" OnPageIndexChanging="uiGridViewPages_PageIndexChanging" EnableModelValidation="True"
                            HorizontalAlign="Center" Width="95%">
                            <Columns>
                                <asp:BoundField DataField="Title" HeaderText="Title" />
                                <%--<asp:BoundField DataField="CreatedDate" HeaderText="&#1578;&#1575;&#1585;&#1610;&#1582; &#1575;&#1604;&#1606;&#1588;&#1585;" DataFormatString="{0:dd/MM/yyyy}" />--%>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("PageID") %>'
                                            CommandName="EditPages">Edit</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("PageID") %>'
                                            CommandName="DeletePages" OnClientClick="return confirm('do you want to delete this record ?');">Delete</asp:LinkButton>
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
                    Edit Pages</h4>
                <div class="AdminDetails728">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle">
                        <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="An error occured.please try again."
                            Visible="False"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label4" runat="server" Text="Name  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label3" runat="server" Text="Title  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxTitle" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div style="display:none">
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label1" runat="server" Text="In Menu  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="width: 75%">
                        <asp:CheckBox ID="uiCheckBoxInMenu" runat="server" />
                    </div>
                    <div class="AdminLeft">
                       
                    </div>
                    <div class="clear5">
                    </div>
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label7" runat="server" Text="Parent Page :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:DropDownList ID="uiDropDownListPages" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft">
                        
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label8" runat="server" Text="Content :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <FCKeditorV2:FCKeditor ID="uiFCKeditorContent" runat="server" BasePath="../modules/fckeditor/" Height="350" Width="600"
                            SkinPath="skins/silver/" ToolbarSet="">                            
                        </FCKeditorV2:FCKeditor>
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
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
