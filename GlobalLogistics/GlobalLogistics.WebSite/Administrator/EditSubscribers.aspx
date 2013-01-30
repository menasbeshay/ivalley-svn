<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="EditSubscribers.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditSubscribers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi15").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewSubscribers" runat="server">
        <div class="ContentLeftDiv">
                <h1>
                    المشتركين الحاليين
                </h1>
                <div class="Details675">
            <div class="AdminRight" style="width: 310px">
             <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة مشترك جديد</asp:LinkButton>
                </div>

                &nbsp; &nbsp;
                <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonAskExport" runat="server" OnClick="uiLinkButtonAskExport_Click">تصدير المشتركين الحاليين</asp:LinkButton>
                </div>
            </div>
            <div class="AdminMiddle" style="width: 50px;">
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear">
            </div>
            

            <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch">
            
            <div class="AdminRight" style="width: 110px">
               &nbsp;
            </div>
            <div class="AdminMiddle">
            <asp:Label ID="Label7" runat="server" Text="بحث : " CssClass="Label"></asp:Label>
            &nbsp;&nbsp;
                <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="300px"></asp:TextBox>
                &nbsp;&nbsp; <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" 
                    onclick="uiButtonSearch_Click" Width="60px" style="display:none;" />
                    <div class="SearchBtn">
                <asp:LinkButton ID="uiLinkButtonSearch" runat="server" 
                    onclick="uiButtonSearch_Click">بحث</asp:LinkButton>
                    </div>
            </div>
            <div class="AdminLeft">
               
            </div>
            <div class="clear10">
            </div>
            </asp:Panel>

            <div class="AdminRight" style="width: 110px">
                &nbsp;</div>
            <div class="AdminMiddle">
                <asp:GridView ID="uiGridViewSubscribers" runat="server" AutoGenerateColumns="False"
                    OnRowCommand="uiGridViewSubscribers_RowCommand" 
                    EnableModelValidation="True" AllowPaging="True" HorizontalAlign="Center" 
                    onpageindexchanging="uiGridViewSubscribers_PageIndexChanging" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="Email" HeaderText="البريد الإلكترونى" />
                        <asp:TemplateField HeaderText="إجراءات">
                            <ItemTemplate>
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("SubscribersID") %>'
                                    CommandName="EditSubscriber">تعديل
                                    </asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("SubscribersID") %>'
                                    CommandName="DeleteSubscriber" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" />
                        <PagerStyle HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear">
            </div>
            </div>
            </div>

        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server">
         <div class="ContentLeftDiv">
                <h6>
                    تعديل المشتركين الحاليين
                </h6>
                <div class="AdminDetails728">
            <div class="AdminRight">
            </div>
            <div class="AdminMiddle">
                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى."
                    Visible="False"></asp:Label>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear">
            </div>
            <div class="AdminRight">
                 <asp:Label ID="Label2" runat="server" Text="البريد الإلكترونى: " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxEMail" runat="server" ValidationGroup="EditPage" 
                    Width="350px"></asp:TextBox>
            </div>
            <div class="AdminLeft" style="width: 40%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxEMail" Display="Dynamic" 
                    ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="أدخل البريد الإلكترونى بشكل صحيح"
                    ControlToValidate="uiTextBoxEMail" ValidationGroup="EditPage" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="clear">
            </div>
            <div class="AdminRight">
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
            <div class="clear">
            </div>
            </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
