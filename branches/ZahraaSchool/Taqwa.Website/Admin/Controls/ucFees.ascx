<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucFees.ascx.cs" Inherits="Taqwa.Website.Admin.Controls.ucFees" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div>
    
    <h4 style="direction:rtl;">الطالب الحالى :
        <asp:Label ID="uiLabelStudentName" runat="server"></asp:Label>
        <br />
        الصف : <asp:Label ID="uiLabelClass" runat="server"></asp:Label>
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
            <div class="clear">
            </div>
        <div class="AdminLeft" style="width: 250px">
            <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" 
                Text="المصروفات المستحقة من العام السابق :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxRemainingFees" runat="server" ValidationGroup="UpdatePage" 
                Width="150px">0</asp:TextBox>
        </div>
        <div class="AdminRight">

            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                runat="server" ControlToValidate="uiTextBoxRemainingFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>

        </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 250px">
            <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="رسوم الكتب الدراسية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxBooksFees" runat="server" ValidationGroup="UpdatePage" 
                Width="150px">0</asp:TextBox>
        </div>
        <div class="AdminRight">
           
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" 
                runat="server" ControlToValidate="uiTextBoxBooksFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
           
        </div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 250px">
            <asp:Label ID="Label1" runat="server" CssClass="Label" 
                Text="رسوم إشتراك سيارة المدرسة :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxBusFees" runat="server" ValidationGroup="UpdatePage" 
                Width="150px">0</asp:TextBox>
        </div>
        <div class="AdminRight">
           
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" 
                runat="server" ControlToValidate="uiTextBoxBusFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
           
        </div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 250px">
            <asp:Label ID="Label2" runat="server" CssClass="Label" 
                Text="رسوم الزى المدرسى :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxUniformFees" runat="server" ValidationGroup="UpdatePage" 
                Width="150px">0</asp:TextBox>
        </div>
        <div class="AdminRight">
           
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator7" 
                runat="server" ControlToValidate="uiTextBoxUniformFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
           
        </div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 250px">
            <asp:Label ID="Label3" runat="server" CssClass="Label" 
                Text="الرسوم الدراسية والأنشطة :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxActFees" runat="server" ValidationGroup="UpdatePage" 
                Width="150px">0</asp:TextBox>
        </div>
        <div class="AdminRight">
           
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator8" 
                runat="server" ControlToValidate="uiTextBoxActFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
           
        </div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 250px">
            <asp:Label ID="Label4" runat="server" CssClass="Label" 
                Text="رسوم الخدمات الإضافية :  "></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxOtherFees" runat="server" ValidationGroup="UpdatePage" 
                Width="150px">0</asp:TextBox>
        </div>
        <div class="AdminRight">
           
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator9" 
                runat="server" ControlToValidate="uiTextBoxOtherFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
           
        </div>
        <div class="clear"></div>
        
        <div class="AdminLeft" style="width: 250px;">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل " ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء" Visible="false" />
        </div>
        <div class="AdminRight">
            &nbsp;
        </div>
        <div class="clear"></div>
        <br />

        <div>
            <asp:GridView ID="uiGridViewStudentsFees" runat="server" AllowPaging="True" Visible="false" 
                AutoGenerateColumns="False" CellPadding="1" CellSpacing="3" 
                onpageindexchanging="uiGridViewStudentsFees_PageIndexChanging" 
                onrowcommand="uiGridViewStudentsFees_RowCommand">
                <AlternatingRowStyle HorizontalAlign="Center" />
                <Columns>
                    
                    <asp:BoundField DataField="ArStudentName" HeaderText="إسم الطالب " />
                    <asp:BoundField DataField="ArFatherName" HeaderText="إسم الأب " />
                    <asp:BoundField DataField="ENSchoolYear" HeaderText="السنة الدراسية" />
                    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="uiLinkButtonEdit" runat="server" 
                                CommandArgument='<%# Eval("FeesID") %>' 
                                CommandName="EditFees">تعديل المصروفات</asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("FeesID") %>' CommandName="DeleteFees" OnClientClick="return confirm('Are you want to delete this record?');">حذف المصروفات</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    عفواً ، لا توجد بيانات .
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        </asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>