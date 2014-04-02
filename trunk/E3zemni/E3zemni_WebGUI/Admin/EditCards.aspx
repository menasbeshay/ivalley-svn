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
                                <asp:DropDownList ID="uiDropDownListCats" runat="server" 
                                    CssClass="form-control" 
                                    onselectedindexchanged="uiDropDownListCats_SelectedIndexChanged">
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
                    Add / Edit Cards
                </h4>
                <div class="clearfix"></div>


                <ul class="tabs" id="myTab">
					<li><a href="#t-1" class="active">Main Info</a></li>
                    <asp:PlaceHolder ID="tabs" runat="server">
					<li><a href="#t-2">Card text</a></li>
					<li><a href="#t-3">Card layout</a></li>		
                    </asp:PlaceHolder>			
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
                                <asp:PlaceHolder ID="tabscontent" runat="server">
                                <li id="t-2">
                                    <asp:Panel runat="server" DefaultButton="uiButtonSaveText">
                                        <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            Text label
                                            <asp:TextBox ID="uiTextBoxTxtLabel" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-3">
                                        <div style="height:30px;"></div>
                                            <asp:CheckBox ID="uiCheckBoxIsMultiLine" runat="server" Text=" Is multiline" CssClass="checkbox-inline"/>
                                        </div>
                                        <div class="clear" style="height:10px;"></div>
                                        <div class="col-lg-3">
                                            X position
                                            <asp:TextBox ID="uiTextBoxX" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-3">
                                            Y position
                                            <asp:TextBox ID="uiTextBoxY" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div><div class="col-lg-3">
                                            Width
                                            <asp:TextBox ID="uiTextBoxWidth" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-3">
                                            Height
                                            <asp:TextBox ID="uiTextBoxHeight" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="clear" style="height:10px;"></div>
                                        <div class="form-actions">
                            
                                            <div class="col-lg-4">
                                                <asp:Button ID="uiButtonSaveText" runat="server" CssClass="btn btn-success" 
                                                    Text="Save " onclick="uiButtonSaveText_Click"> </asp:Button>
                                                <asp:LinkButton ID="uiLinkButtonCancelText" runat="server" 
                                                    CssClass="btn btn-default" onclick="uiLinkButtonCancelText_Click" > Cancel</asp:LinkButton>
                                            </div>                                            
                                        </div>
                                    </div>
                                    </asp:Panel>
                                    
                                    <div class="clear" style="height:10px;"></div>
                                    <asp:GridView ID="uiGridViewCardText" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" GridLines="None" EmptyDataText="No records found."
                                         Width="90%" 
                                        CssClass="table" 
                                        onpageindexchanging="uiGridViewCardText_PageIndexChanging" 
                                        onrowcommand="uiGridViewCardText_RowCommand">                            
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField DataField="TextLabel" HeaderText="Text Label" />
                                            <asp:CheckBoxField DataField="IsMultiLine" HeaderText="Is multiline" />
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("CardTextID") %>'
                                                        CssClass="btn btn-default" CommandName="EditTxt"> Edit</asp:LinkButton>&nbsp;
                                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CardTextID") %>'
                                                        CssClass="btn btn-default" CommandName="DeleteTxt" OnClientClick="return confirm('Are you want to delete this record ?');"> Delete</asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="20%" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </li>
                                <li id="t-3">
                                       <asp:Panel ID="Panel1" runat="server" DefaultButton="uiButtonSaveLayout">
                                        <div class="col-lg-12">
                                        <div class="col-lg-6">
                                            Front Image
                                            <asp:FileUpload ID="uiFileUploadLayoutFront" runat="server" />
                                        </div>
                                        
                                        <div class="clear" style="height:10px;"></div>
                                        <div class="col-lg-6">
                                            Back Image
                                            <asp:FileUpload ID="uiFileUploadLayoutBack" runat="server" />
                                        </div>
                                        <div class="clear" style="height:10px;"></div>
                                        <div class="col-lg-3">
                                            Color
                                             <asp:DropDownList ID="uiDropDownListColor" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clear" style="height:10px;"></div>
                                        <div class="form-actions">
                            
                                            <div class="col-lg-4">
                                                <asp:Button ID="uiButtonSaveLayout" runat="server" CssClass="btn btn-success" 
                                                    Text="Save " onclick="uiButtonSaveLayout_Click"> </asp:Button>
                                                <asp:LinkButton ID="uiLinkButtonCancelLayout" runat="server" 
                                                    CssClass="btn btn-default" onclick="uiLinkButtonCancelLayout_Click" > Cancel</asp:LinkButton>
                                            </div>                                            
                                        </div>
                                    </div>
                                    </asp:Panel>
                                    
                                    <div class="clear" style="height:10px;"></div>
                                    <asp:GridView ID="uiGridViewLayout" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" GridLines="None" EmptyDataText="No records found."
                                         Width="90%" 
                                        CssClass="table" 
                                        onpageindexchanging="uiGridViewLayout_PageIndexChanging" 
                                        onrowcommand="uiGridViewLayout_RowCommand"
                                        onrowdatabound="uiGridViewLayout_RowDataBound">                            
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:ImageField DataImageUrlField="LayoutImage" HeaderText="Front Image" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30"/>
                                           <asp:TemplateField HeaderText="Color">
                                            <ItemTemplate>
                                                <div id="ColorDiv" runat="server" style="width:20px;height:20px;margin:0 auto;"></div>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>                                                    
                                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CardLayoutID") %>'
                                                        CssClass="btn btn-default" CommandName="DeleteLayout" OnClientClick="return confirm('Are you want to delete this record ?');"> Delete</asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="20%" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </li>
                                </asp:PlaceHolder>
                                </ul>

                
            
            <div class="clear" style="height: 10px;">
            </div>
        </div>
    </div>           
    </asp:Panel>
</asp:Content>
