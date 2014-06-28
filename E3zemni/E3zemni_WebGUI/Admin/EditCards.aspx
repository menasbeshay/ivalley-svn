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
                                Card Category
                                <asp:DropDownList ID="uiDropDownListCats" runat="server" 
                                    CssClass="form-control" AutoPostBack="true"
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
                    <li><a href="#t-4">Card default background colors </a></li>
                     <li><a href="#t-5">Card attached images info </a></li>
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
                                                    Text="Add Text " onclick="uiButtonSaveText_Click"> </asp:Button>
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
                                                    Text="Add Layout " onclick="uiButtonSaveLayout_Click"> </asp:Button>
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
                                            <asp:TemplateField HeaderText="Front Image" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30">
                                            <ItemTemplate>
                                                <img src='..<%# Eval("LayoutImage") %>'
                                            </ItemTemplate>
                                            </asp:TemplateField>
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

                                 <li id="t-4">
                                       <asp:Panel ID="Panel2" runat="server" DefaultButton="uiButtonSaveColor">
                                        <div class="col-lg-12">
                                       
                                        <div class="col-lg-3">
                                            Color
                                             <asp:DropDownList ID="uiDropDownListBackColor" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clear" style="height:10px;"></div>
                                        <div class="form-actions">
                            
                                            <div class="col-lg-4">
                                                <asp:Button ID="uiButtonSaveColor" runat="server" CssClass="btn btn-success" 
                                                    Text="Add Color " onclick="uiButtonSaveColor_Click"> </asp:Button>                                                
                                            </div>                                            
                                        </div>
                                    </div>
                                    </asp:Panel>
                                    
                                    <div class="clear" style="height:10px;"></div>
                                    <asp:GridView ID="uiGridViewColors" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" GridLines="None" EmptyDataText="No records found."
                                         Width="90%" 
                                        CssClass="table" 
                                        onpageindexchanging="uiGridViewColors_PageIndexChanging" 
                                        onrowcommand="uiGridViewColors_RowCommand"
                                        onrowdatabound="uiGridViewColors_RowDataBound">                            
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" />
                                        <Columns>                                            
                                           <asp:TemplateField HeaderText="Color">
                                            <ItemTemplate>
                                                <div id="ColorDiv" runat="server" style="width:20px;height:20px;margin:0 auto;"></div>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>                                                    
                                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ColorID") %>'
                                                        CssClass="btn btn-default" CommandName="DeleteColor" OnClientClick="return confirm('Are you want to delete this record ?');"> Delete</asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="20%" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </li>
                                  <li id="t-5">
                                    <asp:Panel ID="Panel3" runat="server" DefaultButton="uiButtonSaveText">
                                        <div class="col-lg-12">                                        
                                        <div class="col-lg-3">
                                            X position
                                            <asp:TextBox ID="uiTextBoxImageX" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-3">
                                            Y position
                                            <asp:TextBox ID="uiTextBoxImageY" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div><div class="col-lg-3">
                                            Width
                                            <asp:TextBox ID="uiTextBoxImageWidth" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-3">
                                            Height
                                            <asp:TextBox ID="uiTextBoxImageHeight" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="clear" style="height:10px;"></div>
                                        <div class="form-actions">
                            
                                            <div class="col-lg-4">
                                                <asp:Button ID="uiButtonSaveImageInfo" runat="server" CssClass="btn btn-success" 
                                                    Text="Add Image info " onclick="uiButtonSaveImageInfo_Click"> </asp:Button>
                                                <asp:LinkButton ID="uiLinkButtonCancelImage" runat="server" 
                                                    CssClass="btn btn-default" onclick="uiLinkButtonCancelImage_Click" > Cancel</asp:LinkButton>
                                            </div>                                            
                                        </div>
                                    </div>
                                    </asp:Panel>
                                    
                                    <div class="clear" style="height:10px;"></div>
                                    <asp:GridView ID="uiGridViewCardImages" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" GridLines="None" EmptyDataText="No records found."
                                         Width="90%" 
                                        CssClass="table"                                         
                                        onrowcommand="uiGridViewCardImages_RowCommand">                            
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField DataField="PosX" HeaderText="X" />
                                            <asp:BoundField DataField="PosY" HeaderText="Y" />                                            
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("CardImageID") %>'
                                                        CssClass="btn btn-default" CommandName="EditImg"> Edit</asp:LinkButton>&nbsp;
                                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CardImageID") %>'
                                                        CssClass="btn btn-default" CommandName="DeleteImg" OnClientClick="return confirm('Are you want to delete this record ?');"> Delete</asp:LinkButton>
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
