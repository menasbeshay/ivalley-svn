<%@ Page Title="" Language="C#" MasterPageFile="~/CAPA/Site.Master" AutoEventWireup="true" CodeBehind="CompaniesAdmin.aspx.cs" Inherits="PricingGUI.CompaniesAdmin" %>
<%@ MasterType virtualpath="~/CAPA/Site.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style type="text/css">
/* technique 1 */
tbody tr:nth-child(odd){ background-color:#ccc; }
/* technique 2 */
TBODY TR.odd { background-color:#78a5d1; }
    .style1
    {
        width: 232px;
    }
</style>

<asp:UpdatePanel ID="ui_UpdtPanel" runat="server">
            <ContentTemplate>
            
    
    <table style="width: 80%;">
        <tbody>
        <tr>
            <td style="height: 24px; text-align: center;" colspan="6">
                <asp:Label ID="ui_lb_msg" runat="server" Font-Bold="True" Font-Underline="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 16%; height: 24px;">
                <asp:Label ID="Label1" runat="server" Text="Company Name [English] :" Width="150px"></asp:Label>
            </td>
            <td style="width: 19%; height: 24px;">
                <asp:TextBox ID="ui_txtCompNameEn" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 9%; height: 24px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ui_txtCompNameEn" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationGroup="SaveComp"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 15%; height: 24px;">
                <asp:Label ID="Label5" runat="server" Text="Company Name [Arabic] :" 
                    Width="150px"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="ui_txtCompNameAr" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="ui_txtCompNameAr" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationGroup="SaveComp"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Company Code :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ui_txtCompCode" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ui_txtCompCode" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationGroup="SaveComp"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Old Email :"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="ui_txtOldEmail" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ui_txtOldEmail" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationGroup="SaveComp"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="First Contact" Font-Bold="True" 
                    Font-Underline="True"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td></td>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Second Contact" Font-Bold="True" 
                    Font-Underline="True"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" Text="Name :"></asp:Label>
            </td>
            <td>
               <asp:TextBox runat="server" Width="220px" CssClass="dateSelect" ID="ui_txtName1" ></asp:TextBox>
                                   
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="ui_txtName1" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationGroup="SaveComp"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Name :"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="ui_txtName2" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="New Email :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ui_txtNewEmail1" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="ui_txtNewEmail1" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationGroup="SaveComp"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="ui_txtNewEmail1" Display="Dynamic" ErrorMessage="Email" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="SaveComp"></asp:RegularExpressionValidator>
            </td>
            <td>
                <asp:Label ID="Label9" runat="server" Text="New Email :"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="ui_txtNewEmail2" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="ui_txtNewEmail2" Display="Dynamic" ErrorMessage="Email" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="SaveComp"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Phone Number :"></asp:Label>
            </td>
            <td>
               <asp:TextBox runat="server" ID="ui_txtNumber1" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="ui_txtNumber1" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationGroup="SaveComp"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="ui_txtNumber1" Display="Dynamic" ErrorMessage="Number" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationExpression="^\d+$" ValidationGroup="SaveComp"></asp:RegularExpressionValidator>
            </td>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Phone Number :"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="ui_txtNumber2" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="ui_txtNumber2" Display="Dynamic" ErrorMessage="Number" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationExpression="^\d+$" ValidationGroup="SaveComp"></asp:RegularExpressionValidator>
            </td>
        </tr>
             <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td></td>
            <td>
             
            </td>
            <td class="style1">
              
                &nbsp;</td>
            <td>
              
                &nbsp;</td>
        </tr>
            <tr>
                <td colspan="4" style="text-align:left">
                    &nbsp;</td>
                <td colspan="1" style="text-align:right" class="style1">
                    <asp:Button runat="server" class="btn btn-default" Font-Bold="true" 
                        Font-Size="17px" ID="ui_btnSave" Text="Add" OnClick="ui_btnSave_Click" 
                        ValidationGroup="SaveComp" />
                   

                </td>

                <td style="text-align:right">
                    <asp:Button ID="ui_btn_Click" runat="server" class="btn btn-default" 
                        Font-Bold="true" Font-Size="17px" OnClick="ui_btn_Click_Click" Text="Cancel" />
                </td>

            </tr>
            </tbody>
    </table>
       

    <br />
    <center>
                 <asp:UpdateProgress runat="Server" ID="ui_UpdatProgress" DisplayAfter="1" AssociatedUpdatePanelID="ui_UpdtPanel">
                                <ProgressTemplate>
                                    <asp:Image runat="server" ID="ui_ImgLoading" Width="20px" ImageUrl="~/images/loading.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                </center>
                <br />
              
                    <table width="70%">
                        <tr>
                            <td align="left" style="text-align: right">
                                <asp:Label runat="server" ID="ui_LblSearch" 
                                    Text="Search by Company Name [English] :" Font-Size="15pt"></asp:Label>
                            </td>
                            <td align="center" style="width: 260px">
                                <asp:TextBox runat="server" ID="ui_TxtSearch" Font-Size="14px" Width="250px"></asp:TextBox>
                            </td>
                            <td align="right" style="text-align: left">
                                <asp:Button runat="server" ID="ui_BtnSearch" Text="Go" BackColor="#336699" BorderColor="#FFFFCC"
                                    BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" ForeColor="White" 
                                    Width="75px" onclick="ui_BtnSearch_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:GridView runat="server" Width="100%" ID="ui_GvData" AutoGenerateColumns="False"
                                    AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" 
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                    onpageindexchanging="ui_GvData_PageIndexChanging" PageSize="15">
                                    <Columns>
                                        <asp:BoundField DataField="CompNameEng" HeaderText="Company Name English" />
                                        <asp:BoundField DataField="CompNameAr" HeaderText="Company Name Arabic" />
                                        <asp:BoundField DataField="Comp_Code" HeaderText="Company Code" />
                                        <asp:BoundField DataField="OLD_EMAIL" HeaderText="Old Email" />
                                        <asp:BoundField DataField="Doctor_Name" HeaderText="First Contact" />
                                        <asp:BoundField DataField="New_Email" HeaderText="Email" />
                                        <asp:BoundField DataField="Phone_Number" HeaderText="Phone" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <asp:ImageButton ID="ui_ImgBtn_Edit" Width="20px" runat="server" CommandArgument='<%# Eval("CompanyID") %>'
                                                                    ImageUrl="~/images/edit.png" OnClick="ui_BtnEdit_Click" />
                                                            </td>                                                           
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                                    <tbody>
                                                        <tr>
                                                            <td style="text-align: center">
                                                                <asp:ImageButton ID="ui_ImgBtn_Delete" runat="server" CommandArgument='<%# Eval("CompanyID") %>'
                                                                    ImageUrl="~/images/del1.png" OnClick="ui_BtnDelete_Click" />
                                                                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Are you sure ?"
                                                                    TargetControlID="ui_ImgBtn_Delete">
                                                                </cc1:ConfirmButtonExtender>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <RowStyle ForeColor="#000066" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
              
                </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>
