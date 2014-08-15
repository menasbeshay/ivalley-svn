<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="RoomsReport.aspx.cs" Inherits="Chat2Connect.Admin.RoomsReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="blockBoxshadow col-lg-12 ">

        <table dir="rtl" class="table-condensed" style="width: 100%;">
            <tr>
                <td colspan="4">
                    <i class="modernicon iconmodern-report pull-right icon-2x"></i>
                    <h3 class="col-lg-4 pull-right">تقرير الغرف</h3>
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
                        <label>تاريخ الإنشاء من </label>
                    </div>
                </td>
                <td style="width: 15%; vertical-align: top;">
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
                <td style="width:10%; vertical-align: top;">
                    <div class="control-label pull-right">
                        <label>حالة الغرفة </label>
                    </div>
                </td>
                <td style="width:15%; vertical-align: top">
                    <div class="form-group">
                        <asp:DropDownList ID="lstRoomStatus" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                </td>
                <td style="vertical-align: top;">
                    <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonSearch" Style="text-decoration: none;" OnClick="uiLinkButtonSearch_Click">بحث</asp:LinkButton>
                </td>
            </tr>
        </table>
        <hr style="background: #ffd800; width: 100%; margin: 5px auto;" />
        <div class="clearfix" style="height: 10px;"></div>
        <div class="col-lg-12" style="float: none;">
            <asp:GridView ID="grdResult" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" OnPageIndexChanging="grdResult_PageIndexChanging" HeaderStyle-CssClass="MsgHeader">
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    لا توجد بيانات
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="إسم الغرفة" />
                    <asp:BoundField DataField="OwnerName" HeaderText="المالك" />
                    <asp:BoundField DataField="CreatedDate" DataFormatString="{0:dd / MM / yyyy hh:mm tt}" HeaderText="تاريخ الإنشاء" />
                </Columns>
            </asp:GridView>
            <div class="clearfix" style="height: 5px;"></div>
        </div>
        <div class="clearfix" style="height: 5px;"></div>
    </div>
    <script>
        $(document).ready(function () {
            $('.clearInput').click(function () {
                var input = $(this).data("control");
                $('#' + input).val("");
            });
        });
    </script>
</asp:Content>
