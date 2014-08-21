<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ProductManagement.aspx.cs" Inherits="Web.UI.AdminPanel.MainPages.ProductManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="CPH" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>




<%--    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="tabBody">--%>
<%--        <asp:TabPanel ID="TabGallery" HeaderText="Gallery" runat="server" Enabled="false">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN FORM WIZARD WITH VALIDATION -->
                        <div class="col-md-10">

                            <iframe id="ifrmProductImages" runat="server" scrolling="yes" height="700px" frameborder="0" style="padding: 0; margin: 0;" width="100%"></iframe>
                        </div>
                    </div>
                </div>



            </ContentTemplate>



        </asp:TabPanel>--%>
<%--        <asp:TabPanel ID="TabData" HeaderText="Data" runat="server">
            <ContentTemplate>--%>
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
                                                <label for="txtSectionTitle" class="">Product Title :</label>
                                                <asp:TextBox ID="txtproductTitile" CssClass="form-control" runat="server" />

                                            </div>
                                            <div class="form-group">
                                                <label for="txtSectionContent" class="">Short Description :</label>
                                                <cc1:Editor ID="edtrShortDescription" runat="server" />

                                            </div>
                                            <div class="form-group">
                                                <label class="">Full Description :</label>
                                                <cc1:Editor ID="edtrFullDescription" runat="server" />

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
                                              
                                                    <asp:Button ID="btnProductGallery" CssClass="btn btn-blue" Text="Product Gallery" runat="server" OnClick="btnProductGallery_Click" />
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
