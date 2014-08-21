<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AboutUsManagement.aspx.cs" Inherits="Web.UI.AdminPanel.MainPages.AboutUsManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>


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
                                <div class="form-group ">

                                    <label for="ddlLanguage">Choose Language</label>
                                    <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control ">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group">

                                    <label for="ddlPage">Choose Page</label>
                                    <asp:DropDownList ID="ddlPage" runat="server" CssClass="form-control ">
                                    </asp:DropDownList>
                                    <%--<input id="userName" name="userName" type="text" class="form-control required">--%>
                                </div>

                                <div class="form-group">
                                    <label for="txtSectionTitle" class="">Section Title :</label>
                                    <asp:TextBox ID="txtSectionTitle" CssClass="form-control" runat="server" />

                                </div>
                                <div class="form-group">
                                    <label for="txtSectionContent" class="">Section Title :</label>
                                    <cc1:Editor ID="edSectionContent" runat="server" />

                                </div>
                                <div class="form-group">
                                    <label class="">Is Default Section :</label>
                                    <asp:CheckBox ID="chkIsDefault" Text="" CssClass="checkbox" runat="server" />

                                </div>
                                <div class="form-group">
                                    <label class="">Current about us Image :</label>
                                    <asp:Image runat="server" ID="imgImageFile" Width="150px" Height="150px" Visible="false" />

                                </div>

                                <div class="form-group">
                                    <label class="">about us Image :</label>
                                    <asp:FileUpload ID="fpld" runat="server" />

                                </div>
                                <div class=" col-md-12">
                                    <div>

                                        <asp:Button ID="btnSave" Text="Save" CssClass="btn btn-blue" runat="server" OnClick="btnSave_Click" />
                                        <asp:Button ID="btnSaveAndNew" Text="Save And New" CssClass="btn btn-blue" runat="server" OnClick="btnSaveAndNew_Click" />
                                        <asp:Button ID="btnClear" Text="Clear" CssClass="btn btn-blue" runat="server" OnClick="btnClear_Click" />
                                        <asp:Button ID="btnBack" Text="Back" CssClass="btn btn-blue" runat="server" OnClick="btnBack_Click" />
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


</asp:Content>
