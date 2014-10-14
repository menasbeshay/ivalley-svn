<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="AccountsReport.aspx.cs" Inherits="Chat2Connect.Admin.AccountsReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="blockBoxshadow col-lg-12 ">

        <table dir="rtl" class="table-condensed" style="width: 100%;">
            <tr>
                <td colspan="4">
                    <i class="modernicon iconmodern-report pull-right icon-2x"></i>
                    <h3 class="col-lg-4 pull-right">تقرير الحسابات</h3>

                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <hr style="background: #ffd800; width: 100%; margin: 5px auto;" />
                </td>
            </tr>
            <tr>
                <td style="width: 15%; vertical-align: top;">
                    <div class="control-label pull-right">
                        <label>الإيميل </label>
                    </div>
                </td>
                <td style="width: 20%">
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </td>
                <td style="vertical-align: top;">
                    <div class="control-label pull-right">
                        <label>الصلاحيات </label>
                    </div>
                </td>
                <td style="width: 30%; vertical-align: top" rowspan="2">
                    
                    <div class="form-group">
                        <asp:ListBox runat="server" CssClass="form-control" ID="lstRoles"></asp:ListBox>
                    </div>
                </td>

            </tr>
            <tr>
                <td style="vertical-align: top;">
                    <div class="control-label pull-right">
                        <label>تاريخ التسجيل من </label>
                    </div>
                </td>
                <td style="vertical-align: top;">
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtCreatedFrom" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                            <span class="input-group-btn">
                                <button class="btn bg-warning clearInput icon icon-remove" data-control="<%= txtCreatedFrom.ClientID %>" type="button"></button>
                            </span>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;">
                    <div class="control-label pull-right">
                        <label>إلى </label>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtCreatedTo" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                            <span class="input-group-btn">
                                <button class="btn bg-warning clearInput icon icon-remove" data-control="<%= txtCreatedTo.ClientID %>" type="button"></button>
                            </span>
                        </div>
                    </div>
                </td>
                <td style="vertical-align: top;">
                    <div class="control-label pull-right">
                        <label>حالة الحساب </label>
                    </div>
                </td>
                <td style="vertical-align: top">
                    <div class="form-group">
                        <asp:DropDownList ID="lstAccountStatus" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                </td>
                <td style="vertical-align: top;">
                    <input type="button" id="btnClearForm" class="btn btn-warning" style="text-decoration: none;" value="مسح" />
                    <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonSearch" Style="text-decoration: none;" OnClick="uiLinkButtonSearch_Click">بحث</asp:LinkButton>
                </td>
            </tr>
        </table>
        <hr style="background: #ffd800; width: 100%; margin: 5px auto;" />
        <div class="clearfix" style="height: 10px;"></div>
        <div class="col-lg-12" style="float: none;">
            <asp:GridView ID="grdMemberResult" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" OnPageIndexChanging="grdMemberResult_PageIndexChanging" HeaderStyle-CssClass="MsgHeader">
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    لا توجد بيانات
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="إسم العضو" />
                    <asp:BoundField DataField="Email" HeaderText="البريد الإلكترونى" />
                    <asp:BoundField DataField="CreateDate" DataFormatString="{0:dd / MM / yyyy hh:mm tt}" HeaderText="تاريخ التسجيل" />
                </Columns>
            </asp:GridView>
            <div class="clearfix" style="height: 5px;"></div>
        </div>
        <div class="clearfix" style="height: 5px;"></div>
    </div>
    <script>
        $(document).ready(function () {
            
            $('#btnClearForm').click(function () {
                $(<%= lstRoles.ClientID%>).val("");
                $(<%= txtEmail.ClientID%>).val("");
                $(<%= txtCreatedFrom.ClientID%>).val("");
                $(<%= txtCreatedTo.ClientID%>).val("");
            });
        });
    </script>
</asp:Content>
