<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ContactManagement.aspx.cs" Inherits="Web.UI.AdminPanel.MainPages.ContactManagement" %>


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
                                    <label for="txtTitle" class="">Contact Title :</label>
                                    <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" />

                                </div>
                                <div class="form-group">
                                    <label for="txtaddress" class="">Contact Address :</label>
                                    <asp:TextBox ID="txtAddress" runat="server" />

                                </div>
                                <div class="form-group">
                                    <label for="txtPhone" class="">Contact Phone :</label>
                                    <asp:TextBox ID="txtPhone" runat="server" />

                                </div>
                                <div class="form-group">
                                    <label class="">Contact Mobail :</label>
                                    <asp:TextBox ID="txtMobile" runat="server" />

                                </div>

                                                                <div class="form-group">
                                    <label class="">Contact Fax :</label>
                                    <asp:TextBox ID="txtFax" runat="server" />

                                </div>

                                <div class="form-group">
                                    <label for="txtaddress" class="">Contact Email :</label>
                                    <asp:TextBox ID="txtEmail" runat="server" />

                                </div>
                                <div class="form-group">
                                    <label for="txtaddress" class="">Contact Work Hours :</label>
                                    <asp:TextBox ID="txtWorkHours" runat="server" />

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
