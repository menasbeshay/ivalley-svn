<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="MailAds.aspx.cs" Inherits="Chat2Connect.Admin.MailAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <input type="hidden" runat="server" id="hdnAdID" value="0" />
    <h1>الإعلانات فى صندوق البريد</h1>
    <div class="form-group pull-right">
        <asp:Label ID="lblTitle" runat="server" CssClass="form-control" Text="إعلان جديد"></asp:Label>
    </div>
    <div class="form-horizontal blockBox">
        <div class="form-group">
            <div class="pull-right col-lg-5">
                <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <label>نص الإعلان</label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="txtAdText" runat="server" TextMode="MultiLine" MaxLength="500" CssClass="form-control"> </asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <label>إختر الصورة</label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:FileUpload ID="uiFileUploadAddImage" runat="server" />
                    </div>
                </div>
            </div>
            <div class="pull-right col-lg-7">
                <div class="form-group">
                    <div class="pull-right col-lg-4">
                        نوع الحسابات
                <asp:CheckBoxList ID="chkMemberTypes" runat="server"></asp:CheckBoxList>
                    </div>
                    <div class="pull-right col-lg-4">
                        المدة بالأيام
                <asp:DropDownList ID="lstDays" runat="server"></asp:DropDownList>
                    </div>
                    <div class="pull-right col-lg-4">
                        عدد مرات الإعلان فى اليوم
                <asp:DropDownList ID="lstHours" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-2 pull-right">
                        تاريخ بدء الإعلان
                    </div>
                    <div class="col-lg-2 pull-right">
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-2 pull-right">
                        حالة الإعلان
                    </div>
                    <div class="col-lg-10 pull-right">
                        <asp:RadioButtonList ID="rdStatus" runat="server" CssClass="form-control"></asp:RadioButtonList>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <asp:Button ID="btnSaveAd" runat="server" CssClass="btn btn-warning" Text="حفظ" OnClick="btnSaveAd_Click" />
        </div>
    </div>
    <table class="table table-condensed">
        <tr>
            <th>رقم الإعلان</th>
            <th>الحالة</th>
            <th>نص الإعلان</th>
        </tr>
        <asp:Repeater ID="repAds" runat="server">
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnkEdit_Click"><%# Eval("ID") %></asp:LinkButton></td>
                    <td><%# GetStatusName(Eval("RowStatusID")) %></td>
                    <td>
                        <%# GetAdContent(Eval("AdText"),Eval("AdImage")) %>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</asp:Content>
