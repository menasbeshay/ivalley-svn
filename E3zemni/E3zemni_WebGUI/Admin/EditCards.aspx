<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditCards.aspx.cs" Inherits="E3zemni_WebGUI.Admin.EditCards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#cardItem").addClass("current")
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <asp:Panel runat="server" ID="uiPanelAllCards">
        <div class="row">
            <div class="col-lg-12">
                <!-- BEGIN BORDERED TABLE widget-->
                
                        <h4>
                            Cards</h4>
                        
                         <div class="col-lg-6">                                
                                Card Category
                                <asp:DropDownList ID="uiDropDownListCats" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>                            
                        <div class="clear" style="height:10px;"></div>
                
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-primary" 
                            onclick="uiLinkButtonAdd_Click" > Add new card</asp:LinkButton>
                        <div class="clear" style="height: 20px;">
                        </div>
                        <asp:GridView ID="uiGridViewCards" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" GridLines="None" EmptyDataText="No records found."
                             Width="90%" 
                            CssClass="table" 
                            onpageindexchanging="uiGridViewCards_PageIndexChanging" 
                            onrowcommand="uiGridViewCards_RowCommand">                            
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="CardNameEng" HeaderText="English Name" />
                                <asp:BoundField DataField="CardNameAr" HeaderText="Arabic Name" />
                                <asp:BoundField DataField="UploadDate" HeaderText="Upload Date" DataFormatString="{0:dd/MM/yyyy}"/>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("CardID") %>'
                                            CssClass="btn btn-default" CommandName="EditCat"> Edit</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CardID") %>'
                                            CssClass="btn btn-default" CommandName="DeleteCat" OnClientClick="return confirm('Are you want to delete this record ?');"> Delete</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="20%" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                   
                <!-- END BORDERED TABLE widget-->
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="uiPanelEdit">
        <div class="row">
            <div class="grid_12">
                <h4>
                    Add / Edit Cards
                </h4>
                <div class="clearfix"></div>


                <ul class="tabs">
					<li><a href="#t-1" class="active">Main Info</a></li>
					<li><a href="#t-2">Card layouts</a></li>
					<li><a href="#t-3">Card text</a></li>					
				</ul><!-- tabs -->

                <ul class="tabs-content">
								<li id="t-1" class="active">
                                    <div>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="uiTextBoxCardNameEn" runat="server" CssClass="form-control" placeholder="English name"></asp:TextBox>
                                        </div>
                                        <div class="clear" style="height: 10px;">
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="uiTextBoxCardNameAr" runat="server" CssClass="form-control" placeholder="Arabic Name"></asp:TextBox>
                                        </div>
                                        <div class="clear" style="height: 10px;">
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="uiTextBoxDescEn" runat="server" CssClass="form-control" placeholder="English description"
                                                TextMode="MultiLine" Rows="4"></asp:TextBox>
                                        </div>
                                        <div class="clear" style="height: 10px;">
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="uiTextBoxDescAr" runat="server" CssClass="form-control" placeholder="Arabic description"
                                                TextMode="MultiLine" Rows="4"></asp:TextBox>
                                        </div>
                                        <div class="clear" style="height: 10px;">
                                        </div>
                                        <div class="col-lg-6">
                                            Dimension
                                            <asp:DropDownList ID="uiDropDownListDim" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clear" style="height: 10px;">
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="uiTextBoxPriceBefore" runat="server" CssClass="form-control" placeholder="Price before"></asp:TextBox>
                                        </div>
                                        <div class="clear" style="height: 10px;">
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="uiTextBoxPriceAfter" runat="server" CssClass="form-control" placeholder="Price after"></asp:TextBox>
                                        </div>
                                        <div class="clear" style="height: 10px;">
                                        </div>
                                        <div class="col-lg-6">
                                            Choose main image &nbsp;
                                            <asp:FileUpload ID="uiFileUploadMainImage" runat="server" />
                                        </div>
                                        <div class="clear" style="height: 10px;">
                                        </div>
                                        <div class="col-lg-6">
                                            Choose hover image &nbsp;
                                            <asp:FileUpload ID="uiFileUploadHoverImage" runat="server" />
                                        </div>
                                        <div class="clear" style="height: 10px;">
                                        </div>
                                        <div class="form-actions">
                            
                                            <div class="col-lg-4">
                                                <asp:Button ID="uiLinkButtonOK" runat="server" CssClass="btn btn-success" 
                                                    Text="Save " onclick="uiLinkButtonOK_Click"> </asp:Button>
                                                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" 
                                                    CssClass="btn btn-default" onclick="uiLinkButtonCancel_Click" > Cancel</asp:LinkButton>
                                            </div>
                                            <div class="col-lg-2">
                                                <asp:LinkButton ID="uiLinkButtonBack" runat="server" CssClass="btn btn-default" 
                                                    onclick="uiLinkButtonBack_Click" >Back to cards</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li id="t-2">
                                </li>
                                <li id="t-3">
                                </li>
                                </ul>

                
            
            <div class="clear" style="height: 10px;">
            </div>
        </div>
    </div>           
    </asp:Panel>
</asp:Content>
