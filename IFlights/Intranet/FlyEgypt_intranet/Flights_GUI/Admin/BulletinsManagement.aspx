<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ExceptionLight.Master" AutoEventWireup="true" CodeBehind="BulletinsManagement.aspx.cs" Inherits="Flights_GUI.Admin.BulletinsManagement" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/ExceptionLight.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <script type="text/javascript">
             $(document).ready(function () {
                 $('.notify-row .btn-inverse').removeClass("active");
                 $('#mi_top_Manage_Circulars').addClass("active");
             });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelViewAll" runat="server">
    <div class="cell-2 clearfix pull-right">
        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonAdd_Click">Add new bulletin</asp:LinkButton>
        <div class="clearfix">&nbsp;  </div>
    </div>
    <div class="cell-12 clearfix">
        <telerik:RadGrid ID="uiRadGridcirculars" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" EnableEmbeddedSkins="False" Width="90%"                         
                        onpageindexchanged="uiRadGridcirculars_PageIndexChanged"                          
                        onitemcommand="uiRadGridcirculars_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="Title" HeaderText="Title"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="UserName" HeaderText="Created By"></telerik:GridBoundColumn>                        
                            <telerik:GridBoundColumn DataField="createdDate" HeaderText="Created Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>                        
                        <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>                                
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("AnnouncementID") %>'
                                        CommandName="EditCircular"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("AnnouncementID") %>'
                                        CommandName="DeleteCircular" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:RadGrid>
    </div>
        </asp:Panel>
     <asp:Panel ID="uiPanelEdit" runat="server">
         <div class="cell-12 clearfix">
             <div class="cell-2">Title</div>
             <div class="cell-4">
                 <asp:TextBox ID="uiTextBoxTitle" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ValidationGroup="add" ControlToValidate="uiTextBoxTitle"></asp:RequiredFieldValidator>
             </div>
         </div>
         <div style="clear:both;height:5px;"></div>
         <div class="cell-12 clearfix">
             <div class="cell-2">Brief</div>
             <div class="cell-4">
                 <asp:TextBox ID="uiTextBoxBrief" runat="server" TextMode="MultiLine" Rows="4" Columns="20"></asp:TextBox></div>
         </div>
         <div style="clear:both;height:5px;"></div>
         <div class="cell-12 clearfix">
             <div class="cell-2">Main image</div>
             <div class="cell-4">

                 <asp:FileUpload ID="uiFileUploadImg" runat="server" />
                 
             </div>
             <div class="cell-4">
                 <asp:Image ID="uiImageMain" runat="server" style="max-width:150px;"/>
             </div>
         </div>
         <div style="clear:both;height:5px;"></div>
         <div class="cell-12 clearfix" style="margin-left:0;display:none;">
             <div class="cell-2">Created By</div>
             <div class="cell-4"><asp:TextBox ID="uiTextBoxCreatedBy" runat="server"></asp:TextBox></div>
         </div>
         <div style="clear:both;height:5px;"></div>
          <div class="cell-12 clearfix" style="margin-left:0">
             <div class="cell-2">Content</div>
             <div class="cell-4">
                 <telerik:RadEditor ID="uiRadEditorContnet" runat="server">
                     <CssFiles>
                         <telerik:EditorCssFile Value="~/css/editor.css" />
                     </CssFiles>
                     <Tools>
                         <telerik:EditorToolGroup Tag="MainToolbar">
                             <telerik:EditorSplitButton Name="Undo">
                             </telerik:EditorSplitButton>
                             <telerik:EditorSplitButton Name="Redo">
                             </telerik:EditorSplitButton>
                             <telerik:EditorSeparator />
                             <telerik:EditorTool Name="Cut" />
                             <telerik:EditorTool Name="Copy" />
                             <telerik:EditorTool Name="Paste" ShortCut="CTRL+V" />
                         </telerik:EditorToolGroup>
                         <telerik:EditorToolGroup Tag="Formatting">
                             <telerik:EditorTool Name="Bold" />
                             <telerik:EditorTool Name="Italic" />
                             <telerik:EditorTool Name="Underline" />
                             <telerik:EditorSeparator />
                             <telerik:EditorSplitButton Name="ForeColor">
                             </telerik:EditorSplitButton>
                             <telerik:EditorSplitButton Name="BackColor">
                             </telerik:EditorSplitButton>
                             <telerik:EditorSeparator />
                             <telerik:EditorDropDown Name="FontName">
                             </telerik:EditorDropDown>
                             <telerik:EditorDropDown Name="RealFontSize">
                             </telerik:EditorDropDown>
                         </telerik:EditorToolGroup>
                         <telerik:EditorToolGroup>
                             <telerik:EditorTool Name="ImageManager" />
                             <telerik:EditorTool Name="DocumentManager" />
                             <telerik:EditorTool Name="InsertTable" />
                         </telerik:EditorToolGroup>
                     </Tools>
                     <Content>
</Content>
                     <ImageManager DeletePaths="~/FileUploads" UploadPaths="~/FileUploads" ViewPaths="~/FileUploads" />
                     <DocumentManager DeletePaths="~/FileUploads" UploadPaths="~/FileUploads" ViewPaths="~/FileUploads" />
                 </telerik:RadEditor>
             </div>
         </div>
         <div class="cell-12 clearfix" style="margin-left:0;margin-top:10px;">
             <div class="cell-2"></div>
             <div class="cell-2">
                 <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="btn btn-primary" OnClick="uiButtonSave_Click" ValidationGroup="add">Save</asp:LinkButton></div>
             <div class="cell-4">
                 <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton></div>
             </div>
         
     </asp:Panel>

</asp:Content>
