<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditColors.aspx.cs" Inherits="E3zemni_WebGUI.Admin.EditColors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#colorsItem").addClass("current")
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <asp:Panel ID="uiPanelEditCat" runat="server" DefaultButton="uiLinkButtonOK">
        <div class="row">
            <div class="grid_12">
                
                        <h4>
                           Add / Edit Colrs </h4>
                        
                    
                        <asp:Panel ID="uipanelError" runat="server" >
                            <div class="alert alert-error">
                                <button class="close" data-dismiss="alert">
                                    ×</button>
                                <strong>Error!</strong> An error occurred. Can't delete this Color.
                            </div>
                        </asp:Panel>
                        <div class="clearfix"></div>
                        <div class="form-horizontal">
                        
                            <div class="col-lg-6">                                
                                        <asp:TextBox ID="uiTextBoxEnName" runat="server" CssClass="form-control" placeholder="English Name"></asp:TextBox>                                                                
                            </div>                            
                        <div class="clear" style="height:10px;"></div>
                                <div class="col-lg-6">                                   
                                        <asp:TextBox ID="uiTextBoxArName" runat="server" CssClass="form-control" placeholder="Arabic Name"></asp:TextBox>                                    
                                </div>
                        
                          <div class="clear" style="height:10px;"></div>
                          <div class="col-lg-6">                                    
                                          <asp:TextBox ID="uiTextBoxColorCode" runat="server" CssClass="form-control" placeholder="Color Code"></asp:TextBox>                                    
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
                                    onclick="uiLinkButtonBack_Click" >Back to colors</asp:LinkButton>
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
                            Colors</h4>
                        
                
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-primary" 
                            onclick="uiLinkButtonAdd_Click" > Add new color</asp:LinkButton>
                        <div class="clear" style="height: 20px;">
                        </div>
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
                                <asp:BoundField DataField="ColorNameEng" HeaderText="English Name" />
                                <asp:BoundField DataField="ColorNameAr" HeaderText="Arabic Name" />
                                <asp:TemplateField HeaderText="Color">
                                <ItemTemplate>
                                    <div style='width:20px;height:20px;margin:0 auto;' id="colordiv" runat="server">                                    
                                    </div>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ColorID") %>'
                                            CssClass="btn btn-default" CommandName="EditColor"> Edit</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ColorID") %>'
                                            CssClass="btn btn-default" CommandName="DeleteColor" OnClientClick="return confirm('Are you want to delete this record ?');"> Delete</asp:LinkButton>
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
