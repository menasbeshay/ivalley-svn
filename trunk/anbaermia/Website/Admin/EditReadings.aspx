<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditReadings.aspx.cs" Inherits="Website.Admin.EditReadings"%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelAllReadings" runat="server" Visible="true">
            <div class="ContentLeftDiv">
                <h1>
                    قراءات اليوم
                </h1>
                <div class="Details675">
                    <div class="AdminMore">
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة قراءات يوم </asp:LinkButton>
                    </div>
                   
                    <div class="clear">
                    </div>
                    <div class="AdminRight">
                    </div>
                    <div class="AdminMiddle" style="text-align: center; width: 100%;">
                        <asp:GridView ID="uiGridViewReadings" runat="server" AutoGenerateColumns="False"
                            CellPadding="1" CellSpacing="3" OnRowCommand="uiGridViewReadings_RowCommand"
                             AllowPaging="True" 
                            onpageindexchanging="uiGridViewReadings_PageIndexChanging" Width="100%">
                            <AlternatingRowStyle HorizontalAlign="Center" />
                            <Columns>
                            <asp:TemplateField HeaderText="القراءات">
                            <ItemTemplate>
                                <%# Server.HtmlDecode(Eval("ArContent").ToString()) %>
                            </ItemTemplate>
                            </asp:TemplateField>
                                
                                <asp:BoundField HeaderText="التاريخ" DataField="ViewDate" DataFormatString="{0:dd/MM/yyyy}"/>
                                <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        
                                            <div class="btn">
                                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ReadingsID") %>'
                                                    CommandName="EditRead">تعديل</asp:LinkButton>
                                            </div>
                                            <div class="btn">
                                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ReadingsID") %>'
                                                    CommandName="DeleteRead" OnClientClick="return confirm('هل تريد حذف هذا السجل?');">حذف</asp:LinkButton>
                                            </div>
                                            
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelCurrent" runat="server" Visible="false">
            <div class="ContentLeftDiv">
                <h1>
                    تعديل القراءات الحالية
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                        المحتوى </div>
                    <div class="AdminMiddle">
                        
                        </div>
                    <div style=" margin-top: 8px;">
                        </div>
                    <div class="clear">
                    </div>
                    <div class="AdminMiddle" style="width: 95%">
                        <telerik:RadEditor ID="uiRadEditorPageContent" runat="server">
                            <Tools>
                                <telerik:EditorToolGroup Tag="MainToolbar">
                                    <telerik:EditorTool Name="FindAndReplace" />
                                    <telerik:EditorSeparator />
                                    <telerik:EditorSplitButton Name="Undo">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSplitButton Name="Redo">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSeparator />
                                    <telerik:EditorTool Name="Cut" />
                                    <telerik:EditorTool Name="Copy" />
                                    <telerik:EditorTool Name="Paste" ShortCut="CTRL+V" />
                                </telerik:EditorToolGroup>
                                <telerik:EditorToolGroup Tag="Formatting">
                                    <telerik:EditorTool Name="Bold" />
                                    <telerik:EditorTool Name="Italic" />
                                    <telerik:EditorTool Name="Underline" />
                                    <telerik:EditorSeparator />
                                    <telerik:EditorSplitButton Name="ForeColor">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSplitButton Name="BackColor">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSeparator />
                                    <telerik:EditorDropDown Name="FontName">
                                    </telerik:EditorDropDown>
                                    <telerik:EditorDropDown Name="RealFontSize">
                                    </telerik:EditorDropDown>
                                </telerik:EditorToolGroup>
                            </Tools>
                            <Content>
                            
</Content>
                            <CssFiles>
                                <telerik:EditorCssFile Value="~/css/RadEditor.css" />
                            </CssFiles>
                        </telerik:RadEditor>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight">
                        التاريخ
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxDate" runat="server" ValidationGroup="UpdateReadings" 
                            Columns="50"></asp:TextBox>
                        <asp:CalendarExtender ID="uiTextBoxDate_CalendarExtender" runat="server" 
                            DaysModeTitleFormat="dd/MM/yyyy" Enabled="True" Format="dd/MM/yyyy" 
                            TargetControlID="uiTextBoxDate" TodaysDateFormat="dd/MM/yyyy">
                        </asp:CalendarExtender>
                    </div>
                    <div style="margin-top: 8px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                            ControlToValidate="uiTextBoxDate" ForeColor="#C76E1F" ValidationGroup="UpdateReadings"></asp:RequiredFieldValidator></div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight" style="width: 120px">
                    </div>
                    <div class="AdminMiddle" style="text-align: center;">
                        <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonUpdateReadings" runat="server" Text="إضافة / تعديل"
                                ValidationGroup="UpdateReadings" OnClick="uiLinkButtonUpdateReadings_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SmallBtn">
                            <asp:LinkButton ID="uiLinkButtonCancelReadings" runat="server" Text="إلغاء" OnClick="uiLinkButtonCancelReadings_Click"></asp:LinkButton></div>
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
