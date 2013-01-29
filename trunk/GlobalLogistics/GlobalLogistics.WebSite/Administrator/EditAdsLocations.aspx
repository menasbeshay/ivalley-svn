<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditAdsLocations.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditAdsLocations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi6").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminMain"  style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAdsLocations" runat="server">
         <div class="ContentLeftDiv">
                <h1>
                     أماكن الإعلانات الحالية
                </h1>
                <div class="Details675">
            
            <div class="AdminRight" style="width: 140px">
             <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة مكان إعلانى جديد</asp:LinkButton>
            </div>
            </div>
            <div class="AdminMiddle">
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
           
            
            <div class="AdminMiddle" style="width:100%">
                <asp:GridView ID="uiGridViewAdsLocations" runat="server" AutoGenerateColumns="False"
                    OnRowCommand="uiGridViewAdsLocations_RowCommand" 
                    EnableModelValidation="True" AllowPaging="True" HorizontalAlign="Center" 
                    onpageindexchanging="uiGridViewAdsLocations_PageIndexChanging" 
                    Width="80%">
                    <Columns>
                        <asp:BoundField DataField="EnTitle" HeaderText="الإسم بالإنجليزية" />
                        <asp:BoundField DataField="ArTitle" HeaderText="الإسم بالعربية" />
                        <asp:TemplateField HeaderText="إجراءات">
                            <ItemTemplate>
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("AdsLocationID") %>'
                                    CommandName="EditLocation">تعديل</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("AdsLocationID") %>'
                                    CommandName="DeleteLocation" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
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
                <h6>
                    تعديل أماكن الإعلانات </h6>
                <div class="AdminDetails728">
            <div class="AdminRight" style="width: 170px">
            </div>
            <div class="AdminMiddle">
                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى."
                    Visible="False"></asp:Label>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear">
            </div>
            <div class="AdminRight" style="width: 170px">
                <asp:Label ID="Label2" runat="server" Text="الإسم بالإنجليزية: " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxEnName" runat="server" ValidationGroup="EditPage" 
                    Width="350px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxEnName" Display="Dynamic" 
                    ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear">
            </div>
            <div class="AdminRight" style="width: 170px">
                <asp:Label ID="Label1" runat="server" Text="الإسم بالعربية: " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxArName" runat="server" ValidationGroup="EditPage" 
                    Width="350px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxArName" Display="Dynamic" 
                    ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear">
            </div>
            <div class="AdminRight" style="width: 170px">
                <asp:Label ID="Label7" runat="server" Text="الفاصل الزمنى بين الإعلانات :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxTimeOut" runat="server" ValidationGroup="EditPage"></asp:TextBox>
                &nbsp;<br /><div style="direction:ltr;text-align:right">1 sec = 1000</div></div>
            <div class="AdminLeft">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Numbers only"
                    ValidationGroup="EditPage" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxTimeOut"></asp:RegularExpressionValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 170px">
                <asp:Label ID="Label3" runat="server" Text="الوصف :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxDesc" runat="server" ValidationGroup="EditPage" 
                    Columns="30" Rows="5" TextMode="MultiLine" Width="350px"></asp:TextBox>
                </div>
            <div class="AdminLeft">
                
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 170px">
                <asp:Label ID="Label4" runat="server" Text="مكان الإعلان :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:FileUpload ID="uiFileUploadAdLocation" runat="server" />
                </div>
            <div class="AdminLeft">
                
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 170px">
                <asp:Label ID="Label5" runat="server" Text="مقاس الإعلان :" CssClass="Label"></asp:Label>
            </div>
            <div class="clear5"></div>
            <div class="AdminMiddle">
             <asp:Label ID="Label6" runat="server" Text="العرض :" CssClass="Label"></asp:Label>
                &nbsp;<asp:TextBox ID="uiTextBoxWidth" runat="server" ValidationGroup="EditPage"></asp:TextBox> &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Numbers only"
                    ValidationGroup="EditPage" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxWidth"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="Label8" runat="server" Text="الطول :" CssClass="Label"></asp:Label>
                &nbsp;&nbsp;<asp:TextBox ID="uiTextBoxHeight" runat="server" ValidationGroup="EditPage"></asp:TextBox>
                &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers only"
                    ValidationGroup="EditPage" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxHeight"></asp:RegularExpressionValidator>
                </div>
            <div class="AdminLeft">
                
                     
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 170px">
            </div>
            <div class="AdminMiddle" style="text-align: center">
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
