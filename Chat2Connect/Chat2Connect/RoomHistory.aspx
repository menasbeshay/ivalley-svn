<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomHistory.aspx.cs" Inherits="Chat2Connect.RoomHistory" %>

<%@ Register Src="~/Admin/UserControls/MemberLogDetails.ascx" TagPrefix="uc1" TagName="MemberLogDetails" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-group">
            <div class="col-lg-12 control-label pull-right">
                <h5>حركة عمليات الغرفة - 
                    <asp:Label ID="lblRoomName" runat="server"></asp:Label>
                </h5>
            </div>
        </div>
        <div class="col-md-12 pull-right">
            <asp:GridView ID="grdLog" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" AllowPaging="false" HeaderStyle-CssClass="MsgHeader" EmptyDataText="لا يوجد">
                <RowStyle HorizontalAlign="Center" />
                <Columns>
                    <asp:BoundField DataField="CreateDate" DataFormatString="{0:dd / MM / yyyy hh:mm tt}" HeaderText="التاريخ والوقت" />
                    <asp:BoundField DataField="MemberName" HeaderText="عضو الإدارة" />
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
    </form>
</body>
</html>
