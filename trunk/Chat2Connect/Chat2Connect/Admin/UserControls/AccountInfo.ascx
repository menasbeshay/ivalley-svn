<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountInfo.ascx.cs" Inherits="Chat2Connect.Admin.UserControls.AccountInfo" %>
<style>
    /*ul > li {
        display: inline-block;
        zoom: 1;
        *display: inline;
    }*/
    .horizontallist li {
        display: inline;
        list-style-type: none;
        padding-right: 20px;
    }
</style>
<div class="modal-content">
    <div class="modal-header">
        <h3 id="myModalLabel1">معلومات الحساب</h3>
    </div>
    <div class="modal-body">
        <div class="form-horizontal blockBox validationGroup">
            <div class="form-group">
                <div class="form-group has-error">
                    <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="false" CssClass="control-label"></asp:Label>
                </div>
                <asp:DetailsView ID="dtlAccountInfo" runat="server" AutoGenerateRows="false" GridLines="None" CssClass="table table-condensed" Width="100%">
                    <Fields>
                        <asp:TemplateField>
                            <HeaderTemplate>النكنيم</HeaderTemplate>
                            <ItemTemplate>
                                <% if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_ChangeUsername.ToString()))
                                   { %>
                                <asp:TextBox ID="txtUsername" runat="server" Text='<%# Eval("UserName") %>'></asp:TextBox>
                                <asp:LinkButton ID="btnUpdateUserName" runat="server" Text="تعديل" CssClass="pull-left btn btn-warning" OnClick="btnUpdateUserName_Click">
                                    <i class="icon-pencil"></i>
                                    تعديل
                                </asp:LinkButton>
                                <%}
                                   else
                                   { %>
                                <%# Eval("UserName") %>
                                <%} %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <HeaderTemplate>الإيميل</HeaderTemplate>
                            <ItemTemplate>
                                <span style="font-family:Tahoma">
                                <%# Eval("Email") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <HeaderTemplate>كلمة السر</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("Password") %>
                                <a href="#passwordModal" data-toggle="modal" class="pull-left btn btn-warning">
                                    <i class="icon-pencil"></i>
                                    تعديل
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <HeaderTemplate>السؤال السرى</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("PasswordQuestion") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <HeaderTemplate></HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("QuestionAnswer") %>
                                <a href="#questionModal" data-toggle="modal" class="pull-left btn btn-warning">
                                    <i class="icon-pencil"></i>
                                    تعديل
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField Visible="false" HeaderText="تاريخ التسجيل" DataField="CreationDate" DataFormatString="{0:dd / MM / yyyy hh:mm}" HtmlEncode="false" />
                        <asp:BoundField Visible="false" HeaderText="اّى بى التسجيل" DataField="IP" />
                        <asp:TemplateField Visible="false" HeaderText="لون الصبغة">
                            <ItemTemplate>
                                <span style='display:block;color:<%# Eval("MemberTypeColor") %>;background-color:<%# Eval("MemberTypeColor") %>'><%# Eval("MemberTypeColor") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField Visible="false" HeaderText="إنتهاء الصبغة" DataField="MemberTypeExpiryDate" DataFormatString="{0:dd / MM / yyyy hh:mm}" HtmlEncode="false" />
                        <asp:BoundField Visible="false" HeaderText="الرصيد" DataField="Credit_Money" />
                        <asp:BoundField Visible="false" HeaderText="متصل؟" DataField="IsOnline" />
                        <asp:BoundField Visible="false" HeaderText="الحالة" DataField="StatusName" />
                        <asp:BoundField Visible="false" HeaderText="الأصدقاء" DataField="FriendsCount" />
                        <asp:TemplateField HeaderText="الغرف التى يمتلكها">
                            <ItemTemplate>
                                <ul class="horizontallist">
                                    <asp:Repeater ID="repOwnerRooms" runat="server">
                                        <ItemTemplate>
                                            <li><%# Eval("Name") %></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="الغرف التى يديرها">
                            <ItemTemplate>
                                <ul class="horizontallist">
                                    <asp:Repeater ID="repAdminRooms" runat="server">
                                        <ItemTemplate>
                                            <li><%# Eval("RoomName") %></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
            </div>
        </div>
    </div>
</div>
<div id="passwordModal" class="modal fade" role="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                <i class="icon-4x" style="float: left; font-family: 'entypo'; margin-left: 10px;">-</i>
                <h3 id="myModalLabel1">تعديل كلمة المرور</h3>
            </div>
            <div class="modal-body">
                <div class="form-horizontal blockBox validationGroup">
                    <h4>تعديل كلمة المرور</h4>
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>كلمة المرور الجديدة</label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txtPassword" ErrorMessage="من فضلك أدخل كلمة المرور." ToolTip="من فضلك أدخل كلمة المرور." ValidationGroup="valGroup_ChangePassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6 pull-left">
                            <asp:Button ID="btnChangePassword" runat="server" Text="إعتمد" CssClass="btn btn-warning " ValidationGroup="valGroup_ChangePassword" Style="width: 100px;" OnClick="btnChangePassword_Click" />
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
<div id="questionModal" class="modal fade" role="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration: none;">×</a>
                <i class="icon-4x" style="float: left; font-family: 'entypo'; margin-left: 10px;">-</i>
                <h3 id="myModalLabel1">تعديل السؤال السرى</h3>
            </div>
            <div class="modal-body">
                <div class="form-horizontal blockBox validationGroup">
                    <h4>تعديل السؤال والجواب السرى</h4>
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>السؤال السرى</label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:DropDownList ID="drpQuestions" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">اختر السؤال السرى</asp:ListItem>
                                <asp:ListItem> اين ولدت</asp:ListItem>
                                <asp:ListItem>اقرب صديق اليك</asp:ListItem>
                                <asp:ListItem>اين تسكن</asp:ListItem>
                                <asp:ListItem>افضل مدينه زرتها</asp:ListItem>
                                <asp:ListItem>سيارة تتمنى اقتنائها</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>إجابة السوال السرى</label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:TextBox ID="txtQuestionAnswer" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtQuestionAnswer" ErrorMessage="من فضلك أدخل إجابة السؤال السرى." ToolTip="من فضلك أدخل إجابة السؤال السرى." ValidationGroup="valGroup_ChangeQuestion" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6 pull-left">
                            <asp:Button ID="btnChangeQuestion" runat="server" Text="إعتمد" CssClass="btn btn-warning " ValidationGroup="valGroup_ChangeQuestion" Style="width: 100px;" OnClick="btnChangeQuestion_Click" />
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
