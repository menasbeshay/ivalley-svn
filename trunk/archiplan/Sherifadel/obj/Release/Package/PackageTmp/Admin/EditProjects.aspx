<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditProjects.aspx.cs" Inherits="archiplan.Admin.EditProjects" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain">
        <asp:Panel ID="uiPanelViewProducts" runat="server">
            <div class="ContentLeftDiv">
                <h1>Projects 
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle" style="width: 30%">
                        Category : 
                        <asp:DropDownList ID="uiDropDownListCats" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="uiDropDownListCats_SelectedIndexChanged">
                        </asp:DropDownList>

                    </div>
                    <div class="AdminLeft">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new project</asp:LinkButton>
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
                <h3>Edit projects</h3>
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

                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                    <br />
                    <div style="float:left;">
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label2" runat="server" Text="Name English  :" CssClass="Label"></asp:Label>
                    </div>
                    
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxName_en" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxName_en" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                       </div>

                    <div class="clear5">
                    </div>



                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label6" runat="server" Text="Description  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <div style="width: 700px">
                            <FCKeditorV2:FCKeditor ID="uiFCKeditorDesc" runat="server"
                                BasePath="~/modules/fckeditor/" Height="300px"
                                SkinPath="skins/silver/">
                            </FCKeditorV2:FCKeditor>
                        </div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label4" runat="server" Text="Description English  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <div style="width: 700px">
                            <FCKeditorV2:FCKeditor ID="uiFCKeditorDesc_en" runat="server"
                                BasePath="~/modules/fckeditor/" Height="300px"
                                SkinPath="skins/silver/">
                            </FCKeditorV2:FCKeditor>
                        </div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>



                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label5" runat="server" Text="Thumbnail picture :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="width: 200px">
                        <asp:FileUpload ID="uiFileUploadThumbs" runat="server" Width="180px" />
                    </div>
                    <div class="AdminLeft">
                        image size 165px * 100px
                        <asp:Image ID="uiImageThumbs" runat="server" ImageAlign="TextTop" />
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
                                OnClick="uiButtonUpdate_Click"></asp:LinkButton>
                        </div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="&#1573;&#1604;&#1594;&#1575;&#1569;" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="Cancel" OnClick="uiButtonCancel_Click"></asp:LinkButton>
                        </div>
                        &nbsp; &nbsp; &nbsp;
                        
                        <div class="AdminMore" style="width: 160px;">
                            <asp:LinkButton ID="uiLinkButtonBack" runat="server" Text="Back to products" OnClick="uiLinkButtonBack_Click"></asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <asp:Panel ID="uiPanelAllPics" runat="server">
                        <div class="ContentLeftDiv">
                            <h4>Project Photos
                            </h4>
                            <div class="Details675">
                                <div class="AdminRight">
                                    <asp:Label ID="Label1" runat="server" Text="photo  :" CssClass="Label"></asp:Label>
                                </div>
                                <div class="AdminMiddle" style="width: 30%">
                                    <asp:FileUpload ID="uiFileUploadProjectPic" runat="server" />
                                </div>
                                <div class="AdminLeft">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                        ControlToValidate="uiFileUploadProjectPic" Display="Dynamic" ValidationGroup="EditItem"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear5">
                                </div>
                                <div class="AdminRight">
                                    &nbsp;
                                </div>
                                <div class="AdminMiddle" style="width: 30%">
                                    <div class="AdminMore">
                                        <asp:LinkButton ID="uiLinkButtonAddItems" runat="server" OnClick="uiLinkButtonAddItems_Click"
                                            ValidationGroup="EditItem">Add new photo</asp:LinkButton>
                                    </div>
                                </div>
                                <div class="AdminLeft">
                                </div>
                                <div class="clear5">
                                </div>

                                <div class="AdminMiddle" style="width: 100%">
                                    <asp:DataList ID="uiDataListProductMedia" runat="server"
                                        HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Horizontal"
                                        OnItemCommand="uiDataListProductMedia_ItemCommand">
                                        <ItemTemplate>
                                            <div style="margin: 5px;">
                                                <asp:ImageButton ID="uiButtonDelete" runat="server" CommandArgument='<%# Eval("ItemID") %>' Text="Delete" OnClientClick="return confirm('Are you want to delete this photo?');" CommandName="Delete" ForeColor="#000099" ImageUrl="../images/action_delete.gif" AlternateText="Delete image" ImageAlign="Middle" Style="float: right;" />
                                                <br />
                                                <a href='<%# Eval("PicPath") %>' rel="lightbox[chiledranroom]">
                                                    <img src='../Images.aspx?Inner=product&Image=<%# Eval("PicPath") %>' alt="4" width="165" height="100"></a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                                <div class="clear5">
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
