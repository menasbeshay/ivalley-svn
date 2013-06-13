<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditTicker.aspx.cs" Inherits="Website.Admin.EditTicker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
      <asp:Panel ID="uiPanelCurrentNews" runat="server" Visible="true">
          <div class="ContentLeftDiv">
              <h1>
                  الأخبار الحالية
              </h1>
              <div class="Details675">
                  
                  <div class="AdminMore">
                      <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة خبر جديد</asp:LinkButton>
                  </div>
                  &nbsp;&nbsp;
                  <div class="AdminMore">
                      <asp:LinkButton ID="uiLinkButtonSettings" runat="server" OnClick="uiLinkButtonSettings_Click">تعديل عدد الأخبار </asp:LinkButton>
                  </div>
                  <div class="clear">
                  </div>
                  <div class="AdminRight">
                  </div>
                  <div class="AdminMiddle" style="text-align: center;width: 90%;">
            <asp:GridView ID="uiGridViewNews" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="3" OnRowCommand="uiGridViewNews_RowCommand" Width="90%">
                <AlternatingRowStyle HorizontalAlign="Center" />
                <Columns>
                    <asp:BoundField HeaderText="الخبر" DataField="ArContent" />
                    <asp:BoundField HeaderText="التاريخ" DataField="PostedDate" />
                    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <div class="smallrightHeight AdminCP">
                                <div class="btn">
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("NewsTickerID") %>'
                                        CommandName="DeleteNews" OnClientClick="return confirm('هل تريد حذف هذا السجل?');">حذف</asp:LinkButton>
                                </div>
                                <div class="btn">
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("NewsTickerID") %>'
                                        CommandName="EditNews">تعديل</asp:LinkButton>
                                </div>
                                
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
            </div>
            <div class="clear"></div>
        </div>
          </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelCurrent" runat="server" Visible="false">
        <div class="ContentLeftDiv">
            <h1>
                تعديل الأخبار الحالية
            </h1>
            <div class="Details675">
                <div class="AdminRight">
            الخبر</div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxContent" runat="server" ValidationGroup="UpdateNews" Columns="50"></asp:TextBox></div>
        <div style="float: left; margin-left: 200px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxContent" ForeColor="#C76E1F" ValidationGroup="UpdateNews"></asp:RequiredFieldValidator></div>
        <div class="clear">
        </div>        
        <div class="AdminRight" style="width: 120px">
                </div>
                <div class="AdminMiddle" style="text-align: center;">
                    <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                    <div class="SearchBtn">
                        <asp:LinkButton ID="uiLinkButtonUpdateNews" runat="server" Text="إضافة / تعديل" ValidationGroup="UpdateNews"
                            OnClick="uiLinkButtonUpdateNews_Click"></asp:LinkButton></div>
                    &nbsp; &nbsp; &nbsp;
                    <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                    <div class="SmallBtn">
                        <asp:LinkButton ID="uiLinkButtonCancelNews" runat="server" Text="إلغاء" 
                            OnClick="uiLinkButtonCancelNews_Click"></asp:LinkButton></div>
                </div>
                <div class="AdminLeft">
                </div>
                <div class="clear5">
                </div>
        </div>
        </div>
    </asp:Panel>
        <asp:Panel ID="uiPanelEditSettings" runat="server" Visible="true">
            <div class="ContentLeftDiv">
                <h1>
تعديل عدد الأخبار 
                </h1>
                <div class="Details675">
                    <div class="AdminRight">
                        عدد الأخبار</div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxNewsNo" runat="server" ValidationGroup="UpdateSettings" Columns="50"></asp:TextBox></div>
                    <div style="float: left; margin-left: 200px; margin-top: 8px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                            ControlToValidate="uiTextBoxNewsNo" ForeColor="#C76E1F" ValidationGroup="UpdateSettings"></asp:RequiredFieldValidator></div>
                    <div class="clear">
                    </div>
                    <div class="AdminRight" style="width: 120px">
                    </div>
                    <div class="AdminMiddle" style="text-align: center;">
                        <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonUpdateSettings" runat="server" Text="إضافة / تعديل"
                                ValidationGroup="UpdateSettings" OnClick="uiLinkButtonUpdateSettings_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SmallBtn">
                            <asp:LinkButton ID="uiLinkButtonCancelSettings" runat="server" Text="إلغاء" OnClick="uiLinkButtonCancelSettings_Click"></asp:LinkButton></div>
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
