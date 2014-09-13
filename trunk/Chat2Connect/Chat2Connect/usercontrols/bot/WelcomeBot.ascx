<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WelcomeBot.ascx.cs" Inherits="Chat2Connect.usercontrols.bot.WelcomeBot" %>
<div class="col-lg-7 pull-right">
    <div class="col-lg-4 pull-right">
        <h5>بوت الترحيب</h5>
    </div>
</div>
<div class="clearfix"></div>
<hr style="background: #ffd800; width: 100%; margin: 5px auto;" />
<div class="clearfix"></div>
<form class="form-horizontal" role="form">
    <div class="form-group">
        <label for="rdStatus" class="col-sm-2 control-label pull-right">حالة البوت</label>
        <div class="col-sm-10 pull-right">
            <asp:RadioButtonList ID="rdStatus" runat="server" RepeatDirection="Horizontal" CssClass="form-control">
                <asp:ListItem Value="1" Text="فعال"></asp:ListItem>
                <asp:ListItem Value="0" Text="معطل"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="form-group">
        <div class="col-sm-2 control-label pull-right">
            <label>عند الدخول</label>
        </div>
        <div class="col-sm-4 pull-right">
            <asp:TextBox ID="txtLoginMessagePart1" runat="server" CssClass="form-control"></asp:TextBox>
            <div class="col-sm-1 has-error pull-right">
                <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtLoginMessagePart1" Display="Dynamic" ErrorMessage="*" ValidationGroup='<%# this.ValidationGroup %>'></asp:RequiredFieldValidator>
            </div>
        </div>

        <label class="col-sm-2 control-label pull-right">(إسم الحساب)</label>
        <div class="col-sm-4 pull-right">
            <asp:TextBox ID="txtLoginMessagePart2" runat="server" CssClass="form-control"></asp:TextBox>
            <div class="col-sm-1 has-error pull-right">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLoginMessagePart2" Display="Dynamic" ErrorMessage="*" ValidationGroup='<%# this.ValidationGroup %>'></asp:RequiredFieldValidator>
            </div>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="form-group">
        <label class="col-sm-2 control-label pull-right">عند الخروج</label>
        <div class="col-sm-4 pull-right">
            <asp:TextBox ID="txtLogoutMessagePart1" runat="server" CssClass="form-control"></asp:TextBox>
            <div class="col-sm-1 has-error pull-right">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLogoutMessagePart1" Display="Dynamic" ErrorMessage="*" ValidationGroup='<%# this.ValidationGroup %>'></asp:RequiredFieldValidator>
            </div>
        </div>

        <label class="col-sm-2 control-label pull-right">(إسم الحساب)</label>
        <div class="col-sm-4 pull-right">
            <asp:TextBox ID="txtLogoutMessagePart2" runat="server" CssClass="form-control"></asp:TextBox>
            <div class="col-sm-1 has-error pull-right">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLogoutMessagePart2" Display="Dynamic" ErrorMessage="*" ValidationGroup='<%# this.ValidationGroup %>'></asp:RequiredFieldValidator>
            </div>
        </div>

    </div>
    <div class="clearfix"></div>
</form>

