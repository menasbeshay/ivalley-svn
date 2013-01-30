<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditSailing.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditSailing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(function () {
        $("#mi21").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAds" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    جداول الخطوط البحرية الحالية
                </h1>
                <div class="Details675">
                

                     <div class="AdminRight" >
                        <asp:Label ID="Label6" runat="server" Text="الشركة :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:DropDownList ID="uiDropDownListCompanies" runat="server" Width="250px">
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                    <div class="clear5" >
                    </div>

                    <div class="AdminRight" >
                        <asp:Label ID="Label1" runat="server" Text="من :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:DropDownList ID="uiDropDownListFromCity" runat="server" Width="250px">
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                    <div class="clear5" >
                    </div>

                    <div class="AdminRight" >
                        <asp:Label ID="Label2" runat="server" Text="إلى :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:DropDownList ID="uiDropDownListToCity" runat="server" Width="250px">
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                    <div class="clear5" >
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="clear10">
                    </div>
                    <div class="AdminMore">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة خط بحرى جديد</asp:LinkButton>
                    </div>
                    <div class="clear10">
                    </div>


                    <div class="AdminRight" style="width: 160px" >
                    <asp:Label ID="Label3" runat="server" Text="رفع جداول خطوط ملاحية :" CssClass="Label"></asp:Label>
                       </div>
                    <div class="AdminMiddle" >
                        <asp:FileUpload ID="uiFileUploadshippingLines" runat="server" />
                        &nbsp;<asp:RegularExpressionValidator ID="rexp" runat="server" 
                            ControlToValidate="uiFileUploadshippingLines" Display="Dynamic" 
                            ErrorMessage="Only .xlsx files" 
                            ValidationExpression="(.*\.([Xx][Ll][Ss][Xx])$)" 
                            ValidationGroup="EditPage"></asp:RegularExpressionValidator>
&nbsp;
                        
                        
                    </div>
                    <div class="AdminLeft" >
                    </div>
                     <div class="clear10">
                    </div>

                    <div class="AdminRight" style="width: 160px" >
                        <asp:Label ID="Label5" runat="server" Text="الشركة :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" >
                        <asp:DropDownList ID="uiDropDownListUploadCompany" runat="server" Width="250px">
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft" >
                    </div>
                    <div class="clear5" >
                    </div>

                    <div class="AdminRight" style="width: 160px">
                    <asp:Label CssClass="Label" ID="Label4" Text="طريقة الرفع" runat="server"></asp:Label>
                    </div>

                    <div class="AdminMiddle">
                        <asp:DropDownList ID="uiDropDownListUploadType" runat="server" Width="150px">
                        <asp:ListItem Text="أكواد " Value="1"></asp:ListItem>
                        <asp:ListItem Text="أسماء " Value="2"></asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;
                        <div class="AdminMore" style="height: 20px">
                    <asp:LinkButton ID="uiLinkButtonUpload" runat="server" 
                                OnClick="uiLinkButtonUpload_Click">رفع جداول خطوط ملاحية </asp:LinkButton>
                    </div>
                        </div>
                    <div class="AdminLeft">
                    
                    </div>
                     <div class="clear10">
                    </div>


                    <div class="AdminMiddle" style="width:100%">
                        <asp:GridView ID="uiGridViewShipping" runat="server" AutoGenerateColumns="false"
                            OnRowCommand="uiGridViewShipping_RowCommand" AllowPaging="True" HorizontalAlign="Center"
                            OnPageIndexChanging="uiGridViewShipping_PageIndexChanging" Width="80%" 
                            onrowdatabound="uiGridViewShipping_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="الشركة">
                                <ItemTemplate>
                                    <asp:Label ID="uiLabelCompanyName" runat="server"></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="من">
                                <ItemTemplate>
                                    <asp:Label ID="uiLabelFromName" runat="server"></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="إلى">
                                <ItemTemplate>
                                    <asp:Label ID="uiLabelToName" runat="server"></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>                                
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>                                        
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ShippingLinesID") %>'
                                            CommandName="DeleteShipping" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                        <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div class="clear10"></div>

                    <div class="AdminRight" >
                
            </div>
            <div class="AdminMiddle" style="width:100%">
                <asp:GridView ID="uiGridViewLog" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center"  Width="80%">   
                <Columns>
                <asp:TemplateField HeaderText="Items faild to insert" HeaderStyle-ForeColor="Red" >
                <ItemTemplate>
                <%# Container.DataItem.ToString() %>
                </ItemTemplate>
                </asp:TemplateField>
                </Columns>       
                <HeaderStyle HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />      
                </asp:GridView>
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
