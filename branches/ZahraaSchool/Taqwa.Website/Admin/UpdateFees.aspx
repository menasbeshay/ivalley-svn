<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateFees.aspx.cs" Inherits="Taqwa.Website.Admin.Controls.UpdateFees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminMain" style="padding:10px;">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear" ></div>
<div class="clearfix" style="height:5px;"></div>
<div class="row" style="direction:rtl;padding-right:20px;">
<h2  class="pull-right">
تحميل المصروفات الدراسية
</h2></div>
<div class="clearfix" style="height:5px;"></div>
<div class="row" style="direction:rtl;">
    <div class="col-lg-3 pull-right ">
    السنة الدراسية
    </div>
    <div class="col-lg-6 pull-right ">
    <asp:DropDownList ID="uiDropDownListSchoolYear" runat="server" >
                </asp:DropDownList>
    </div>
</div>
<div class="clearfix" style="height:5px;"></div>
<div class="row" style="direction:rtl;">
    <div class="pull-right col-lg-3">
    الصف الدراسى
    </div>
    <div class="pull-right col-lg-6">
    <asp:DropDownList ID="uiDropDownListClass" runat="server" >
                </asp:DropDownList>
    </div>
</div>
<div class="clearfix" style="height:5px;"></div>
<div class="row" style="direction:rtl;">
    <div class="pull-right col-lg-3">
    رسوم الكتب الدراسية 
    </div>
    <div class="pull-right col-lg-6">
        <asp:TextBox ID="uiTextBoxBooksFees" runat="server"></asp:TextBox>
    </div>
    <div class="pull-right col-lg-2">
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" 
                runat="server" ControlToValidate="uiTextBoxBooksFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ValidationGroup="UpdatePage" ForeColor="#ff0000" ControlToValidate="uiTextBoxBooksFees" Display="Dynamic" ></asp:RequiredFieldValidator>
    </div>
</div>
<div class="clearfix" style="height:5px;"></div>
<div class="row" style="direction:rtl;">
    <div class="pull-right col-lg-3">
    رسوم إشتراك سيارة المدرسة 
    </div>
    <div class="pull-right col-lg-6">
    <asp:TextBox ID="uiTextBoxBusFees" runat="server"></asp:TextBox>
    </div>
    <div class="pull-right col-lg-2">
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                runat="server" ControlToValidate="uiTextBoxBusFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ValidationGroup="UpdatePage" ForeColor="#ff0000" ControlToValidate="uiTextBoxBusFees" Display="Dynamic" ></asp:RequiredFieldValidator>
    </div>
</div>
<div class="clearfix" style="height:5px;"></div>
<div class="row" style="direction:rtl;">
    <div class="pull-right col-lg-3">
    رسوم الزى المدرسى 
    </div>
    <div class="pull-right col-lg-6">
    <asp:TextBox ID="uiTextBoxUniformFees" runat="server"></asp:TextBox>
    </div>
       <div class="pull-right col-lg-2">
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                runat="server" ControlToValidate="uiTextBoxUniformFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ValidationGroup="UpdatePage" ForeColor="#ff0000" ControlToValidate="uiTextBoxUniformFees" Display="Dynamic" ></asp:RequiredFieldValidator>
    </div>
</div>
<div class="clearfix" style="height:5px;"></div>
<div class="row" style="direction:rtl;">
    <div class="pull-right col-lg-3">
    الرسوم الدراسية والأنشطة 
    </div>
    <div class="pull-right col-lg-6">
    <asp:TextBox ID="uiTextBoxActFees" runat="server"></asp:TextBox>
    </div>
         <div class="pull-right col-lg-2">
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                runat="server" ControlToValidate="uiTextBoxActFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ValidationGroup="UpdatePage" ForeColor="#ff0000" ControlToValidate="uiTextBoxActFees" Display="Dynamic" ></asp:RequiredFieldValidator>
    </div>
</div>
<div class="clearfix" style="height:5px;"></div>
<div class="row" style="direction:rtl;">
    <div class="pull-right col-lg-3">
    رسوم الخدمات الإضافية 
    </div>
    <div class="pull-right col-lg-6">
    <asp:TextBox ID="uiTextBoxExtFees" runat="server"></asp:TextBox>
    </div>
            <div class="pull-right col-lg-2">
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                runat="server" ControlToValidate="uiTextBoxExtFees" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ValidationGroup="UpdatePage" ForeColor="#ff0000" ControlToValidate="uiTextBoxExtFees" Display="Dynamic" ></asp:RequiredFieldValidator>
    </div>
</div>


<div class="clearfix" style="height:5px;"></div>
<div class="row" style="direction:rtl;">
    <div class="pull-right col-lg-3">
    &nbsp; 
    </div>
    <div class="pull-right col-lg-6">
        <asp:Button ID="uiButtonSave" runat="server" Text="تحميل المصروفات" 
            ValidationGroup="UpdatePage" onclick="uiButtonSave_Click"/>
    </div>
          
</div>

</div>
</asp:Content>
