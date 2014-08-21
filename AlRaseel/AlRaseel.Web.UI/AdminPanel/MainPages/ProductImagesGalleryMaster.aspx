<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ProductImagesGalleryMaster.aspx.cs" Inherits="Web.UI.AdminPanel.MainPages.ProductImagesGalleryMaster" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../lib/GallaryLightBox/example1/colorbox.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="../lib/GallaryLightBox/jquery.colorbox.js" type="text/javascript"></script>
    <script src="../lib/tooltip/jquery.tipTip.js" type="text/javascript"></script>
    <script src="../lib/tooltip/jquery.tipTip.minified.js" type="text/javascript"></script>
    <link href="../lib/tooltip/tipTip.css" rel="stylesheet" type="text/css" />
    <link href="../lib/css/admin.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function ajaxFileUpload1_ClientUploadComplete(sender, e) {
            if (sender._filesInQueue[sender._filesInQueue.length - 1]._isUploaded) {
                //__doPostBack('updatePanelAttachments', ''); // Do post back only after all files have been uploaded
                location.reload();
            }

        }
        $(function () {
            $(".tip_right_top").tipTip({ maxWidth: "auto", edgeOffset: 2 });
        });
        function load() { Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler); }
        function EndRequestHandler() {
            $(".tip_right_top").tipTip({ maxWidth: "auto", edgeOffset: 2 });
        }
        $(document).ready(function () {
            $(".gallery").colorbox({ rel: 'Image', slideshow: true });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row">
        <div class="col-md-12">
            <div>
                <asp:UpdatePanel runat="server" ID="updatePanelAttachments" UpdateMode="Conditional"
                    OnPreRender="updatePanelAttachments_PreRender">
                    <ContentTemplate>
                        <table width="98%" class="tblMain" cellpadding="2" cellspacing="2">
                            <tr>
                                <td class="tdHeader">
                                    <img class="imgIcon" src="../lib/icons/24/User.png" />
                                    <asp:Label runat="server" Text="Gallery Images" CssClass="tdPageTitle" ID="lblPageSubTitle"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ListView ID="lstview" runat="server" GroupItemCount="4" DataSourceID="objImages"
                                        OnItemCommand="lstview_ItemCommand">
                                        <LayoutTemplate>
                                            <table>
                                                <asp:PlaceHolder ID="GroupPlaceHolder" runat="server"></asp:PlaceHolder>
                                            </table>
                                        </LayoutTemplate>
                                        <GroupTemplate>
                                            <tr>
                                                <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                                            </tr>
                                        </GroupTemplate>
                                        <ItemTemplate>
                                            <td>
                                                <div class="imgIcon">
                                                    <a class="gallery" href='<%#"../../Files/Products/"+ Eval("ImageFile") %>'>
                                                        <asp:Image ID="img" ImageUrl='<%#"~/Files/Products/"+ Eval("ImageFile") %>'
                                                            runat="server" Width="150px" Height="150px" /></a>
                                                </div>
                                                <div>
<%--                                                    <asp:Image ID="Image1" CssClass="imgIcon tip_right_top" title='<%# Data.Extensions.GeneralMethods.GetRecordInfo(Eval("CreatedOn").ToString(),Eval("CreatedBy").ToString(),Eval("ModifiedOn").ToString(),Eval("ModifiedBy").ToString()) %>'
                                                        ImageUrl="../lib/img/Info.png" runat="server" />--%>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CssClass="imgIcon tip_right_top"
                                                        class="tip_right_top" ImageUrl="~/System/Backend/lib/img/Restor.png" CommandName="restoreitem"
                                                        CommandArgument='<%# Eval("Id") %>' Visible='<%# Data.Extensions.GeneralMethods.DeleteRestorVisible(Eval("Active"),"true") %>'
                                                        ToolTip="Restore Item"></asp:ImageButton>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CssClass="imgIcon tip_right_top"
                                                        ImageUrl="~/System/Backend/lib/img/Delete.png" CommandName="deleteitem" CommandArgument='<%# Eval("Id") %>'
                                                        OnClientClick="if(!confirm('Are you sure you want delete this?')) return false;"
                                                        Visible='<%# Data.Extensions.GeneralMethods.DeleteRestorVisible(Eval("Active"),"false") %>'
                                                        title="Delete Item"></asp:ImageButton>
                                                    <asp:ImageButton ID="imgEdit" runat="server" CssClass="imgIcon tip_right_top" ImageUrl="~/System/Backend/lib/img/Edit.png"
                                                        CommandName="edititem" CommandArgument='<%# Eval("Id") %>' title="Edit"></asp:ImageButton>
                                                </div>
                                            </td>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            <center>
                                        There is no images</center>
                                        </EmptyDataTemplate>
                                    </asp:ListView>
                                    <asp:ObjectDataSource ID="objImages" runat="server" SelectMethod="LoadByProductId" TypeName="Data.Repositories.ProductImagesRepositories">
                                        <SelectParameters>
                                            <asp:Parameter Name="ProductID" Type="String" DefaultValue="ProductID" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:AjaxFileUpload ID="AjaxFileUpload1" MaximumNumberOfFiles="10" OnClientUploadComplete="ajaxFileUpload1_ClientUploadComplete"
                                        runat="server" OnUploadComplete="AjaxFileUpload1_UploadComplete" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="400px" id="tbEdit" runat="server" visible="false">
                                        <tr>
                                            <td>
                                                <asp:Label Text="Image Title" runat="server" ID="lblImageTitle"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="TxtTitle" TextMode="MultiLine" Width="400px" Height="100px" OnTextChanged="TxtTitle_TextChanged"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" OnClientClick="window.location.reload()"
                                                    Text="Update" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <asp:Image ID="imgEdit" runat="server" Width="150px" Height="150px" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td id="Td1" class="msg" runat="server">
                                    <asp:Label ID="lblMessge" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

</asp:Content>
