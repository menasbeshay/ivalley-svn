<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Common.Master" AutoEventWireup="true" CodeBehind="SectorClients.aspx.cs" Inherits="Flights_GUI.Common.SectorClients" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelViewAll" runat="server">
        <div class="ContentLeftDiv">
            <h4>
                Clients</h4>
            <div class="Details900">
                <div class="whiteArea">
                    <div class="More" style="float: left;">
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new client</asp:LinkButton>
                    </div>
                    <div class="clear10">
                    </div>
                    <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch">
                        <div class="AdminMiddle">
                            <asp:Label ID="Label33" runat="server" Text="Client name or Contact name :" 
                                CssClass="Label"></asp:Label>
                            &nbsp;
                            <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="310px"></asp:TextBox>
                            <div class="clear5">
                            </div>
                            </div>
                        <div class="AdminRight" style="width: 80px">
                            &nbsp;
                            <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" OnClick="uiButtonSearch_Click"
                                Width="60px" Style="display: none;" />
                            <div class="SearchBtn" 
                                style="width: 50px; height: 15px; margin-top: -15px; margin-left: 5px;">
                                <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click">Search</asp:LinkButton>
                            </div>
                        </div>
                        <div class="clear10">
                        </div>
                    </asp:Panel>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 100%; padding-left: 5%;">
                        <telerik:radgrid id="uiRadGridClients" runat="server" allowpaging="True" autogeneratecolumns="False"
                            cellspacing="0" horizontalalign="Center" skin="Office2007" width="90%" 
                            onpageindexchanged="uiRadGridClients_PageIndexChanged" onpagesizechanged="uiRadGridClients_PageSizeChanged"
                            onitemcommand="uiRadGridClients_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="Name"></telerik:GridBoundColumn>                                                    
                        <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>
                              
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ClientID") %>'
                                        CommandName="EditSectorClient"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ClientID") %>'
                                        CommandName="DeleteSectorClient" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:radgrid>
                    </div>
                    <div class="clear5">
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelEdit" runat="server">
        <div class="ContentLeftDiv">
            <h4>
                Edit Client</h4>
            <div class="Details900">
                <div class="whiteArea">
                    <div class="AdminLeft" style="width: 100px;" >
                        <asp:Label ID="Label25" runat="server" Text="Name" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="SectorClient" 
                            Width="300px" ></asp:TextBox></div>
                    <div class="AdminRight" >                        
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="uiTextBoxName" Display="Dynamic" ErrorMessage="Required" 
                            ForeColor="Red" ValidationGroup="SectorClient">*</asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                        </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        <asp:Label ID="Label1" runat="server" Text="Telephone" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxTele" runat="server" ValidationGroup="SectorClient" 
                            Width="300px"></asp:TextBox></div>
                    <div class="AdminRight">
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" 
                            runat="server" ControlToValidate="uiTextBoxTele" Display="Dynamic" 
                            ErrorMessage="Numbers only." ForeColor="Red" 
                            ValidationExpression="^[-+]?(\d)+$" ValidationGroup="SectorClient">*</asp:RegularExpressionValidator>
                        <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator5_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RegularExpressionValidator5">
                        </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        <asp:Label ID="Label2" runat="server" Text="Fax" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxFax" runat="server" ValidationGroup="SectorClient" 
                            Width="300px"></asp:TextBox></div>
                    <div class="AdminRight">
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" 
                            runat="server" ControlToValidate="uiTextBoxFax" Display="Dynamic" 
                            ErrorMessage="Numbers only." ForeColor="Red" 
                            ValidationExpression="^[-+]?(\d)+$" ValidationGroup="SectorClient">*</asp:RegularExpressionValidator>
                        <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator6_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RegularExpressionValidator6">
                        </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        <asp:Label ID="Label3" runat="server" Text="Address" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxAddress" runat="server" Height="50px" 
                            TextMode="MultiLine" ValidationGroup="SectorClient" Width="300px"></asp:TextBox></div>
                    <div class="AdminRight">
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        <asp:Label ID="Label4" runat="server" Text="E-Mail" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxMail" runat="server" ValidationGroup="SectorClient" 
                            Width="300px"></asp:TextBox></div>
                    <div class="AdminRight">
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator7" 
                            runat="server" ControlToValidate="uiTextBoxMail" Display="Dynamic" 
                            ErrorMessage="Please enter a valid email address." ForeColor="Red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="SectorClient">*</asp:RegularExpressionValidator>
                        <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator7_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RegularExpressionValidator7">
                        </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        <asp:Label ID="Label5" runat="server" Text="Website" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxWebsite" runat="server" 
                            ValidationGroup="SectorClient" Width="300px"></asp:TextBox></div>
                    <div class="AdminRight">
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        <asp:Label ID="Label6" runat="server" Text="Logo" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        </div>
                    <div class="AdminRight">
                        <asp:FileUpload ID="uiFileUploadLogo" runat="server" />
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="seprator">
                        Contact person info.
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        <asp:Label ID="Label7" runat="server" Text="Name" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxContactName" runat="server" 
                            ValidationGroup="SectorClient" Width="300px"></asp:TextBox></div>
                    <div class="AdminRight">
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        <asp:Label ID="Label8" runat="server" Text="Telephone" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxContactTele" runat="server" 
                            ValidationGroup="SectorClient" Width="300px"></asp:TextBox></div>
                    <div class="AdminRight">
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator8" 
                            runat="server" ControlToValidate="uiTextBoxContactTele" Display="Dynamic" 
                            ErrorMessage="Numbers only." ForeColor="Red" 
                            ValidationExpression="^[-+]?(\d)+$" ValidationGroup="SectorClient">*</asp:RegularExpressionValidator>
                        <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator8_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RegularExpressionValidator8">
                        </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        <asp:Label ID="Label9" runat="server" Text="Mobile" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxContactMobile" runat="server" 
                            ValidationGroup="SectorClient" Width="300px"></asp:TextBox></div>
                    <div class="AdminRight">
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator9" 
                            runat="server" ControlToValidate="uiTextBoxContactMobile" Display="Dynamic" 
                            ErrorMessage="Numbers only." ForeColor="Red" 
                            ValidationExpression="^[-+]?(\d)+$" ValidationGroup="SectorClient">*</asp:RegularExpressionValidator>
                        <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator9_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RegularExpressionValidator9">
                        </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        <asp:Label ID="Label10" runat="server" Text="E-Mail" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxContactMail" runat="server" 
                            ValidationGroup="SectorClient" Width="300px"></asp:TextBox></div>
                    <div class="AdminRight">
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                            runat="server" ControlToValidate="uiTextBoxContactMail" Display="Dynamic" 
                            ErrorMessage="Please enter a valid email address." ForeColor="Red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="SectorClient">*</asp:RegularExpressionValidator>
                        <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator10_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RegularExpressionValidator10">
                        </cc1:ValidatorCalloutExtender>
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminLeft" style="width: 100px;">
                        &nbsp;&nbsp;</div>
                    <div class="AdminMiddle" style="width: 50%;">
                        <div class="More" style="float: left;">
                            <asp:LinkButton ID="uiLinkButtonSaveClient" runat="server" Text="Save" OnClick="uiLinkButtonSaveClient_Click"
                                ValidationGroup="SectorClient"></asp:LinkButton></div>
                        &nbsp;<div class="More" style="float: left; width: 45%;">
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="Cancel" OnClick="uiLinkButtonCancel_Click"></asp:LinkButton></div>
                    </div>
                    <div class="AdminRight">
                    </div>
                    <div class="clear10">
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
        
</asp:Content>
