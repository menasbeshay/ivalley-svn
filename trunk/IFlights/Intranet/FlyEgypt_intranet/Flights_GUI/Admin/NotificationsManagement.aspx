<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ExceptionLight.Master" AutoEventWireup="true" CodeBehind="NotificationsManagement.aspx.cs" Inherits="Flights_GUI.Admin.NotificationsManagement" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/ExceptionLight.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery-ui.min.js"></script>
    <link href="../css/jquery-ui.min.css" rel="stylesheet" />
    <script src="../js/tag-it.js"></script>
    <link href="../css/jquery.tagit.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#myTags").tagit({
                autocomplete: { source: "../Common/IntranetService.asmx/GetAvalName" }
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cell-12">
        <asp:Panel runat="server" ID="uiPanelSuccess" Visible="false">
            <div class="alert alert-success">
                Mails sent successfully.
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelNotifications" runat="server">
            <div class="cell-12">
                <div class="cell-2">
                    Emails :
                </div>
                <div class="cell-8">
                    <label style="font-size: x-small; position: absolute; top: -15px">Seperate emails with semicolon ' ; '</label>
<%--                    <textarea id="txtEmails" runat="server" style="width:100%" />--%>
                    <ul id="myTags">
                    </ul>

                </div>
            </div>
            <div style="clear: both; height: 10px;"></div>
            <div class="cell-12">
                <div class="cell-2">
                    Select Groups :
                </div>
                <div class="cell-8">
                    <asp:CheckBoxList ID="CheckBoxListGroups" RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="5" runat="server"></asp:CheckBoxList>
                </div>
            </div>
            <div style="clear: both; height: 10px;"></div>
            <div class="cell-12">
                <div class="cell-2">
                    Mail Content :
                </div>
                <div class="cell-8">
                    <telerik:RadEditor Width="100%" ID="uiRadEditorContnet" runat="server">
                        <CssFiles>
                            <telerik:EditorCssFile Value="~/css/editor.css" />
                        </CssFiles>
                        <Tools>
                            <telerik:EditorToolGroup Tag="MainToolbar">
                                <telerik:EditorSplitButton Name="Undo">
                                </telerik:EditorSplitButton>
                                <telerik:EditorSplitButton Name="Redo">
                                </telerik:EditorSplitButton>
                                <telerik:EditorSeparator />
                                <telerik:EditorTool Name="Cut" />
                                <telerik:EditorTool Name="Copy" />
                                <telerik:EditorTool Name="Paste" ShortCut="CTRL+V" />
                            </telerik:EditorToolGroup>
                            <telerik:EditorToolGroup Tag="Formatting">
                                <telerik:EditorTool Name="Bold" />
                                <telerik:EditorTool Name="Italic" />
                                <telerik:EditorTool Name="Underline" />
                                <telerik:EditorSeparator />
                                <telerik:EditorSplitButton Name="ForeColor">
                                </telerik:EditorSplitButton>
                                <telerik:EditorSplitButton Name="BackColor">
                                </telerik:EditorSplitButton>
                                <telerik:EditorSeparator />
                                <telerik:EditorDropDown Name="FontName">
                                </telerik:EditorDropDown>
                                <telerik:EditorDropDown Name="RealFontSize">
                                </telerik:EditorDropDown>
                            </telerik:EditorToolGroup>
                            <telerik:EditorToolGroup>
                                <telerik:EditorTool Name="ImageManager" />
                                <telerik:EditorTool Name="DocumentManager" />
                                <telerik:EditorTool Name="InsertTable" />
                            </telerik:EditorToolGroup>
                        </Tools>
                        <Content>
                        </Content>
                        <ImageManager DeletePaths="~/FileUploads" UploadPaths="~/FileUploads" ViewPaths="~/FileUploads" />
                        <DocumentManager DeletePaths="~/FileUploads" UploadPaths="~/FileUploads" ViewPaths="~/FileUploads" />
                    </telerik:RadEditor>

                </div>
            </div>
            <div style="clear: both; height: 10px;"></div>
            <div class="cell-12">
                <div class="cell-2">
                    <asp:LinkButton ID="LinkButtonSendNotifications" OnClick="LinkButtonSendNotifications_Click" CssClass="btn btn-primary" runat="server">Send</asp:LinkButton>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
