<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARNoBanner.Master" AutoEventWireup="true" CodeBehind="EditTourismList.aspx.cs" Inherits="Obtravel.Arabic.Admin.EditTourismList" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div style="direction:rtl;">
  <div> <h1>
        تعديل العروض الفرعية </h1>
        <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">العودة إلى لوحة التحكم</a>
                            </div> 
                            
                            
                            <div class="btn">
                                <a href="EditPackages.aspx">العودة إلى العروض</a>
                            </div>                           
                        </div>
                        </div>
    <asp:Panel ID="uiPanelViewLists" runat="server">
        <h2>
            إضافة عرض فرعى جديد
        </h2>
        <div class="smallleftHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة رحلة جديدة</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
        <div class="clear10px">
        </div>
        <h2>
            العروض الحالية
        </h2>
        <asp:Repeater ID="uiRepeaterCurrentTourismLists" runat="server" 
            onitemcommand="uiRepeaterTourismLists_ItemCommand">
            <HeaderTemplate>
                <div class="services">
                    <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <div class="img Tourism">
                        <asp:Image ID="uiImageList" runat="server" ImageUrl='<%# Eval("arImagePath") %>' /></div>
                    <div class="serv_data">
                        <h4>
                            <%# Eval("arTitle") %></h4>
                        
                        <div class="TourismControls AdminCP">
                            <div class="btn">
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    CommandName="EditList">تعديل</asp:LinkButton>
                            </div>
                            <div class="btn">
                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    CommandName="DeleteList" OnClientClick="return confirm('؟هل تريد حذف هذا السجل');">حذف</asp:LinkButton>
                            </div>

                        </div>
                        <%# Eval("arBrief") %>
                    </div>
                    <div class="clear">
                    </div>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul> </div></FooterTemplate>
        </asp:Repeater>
    </asp:Panel>
    <asp:Panel ID="uiPanelEditTourismList" runat="server">
        <div class="smallleft">
            العنوان</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateList" 
                Columns="50"></asp:TextBox></div>
        <div style="float: right; margin-left: 35px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="من فضلك أدخل العنوان"
                ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" ValidationGroup="UpdateList"></asp:RequiredFieldValidator></div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            الصورة</div>
        <div class="smallrightHeight">
            <asp:FileUpload ID="uiFileUploadImage" runat="server" /></div>
            <div style="float:right;margin-right:100px;">
                <asp:Image ID="uiImageCurrent" runat="server" Width="80px" />         
            </div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            نبذة</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxBrief" runat="server" ValidationGroup="UpdateList" Columns="30"
                Rows="4" TextMode="MultiLine"></asp:TextBox></div>
        <div style="float: right; margin-left: 145px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="من فضلك أدخل النبذة"
                ControlToValidate="uiTextBoxBrief" ForeColor="#C76E1F" ValidationGroup="UpdateList"></asp:RequiredFieldValidator></div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            المحتوى</div>
        <div style="float:right;width:780px;height:300px;">
            <FCKeditorV2:FCKeditor ID="uiFCKeditorContent" runat="server" BasePath="~/modules/fckeditor/" Height="300px">
            </FCKeditorV2:FCKeditor>
            </div>
        
        <div class="clear10px">
        </div>
        <div class="smallleft">
            الترتيب</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxOrder" runat="server"></asp:TextBox></div>
        <div style="float: right; margin-left: 35px; margin-top: 8px;">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="أرقام فقط"
                ValidationGroup="UpdateList" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxOrder"
                ForeColor="#C76E1F"></asp:RegularExpressionValidator></div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            عرض فى الموقع</div>
        <div class="smallrightHeight">
            <asp:CheckBox ID="uiCheckBoxViewInWeb" runat="server" /></div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            &nbsp;</div>
        <div class="smallrightHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" OnClick="uiLinkButtonUpdate_Click"
                    ValidationGroup="UpdateList">تحديث</asp:LinkButton>
            </div>
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" OnClick="uiLinkButtonCancel_Click">إلغاء</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
    </asp:Panel>
    </div>
</asp:Content>
