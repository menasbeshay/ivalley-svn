<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="applications.aspx.cs" Inherits="WebApplication.Admin.applications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section class="span12 col-left">
        			
            <div class="span12">
                <asp:Panel runat="server" ID="uiPanelAllApplications">
                    <asp:GridView ID="uiGridViewAllApplications" runat="server" AllowPaging="True" AutoGenerateColumns="False" HorizontalAlign="Center" OnPageIndexChanging="uiGridViewAllApplications_PageIndexChanging" OnRowCommand="uiGridViewAllApplications_RowCommand" PageSize="15" Width="100%" CssClass="table table-hover " >
                        <AlternatingRowStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" />                    
                        <Columns>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />                        
                            <asp:BoundField DataField="Langauge" HeaderText="Langauge" />
                            <asp:BoundField DataField="CourseName" HeaderText="Course Name" />                        
                            <asp:BoundField DataField="LastStatusName" HeaderText="Status" ItemStyle-Width="250px"/>
                            <asp:BoundField DataField="LastStatusDate" HeaderText="Last Updated Date" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                <asp:LinkButton runat="server" CommandName="EditApp" CommandArgument='<%# Eval("ApplicationDataID") %>' CssClass="btn btn-primary">Update application</asp:LinkButton>
                                    <div class="clearfix" style="height:2px;"></div>
                                    <a href='appdata?sid=<%# Eval("StudentID") %>' class="btn btn-sm btn-primary">Update application data</a>
                                    </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel runat="server" ID="uiPanelApplicationDetails" style="position:relative;">
                    <h4 class="bold" style="color:#428bca">
                        Applicant Data
                    </h4>
                    <asp:LinkButton ID="uiLinkButtonBack" runat="server" CssClass="btn btn-primary pull-right" OnClick="uiLinkButtonBack_Click">Back to applications</asp:LinkButton>
                    <div class="clearfix" style="height:1px;clear:both;"></div>
                    <asp:LinkButton ID="uiLinkButtonPrint" runat="server" CssClass="btn btn-primary pull-right" OnClick="uiLinkButtonPrint_Click">Print applications</asp:LinkButton>
                    <div class="col-lg-2 pull-right" style="position:absolute;top:20px;right:14%;">
                        
                            <asp:Image ID="uiImageMain" runat="server" CssClass="thumbnail" style="max-height:100px;"/>
                         
                    </div>
                    <div class="col-lg-8">
                        <div class="col-lg-11">
                            <div class="col-lg-2"><label style="font-weight:bold">Name</label></div>
                            <div class="col-lg-4">
                                <asp:Label ID="uiLabelName" runat="server" ></asp:Label></div>
                            <div class="col-lg-2"><label style="font-weight:bold">Email</label></div>
                            <div class="col-lg-4">
                                <asp:Label ID="uiLabelMail" runat="server" ></asp:Label>
                            </div>
                        </div>                       
                    </div>

                    <div class="col-lg-8">
                        <div class="col-lg-11">
                            <div class="col-lg-2"><label style="font-weight:bold">Language</label></div>
                            <div class="col-lg-4"><asp:Label ID="uiLabelLang" runat="server" ></asp:Label></div>
                            <div class="col-lg-2"><label style="font-weight:bold">Course</label></div>
                            <div class="col-lg-4"><asp:Label ID="uiLabelCourse" runat="server" ></asp:Label></div>
                        </div>                       
                    </div>
                    <div class="clearfix" style="clear:both;height:5px;"></div>
                    
                        <div class="col-lg-12">
                            <h4>Update application status </h4>

                            <div class="clearfix" style="clear: both; height: 5px;"></div>                            
                            <div class="col-lg-12">
                                <div class="col-lg-2">
                                    <label>Status Comment</label></div>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="uiTextBoxComment" runat="server" TextMode="MultiLine" Rows="4" Width="80%"></asp:TextBox>
                                </div>
                            </div>                                
                            <div class="clearfix" style="clear: both; height: 10px;"></div>
                            <div class="col-lg-12">
                                <div class="col-lg-2">
                                    <label>New status</label></div>
                                <div class="col-lg-3">
                                    <asp:DropDownList ID="uiDropDownListStatus" runat="server"></asp:DropDownList>
                                </div>
                            </div>

                            <asp:Panel runat="server" ID="uiPanelFees" Visible="false">
                                <div class="clearfix" style="clear: both; height: 5px;"></div>                            
                            <div class="col-lg-12">
                                <div class="col-lg-2">
                                    <label>Tuition  Fees</label></div>
                                <div class="col-lg-1">
                                    <asp:TextBox ID="uiTextBoxFees" runat="server" ></asp:TextBox>
                                </div>
                            </div>  
                            </asp:Panel>

                             <asp:Panel runat="server" ID="uiPanelMissingDocs" Visible="false">
                                <div class="clearfix" style="clear: both; height: 5px;"></div>
                                 <hr style="width:70%" />
                            <div class="col-lg-12">
                                <div class="col-lg-5">
                                    <label class="bold">Select missing documents</label></div>
                                <div class="clearfix" style="clear: both; height: 5px;"></div>
                                <div class="col-lg-12">
                                    <asp:CheckBoxList ID="uiCheckBoxListMissingDocs" runat="server"></asp:CheckBoxList>
                                </div>
                            </div>  
                            </asp:Panel>

                            <asp:Panel runat="server" ID="uiPanelRefusalReasons" Visible="false">
                                <div class="clearfix" style="clear: both; height: 5px;"></div> 
                                <hr style="width:70%" />                           
                            <div class="col-lg-12">
                                <div class="col-lg-5">
                                    <label class="bold">Select refusal reasons :</label></div>
                                <div class="clearfix" style="clear: both; height: 5px;"></div>
                                <div class="col-lg-12">
                                    <asp:CheckBoxList ID="uiCheckBoxListRefusalReason" runat="server"></asp:CheckBoxList>
                                </div>
                            </div>  
                            </asp:Panel>

                            <div class="clearfix" style="height:10px;"></div>
                             <hr style="width:70%" />
                            <div class="col-lg-12">
                                <div class="col-lg-2">
                                    <label class="bold">Attachments</label></div>
                                <div class="col-lg-12">
                                      <iframe src="../upload.html" style="border:0;width:100%"></iframe>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                
                                <div class="col-lg-2 col-lg-offset-7">
                                    <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn btn-default" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
                                    </div>
                                <div class="col-lg-2">
                                       <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonUpdate_Click">Update Status</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    

                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <h4 class="bold " style="color:#428bca">
                                Update History
                            </h4>
                            <asp:GridView ID="uiGridViewStatusHistory" runat="server"  AutoGenerateColumns="False" HorizontalAlign="Center"  Width="100%" CssClass="table table-hover " OnRowDataBound="uiGridViewStatusHistory_RowDataBound" >
                                <AlternatingRowStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" />                     
                        <Columns>                                                        
                            <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="30%"/>
                            <asp:BoundField DataField="StatusComment" HeaderText="Comment" ItemStyle-Width="40%"/>
                            <asp:BoundField DataField="StatusDate" HeaderText="Last Updated Date" DataFormatString="{0:dd/MM/yyyy}" />     
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                     <a href='#attachModal_<%# Container.DataItemIndex %>' data-toggle="modal" class="btn btn-primary btn-sm" style="text-decoration:none;">Check attachments</a> &nbsp;
                                    <div id='attachModal_<%# Container.DataItemIndex %>' class="modal fade" role="modal" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <a class="close pull-right" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>                                                    
                                                    <h3>Attachments</h3>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-horizontal blockBox">
                                                        <asp:GridView ID="uiGridViewAttachments" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("FilePath").ToString().Substring(Eval("FilePath").ToString().LastIndexOf("/") + 1) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Download">
                                                                    <ItemTemplate>
                                                                        <a href='<%# Eval("FilePath").ToString()%>' class="btn btn-primary">Download</a>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                
                                                            </Columns>
                                                        </asp:GridView>
                                                        
                                                    </div>
                                                </div>                                               
                                                <div class="modal-footer">
                                                    <a href="#" class="btn " data-dismiss="modal" style="text-decoration: none;">close</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Admin Attachments">
                                <ItemTemplate>
                                     <a href='#adminattachModal_<%# Container.DataItemIndex %>' data-toggle="modal" class="btn btn-primary btn-sm" style="text-decoration:none;">Check admin attachments</a>&nbsp;
                                    <div id='adminattachModal_<%# Container.DataItemIndex %>' class="modal fade" role="modal" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <a class="close pull-right" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>                                                    
                                                    <h3>Attachments</h3>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-horizontal blockBox">
                                                        <asp:GridView ID="uiGridViewAdminAttachments" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Name">
                                                                    <ItemTemplate>
                                                                        <%# Eval("AttachmentPath").ToString().Substring(Eval("AttachmentPath").ToString().LastIndexOf("/") + 1) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Download">
                                                                    <ItemTemplate>
                                                                        <a href='<%# Eval("AttachmentPath").ToString()%>' class="btn btn-primary">Download</a>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                
                                                            </Columns>
                                                        </asp:GridView>
                                                        
                                                    </div>
                                                </div>                                               
                                                <div class="modal-footer">
                                                    <a href="#" class="btn " data-dismiss="modal" style="text-decoration: none;">close</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment receipt">
                                <ItemTemplate>
                                   
                                    <a href='#paymentModal_<%# Container.DataItemIndex %>' class="btn btn-primary btn-sm" data-toggle="modal" style="text-decoration:none;">Payment receipt</a>&nbsp;
                                    <div id='paymentModal_<%# Container.DataItemIndex %>' class="modal fade" role="modal" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <a class="close pull-right" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>                                                    
                                                    <h3>Wire Transefer Receipt</h3>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-horizontal blockBox">                                                        
                                                        <img src=' <%# Eval("WireTranseferReceipt") %>' style="max-width:90%"/>
                                                    </div>
                                                </div>                                               
                                                <div class="modal-footer">
                                                    <a href="#" class="btn " data-dismiss="modal" style="text-decoration: none;">close</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Visa result">
                                <ItemTemplate>
                                   
                                    <a href='#visaModal_<%# Container.DataItemIndex %>' class="btn btn-primary btn-sm" data-toggle="modal" style="text-decoration:none;">Visa result</a>
                                    <div id='visaModal_<%# Container.DataItemIndex %>' class="modal fade" role="modal" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <a class="close pull-right" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>                                                    
                                                    <h3>Visa result</h3>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-horizontal blockBox">                                                        
                                                        <img src=' <%# Eval("VisaResult") %>' style="max-width:90%"/>
                                                    </div>
                                                </div>                                               
                                                <div class="modal-footer">
                                                    <a href="#" class="btn " data-dismiss="modal" style="text-decoration: none;">close</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                            </asp:GridView>
                        </div>                       
                    </div>


                </asp:Panel>
            </div>
            
        </section>
   
</asp:Content>
