<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucInstallment.ascx.cs" Inherits="Taqwa.Website.Admin.Controls.ucInstallment" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
    <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div>
    
    <h4>الطالب الحالى : 
                        <asp:Label ID="uiLabelStudentName" runat="server"></asp:Label> 
                        <br /> الصف : <asp:Label ID="uiLabelClass" runat="server"></asp:Label>
    </h4>
    </div>
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMessage" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 250px">
          <asp:Label ID="Label14" runat="server" CssClass="Label" 
                Text="السنة الدراسية :"></asp:Label>
            </div>
            <div class="AdminMiddle">
                &nbsp;<asp:DropDownList ID="uiDropDownListSchoolYear" runat="server" 
                    Width="150px" AutoPostBack="True" 
                    onselectedindexchanged="uiDropDownListSchoolYear_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="AdminRight" >
            &nbsp;</div>
            <div class="clear"></div>
        <div class="AdminLeft" style="width: 250px">
            <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" 
                Text="القيمة :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxQty" runat="server" ValidationGroup="UpdatePage" 
                Width="150px">0</asp:TextBox>
        </div>
        <div class="AdminRight">

            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                runat="server" ControlToValidate="uiTextBoxQty" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>

        </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 250px">
             <asp:Label ID="Label16" runat="server" CssClass="Label" Text="التاريخ :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxDate" runat="server" ValidationGroup="UpdatePage" 
                Width="150px"></asp:TextBox>
            <cc1:CalendarExtender ID="uiTextBoxDate_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="uiTextBoxDate" Format="dd/MM/yyyy">
            </cc1:CalendarExtender>
        </div>
        <div class="AdminRight">
           
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 250px">
             <asp:Label ID="Label1" runat="server" CssClass="Label" Text="رقم الإيصال :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxPayOrderNo" runat="server" ValidationGroup="UpdatePage" 
                Width="150px"></asp:TextBox>            
        </div>
        <div class="AdminRight">
           
            &nbsp;</div>
        <div class="clear"></div>
        
        <div class="AdminLeft" style="width: 250px;">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل " ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء " />
        </div>
        <div class="AdminRight">
            &nbsp;
        </div>
        <div class="clear"></div>
        <br />

        <div>
            <asp:GridView ID="uiGridViewStudentsInstallments" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="1" CellSpacing="3" 
                onpageindexchanging="uiGridViewStudentsInstallments_PageIndexChanging" 
                onrowcommand="uiGridViewStudentsInstallments_RowCommand">
                <AlternatingRowStyle HorizontalAlign="Center" />
                <Columns>
                    
                    <asp:BoundField DataField="ArStudentName" HeaderText="إسم الطالب " />
                    <asp:BoundField DataField="ArFatherName" HeaderText="إسم الأب " />
                    <asp:BoundField DataField="Quantity" HeaderText="القيمة" />
                    <asp:BoundField DataField="Date" HeaderText="التاريخ" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="uiLinkButtonEdit" runat="server" 
                                CommandArgument='<%# Eval("InstallmentID") %>' 
                                CommandName="EditInstallment">تعديل القسط</asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("InstallmentID") %>' CommandName="DeleteInstallment" OnClientClick="return confirm('Are you want to delete this record?');">حذف القسط</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    لا توجد بيانات
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        </asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>