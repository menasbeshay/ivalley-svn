<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadMessage.aspx.cs" Inherits="Chat2Connect.LoadMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server">
    <asp:DetailsView ID="dtlMessage" runat="server" AutoGenerateRows="false" Width="100%">
        <Fields>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="form-horizontal blockBox">
                        <div class="row">
                            <div class="col-sm-2 pull-right">
                                <label>من </label>
                            </div>
                            <div class="col-sm-8 pull-right">
                                <%#Eval("FromMember") %>
                            </div>
                        </div>
                        <div class="clearfix" style="height: 10px;"></div>
                        <div class="row">
                            <div class="col-sm-2 pull-right">
                                <label> إلى </label>
                            </div>
                            <div class="col-sm-8 pull-right">
                                <%#Eval("ToMembers") %>
                            </div>

                        </div>
                        <div class="clearfix" style="height: 10px;"></div>
                        <div class="row">
                            <div class="col-sm-2 pull-right">
                                <label>عنوان الرسالة</label>
                            </div>
                            <div class="col-sm-8 pull-right">
                                <%#Eval("Subject") %>
                            </div>
                        </div>
                        <div class="clearfix" style="height: 10px;"></div>
                        <div class="row">
                            <div class="col-sm-2 pull-right">
                                <label>المحتوى </label>
                            </div>
                            <div class="col-sm-8 pull-right">
                                <%#Eval("Body") %>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    </form>
</body>
</html>
