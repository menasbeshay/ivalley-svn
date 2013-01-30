<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditMinerals.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditMinerals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi19").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAds" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    اسعار المعادن الحالية
                </h1>
                <div class="Details675">
                

                     <div class="AdminRight" style="width: 130px" >
                        <asp:Label ID="Label6" runat="server" Text="المعدن :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:DropDownList ID="uiDropDownListMins" runat="server" Width="250px">
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                    <div class="clear5" >
                    </div>

                    <div class="AdminRight" style="width: 130px" >
                        <asp:Label ID="Label1" runat="server" Text="سعر البيع   :" 
                            CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:TextBox ID="uiTextBoxCellPrice" runat="server"></asp:TextBox>
                        
                    </div>
                    <div class="AdminLeft" >
                    </div>
                    <div class="clear5" >
                    </div>

                    <div class="AdminRight" style="width: 130px" >
                        <asp:Label ID="Label2" runat="server" Text=" سعر الشراء :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:TextBox ID="uiTextBoxBuyPrice" runat="server"></asp:TextBox>
                       
                    </div>
                    <div class="AdminLeft" >
                    </div>
                   
                    <div class="clear10">
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminRight">
                    &nbsp;
                    </div>
                    <div class="AdminMiddle" >
                    <div class="AdminMore">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة سعر جديد</asp:LinkButton>
                    </div>
                    &nbsp;&nbsp;
                    <div class="AdminMore">
                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server"  
                            OnClientClick="return confirm('Are you want to delete this record?');" 
                            onclick="uiLinkButtonDelete_Click">حذف جميع الأسعار</asp:LinkButton>
                    </div>
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="clear10">
                    </div>
                   <div class="AdminRight" style="width: 130px" >
                    <asp:Label ID="Label3" runat="server" Text="رفع أسعار المعادن :" CssClass="Label"></asp:Label>
                       </div>
                    <div class="AdminMiddle" >
                        <asp:FileUpload ID="uiFileUploadMines" runat="server" />
                        &nbsp;<asp:RegularExpressionValidator ID="rexp" runat="server" 
                            ControlToValidate="uiFileUploadMines" Display="Dynamic" 
                            ErrorMessage="Only .xlsx files" 
                            ValidationExpression="(.*\.([Xx][Ll][Ss][Xx])$)" ValidationGroup="EditPage"></asp:RegularExpressionValidator>
&nbsp;
                        
                        <div class="AdminMore" style="height: 20px">
                    <asp:LinkButton ID="uiLinkButtonUpload" runat="server" 
                                OnClick="uiLinkButtonUpload_Click">رفع أسعار </asp:LinkButton>
                    </div>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                     <div class="clear10">
                    </div>
                     <div class="clear10">
                    </div>

                    <div class="AdminMiddle" style="width:100%">
                        <asp:GridView ID="uiGridViewMineral" runat="server" AutoGenerateColumns="false"
                            OnRowCommand="uiGridViewMineral_RowCommand" AllowPaging="True" HorizontalAlign="Center"
                            OnPageIndexChanging="uiGridViewMineral_PageIndexChanging" Width="80%" 
                            onrowdatabound="uiGridViewMineral_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="المعدن">
                                <ItemTemplate>
                                    <asp:Label ID="uiLabelMinName" runat="server"></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CellPrice" HeaderText="سعر البيع" />
                                <asp:BoundField DataField="BuyPrice" HeaderText="سعر الشراء" />
                                <asp:BoundField DataField="CreatedDate" HeaderText="أخر تحديث" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>                                        
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("MineralID") %>'
                                            CommandName="DeleteMineral" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                        <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    
                    <div class="clear10">
                    </div>
                    </div>
                    </div>
                    </asp:Panel>
                    </div>
</asp:Content>
