<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditNews.aspx.cs" Inherits="website.Admin.EditNews" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validateTextLength(oSrc, args) {
            args.IsValid = (args.Value.length <= 500);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="AdminMain" >
        <asp:Panel ID="uiPanelViewNews" runat="server">            
            <div class="ContentLeftDiv">
                <h1>
                    News
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add News</asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 100%">
                        <asp:GridView ID="uiGridViewNews" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewNews_RowCommand"
                            AllowPaging="True" OnPageIndexChanging="uiGridViewNews_PageIndexChanging" EnableModelValidation="True"
                            HorizontalAlign="Center" Width="95%">
                            <Columns>
                                <asp:BoundField DataField="Title" HeaderText="Title" />
                                <%--<asp:BoundField DataField="CreatedDate" HeaderText="&#1578;&#1575;&#1585;&#1610;&#1582; &#1575;&#1604;&#1606;&#1588;&#1585;" DataFormatString="{0:dd/MM/yyyy}" />--%>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="EditNews">Edit</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="DeleteNews" OnClientClick="return confirm('do you want to delete this record ?');">Delete</asp:LinkButton>
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
                    Edit News</h4>
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
                        <asp:Label ID="Label3" runat="server" Text="Title  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxTitle" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label1" runat="server" Text="Date  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="width: 75%">
                        <asp:TextBox ID="uiTextBoxDate" runat="server" ValidationGroup="EditPage" Width="300px"></asp:TextBox>
                        <asp:CalendarExtender ID="uiTextBoxDate_CalendarExtender" runat="server" DaysModeTitleFormat="dd/MM/yyyy"
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="uiTextBoxDate" TodaysDateFormat="dd/MM/yyyy">
                        </asp:CalendarExtender>                        
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxDate" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label7" runat="server" Text="Brief :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxBrief" runat="server" TextMode="MultiLine" Rows="6" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="uiTextBoxBrief"
                            Display="Dynamic" ClientValidationFunction="validateTextLength" ErrorMessage="Brief can't excced 500 characters."
                            ValidationGroup="EditPage"></asp:CustomValidator>
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
                    <div class="clear">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label5" runat="server" Text="Content  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxContent" runat="server" TextMode="MultiLine" Rows="6" Width="400px"></asp:TextBox>
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
                    <asp:Panel ID="uiPanelAllItems" runat="server">
                        <div class="ContentLeftDiv">
                            <h4>
                                News Images
                            </h4>
                            <div class="Details675">
                                <div class="AdminRight">
                                    <asp:Label ID="Label2" runat="server" Text="images  :" CssClass="Label"></asp:Label>
                                </div>
                                <div class="AdminMiddle" style="width: 30%">
                                    <asp:FileUpload ID="uiFileUploadImage" runat="server" />
                                </div>
                                <div class="AdminLeft">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                        ControlToValidate="uiFileUploadImage" Display="Dynamic" ValidationGroup="EditItem"></asp:RequiredFieldValidator>
                                </div>
                                <div class="clear5">
                                </div>
                               
                                <div class="AdminLeft">
                                    <div class="AdminMore">
                                        <asp:LinkButton ID="uiLinkButtonAddItems" runat="server" OnClick="uiLinkButtonAddItems_Click"
                                            ValidationGroup="EditItem">Add new image</asp:LinkButton>
                                    </div>
                                </div>
                                <div class="clear5">
                                </div>
                                <div class="AdminMiddle" style="width: 100%">
                                    <asp:GridView ID="uiGridViewImages" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewImages_RowCommand"
                                        AllowPaging="True" OnPageIndexChanging="uiGridViewImages_PageIndexChanging" EnableModelValidation="True"
                                        HorizontalAlign="Center" Width="95%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Images">
                                            <ItemTemplate>
                                                <img src="../images.aspx?Inner=Quote&Image=<%# Eval("picpath") %>" />
                                            </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>                                                    
                                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>'
                                                        CommandName="DeleteItem" OnClientClick="return confirm('do you want to delete this record ?');">Delete</asp:LinkButton>
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
