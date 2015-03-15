<%@ Page Title="" Language="C#" MasterPageFile="~/AccountMatster.master" AutoEventWireup="true" CodeBehind="ContactRespon.aspx.cs" Inherits="Taqwa.Website.ContactRespon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mainContent">
        <div class="style24" style="color: Green; margin-bottom: 15px">
            مراسلة المسئولين
        </div>

        <table>
            <tr>
                <td style="height: 43px; width: 100px">المرسل اليه
                </td>
                <td style="height: 43px">
                    <asp:DropDownList Width="150" ID="drpDwnReceiver" runat="server">
                        <asp:ListItem Selected="True" Value="0">مدير المدرسة</asp:ListItem>
                        <asp:ListItem Value="1">الإخصائي النفسي</asp:ListItem>
                        <asp:ListItem Value="2">مسئول الموقع</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 131px">محتوى الرسالة
                </td>
                <td style="height: 131px">
                    <asp:TextBox ID="txtMsg" TextMode="MultiLine" Width="300" Rows="5" Wrap="true" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 43px">
                    <div style="float: left">
                        <asp:Button ID="btnSendMsg" Width="100" runat="server" Text="ارسال" OnClientClick="return confirm('هل أنت متأكد أنك تريد إرسال هذه الرسالة؟')" OnClick="btnSendMsg_Click" />
                    </div>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
