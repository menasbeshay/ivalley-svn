<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="SliderPage.aspx.cs" Inherits="brotherssolidarity.Admin.SliderPage" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-box"></i>Edit Your Slider Images</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="span8 col1">
                                <asp:Table ID="SliderTable" runat="server">
                                    <asp:TableRow Visible="false">
                                        <asp:TableCell>
                                            <asp:Label ID="lblSliderTitel" runat="server" Text="Title : "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <FCKeditorV2:FCKeditor ID="uiFCKeditorTitle" runat="server" BasePath="~/modules/fckeditor/" SkinPath="skins/silver/" Width="500" Height="300">
                                        </FCKeditorV2:FCKeditor>                                            
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            
                                        </asp:TableCell>

                                    </asp:TableRow>
                                    <asp:TableRow Visible="false">
                                        <asp:TableCell>
                                            <asp:Label ID="lblSliderDescription" runat="server" Text="Description : "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                           <FCKeditorV2:FCKeditor ID="uiFCKeditorDesc" runat="server" BasePath="~/modules/fckeditor/" SkinPath="skins/silver/" Width="500" Height="300">
                                        </FCKeditorV2:FCKeditor>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                           
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblUploadImg" runat="server" Text="Upload Image"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:FileUpload ID="UploadImgSlider" runat="server" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RequiredFieldValidator ValidationGroup="MatColValGroup" runat="server" ID="RequiredFieldValidator2" ForeColor="Red" Font-Bold="true" Font-Size="Large" ErrorMessage="*"
                                                Display="Dynamic" ControlToValidate="UploadImgSlider"></asp:RequiredFieldValidator>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow Visible="false">
                                        <asp:TableCell>
                                            <asp:Label ID="SliderLink" runat="server" Text="Slider Link"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtSliderLink" runat="server"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblActive" runat="server" Text="Is Active ?"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:CheckBox ID="chkboxActive" runat="server" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                        <div class="clearfix" style="height:15px"></div>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell ColumnSpan="2">
                                            <asp:Button ID="BtnSaveSlider" runat="server" Text="Save" Style="margin-right: 3px" OnClick="BtnSaveSlider_Click" CssClass="btn btn-success" />
                                            <asp:Button ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" CssClass="btn btn-danger" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                            <div class="span4 col2">
                                <img id="SliderBannerImg" runat="server" src="" visible="false" height="200" width="200" />
                            </div>
                        </div>
                        <div class="span12">
                            <div style="margin: 0 auto; float: none; text-align: center;">
                                <asp:Button ID="BtnNewSlider" runat="server" Text="Add New Slider" CssClass="btn btn-primary" OnClick="BtnNewSlider_Click" />
                            </div>

                            <div class="clearfix" style="height: 20px">
                            </div>

                            <asp:GridView ID="GrdSlider" HorizontalAlign="Center" Width="80%" AutoGenerateColumns="False" CssClass="fc-grid" ForeColor="#333333" CellPadding="4" OnRowCommand="GrdSlider_RowCommand" runat="server" GridLines="None">
                                <AlternatingRowStyle HorizontalAlign="Center" BackColor="White" ForeColor="#284775" />
                                <Columns>
                                     <%--<asp:TemplateField HeaderText="Title">
                                        <ItemTemplate>
                                            <%# Server.HtmlDecode( Eval("Title").ToString()) %>
                                            </ItemTemplate>
                                         </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <img id="SliderGrdImg" runat="server" src='<%#Eval("ImagePath") %>' width="100" height="100" />
                                        </ItemTemplate>
                                        <ControlStyle CssClass="actions"></ControlStyle>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkBtnEdit" CommandName="EditSlider" CommandArgument='<%#Eval("SliderID") %>' runat="server" CssClass="btn btn-primary">Edit</asp:LinkButton>

                                            <asp:LinkButton ID="LinkBtnDelete" CommandName="DeleteSlider" OnClientClick="return confirm('Are you sure you want to delete this Slider?')" CssClass="btn btn-primary" CommandArgument='<%#Eval("SliderID") %>' runat="server">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                        
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
