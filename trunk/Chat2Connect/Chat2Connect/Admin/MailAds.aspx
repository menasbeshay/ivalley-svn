<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="MailAds.aspx.cs" Inherits="Chat2Connect.Admin.MailAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-lg-12 blockBoxshadow">
    <input type="hidden" runat="server" id="hdnAdID" value="0" />
    <h1>الإعلانات فى صندوق البريد</h1>
    <div class="col-lg-12 pull-right">
        <h3>
        <asp:Label ID="lblTitle" runat="server" Text="إعلان جديد"></asp:Label>
            </h3>
    </div>
    <div class="form-horizontal col-lg-12">
        <div class="form-group">
            <div class="pull-right col-lg-12">
                <div class="form-group">
                    <div class="col-lg-1 control-label pull-right">
                        <label>نص الإعلان</label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="txtAdText" runat="server" TextMode="MultiLine" MaxLength="500" CssClass="form-control" Rows="5"> </asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-1 control-label pull-right">
                        <label>إختر الصورة</label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:FileUpload ID="uiFileUploadAddImage" runat="server" />
                    </div>
                </div>
            </div>
            <div class="clear" style="height:10px;"></div>
            <div class="pull-right col-lg-12 ">
                <div class="col-lg-1 pull-right control-label" style="padding-right: 0px;">
                    <label>
                        نوع الحسابات</label>
                </div>
                <div class="pull-right col-lg-2">


                    <asp:CheckBoxList ID="chkMemberTypes" runat="server" CssClass=" checkbox-main pull-right"></asp:CheckBoxList>
                </div>
                <div class="pull-right col-lg-1 control-label">
                    <label>المدة بالأيام</label>
                </div>
                <div class="pull-right col-lg-2">
                    <asp:DropDownList ID="lstDays" runat="server"></asp:DropDownList>
                </div>
                <div class="pull-right col-lg-2 control-label">
                    <label>عدد مرات الإعلان فى اليوم</label>
                </div>
                <div class="pull-right col-lg-1">
                    <asp:DropDownList ID="lstHours" runat="server"></asp:DropDownList>
                </div>


            </div>
            <div class="clear" style="height:10px;"></div>
            <div class="pull-right col-lg-12 ">


                <div class="col-lg-1 pull-right control-label" style="padding-right: 0px;padding-left:0px;">
                    <label>تاريخ بدء الإعلان</label>
                </div>
                <div class="col-lg-2 pull-right">
                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                </div>

            </div>
            <div class="clear" style="height:10px;"></div>
            <div class="pull-right col-lg-12 ">


                <div class="col-lg-1 pull-right control-label" style="padding-right: 0px;">
                    <label>حالة الإعلان</label>
                </div>
                <div class="col-lg-2 pull-right" style="padding-right: 0px;">
                    <asp:RadioButtonList ID="rdStatus" runat="server" CssClass="radio-inlineMain"></asp:RadioButtonList>
                </div>

            </div>
        </div>
        <div class="form-group">
            <asp:Button ID="btnSaveAd" runat="server" CssClass="btn btn-warning" Text="حفظ" OnClick="btnSaveAd_Click" />
        </div>
    </div>
        <div class="col-lg-12">
    <table class="table table-condensed">
        <tr>
            <th class="center">رقم الإعلان</th>
            <th class="center">الحالة</th>
            <th class="center">نص الإعلان</th>
        </tr>
        <asp:Repeater ID="repAds" runat="server">
            <ItemTemplate>
                <tr>
                    <td class="center">
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnkEdit_Click"><%# Eval("ID") %></asp:LinkButton></td>
                    <td class="center"><%# GetStatusName(Eval("RowStatusID")) %></td>
                    <td class="center">
                        <%# GetAdContent(Eval("AdText"),Eval("AdImage")) %>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
            </div>
        </div>
</asp:Content>
