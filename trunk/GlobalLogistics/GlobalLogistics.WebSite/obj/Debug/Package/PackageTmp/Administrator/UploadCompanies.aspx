<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UploadCompanies.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.UploadCompanies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(function () {
        $("#mi23").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain"  style="direction: rtl;">
<div class="ContentLeftDiv">
                <h6>
                    رفع الشركات </h6>
                <div class="AdminDetails728">
            <div class="AdminRight" style="width: 130px">
                <asp:Label ID="Label8" runat="server" Text="المدينة :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:DropDownList ID="uiDropDownListCity" runat="server" Width="200px">
                </asp:DropDownList>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>

            <div class="AdminRight" style="width: 130px">
                <asp:Label ID="Label9" runat="server" Text="قطاع الأعمال :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:DropDownList ID="uiDropDownListCategory" runat="server" Width="200px" 
                    AutoPostBack="True" 
                    onselectedindexchanged="uiDropDownListCategory_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>

            <div class="AdminRight" style="width: 130px">
                <asp:Label ID="Label10" runat="server" Text="قطاع الأعمال الفرعى :" 
                    CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:DropDownList ID="uiDropDownListSubCategory" runat="server" Width="200px">
                </asp:DropDownList>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>

             <div class="AdminRight" style="width: 130px">
                <asp:Label ID="Label3" runat="server" Text="إختر الملف :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:FileUpload ID="uiFileUpload" runat="server" />
            &nbsp;<asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="uiFileUpload"
     ErrorMessage="Only .xlsx files"  ValidationGroup="EditPage" 
     ValidationExpression="(.*\.([Xx][Ll][Ss][Xx])$)" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>

            <div class="AdminRight" style="width: 130px">
            </div>
            <div class="AdminMiddle" style="text-align: center">
                <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                            <div class="SearchBtn">
                        <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="إضافة" 
                            ValidationGroup="EditPage" onclick="uiButtonUpdate_Click"></asp:LinkButton></div>
                        
            </div>
            <div class="AdminLeft">
            </div>


            <div class="clear10"></div>

             <div class="AdminRight" style="width: 130px">
            </div>
            <div class="AdminMiddle" style="text-align: center">               
                <asp:Label ID="uiLabelmsg" runat="server" Text="تم رفع الشركات بنجاح." 
                    Visible="False" Font-Bold="True" ForeColor="#009933"></asp:Label>
                <br />
                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="حدث خطأ أثناء رفع البيانات. كود الخطأ : " Visible="False"></asp:Label>
            </div>
            <div class="AdminLeft">
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
            </div>
</asp:Content>
