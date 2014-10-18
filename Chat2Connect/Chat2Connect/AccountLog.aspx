<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="AccountLog.aspx.cs" Inherits="Chat2Connect.AccountLog" %>

<%@ Register Src="~/Admin/UserControls/MemberLogDetails.ascx" TagPrefix="uc1" TagName="MemberLogDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BHead" runat="server">
    <style>
        .table {
            margin-bottom:0px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#userlog').addClass('active');
            $('.clearInput').click(function () {
                var input = $(this).data("control");
                $('#' + input).val("");
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-group">
        <div class="col-lg-12 control-label pull-right">
            <h3>كشف الحساب</h3>
        </div>
    </div>
    <div class="form-horizontal blockBox">
        <div class="form-group">
            <div class="col-md-2 control-label pull-right">
                <label>فى الفترة من </label>
            </div>
            <div class="col-md-2 pull-right">
                <div class="input-group">
                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                    <span class="input-group-btn">
                        <button class="btn bg-warning clearInput icon icon-remove" data-control="<%= txtStartDate.ClientID %>" type="button"></button>
                    </span>
                </div>
            </div>
            <div class="col-md-1 control-label pull-right">
                <label>إلى </label>
            </div>
            <div class="col-md-2 pull-right">
                <div class="input-group">
                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                    <span class="input-group-btn">
                        <button class="btn bg-warning clearInput icon icon-remove" data-control="<%= txtEndDate.ClientID %>" type="button"></button>
                    </span>
                </div>
            </div>
            <div class="col-md-1 pull-right">
                <asp:LinkButton ID="lnkBtnLoadReport" runat="server" class="btn btn-main" OnClick="lnkBtnLoadReport_Click">عرض</asp:LinkButton>
            </div>
        </div>
    </div>
    <div class="col-md-12 pull-right">
        <asp:GridView ID="grdLog" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="grdLog_PageIndexChanging" HeaderStyle-CssClass="MsgHeader">
            <RowStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="CreateDate" DataFormatString="{0:dd / MM / yyyy hh:mm tt}" HeaderText="التاريخ والوقت" />
                <asp:TemplateField HeaderText="نوع الحركة" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Helper.StringEnum.GetStringValue(Helper.EnumUtil.ParseEnum<Helper.Enums.LogType>((int)Eval("LogTypeID"))) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تفاصيل" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <uc1:MemberLogDetails runat="server" ID="ctrlMemberLogDetails" DataSource='<%# Eval("LogDetails") %>' Type='<%# Eval("LogTypeID") %>' AutoBind="true" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
