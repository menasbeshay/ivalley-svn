<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SendMail.ascx.cs" Inherits="Chat2Connect.usercontrols.SendMail" %>
<script src="../js/jquery.tokeninput.js"></script>
<script src="../js/wysihtml5-0.3.0.js"></script>
<script src="../js/advanced.js"></script>
<link href="../css/token-input-facebook.css" rel="stylesheet" />
<div class="form-horizontal blockBox">
    <div class="row">
        <div class="col-sm-2 pull-right">
            <label>من </label>
        </div>
        <div class="col-sm-8 pull-right">
            <asp:TextBox ID="txtFrom" runat="server" Enabled="false" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
        </div>

    </div>
    <div class="clearfix" style="height: 10px;"></div>
    <div class="row">
        <div class="col-sm-2 pull-right">
            <label>إرسال إلى </label>
        </div>
        <div class="col-sm-8 pull-right">
            <asp:TextBox ID="txtTo" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
        </div>

    </div>

    <div class="clearfix" style="height: 10px;"></div>

    <div class="row">
        <div class="col-sm-2 pull-right">
            <label>عنوان الرسالة</label>
        </div>
        <div class="col-sm-8 pull-right">
            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

    </div>

    <div class="clearfix" style="height: 10px;"></div>

    <div class="row">
        <div class="col-sm-2 pull-right">
            <label>المحتوى </label>
        </div>
        <div class="col-sm-8 pull-right">

            <div id="toolbar">
                <div class="btn-group" data-toggle="buttons">

                    <button class="btn btn-default" data-wysihtml5-command='bold' title='CTRL+B'><span class="icon-bold"></span></button>

                    <button class="btn btn-default" data-wysihtml5-command='italic' title='CTRL+I'><span class="icon-italic"></span></button>

                </div>

                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <span class="icon-text-height"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a data-wysihtml5-command='fontSize' data-wysihtml5-command-value='xsmall'>صغير جداً</a></li>
                        <li><a data-wysihtml5-command='fontSize' data-wysihtml5-command-value='small'>صغير</a></li>
                        <li><a data-wysihtml5-command='fontSize' data-wysihtml5-command-value='medium'>متوسط</a></li>
                        <li><a data-wysihtml5-command='fontSize' data-wysihtml5-command-value='large'>كبير</a></li>
                        <li><a data-wysihtml5-command='fontSize' data-wysihtml5-command-value='xlarge'>كبير جداً</a></li>
                    </ul>
                </div>

                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <span class="icon-dashboard"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" id="colorsMenu">

                        <li class='itemColor'><a data-wysihtml5-command='foreColor' data-wysihtml5-command-value='red'>
                            <div class="colorDiv" style="background-color: #f00;"></div>
                        </a></li>
                        <li class='itemColor'><a data-wysihtml5-command='foreColor' data-wysihtml5-command-value='green'>
                            <div class="colorDiv" style="background-color: #0f0;"></div>
                        </a></li>
                        <li class='itemColor'><a data-wysihtml5-command='foreColor' data-wysihtml5-command-value='blue'>
                            <div class="colorDiv" style="background-color: #00f;"></div>
                        </a></li>
                    </ul>
                </div>


                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <span class="icon-smile"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" id="smilesMenu">

                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/1.gif'>
                            <img src="../images/emotions/1.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/2.gif'>
                            <img src="../images/emotions/2.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/3.gif'>
                            <img src="../images/emotions/3.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/4.gif'>
                            <img src="../images/emotions/4.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/5.gif'>
                            <img src="../images/emotions/5.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/8.gif'>
                            <img src="../images/emotions/8.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/9.gif'>
                            <img src="../images/emotions/9.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/10.gif'>
                            <img src="../images/emotions/10.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/11.gif'>
                            <img src="../images/emotions/11.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/12.gif'>
                            <img src="../images/emotions/12.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/13.gif'>
                            <img src="../images/emotions/13.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/15.gif'>
                            <img src="../images/emotions/15.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/16.gif'>
                            <img src="../images/emotions/16.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/17.gif'>
                            <img src="../images/emotions/17.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/19.gif'>
                            <img src="../images/emotions/19.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/21.gif'>
                            <img src="../images/emotions/21.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/22.gif'>
                            <img src="../images/emotions/22.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/23.gif'>
                            <img src="../images/emotions/23.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/27.gif'>
                            <img src="../images/emotions/27.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/28.gif'>
                            <img src="../images/emotions/28.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/29.gif'>
                            <img src="../images/emotions/29.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/31.gif'>
                            <img src="../images/emotions/31.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/32.gif'>
                            <img src="../images/emotions/32.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/33.gif'>
                            <img src="../images/emotions/33.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/37.gif'>
                            <img src="../images/emotions/37.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/38.gif'>
                            <img src="../images/emotions/38.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/39.gif'>
                            <img src="../images/emotions/39.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/41.gif'>
                            <img src="../images/emotions/41.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/43.gif'>
                            <img src="../images/emotions/43.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/47.gif'>
                            <img src="../images/emotions/47.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/48.gif'>
                            <img src="../images/emotions/48.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/49.gif'>
                            <img src="../images/emotions/49.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/20.gif'>
                            <img src="../images/emotions/20.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/44.gif'>
                            <img src="../images/emotions/44.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/45.gif'>
                            <img src="../images/emotions/45.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/46.gif'>
                            <img src="../images/emotions/46.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/7.gif'>
                            <img src="../images/emotions/7.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/14.gif'>
                            <img src="../images/emotions/14.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/18.gif'>
                            <img src="../images/emotions/18.gif" /></a></li>

                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/24.gif'>
                            <img src="../images/emotions/24.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/25.gif'>
                            <img src="../images/emotions/25.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/26.gif'>
                            <img src="../images/emotions/26.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/30.gif'>
                            <img src="../images/emotions/30.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/34.gif'>
                            <img src="../images/emotions/34.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/35.gif'>
                            <img src="../images/emotions/35.gif" /></a></li>

                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/40.gif'>
                            <img src="../images/emotions/40.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/42.gif'>
                            <img src="../images/emotions/42.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/36.gif'>
                            <img src="../images/emotions/36.gif" /></a></li>
                        <li class='itemImage'><a data-wysihtml5-command='insertImage' data-wysihtml5-command-value='images/emotions/6.gif'>
                            <img src="../images/emotions/6.gif" /></a></li>
                    </ul>
                </div>

            </div>
            <div class="clearfix" style="height: 5px;"></div>
            <textarea id="txtBody" class="form-control" style="height: 300px; padding: 0 !important;"></textarea>
        </div>
    </div>
    <div class="clearfix" style="height: 10px;"></div>
    <div class="row">
        <div class="col-sm-2 pull-right">
        </div>
        <div class="col-sm-8 pull-right">
            <a class="btn btn-main" id="sendmsgbtn">إرسال</a>
        </div>
    </div>
    <asp:HiddenField ID="uiHiddenFieldCurrentMember" runat="server" />
