<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ProductAlbumsManagement.aspx.cs" Inherits="Web.UI.AdminPanel.MainPages.ProductAlbumsManagement" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="CPH" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div id="divMsg" runat="server" class="col-md-6">
                                    <asp:Literal Text="text" runat="server" />

                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <!-- BEGIN FORM WIZARD WITH VALIDATION -->
                                        <div class="col-md-10">
                                            <div class="form-group">

                                                <label for="ddlLanguage">Choose Language</label>
                                                <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control ">
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group">

                                                <label for="ddlLanguage">Choose Products</label>
                                                <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control ">
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group">
                                                <label for="txtSectionTitle" class="">Album Title :</label>
                                                <asp:TextBox ID="txtAlbumTitile" CssClass="form-control" runat="server" />

                                            </div>
                                            <div class="form-group">
                                                <label class="">Album Description :</label>
                                                <%--<cc1:Editor ID="edtrShortDescription" runat="server" />--%>
                                                <asp:TextBox ID="txtAlbumDescription" TextMode="MultiLine" Rows="3"  runat="server" />

                                            </div>

                                            <div class="form-group">
                                                <label class="">Current Product Image :</label>
                                                <asp:Image runat="server" ID="imgProductImage" Width="150px" Height="150px" Visible="false" />

                                            </div>

                                            <div class="form-group">
                                                <label class="">Product Image :</label>
                                                <asp:FileUpload ID="fpld" runat="server" />

                                            </div>

                                            <div class=" col-md-12">
                                                <div>

                                                    <asp:Button ID="btnSave" Text="Save" CssClass="btn btn-blue" runat="server" OnClick="btnSave_Click" />
                                                    <asp:Button ID="btnSaveAndNew" Text="Save And New" CssClass="btn btn-blue" runat="server" OnClick="btnSaveAndNew_Click" />
                                                    <asp:Button ID="btnClear" Text="Clear" CssClass="btn btn-blue" runat="server" OnClick="btnClear_Click" />
                                                    <asp:Button ID="btnBack" Text="Back" CssClass="btn btn-blue" runat="server" OnClick="btnBack_Click" />
                                              
                                                    <asp:Button ID="btnAlbumImagesGallery" CssClass="btn btn-blue" Text="Album Images Gallery" runat="server" OnClick="btnProductGallery_Click" />
                                                      </div>

                                            </div>


                                        </div>
                                        <!-- END FORM WIZARD WITH VALIDATION -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<%--            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>--%>



    <%--    <div class="tabcordion">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#tab1_1" data-toggle="tab">Data</a></li>
            <li class=""><a href="#tab1_2" data-toggle="tab">Gallery</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" id="tabData">
                <div class="row column-seperation">
                </div>
            </div>
            <div class="tab-pane fade" id="tabGallery">
                <iframe id="ifram_Image" runat="server" scrolling="yes" height="700px" frameborder="0" style="padding: 0; margin: 0;" width="100%"></iframe>
            </div>
        </div>
    </div>--%>
</asp:Content>
