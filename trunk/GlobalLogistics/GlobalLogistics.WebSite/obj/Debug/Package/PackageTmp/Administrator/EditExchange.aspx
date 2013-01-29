<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditExchange.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditExchange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi17").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAds" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    اسعار العملات الحالية
                </h1>
                <div class="Details675">
                

                     <div class="AdminRight" style="width: 130px" >
                        <asp:Label ID="Label6" runat="server" Text="العملة :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:DropDownList ID="uiDropDownListCurrencies" runat="server" Width="250px">
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                    <div class="clear5" >
                    </div>

                    <div class="AdminRight" style="width: 130px" >
                        <asp:Label ID="Label1" runat="server" Text="سعر البيع بالمصرى  :" 
                            CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:TextBox ID="uiTextBoxCellPrice" runat="server" ValidationGroup="EditPage"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                            runat="server" ControlToValidate="uiTextBoxCellPrice" 
                            ErrorMessage="Numbers only" ValidationExpression="^\d*\.?\d*$" 
                            ValidationGroup="EditPage"></asp:RegularExpressionValidator>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                    <div class="clear5" >
                    </div>

                      <div class="AdminRight" style="width: 130px" >
                        <asp:Label ID="Label4" runat="server" Text="سعر الشراء بالمصرى  :" 
                            CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:TextBox ID="uiTextBoxBuyPrice" runat="server" ValidationGroup="EditPage"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                            runat="server" ControlToValidate="uiTextBoxBuyPrice" 
                            ErrorMessage="Numbers only" ValidationExpression="^\d*\.?\d*$" 
                            ValidationGroup="EditPage"></asp:RegularExpressionValidator>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                    <div class="clear5" >
                    </div>

                    <div class="AdminRight" style="width: 130px" >
                        <asp:Label ID="Label2" runat="server" Text="أخر سعر بيع :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:TextBox ID="uiTextBoxLastCellPrice" runat="server" 
                            ValidationGroup="EditPage"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                            runat="server" ControlToValidate="uiTextBoxLastCellPrice" 
                            ErrorMessage="Numbers only" ValidationExpression="^\d*\.?\d*$" 
                            ValidationGroup="EditPage"></asp:RegularExpressionValidator>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                    
                    <div class="clear10">
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminRight" style="width: 130px" >
                        &nbsp;</div>
                    <div class="AdminMiddle" >
                        <div class="AdminMore">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click" 
                                ValidationGroup="EditPage">إضافة سعر جديد</asp:LinkButton>

                    </div>
                    &nbsp;&nbsp;
                     <div class="AdminMore">
                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" 
                                    OnClientClick="return confirm('Are you want to delete this record?');" onclick="uiLinkButtonDelete_Click"
                                >حذف جميع الأسعار</asp:LinkButton>
                                 </div>

                    </div>
                    <div class="AdminLeft" >
                    </div>
                    
                    <div class="clear10">
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminRight" style="width: 130px" >
                    <asp:Label ID="Label3" runat="server" Text="رفع أسعار العملات :" CssClass="Label"></asp:Label>
                       </div>
                    <div class="AdminMiddle" >
                        <asp:FileUpload ID="uiFileUploadExchange" runat="server" />
                        &nbsp;<asp:RegularExpressionValidator ID="rexp" runat="server" 
                            ControlToValidate="uiFileUploadExchange" Display="Dynamic" 
                            ErrorMessage="Only .xlsx files" 
                            ValidationExpression="(.*\.([Xx][Ll][Ss][Xx])$)" 
                            ValidationGroup="UploadPage"></asp:RegularExpressionValidator>
&nbsp;
                        
                        <div class="AdminMore" style="height: 20px">
                    <asp:LinkButton ID="uiLinkButtonUpload" runat="server" 
                                OnClick="uiLinkButtonUpload_Click" ValidationGroup="UploadPage">رفع أسعار </asp:LinkButton>
                    </div>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                     <div class="clear10">
                    </div>
                     <div class="clear10">
                    </div>
                    <div class="AdminMiddle" style="width:100%">
                        <asp:GridView ID="uiGridViewExchange" runat="server" AutoGenerateColumns="false"
                            OnRowCommand="uiGridViewExchange_RowCommand" AllowPaging="True" HorizontalAlign="Center"
                            OnPageIndexChanging="uiGridViewExchange_PageIndexChanging" Width="80%" 
                            onrowdatabound="uiGridViewExchange_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="العملة">
                                <ItemTemplate>
                                    <asp:Label ID="uiLabelCurrencyName" runat="server"></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CellPrice" HeaderText="سعر البيع" />
                                <asp:BoundField DataField="LastCellPrice" HeaderText="أخر سعر بيع" />
                                <asp:BoundField DataField="CreatedDate" HeaderText="أخر تحديث" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>                                        
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ExchangeID") %>'
                                            CommandName="DeleteExchange" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                        <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div class="clear"></div>
                    </div>
                    </div>
                    </asp:Panel>
                    </div>
</asp:Content>
