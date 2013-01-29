<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditPackages.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditPackages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi3").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewPackages" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    حزمة الإشتراكات</h1>
                <div class="Details675">
                    <div class="AdminRight" style="width: 150px">
                     <div class="AdminMore">
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة حزمة جديدة</asp:LinkButton>
                         </div>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>

                    <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch">
            
            <div class="AdminRight">
               
                &nbsp;</div>
            <div class="AdminMiddle">
            <asp:Label ID="Label10" runat="server" Text="بحث : " CssClass="Label"></asp:Label>
            &nbsp;&nbsp;
                <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="300px"></asp:TextBox>
                &nbsp;&nbsp; <div class="SearchBtn" >
                <asp:LinkButton ID="uiLinkButtonSearch" runat="server" 
                    onclick="uiButtonSearch_Click">بحث</asp:LinkButton>
                    </div>
               <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" 
                    onclick="uiButtonSearch_Click" Width="60px" style="display:none;" />
                    
            </div>
            <div class="AdminLeft">
                
            </div>
            <div class="clear10">
            </div>
            </asp:Panel>


                    
                    <div class="AdminMiddle" style="width:100%">
                        <asp:GridView ID="uiGridViewPackages" runat="server" AutoGenerateColumns="false"
                            OnRowCommand="uiGridViewPackages_RowCommand" AllowPaging="True" HorizontalAlign="Center"
                            OnPageIndexChanging="uiGridViewPackages_PageIndexChanging" Width="80%">
                            <Columns>
                                <asp:BoundField DataField="EnName" HeaderText="الإسم بالإنجليزية" />
                                <asp:BoundField DataField="ArName" HeaderText="الإسم بالعربية" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("PackageID") %>'
                                            CommandName="EditPackage">تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("PackageID") %>'
                                            CommandName="DeletePackage" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
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
        <asp:Panel ID="uiPanelEdit" runat="server">
            <div class="ContentLeftDiv">
                <h6>
                    تعديل حزمة إشتراك</h6>
                <div class="AdminDetails728">
                    <div class="AdminRight" style="width: 120px">
                    </div>
                    <div class="AdminMiddle">
                        <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                            Visible="False"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 120px">
                        <asp:Label ID="Label1" runat="server" Text="الإسم بالإنجليزية : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxEnName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxEnName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 120px">
                        <asp:Label ID="Label2" runat="server" Text="الإسم بالعربية :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxArName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxArName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 120px">
                        <asp:Label ID="Label3" runat="server" Text="الوصف بالإنجليزية :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxEnDesc" runat="server" ValidationGroup="EditPage" TextMode="MultiLine"
                            Height="70px" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 120px">
                        <asp:Label ID="Label4" runat="server" Text="الوصف بالعربية :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxArDesc" runat="server" ValidationGroup="EditPage" TextMode="MultiLine"
                            Height="70px" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 120px">
                        <asp:Label ID="Label5" runat="server" Text="خيارات الحزمة :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:CheckBoxList ID="uiCheckBoxListPackageOptions" runat="server" 
                            CellPadding="2" CellSpacing="2" RepeatColumns="4" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 120px">
                    </div>
                    <div class="AdminMiddle" style="text-align:center;">
                       <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                            <div class="SearchBtn">
                        <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="إضافة / تعديل" 
                            ValidationGroup="EditPage" onclick="uiButtonUpdate_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SmallBtn">
                        <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="إلغاء" 
                            onclick="uiButtonCancel_Click"></asp:LinkButton></div>
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
