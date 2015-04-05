<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="ManageReference.aspx.cs" Inherits="brotherssolidarity.Admin.ManageReference" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-sitemap"></i>Project Main Data</h4>
                    <span class="tools">
                     <asp:Button ID="btnBack"  runat="server" Text=" << Back to Projects" CssClass="btn btn-primary" OnClick="btnBack_Click"/>
                    </span>
                </div>
                <div class="widget-body">

                    <div class="row-fluid">
                        <div class="span8 col1">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="lblRefernceName" Text="Project Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtRefernceName" Width="220px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="CollValGroup" runat="server" ID="rquiredName" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="txtRefernceName"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDescription" runat="server" Text="Project Description"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDescription" runat="server" Wrap="true" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUploadImg" runat="server" Text="Upload Image"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="CollImgFileUpload" runat="server" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="CollValGroup" runat="server" ID="requiredImg" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                            Display="Dynamic" ControlToValidate="CollImgFileUpload"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>


                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="lblActive" Text="Is Active ?"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:CheckBox runat="server" ID="chkActive" />
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="clearfix" style="height: 15px"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnSaveRef" ValidationGroup="CollValGroup" runat="server" Text="Create Refernce" CssClass="btn btn-success" OnClick="btnSaveRef_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="span4 col2">
                            <img id="CollImg" runat="server" src="~/Admin/Images/no-image.png" alt="Image" height="200" width="200" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-sitemap"></i>Project Images</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">

                    <div class="row-fluid">
                        <div class="span12 col1">
                            <asp:Panel runat="server" ID="pnlReferenceImages">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblLayerName" runat="server" Text="Image Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtImageName" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ID="requiredLayerName" Font-Bold="true" Font-Size="Large" ForeColor="Red" ErrorMessage="*"
                                            Display="Dynamic" ValidationGroup="LayerValGroup" ControlToValidate="txtImageName"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUploadLayerImg" runat="server" Text="Upload Image"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="LayerImgFileUpload" runat="server" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ID="requiredLayerImg" Font-Bold="true" Font-Size="Large" ForeColor="Red" ErrorMessage="*"
                                            Display="Dynamic" ValidationGroup="LayerValGroup" ControlToValidate="LayerImgFileUpload"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="clearfix" style="height: 15px"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnAddLayer" runat="server" ValidationGroup="LayerValGroup" Text="Add Image" CssClass="btn btn-success" OnClick="btnAddLayer_Click" />
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                            <div class="clearfix" style="height: 20px"></div>
                            <asp:DataList ID="LayerImgsDataList" runat="server" RepeatColumns="6" RepeatDirection="Horizontal" >
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImgBtnDeleteLayer" runat="server" CommandArgument='<%# Eval("RefernceImageID") %>' OnClick="ImgBtnDeleteLayer_Click" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this Image?')" ImageUrl="~/Images/action_delete.gif" ImageAlign="Middle" Style="float: right;" />
                                    <br />
                                    <a href='<%# Eval("ImagePath") %>' class="prettyPhoto zoom_ico" rel="prettyPhoto[portfolio1]">
                                        <img src='<%# Eval("ImagePath") %>' alt="4" width="150" height="110" />
                                    </a>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
