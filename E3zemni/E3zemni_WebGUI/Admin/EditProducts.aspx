<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditProducts.aspx.cs" Inherits="E3zemni_WebGUI.Admin.EditProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript">
       $(document).ready(function () {
           $("#ProdItem").addClass("current")
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <asp:Panel runat="server" ID="uiPanelAllCards">
        <div class="row">
            <div class="col-lg-12">
                <!-- BEGIN BORDERED TABLE widget-->
                
                        <h4>
                            Products</h4>
                           <div class="col-lg-6"> 
                               Top Categories
                        <asp:DropDownList ID="uiDropDownListTC" runat="server" 
                                    CssClass="form-control" 
                                       OnSelectedIndexChanged="uiDropDownListTC_SelectedIndexChanged" 
                                       AutoPostBack="True">
                                </asp:DropDownList>
                </div>
                <div class="clear" style="height:10px;"></div>
                             <div class="col-lg-6"> 
                             Main Categories
                        <asp:DropDownList ID="uiDropDownListMainCats" runat="server" 
                                    CssClass="form-control" 
                                     OnSelectedIndexChanged="uiDropDownListMainCats_SelectedIndexChanged" 
                                     AutoPostBack="True">
                                </asp:DropDownList>
                </div>
                <div class="clear" style="height:10px;"></div>
                         <div class="col-lg-6">                                
                                Product Category
                                <asp:DropDownList ID="uiDropDownListCats" runat="server" 
                                    CssClass="form-control" AutoPostBack="true"
                                    onselectedindexchanged="uiDropDownListCats_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>                            
                        <div class="clear" style="height:10px;"></div>
                
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-primary" 
                            onclick="uiLinkButtonAdd_Click" > Add new product</asp:LinkButton>
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
                                            CssClass="btn btn-default" CommandName="EditCard"> Edit</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CardID") %>'
                                            CssClass="btn btn-default" CommandName="DeleteCard" OnClientClick="return confirm('Are you want to delete this record ?');"> Delete</asp:LinkButton>
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
                    Add / Edit Product
                </h4>
                <div class="clearfix"></div>


                <ul class="tabs" id="myTab">
					<li><a href="#t-1" class="active">Main Info</a></li>
                    <asp:PlaceHolder ID="tabs" runat="server">
					<li><a href="#t-2">Product Images</a></li>					
                    </asp:PlaceHolder>			
				</ul><!-- tabs -->

                <ul class="tabs-content">
								<li id="t-1" class="active">
                                    <div>
                                        <div class="col-lg-6">
                                            <asp:Label ID="uiLabelMsg" runat="server" Visible="false"></asp:Label>
                                        </div>
                                        <div class="clear" style="height: 10px;"></div>
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
                                                    onclick="uiLinkButtonBack_Click" >Back to products</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <asp:PlaceHolder ID="tabscontent" runat="server">
                                <li id="t-2">
                                    <asp:Panel ID="Panel1" runat="server" DefaultButton="uiButtonSaveText">
                                        <div class="col-lg-12">
                                        <div class="col-lg-4">
                                            Select Image
                                            <asp:FileUpload ID="uiFileUploadProdImage" runat="server" />
                                        </div>
                                        
                                        <div class="clear" style="height:10px;"></div>
                                        <div class="form-actions">
                            
                                            <div class="col-lg-4">
                                                <asp:Button ID="uiButtonSaveText" runat="server" CssClass="btn btn-success" 
                                                    Text="Add Image " onclick="uiButtonSaveText_Click"> </asp:Button>
                                                
                                            </div>                                            
                                        </div>
                                    </div>
                                    </asp:Panel>
                                    
                                    <div class="clear" style="height:10px;"></div>
                                    <asp:DataList ID="uiDataListPhotos" runat="server" 
                                    HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Horizontal" 
                                    onitemcommand="uiDataListPhotos_ItemCommand" CssClass="table table-condensed">
                                    <HeaderTemplate>
                                    <h3>Current Photos </h3>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                    <asp:ImageButton ID="uiButtonDelete" runat="server" CommandArgument='<%# Eval("PartySupplierImageID") %>' Text="Delete" OnClientClick="return confirm('Are you want to delete this photo?');" CommandName="Delete" ForeColor="#000099" ImageUrl="~/images/action_delete.gif" AlternateText="Delete image" ImageAlign="Middle" ToolTip="Delete" />
                                    <br />
                                    <a href='<%# Eval("ImagePath") %>'><img src='<%# Eval("ImagePath") %>' alt="4" width="150" height="110"></a> 
                                    </ItemTemplate>
                                </asp:DataList>
                                </li>                               
                                </asp:PlaceHolder>
                                </ul>

                
            
            <div class="clear" style="height: 10px;">
            </div>
        </div>
    </div>           
    </asp:Panel>
</asp:Content>
