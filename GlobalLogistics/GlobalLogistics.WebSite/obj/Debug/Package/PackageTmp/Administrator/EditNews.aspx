<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="EditNews.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditNews" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    function validateTextLength(oSrc, args) {
        args.IsValid = (args.Value.length <= 500);
    }
</script>
<script type="text/javascript">
    $(function () {
        $("#mi8").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;"  >        
        <asp:Panel ID="uiPanelViewNews" runat="server">
        <div class="ContentLeftDiv">
                <h1>
                    الأخبار الحالية 
                </h1>
                <div class="Details675">
           
            <div class="AdminRight">
             
            </div>
            <div class="AdminMiddle">
            <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة خبر جديد</asp:LinkButton>
                </div>
                &nbsp;&nbsp;
            <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonAskExport" runat="server" OnClick="uiLinkButtonAskExport_Click">تصدير أخبار</asp:LinkButton>
                </div>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear">
            </div>
            
            <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch">
            
            <div class="AdminRight" style="width: 10%">
               
                &nbsp;</div>
            <div class="AdminMiddle" style="width:86%; text-align: center;">
            <asp:Label ID="Label10" runat="server" Text="بحث : " CssClass="Label"></asp:Label>
            &nbsp;
                <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="280px"></asp:TextBox> 
                <div class="clear5"></div>
                &nbsp;<asp:Label ID="Label11" runat="server" CssClass="Label" 
                    Text="تاريخ النشر"></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label9" runat="server" CssClass="Label" 
                    Text="من :"></asp:Label>
                &nbsp;<asp:TextBox ID="uiTextBoxFromDate" runat="server" Width="100px"></asp:TextBox>
                <cc1:CalendarExtender ID="uiTextBoxFromDate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="uiTextBoxFromDate">
                </cc1:CalendarExtender>
                &nbsp;
                <asp:Label ID="Label12" runat="server" CssClass="Label" 
                    Text="إلى :"></asp:Label>
                &nbsp;<asp:TextBox ID="uiTextBoxToDate" runat="server" Width="100px"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Enabled="True" TargetControlID="uiTextBoxToDate">
                </cc1:CalendarExtender>
                &nbsp;
                <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" 
                    onclick="uiButtonSearch_Click" Width="60px" style="display:none;" />
                    <div class="SearchBtn">
                <asp:LinkButton ID="uiLinkButtonSearch" runat="server" 
                    onclick="uiButtonSearch_Click">بحث</asp:LinkButton>
                    </div>
            </div>
            
            <div class="clear10">
            </div>
            </asp:Panel>
           
            
            <div class="AdminMiddle" style="width:100%">
                <asp:GridView ID="uiGridViewNews" runat="server" AutoGenerateColumns="False" OnRowCommand="uiGridViewNews_RowCommand"
                    AllowPaging="True" OnPageIndexChanging="uiGridViewNews_PageIndexChanging" 
                    EnableModelValidation="True" HorizontalAlign="Center" Width="95%">
                    <Columns>
                        <asp:BoundField DataField="EnTitle" HeaderText="العنوان بالإنجليزية" />
                        <asp:BoundField DataField="CreatedDate" HeaderText="تاريخ النشر" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField HeaderText="إجراءات">
                            <ItemTemplate>
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("NewsID") %>'
                                    CommandName="EditNews">تعديل</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("NewsID") %>'
                                    CommandName="DeleteNews" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
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
                    تعديل الأخبار الحالية</h6>
                <div class="AdminDetails728">
            <div class="AdminRight">
            </div>
            <div class="AdminMiddle">
                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                    Visible="False"></asp:Label>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear">
            </div>
            <div class="AdminRight" style="width: 135px;display:none;">
                <asp:Label ID="Label1" runat="server" Text="قطاع الأعمال : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle" style="display:none;">
                <asp:DropDownList ID="uiDropDownListCategory" runat="server" Width="400px">
                </asp:DropDownList>
            </div>
            <div class="AdminLeft" style="display:none;">
            </div>
            <div class="clear" style="display:none;">
            </div>
            <div class="AdminRight" style="width: 135px;">
                <asp:Label ID="Label2" runat="server" Text="عنوان الخبر بالإنجليزية :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle" >
                <asp:TextBox ID="uiTextBoxEnTitle" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft" >
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxEnTitle" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear">
            </div>
            <div class="AdminRight" style="display: none;">
                <asp:Label ID="Label3" runat="server" Text="عنوان الخبر بالعربية :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle" style="display: none;">
                <asp:TextBox ID="uiTextBoxArTitle" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft" style="display: none;">
            </div>
            <div class="clear">
            </div>
            <div class="AdminRight" style="width: 135px">
                <asp:Label ID="Label6" runat="server" Text="المختصر بالإنجليزية :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxEnBreif" runat="server" TextMode="MultiLine" Rows="6" 
                    width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ControlToValidate="uiTextBoxEnBreif" Display="Dynamic"  ClientValidationFunction="validateTextLength"
                    ErrorMessage="لا يمكن كتابة أكثر من 500 حرف" ValidationGroup="EditPage"></asp:CustomValidator>
            </div>
            <div class="clear">
            </div>
            
            <div class="AdminRight" style="display: none;">
                <asp:Label ID="Label7" runat="server" Text="المختصر بالعربية :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle" style="display: none;">
                <asp:TextBox ID="uiTextBoxArBrief" runat="server" TextMode="MultiLine" Rows="6" 
                    width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft" style="display: none;">
                <asp:CustomValidator ID="CustomValidator2" runat="server" 
                    ControlToValidate="uiTextBoxArBrief" Display="Dynamic"  ClientValidationFunction="validateTextLength"
                    ErrorMessage="لا يمكن كتابة أكثر من 500 حرف" ValidationGroup="EditPage"></asp:CustomValidator>
            </div>
            <div class="clear">
            </div>

            <div class="AdminRight" style="width: 135px">
                <asp:Label ID="Label8" runat="server" Text="الصورة الرئيسية للخبر :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:FileUpload ID="uiFileUploadMainPicturePath" runat="server" />
            </div>
            <div class="AdminLeft">
               
            </div>
            <div class="clear">
            </div>
            <div class="AdminRight" style="width: 135px">
                <asp:Label ID="Label4" runat="server" Text="المحتوى بالإنجليزية :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear">
            </div>
            
            <div class="AdminMiddle" style="width:95%">
                <FCKeditorV2:FCKeditor ID="uiFCKeditorEnBody" runat="server" 
                    BasePath="/Modules/fckeditor/" Height="400px" Width="100%">
                </FCKeditorV2:FCKeditor>
            </div>
            
            <div class="clear">
            </div>
            <div class="AdminRight" style="display: none;">
                <asp:Label ID="Label5" runat="server" Text="المحتوى بالعربية :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle" style="display: none;">
            </div>
            <div class="AdminLeft" style="display: none;">
            </div>
            <div class="clear">
            </div>
            
            <div class="AdminMiddle" style="display: none;">
                <FCKeditorV2:FCKeditor ID="uiFCKeditorArBody" runat="server" 
                    BasePath="/Modules/fckeditor/" Height="400px" Width="100%">
                </FCKeditorV2:FCKeditor>
            </div>
           
            <div class="clear">
            </div>
            <div class="AdminRight" style="width: 135px">
            </div>
            <div class="AdminMiddle" style="text-align:center">
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

        <asp:Panel ID="uiPanelExport" runat="server">
        <div class="ContentLeftDiv">
                <h1>
                      تصدير الأخبار  
                </h1>
                <div class="Details675">
           
            
            
            <asp:Panel ID="uiPanelExportSearch" runat="server" DefaultButton="uiButtonExportSearch">
            
            <div class="AdminRight" style="width: 10%">
               
                &nbsp;</div>
            <div class="AdminMiddle" style="width:86%; ">
            <asp:Label ID="Label13" runat="server" Text="بحث : " CssClass="Label"></asp:Label>
            &nbsp;
                <asp:TextBox ID="uiTextBoxExportSearch" runat="server" Width="280px"></asp:TextBox> 
                <div class="clear5"></div>
                &nbsp;<asp:Label ID="Label14" runat="server" CssClass="Label" 
                    Text="تاريخ النشر"></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label15" runat="server" CssClass="Label" 
                    Text="من :"></asp:Label>
                &nbsp;<asp:TextBox ID="uiTextBoxExportFrom" runat="server" Width="100px"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Enabled="True" TargetControlID="uiTextBoxExportFrom">
                </cc1:CalendarExtender>
                &nbsp;
                <asp:Label ID="Label16" runat="server" CssClass="Label" 
                    Text="إلى :"></asp:Label>
                &nbsp;<asp:TextBox ID="uiTextBoxExportTo" runat="server" Width="100px"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" 
                    Enabled="True" TargetControlID="uiTextBoxExportTo">
                </cc1:CalendarExtender>
                &nbsp;
                <asp:Button ID="uiButtonExportSearch" runat="server" Text="بحث" 
                    onclick="uiButtonExportSearch_Click" Width="60px" style="display:none;" />
                    <div class="SearchBtn">
                <asp:LinkButton ID="uiLinkButtonExportSearch" runat="server" 
                    onclick="uiButtonExportSearch_Click">بحث</asp:LinkButton>
                    </div>
            </div>
            
            <div class="clear10">
            </div>
            </asp:Panel>
           
            
            <div class="AdminMiddle" style="width:100%">
                <asp:GridView ID="uiGridViewExport" runat="server" AutoGenerateColumns="False"
                    AllowPaging="True" OnPageIndexChanging="uiGridViewExport_PageIndexChanging" 
                    EnableModelValidation="True" HorizontalAlign="Center" Width="95%">
                    <Columns>
                        <asp:BoundField DataField="EnTitle" HeaderText="العنوان بالإنجليزية" />
                        <asp:BoundField DataField="CreatedDate" HeaderText="تاريخ النشر" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField HeaderText="تحديد">
                            <ItemTemplate>
                               <asp:CheckBox ID="uiCheckBoxExport" runat="server" />
                               <asp:HiddenField ID="uiHiddenFieldID" runat="server" Value='<%# Eval("NewsID") %>' />
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
            <div class="clear10">
            </div>
            <div class="AdminRight">
             
            </div>
            <div class="AdminMiddle">
            
            <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonExport" runat="server" OnClick="uiLinkButtonExport_Click">تصدير أخبار</asp:LinkButton>
                </div>
                &nbsp;
                <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonCancelExport" runat="server" OnClick="uiLinkButtonCancelExport_Click">إنهاء</asp:LinkButton>
                </div>
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
