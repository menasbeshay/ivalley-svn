<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditPages.aspx.cs" Inherits="E3zemni_WebGUI.Admin.EditPages" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#PageItem").addClass("current")
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <asp:Panel ID="uiPanelEditCat" runat="server" DefaultButton="uiLinkButtonOK">
        <div class="row">
            <div class="grid_12">
                
                        <h4>
                           Add / Edit Pages </h4>
                        
                    
                       
                        <div class="clearfix"></div>
                        <div class="form-horizontal">
                        
                            <div class="col-lg-6">                                
                            English Title
                                        <asp:TextBox ID="uiTextBoxEnName" runat="server" CssClass="form-control" ></asp:TextBox>                                                                
                            </div>                            
                        <div class="clear" style="height:10px;"></div>
                                <div class="col-lg-6">                                   
                                Arabic Title
                                        <asp:TextBox ID="uiTextBoxArName" runat="server" CssClass="form-control" ></asp:TextBox>                                    
                                </div>
                        
                          <div class="clear" style="height:10px;"></div>
                          
                            <div class="col-lg-12">     
                            English Content                           
                                         <FCKeditorV2:FCKeditor ID="uiFCKeditorEnContent" runat="server" BasePath="~/modules/fckeditor/" Height="300px" SkinPath="skins/silver/">
            </FCKeditorV2:FCKeditor>                                                              
                            </div>                            
                        <div class="clear" style="height:10px;"></div>
                                <div class="col-lg-12">          
                                Arabic Content                         
                                         <FCKeditorV2:FCKeditor ID="uiFCKeditorArContent" runat="server" BasePath="~/modules/fckeditor/" Height="300px" SkinPath="skins/silver/">
            </FCKeditorV2:FCKeditor>                                   
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
                                    onclick="uiLinkButtonBack_Click" >Back to pages</asp:LinkButton>
                            </div>
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
                            Pages</h4>
                                                               
                      
                        <asp:GridView ID="uiGridViewPages" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" GridLines="None" EmptyDataText="No records found."
                             Width="90%" 
                            CssClass="table" 
                            onpageindexchanging="uiGridViewPages_PageIndexChanging" 
                            onrowcommand="uiGridViewPages_RowCommand">                            
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="PageTitleEng" HeaderText="English Name" />
                                <asp:BoundField DataField="PageTitleAr" HeaderText="Arabic Name" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("PageID") %>'
                                            CssClass="btn btn-default" CommandName="EditPage"> Edit</asp:LinkButton>&nbsp;                                        
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
