<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Training.Master" AutoEventWireup="true" CodeBehind="TrainingOrders.aspx.cs" Inherits="Flights_GUI.Training.TrainingOrders" %>
<%@ MasterType VirtualPath="~/MasterPages/E_Training.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelEditTO" runat="server">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            <i class="icon-reorder"></i>Add / Edit Training orders</h4>
                        <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                            class="icon-remove"></a></span>
                    </div>
                    <div class="widget-body form">
                        
                        <div class="form-horizontal">
                            <div class="control-group">
                                <div class="span6">
                                    <label class="control-label">
                                        Training Code</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxCode" runat="server" CssClass="input-large"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="span6">
                                    <label class="control-label">
                                        Course</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="uiDropDownListCourses" runat="server" CssClass="input-large">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="span6">
                                    <label class="control-label">
                                        Aircraft Model</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxAircraft" runat="server" CssClass="input-large"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="span6">
                                    <label class="control-label">
                                        Trainer</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="uiDropDownListTrainer" runat="server" CssClass="input-large">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="span6">
                                    <label class="control-label">
                                        Start Date - End Date</label>
                                    <div class="controls">
                                        <div class="input-prepend">
                                            <span class="add-on"><i class="icon-calendar"></i></span>
                                            <asp:TextBox ID="uiTextBoxSEDate" runat="server" CssClass="input-large date-range" style="width:183px;" ></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="span6">
                                    <label class="control-label">
                                        Training Place</label>
                                    <div class="controls">
                                        <asp:TextBox ID="uiTextBoxTrainingPlace" runat="server" CssClass="input-large" style="width:199px;"></asp:TextBox>
                                    </div>
                                </div>
                                
                                
                            </div>
                            
                        </div>
                        <div class="clearfix" style="height:20px;"></div>
                        <asp:Panel ID="uiPanelPilots" runat="server" GroupingText="Pilots">
                        <div class="form-horizontal">

                            <div class="control-group">
                                <div class="span12">
                                    <label class="control-label">
                                        Pilot</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="uiDropDownListTrainingPilots" runat="server" CssClass="input-large">
                                        </asp:DropDownList> 
                                        &nbsp;
                                        <asp:LinkButton ID="uiLinkButtonAddPilot" runat="server" CssClass="btn blue" 
                                            onclick="uiLinkButtonAddPilot_Click"><i class='icon-ok'></i> Add pilot</asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="control-group">
                                <asp:GridView ID="uiGridViewPilots" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="uiGridViewPilots_PageIndexChanging"
                                    OnRowCommand="uiGridViewPilots_RowCommand" Width="90%">
                                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    <Columns>
                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                        <asp:BoundField DataField="SureName" HeaderText="Last Name" />
                                        <asp:BoundField DataField="LicenseNo" HeaderText="LicenseNo." />                                                                                
                                        <asp:TemplateField HeaderText="Actions">
                                            <ItemTemplate>                                                
                                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("PilotID") %>'
                                                    CssClass="btn blue" CommandName="DeletePilot" OnClientClick="return confirm('Do you want to delete this record?');"
                                                    ><i class='icon-remove'></i> Delete</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>                            
                        </div>
                        </asp:Panel>
                        <div class="form-actions">                            
                            <asp:LinkButton ID="uiLinkButtonOK" runat="server" CssClass="btn blue" 
                                onclick="uiLinkButtonOK_Click"><i class='icon-ok'></i> Save and continue</asp:LinkButton>
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn blue" 
                                onclick="uiLinkButtonCancel_Click"><i class='icon-remove'></i> Cancel</asp:LinkButton>
                            <asp:LinkButton ID="uiLinkButtonBack" runat="server" CssClass="btn blue" OnClick="uiLinkButtonBack_Click"><i class='icon-arrow-left'></i> Back to training orders</asp:LinkButton>

                            <asp:LinkButton ID="uiLinkButtonApprove" runat="server" CssClass="btn btn-success"
                                OnClick="uiLinkButtonApprove_Click"><i class="icon-ok icon-white"></i> Approve</asp:LinkButton>
                            
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        
    </asp:Panel>
    <asp:Panel ID="uiPanelAllTOs" runat="server">
        <div class="row-fluid">
            <div class="span12">
                <!-- BEGIN BORDERED TABLE widget-->
                <div class="widget">
                    <div class="widget-title">
                        <h4>
                            <i class="icon-reorder"></i>Training Orders</h4>
                        <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                            class="icon-remove"></a></span>
                    </div>
                    <div class="widget-body">

                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn blue" OnClick="uiLinkButtonAdd_Click"><i class='icon-plus'></i> Add training order</asp:LinkButton>
                        <div class="clearfix" style="height: 20px;">
                        </div>
                        <asp:GridView ID="uiGridViewTO" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="uiGridViewTO_PageIndexChanging"
                            OnRowCommand="uiGridViewTO_RowCommand" Width="90%" 
                            onrowdatabound="uiGridViewTO_RowDataBound">
                            <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            <Columns>
                                <asp:BoundField DataField="TrainingCode" HeaderText="Training Code" />
                                <asp:BoundField DataField="AirPlaneModel" HeaderText="AirPlane Model" />
                                <asp:BoundField DataField="TrainingPlace" HeaderText="Training Place" />
                                <asp:TemplateField HeaderText="Course">
                                <ItemTemplate>
                                    <asp:Label ID="uiLabelCourse" runat="server" ></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd/MM/yyyy}"/>
                                <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("TrainingID") %>'
                                            CssClass="btn blue" CommandName="EditTraining"><i class='icon-edit'></i> Edit</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("TrainingID") %>'
                                            CssClass="btn blue" CommandName="DeleteTraining" OnClientClick="return confirm('Do you want to delete this record?');"
                                            ><i class='icon-remove'></i> Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <!-- END BORDERED TABLE widget-->
            </div>
        </div>
    </asp:Panel>
</asp:Content>
