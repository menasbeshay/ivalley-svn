<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditPageGallery.aspx.cs" Inherits="Taqwa.Website.Admin.EditPageGallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
            Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<asp:Panel ID="uiPanel" runat="server" style="padding-right:5px;direction:rtl;">
    <div class="AdminMain" style="direction:rtl;">
    <div><h3>الصور الحالية</h3></div>
    <div class="AdminLeft" style="width:170px;"">
            <asp:Label ID="Label2" runat="server" CssClass="Label" 
                Text="الصفحة الحالية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:DropDownList ID="uiDropDownListPages" runat="server" AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListPages_SelectedIndexChanged" Width="400px">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;
        </div>
        <div class="clear"></div>

    <div >
        <div class="AdminLeft" style="width:170px;"">
            <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" 
                Text="العنوان بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEnNewsTitle" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="uiTextBoxEnNewsTitle" ErrorMessage="*" 
                ValidationGroup="UpdatePage" Enabled="true"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>
        </div>
         <div class="AdminLeft" style="width:170px;"">
            <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="العنوان بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxArNewsTitle" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="uiTextBoxArNewsTitle" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

        <div class="AdminLeft" style="width:170px;"">
            <asp:Label ID="Label1" runat="server" CssClass="Label" 
                Text="تحميل :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:FileUpload ID="uiFileUploadPhoto" runat="server"  />
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="uiFileUploadPhoto" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

        <div class="AdminLeft" style="width:170px;"">
            &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpload" runat="server" Text="تحميل" 
                ValidationGroup="UpdatePage" onclick="uiButtonUpload_Click" />
        </div>
        <div class="AdminRight">
            
        </div>
        <div class="clear"></div>
        

        <div class="AdminLeft" style="width:170px;"">
            &nbsp;
        </div>
        <div class="AdminMiddle">
            
        </div>
        <div class="AdminRight">
            
        </div>
        <div class="clear"></div>
        

        <div class="AdminLeft" style="width:170px;"">
            &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:DataList ID="uiDataListPhotos" runat="server" 
                                    HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Horizontal" 
                                    onitemcommand="uiDataListPhotos_ItemCommand">                                    
                                    <ItemTemplate>
                                    <asp:ImageButton ID="uiButtonDelete" runat="server" CommandArgument='<%# Eval("PageGalleryPhotoID") %>' Text="Delete" OnClientClick="return confirm('Are you want to delete this photo?');" CommandName="Delete" ForeColor="#000099" ImageUrl="~/images/action_delete.gif" AlternateText="Delete image" ImageAlign="Middle" style="float:right;" />
                                    <br />
                                    <a href='<%# Eval("PicPath") %>' rel="lightbox[chiledranroom]"><img src='<%# Eval("PicPath") %>' alt="4" width="150" height="110"></a> 
                                    </ItemTemplate>
                                </asp:DataList>
        </div>
        <div class="AdminRight">
            
        </div>
        <div class="clear"></div>
        
    </div>
    </asp:Panel>
</asp:Content>
