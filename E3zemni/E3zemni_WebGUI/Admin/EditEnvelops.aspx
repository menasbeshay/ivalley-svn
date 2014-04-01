<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditEnvelops.aspx.cs" Inherits="E3zemni_WebGUI.Admin.EditEnvelops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#EnvItem").addClass("current")
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <asp:Panel ID="uiPanelEditCat" runat="server" DefaultButton="uiLinkButtonOK">
        <div class="row">
            <div class="grid_12">
                
                        <h4>
                           Add / Edit Envelops </h4>
                        
                        <div class="clearfix"></div>
                        <div class="form-horizontal">
                            <div class="col-lg-6">                                
                                Dimension
                                <asp:DropDownList ID="uiDropDownListDim" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>                            
                        <div class="clear" style="height:10px;"></div>
                        <div class="col-lg-6">                                
                                Color
                                <asp:DropDownList ID="uiDropDownListColor" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>                            
                        <div class="clear" style="height:10px;"></div>
                        
                            <div class="col-lg-6">                                
                                        <asp:TextBox ID="uiTextBoxPrice" runat="server" CssClass="form-control" placeholder="Price"></asp:TextBox>                                                                
                            </div>                            
                                               
                          <div class="clear" style="height:10px;"></div>
                          <div class="col-lg-6"> 
                                   Choose image &nbsp;
                                        <asp:FileUpload ID="uiFileUploadImage" runat="server" />
                                   </div>
                            </div>
                           
                        
                        <div class="clear" style="height:10px;"></div>                    
                        <div class="form-actions">
                            
                            <div class="col-lg-4">
                                <asp:Button ID="uiLinkButtonOK" runat="server" CssClass="btn btn-success" 
                                    Text="Save " onclick="uiLinkButtonOK_Click"> </asp:Button>
                                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" 
                                    CssClass="btn btn-default" onclick="uiLinkButtonCancel_Click" > Cancel</asp:LinkButton>
                            </div>
                            <div class="col-lg-2">
                                <asp:LinkButton ID="uiLinkButtonBack" runat="server" CssClass="btn btn-default" 
                                    onclick="uiLinkButtonBack_Click" >Back to envelops</asp:LinkButton>
                            </div>
                        </div>
                   
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelAllCats" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <!-- BEGIN BORDERED TABLE widget-->
                
                        <h4>
                            Envelops</h4>
                        
                
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-primary" 
                            onclick="uiLinkButtonAdd_Click" > Add new envelop</asp:LinkButton>
                        <div class="clear" style="height: 20px;">
                        </div>
                        <asp:GridView ID="uiGridViewEnvelops" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" GridLines="None" EmptyDataText="No records found."
                             Width="90%" 
                            CssClass="table" 
                            onpageindexchanging="uiGridViewEnvelops_PageIndexChanging" 
                            onrowcommand="uiGridViewEnvelops_RowCommand" 
                    onrowdatabound="uiGridViewEnvelops_RowDataBound">                            
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                            <Columns>
                                <asp:ImageField DataImageUrlField="ImagePath" HeaderText="Image" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30"/>
                                <asp:BoundField DataField="Price" HeaderText="Price" />
                                <asp:TemplateField HeaderText="Dimension">
                                    <ItemTemplate>
                                        <asp:Label ID="uiLabelDim" runat="server" ></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                <asp:TemplateField HeaderText="Color">
                                <ItemTemplate>
                                    <div id="ColorDiv" runat="server" style="width:20px;height:20px;margin:0 auto;"></div>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("EnvelopID") %>'
                                            CssClass="btn btn-default" CommandName="EditEnvelop"> Edit</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("EnvelopID") %>'
                                            CssClass="btn btn-default" CommandName="DeleteEnvelop" OnClientClick="return confirm('Are you want to delete this record ?');"> Delete</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="20%" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                   
                <!-- END BORDERED TABLE widget-->
            </div>
        </div>
    </asp:Panel>
</asp:Content>