</div>

<script type="text/javascript">
    var Msgeditor;
    $(document).ready(function () {
        $('#sendmsgbtn').click(function () {
            SendMsg();
        });
        //var friends = 
        $("#txtTo").tokenInput("../Services/Services.asmx/SearchMailMembers?memberID=" + $('#<%= uiHiddenFieldCurrentMember.ClientID %>').val(), {
            theme: "facebook",
            preventDuplicates: true,
            hintText: "",
            noResultsText: "لا يوجد",
            searchingText: "بحث فى الأصدقاء..."
        });

        Msgeditor = new wysihtml5.Editor('txtBody', { toolbar: 'toolbar', parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: '../css/main.css' });
    });

    function SendMsg() {

        $.ajax({
            url: "../Services/Services.asmx/SendMsg",
            dataType: "json",
            type: "post",
            data: "{'sender':" + $('#<%= uiHiddenFieldCurrentMember.ClientID %>').val() + ",'ToMember':'" + $('#<%= txtTo.ClientID %>').val() + "' , 'subject' : '" + $('#<%= txtSubject.ClientID %>').val() + "' , 'content' : '" + Msgeditor.getValue() + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data.d == false) {

                    $.pnotify({
                        text: 'حدث خطأ . من فضلك أعد المحاولة.',
                        type: 'error',
                        history: false,
                        closer_hover: false,
                        delay: 5000,
                        sticker: false
                    });
                }
                else if (data.d == true) {

                    $.pnotify({
                        text: 'تم الإرسال بنجاح.',
                        type: 'success',
                        history: false,
                        closer_hover: false,
                        delay: 5000,
                        sticker: false
                    });
                    setTimeout(function () {
                        document.location.href = document.location.href + "?t=inbox";
                    }, 3000);


                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {

                $.pnotify({
                    text: 'حدث خطأ . من فضلك أعد المحاولة.',
                    type: 'error',
                    history: false,
                    closer_hover: false,
                    delay: 5000,
                    sticker: false
                });
            }
        });
    }

</script>
