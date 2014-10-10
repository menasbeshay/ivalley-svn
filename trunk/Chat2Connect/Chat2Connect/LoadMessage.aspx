<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadMessage.aspx.cs" Inherits="Chat2Connect.LoadMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server">
        <div class="form-horizontal blockBox">
            <div class="row">
                <div class="col-sm-4 pull-right">
                    <label>من </label>
                </div>
                <div class="col-sm-8 pull-right" runat="server" id="dvFrom">
                </div>
            </div>
            <div class="clear" style="height: 10px;"></div>
            <div class="row">
                <div class="col-sm-4 pull-right">
                    <label>إلى </label>
                </div>
                <div class="col-sm-8 pull-right" runat="server" id="dvToMembers">
                </div>
            </div>
            <div class="clear" style="height: 10px;"></div>
            <div class="row">
                <div class="col-sm-4 pull-right">
                    <label>عنوان الرسالة</label>
                </div>
                <div class="col-sm-8 pull-right" runat="server" id="dvSubject">
                </div>
            </div>
            <div class="clear" style="height: 10px;"></div>
            <div class="row">
                <div class="col-sm-3 pull-right">
                    <label>المحتوى </label>
                </div>
            </div>
            <div class="clear" style="height: 10px;"></div>
            <div class="row">
                <div class="col-sm-12 pull-right" style="word-wrap: break-word;" runat="server" id="dvBody">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
