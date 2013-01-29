<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="EditAds.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditAds" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi7").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewAds" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    الإعلانات الحالية
                </h1>
                <div class="Details675">
                <div class="AdminMore">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة إعلان جديد</asp:LinkButton>
                    </div>
                    <div class="clear10">
                    </div>
                    
                     <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch">
            
            <div class="AdminRight" style="width: 5%;">
               
                &nbsp;</div>
            <div class="AdminMiddle" style="width:85%" >
            <asp:Label ID="Label10" runat="server" Text="بحث : " CssClass="Label"></asp:Label>
            &nbsp;&nbsp;
                <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="250px"></asp:TextBox>
                &nbsp;<asp:Label ID="Label11" runat="server" CssClass="Label" Text="مكان الإعلان :"></asp:Label>
                &nbsp;<asp:DropDownList ID="uiDropDownListAdsLocations" runat="server" 
                    Width="110px" >
                </asp:DropDownList>
                &nbsp;&nbsp;
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
            
                    <div class="AdminMiddle" style="width: 100%">
                    
                    <asp:GridView ID="uiGridViewAds" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        EmptyDataText="عفواً ، لا توجد بيانات متاحة" HorizontalAlign="Center" Width="90%"
                        OnPageIndexChanging="uiGridViewAds_PageIndexChanging" 
                            OnRowCommand="uiGridViewAds_RowCommand" 
                            onrowdatabound="uiGridViewAds_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="EnTitle" HeaderText="العنوان بالإنجليزية" />
                            <asp:TemplateField HeaderText="مكان الإعلان">
                            <ItemTemplate>                                                       
                                <asp:Label ID="uiLabelAdLocation" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                            <asp:BoundField DataField="StartDate" HeaderText="تاريخ بداية الإعلان" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="EndDate" HeaderText="تاريخ نهاية الإعلان" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:TemplateField HeaderText="إجراءات">
                                <ItemTemplate>
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("AdsID") %>'
                                        CommandName="EditAds">تعديل</asp:LinkButton>
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("AdsID") %>'
                                        CommandName="DeleteAds" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>                        
                        <HeaderStyle HorizontalAlign="Center" />
                        <PagerStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView>
                    </div>
                    
                    <div class="clear5">
                    </div>
                </div>
            </div>
            <div class="clear10">
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server">
            <div class="ContentLeftDiv">
                <h6>
                    تعديل الإعلان
                </h6>
                <div class="AdminDetails728">
                    <div class="AdminRight" style="width: 205px">
                    </div>
                    <div class="AdminMiddle">
                        <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                            Visible="False"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 205px;display:none;" >
                        <asp:Label ID="Label6" runat="server" Text="قطاع الأعمال :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle" style="display:none;">
                        <asp:DropDownList ID="uiDropDownListCategories" runat="server" Width="250px">
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft" style="display:none;">
                    </div>
                    <div class="clear5" style="display:none;">
                    </div>
                    <div class="AdminRight" style="width: 205px">
                        <asp:Label ID="Label9" runat="server" Text="مكان الإعلان :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:DropDownList ID="uiDropDownListLocation" runat="server" Width="250px">                            
                        </asp:DropDownList>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 205px">
                        <asp:Label ID="Label1" runat="server" Text="العنوان بالإنجليزية : " CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxEnName" runat="server" ValidationGroup="EditPage" Width="380px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxEnName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 205px">
                        <asp:Label ID="Label2" runat="server" Text="العنوان بالعربية :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxArName" runat="server" ValidationGroup="EditPage" Width="380px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxArName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 205px">
                        <asp:Label ID="Label3" runat="server" Text="الوصلة الإلكترونية :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxURL" runat="server" ValidationGroup="EditPage" Width="380px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 205px">
                        <asp:Label ID="Label4" runat="server" Text="صورة الإعلان فى الموقع الإنجليزى :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:FileUpload ID="uiFileUploadEnFile" runat="server" />
                    </div>
                    <div class="AdminLeft">
                        <asp:Image ID="uiEnImage" runat="server" Width="200px" />
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 205px">
                        <asp:Label ID="Label5" runat="server" Text="صورة الإعلان فى الموقع العربى :" CssClass="Label"></asp:Label></div>
                    <div class="AdminMiddle">
                        <asp:FileUpload ID="uiFileUploadArFile" runat="server" />
                    </div>
                    <div class="AdminLeft">
                        <asp:Image ID="uiArImage" runat="server" Width="200px" />
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 205px">
                        <asp:Label ID="Label7" runat="server" Text="تاريخ بداية الإعلان :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxStartDate" runat="server" ValidationGroup="EditPage" Width="380px"></asp:TextBox>
                        <cc1:CalendarExtender ID="uiTextBoxStartDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="uiTextBoxStartDate" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="uiTextBoxStartDate" ErrorMessage="*" 
                            ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 205px">
                        <asp:Label ID="Label8" runat="server" Text="تاريخ نهاية الإعلان :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxEndDate" runat="server" ValidationGroup="EditPage" Width="380px"></asp:TextBox>
                        <cc1:CalendarExtender ID="uiTextBoxEndDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="uiTextBoxEndDate" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                    </div>
                    <div class="AdminLeft">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="uiTextBoxEndDate" ErrorMessage="*" 
                            ValidationGroup="EditPage"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 205px">
                        &nbsp;
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
                    <div class="clear5">
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
