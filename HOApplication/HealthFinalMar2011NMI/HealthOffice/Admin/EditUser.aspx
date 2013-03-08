<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="EditUser.aspx.cs" Inherits="Admin_EditUser" %>
<%@ MasterType VirtualPath="~/MasterPages/Admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
<center>
        <asp:Label ID="lblPageHeader" Font-Size="X-Large" runat="server"></asp:Label>
        </center>
        <br />
    <asp:UpdatePanel ID="updatePnl1" runat="server">
        <ContentTemplate>
            <table dir="rtl" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="lblRole1" Text="المسمي الوظيفي" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="dropRole" Width="150px" runat="server" AutoPostBack="true"
                            meta:resourcekey="dropRole1Resource1" OnSelectedIndexChanged="dropRole_SelectedIndexChanged">
                            <asp:ListItem Text="مشرف وزارة"  Value="FA83E65D-EC4F-4FF6-B836-3F78C7D75B5C" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="مشرف مديرية" Value="6598B2CD-9CEB-441B-A605-696B9BA09399"></asp:ListItem>
                            <asp:ListItem Text="مشرف ادارة" Value="E55CB679-23CA-4C36-B94D-EFB5128EAEAC"></asp:ListItem>
                            <asp:ListItem Text="طبيب" Value="5013C55E-EE53-4AEA-A711-C7E95A4FBCDE"></asp:ListItem>
                            <asp:ListItem Text="كاتب صحة" Value="AD2EA5B6-EE94-49A2-B6E7-187667868458"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblCivil" Text="ادارة صحية" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpCivil" Enabled="false" Width="150px" AutoPostBack="true" runat="server"
                            OnSelectedIndexChanged="drpCivil_SelectedIndexChanged">
                            <asp:ListItem Value="-1">اختر ادارة</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblGov" Text="مديرية صحة" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpGov" Width="150px" Enabled="false" AutoPostBack="true" runat="server" OnSelectedIndexChanged="drpGov_SelectedIndexChanged">
                            <asp:ListItem Value="-1">اختر مديرية</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblOffice" Text="مكتب صحة" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpHealthOffice" Enabled="false" Width="150px" 
                            runat="server" AutoPostBack="True" 
                            onselectedindexchanged="drpHealthOffice_SelectedIndexChanged">
                            <asp:ListItem Value="-1">اختر مكتب</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblNationalID" Text="الرقم القومى" runat="server"></asp:Label>
                    </td>
                    <td align="right"> 
                    <asp:TextBox runat="server" ID="txtNationalID" Width="145px" MaxLength="14"></asp:TextBox>
                    </td>
                    <td >
                    <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatePnl1" DisplayAfter="1" ID="progParents">
                                <ProgressTemplate>
                                <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                                جارى البحث
                                </ProgressTemplate>
                                </asp:UpdateProgress>
                    </td>
                    <td>
                    
                    </td>
                    </tr>
                <tr>
                    <td colspan="4" align="center">
                        <asp:Button ID="btnSearch" Text="بحــــث" runat="server" OnClick="btnSearch_Click" />
                    </td>
                   
                </tr>
            </table>
            <br />
            <asp:Label ID="lblMsg" Visible="false" runat="server"></asp:Label>
            <div dir="rtl" align="center">
                <asp:GridView runat="server" EmptyDataText="لا توجد بيانات" ID="grduser" DataKeyNames="UserId"
                    AutoGenerateColumns="false" AllowPaging="true" PageSize="10" SelectedRowStyle-CssClass="AspNet-GridView-Selected"
                    OnRowDataBound="grduser_RowDataBound" OnPageIndexChanging="grduser_PageIndexChanging">
                    <SelectedRowStyle CssClass="AspNet-GridView-Selected" />
                    <Columns>
                        <asp:TemplateField HeaderText="الرقم القومي">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" OnClick="lnkEdit_Click" Text='<%#Eval("NationalId")%>'
                                    CommandArgument='<%#Eval("UserId")%>' runat="server"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="الاسم الاول" DataField="FirstName" />
                        <asp:BoundField HeaderText="اسم الأب" DataField="FatherName" />
                        <asp:TemplateField HeaderText="حالة المشغل">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblStatus"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button runat="server" ID="lnkDelete" OnClick="lnkDel_Click" CommandArgument='<%#Eval("UserId")%>'
                                    Text="حذف" OnClientClick="return confirm('انت على وشك حذف هذه البيانات');"></asp:Button>
                                     <asp:Button runat="server" ID="btnChangePassword" OnClick="btnChangePassword_Click" CommandArgument='<%#Eval("UserId")%>'
                                    Text="تغيير كلمة المرور" ></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
