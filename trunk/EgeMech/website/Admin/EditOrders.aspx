<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="EditOrders.aspx.cs" Inherits="website.Admin.EditOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain">
        <asp:Panel ID="uiPanelViewOrders" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    Orders
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new order</asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminMiddle" style="width: 100%">
                        <asp:GridView ID="uiGridViewOrders" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewOrders_RowCommand"
                            AllowPaging="True" OnPageIndexChanging="uiGridViewOrders_PageIndexChanging" EnableModelValidation="True"
                            HorizontalAlign="Center" Width="95%">
                            <Columns>
                                <asp:BoundField DataField="OrderNumber" HeaderText="Order Number" />
                                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                <asp:BoundField DataField="OrderDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Mail" HeaderText="E-Mail" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                               <%-- <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" />--%>
                                <%--<asp:BoundField DataField="CreatedDate" HeaderText="&#1578;&#1575;&#1585;&#1610;&#1582; &#1575;&#1604;&#1606;&#1588;&#1585;" DataFormatString="{0:dd/MM/yyyy}" />--%>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("OrderID") %>'
                                            CommandName="EditOrders">Edit</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("OrderID") %>'
                                            CommandName="DeleteOrders" OnClientClick="return confirm('do you want to delete this record ?');">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server">
            <div class="ContentLeftDiv">
                <h4>
                    Edit Orders</h4>
                <div class="AdminDetails728">
                
                <div style="width:75%;float:left;">
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle" ">
                        <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="An error occured.please try again."
                            Visible="False"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label10" runat="server" Text="Order No. :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:Label ID="uiLabelNo" runat="server" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label7" runat="server" Text="User :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:DropDownList ID="uiDropDownListUsers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="uiDropDownListUsers_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label4" runat="server" Text="Name  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxFN" runat="server" ValidationGroup="EditPage" Width="196px"></asp:TextBox>
                        <asp:TextBox ID="uiTextBoxLN" runat="server" ValidationGroup="EditPage" Width="196px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxFN" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxLN" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label1" runat="server" Text="Address  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="width: 75%">
                        <asp:TextBox ID="uiTextBoxAddress" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label2" runat="server" Text="City  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="width: 75%">
                        <asp:TextBox ID="uiTextBoxCity" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label3" runat="server" Text="State  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="width: 75%">
                        <asp:TextBox ID="uiTextBoxState" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label5" runat="server" Text="Fax  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="width: 75%">
                        <asp:TextBox ID="uiTextBoxFax" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label6" runat="server" Text="Telephone  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="width: 75%">
                        <asp:TextBox ID="uiTextBoxTelephone" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label8" runat="server" Text="Mail  :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="width: 75%">
                        <asp:TextBox ID="uiTextBoxMail" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                </div>
                <div style="width: 220px; float: left;">
                    <div class="AdminRight" style="width: 93px">
                        <asp:Label ID="Label14" runat="server" Text="Order Status  :"></asp:Label>
                    </div>
                    
                    <div class="AdminMiddle" style="width: 125px;">
                        <asp:DropDownList ID="uiDropDownListStatus" runat="server" Width="120px" >
                        </asp:DropDownList>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminLeft">
                        <div class="SearchBtn" style="width: 100px">
                            <asp:LinkButton ID="uiLinkButtonUpdateStatus" runat="server" OnClick="uiLinkButtonUpdateStatus_Click"
                                Width="150px"> Update Status </asp:LinkButton>
                        </div>
                    </div>
                    <div class="clear5">
                    </div>
                </div>
                    
                    <asp:Panel ID="uiPanelItems" runat="server" GroupingText="Products">
                        <div class="AdminRight" style="width: 135px">
                            <asp:Label ID="Label9" runat="server" Text="Product  :"   ></asp:Label>
                        </div>
                        <div class="AdminMiddle" style="width: 75%">
                            <asp:DropDownList ID="uiDropDownListProducts" runat="server" 
                                Width="225px" AutoPostBack="True" OnSelectedIndexChanged="uiDropDownListProducts_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear5">
                        </div>
                       
                        <div class="AdminRight" style="width: 135px">
                            <asp:Label ID="Label11" runat="server" Text="Price  :"  ></asp:Label>
                        </div>
                        <div class="AdminMiddle" style="width: 75%">
                            <asp:TextBox ID="uiTextBoxPrice" runat="server" ></asp:TextBox>
                        </div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear5">
                        </div>
                        <div class="AdminRight" style="width: 135px">
                            <asp:Label ID="Label12" runat="server" Text="Quantity  :" ></asp:Label>
                        </div>
                        <div class="AdminMiddle" style="width: 55%">
                            <asp:TextBox ID="uiTextBoxQty" runat="server" ></asp:TextBox>
                        </div>
                        <div class="AdminLeft">
                            <div class="SearchBtn" style="width: 200px">
                            <asp:LinkButton ID="uiLinkButtonAddItem" runat="server" 
                                    OnClick="uiLinkButtonAddItem_Click" Width="150px"> Add product </asp:LinkButton>
                            </div>
                        </div>
                        <div class="clear5">
                        </div>
                        <div class="AdminRight" style="width: 135px">
                          
                        </div>
                        <div class="AdminMiddle" style="width: 75%">
                            <asp:GridView ID="uiGridViewProducts" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="4" GridLines="Both" OnPageIndexChanging="uiGridViewProducts_PageIndexChanging"
                                OnRowCommand="uiGridViewProducts_RowCommand" Width="90%" >
                               
                                <Columns>
                                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                                    <asp:BoundField DataField="ItemPrice" HeaderText="Price" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("OrderDetailID") %>'
                                                CommandName="DeleteDetail" OnClientClick="return confirm('do you want to delete this record ?');">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="AdminLeft">
                          
                        </div>
                        <div class="clear5">
                        </div>
                                        
                        <div class="AdminRight" style="width: 135px">
                            <asp:Label ID="Label13" runat="server" Text="Total  :" CssClass="Label"></asp:Label>
                        </div>
                        <div class="AdminMiddle" style="width: 75%">
                            <asp:TextBox ID="uiTextBoxTotal" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="AdminLeft">
                            
                        </div>
                        <div class="clear5">
                        </div>         
                                   
                    </asp:Panel>
                    <div class="AdminRight" style="width: 135px">
                        &nbsp;
                    </div>
                    <div class="AdminMiddle" style="text-align: center">
                        <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="&#1573;&#1590;&#1575;&#1601;&#1577; / &#1578;&#1593;&#1583;&#1610;&#1604;" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="Add / Edit" ValidationGroup="EditPage"
                                OnClick="uiButtonUpdate_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="&#1573;&#1604;&#1594;&#1575;&#1569;" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="Cancel" OnClick="uiButtonCancel_Click"></asp:LinkButton></div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
