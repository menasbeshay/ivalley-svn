<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="News.aspx.cs" Inherits="Admin_News" Title="تحديث الاخبار" %>

<%@ MasterType VirtualPath="~/MasterPages/Admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
                <table>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblTitle" Text="الخبر:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtTitle" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="validateTitle" ErrorMessage="*" ForeColor="Red"
                            Display="Dynamic" ControlToValidate="txtTitle" ValidationGroup="NewsValidation"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblDescription" Text="التفاصيل:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtDescription" Width="350px" Rows="4" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblFile" Text="الملف المرفق:"></asp:Label>
                    </td>
                    <td align="right">
                        <table>
                            <tr>
                                <td runat="server" id="areaFileUpload" valign="top">
                                    <input type="file" runat="server" name="MMM" id="filUpload" style="width: 350px"></input>
                                    <asp:LinkButton runat="server" ID="lnkCancelUpload" Text="الغاء تغيير الملف" Visible="false"
                                        OnClick="lnkCancelUpload_Click"></asp:LinkButton>
                                </td>
                                <td runat="server" id="areaChangeFile" style="display: none" valign="top">
                                    <asp:LinkButton runat="server" ID="lnkViewFile" Text="عرض الملف" OnClick="lnkViewFile_Click"></asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton runat="server" ID="lnkChangeFile" Text="تغيير الملف" OnClick="lnkChangeFile_Click"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label1" Text="اظهار الخبر:"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkShowLive" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button runat="server" ID="btnSave" ValidationGroup="NewsValidation" Width="100px"
                            Text="اضافة خبر" OnClick="btnSave_Click" />
                        &nbsp;&nbsp;
                        <asp:Button runat="server" ID="btnCancel" Width="100px" Text="الغاء" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
            <hr style="width: 400px; text-align: right" />
            <asp:Label runat="server" ID="lbloldNews" Text="الاخبار التى تم اضافتها من قبل" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:GridView runat="server" ID="grdNews" AutoGenerateColumns="false" OnRowDataBound="grdNews_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="الخبر" DataField="Title" />
                    <asp:BoundField HeaderText="اظهار الخبر" DataField="ShowStatus" />
                    <asp:BoundField HeaderText="تاريخ الاضافة" DataField="CreateDate" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField HeaderText="المستخدم" DataField="UserName" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                         <asp:ImageButton runat="server" ID="lnkShowFile" OnClick="lnkShowFile_Click" CommandArgument='<%# Eval("NewsID") %>'
                             ToolTip="عرض الملف" ImageUrl="~/Images/view.png" Width="20px" />&nbsp;
                            <asp:ImageButton runat="server" ImageUrl="~/Images/edit.png" OnClick="lnkEdit_Click" CommandArgument='<%# Eval("NewsID") %>'
                                ID="lnkEdit" ToolTip="تعديل" Width="20px"></asp:ImageButton>&nbsp;
                            <asp:ImageButton runat="server" ImageUrl="~/Images/Symbols-Delete-icon.png" OnClick="lnkDelete_Click" CommandArgument='<%# Eval("NewsID") %>'
                                ID="lnkDelete" OnClientClick="return confirm('تأكيد الحذف ؟');" ToolTip="حذف" Width="20px"></asp:ImageButton>
                        </ItemTemplate>
                        <ItemStyle CssClass="GridCellAlignCenter" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
       
</asp:Content>
