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
                autocomplete: { source: "../Common/IntranetService.asmx/GetAvalName" },
                afterTagAdded: function (event, ui) {
                    var mails = $('#myTags').tagit('assignedTags');
                    var allmails = mails.join(",");
                    $('#<%= uiHiddenFieldmails.ClientID%>').val(allmails);
                },
                afterTagRemoved: function (event, ui) {
                    var mails = $('#myTags').tagit('assignedTags');
                    var allmails = mails.join(",");
                    $('#<%= uiHiddenFieldmails.ClientID%>').val(allmails);
                }
            });
        });


        function validateBeforeSubmit()
        {
            var valid = false;
            var checkedItems = $('#RulesDiv').find('input:checked');
            var mails = $('#myTags').tagit('assignedTags');
            if (checkedItems.length > 0 || mails.length >0) {
                valid = true;
            }

            if (!valid)
            {
                $('#errorDiv').fadeIn(200);
                $('html, body').animate({ scrollTop: '0px' }, 800);
            }
            return valid;
        }
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="uiHiddenFieldmails" runat="server" />


    <div class="cell-12">
        
        <div class="box error-box " id="errorDiv" style="display:none;">
                <a href="#" onclick="$('#errorDiv').fadeOut(200);" style="  position: absolute;  top: 2px;  right: 2px;  padding: 2px 8px 4px;  background: rgba(0,0,0,.1);  color: #fff;  font-size: 17px;"><i class="fa fa-times"></i>  </a>
                <h3>
                    Error
                </h3>
                <p>
                    Please select at least one group or enter one mail.
                </p>
            </div>
        <asp:Panel runat="server" ID="uiPanelSuccess" Visible="false">
            <div class="box success-box" >
                Mails sent successfully.
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelNotifications" runat="server">
            <div class="cell-12">
                <div class="cell-2">
                    Emails :
                </div>
                <div class="cell-8">
                    
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
                <div id="RulesDiv" class="cell-8">
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
                <div class="cell-2"></div>
                <div class="cell-2">
                    <asp:LinkButton ID="LinkButtonSendNotifications" OnClick="LinkButtonSendNotifications_Click" OnClientClick="return validateBeforeSubmit()" CssClass="btn btn-primary" runat="server">Send</asp:LinkButton>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
