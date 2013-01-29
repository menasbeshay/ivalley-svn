<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Company.Master" AutoEventWireup="true" CodeBehind="Photos.aspx.cs" Inherits="GlobalLogistics.WebSite.Company.Photos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="AdminMain"  style="direction: rtl;">
 <div class="ContentLeftDiv">
                <h1>
                       الصور الحالية
                </h1>
                <div class="Details675">

                <div class="AdminRight">
                <asp:Label ID="Label2" runat="server" Text="الإسم بالإنجليزية : " CssClass="Label"></asp:Label>
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
            <div class="clear5">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label3" runat="server" Text="الإسم بالعربية :" CssClass="Label"></asp:Label>
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
            <div class="clear5">
            </div>
               <div class="AdminRight">
                   <asp:Label ID="Label1" runat="server" Text="إختر صورة : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
             <asp:FileUpload ID="uiFileUploadPhoto" runat="server" />
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear10">
            </div>            
            <div class="clear10">
            </div>  
                 <div class="AdminRight">
             <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة صورة جديدة</asp:LinkButton>
                </div>
            </div>
            <div class="AdminMiddle">
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>            

<asp:DataList ID="uiDataListPhotos" runat="server" 
    HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Horizontal" 
    onitemcommand="uiDataListPhotos_ItemCommand">
    <ItemTemplate>
    <asp:ImageButton ID="uiButtonDelete" runat="server" CommandArgument='<%# Eval("PhotoID") %>' Text="Delete" OnClientClick="return confirm('Are you want to delete this photo?');" CommandName="Delete" ForeColor="#000099" ImageUrl="~/images/action_delete.gif" AlternateText="Delete image" ImageAlign="Middle" style="float:right;" />
    <br />
    <a href='<%# Eval("PhotoPath") %>' rel="lightbox[chiledranroom]"><img src='<%# Eval("PhotoPath") %>' alt="4" width="150" height="110"></a> 
    </ItemTemplate>
</asp:DataList>
</div>
</div>
</div>
</asp:Content>
