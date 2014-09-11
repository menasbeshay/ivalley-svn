<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="SiteSettings.aspx.cs" Inherits="Chat2Connect.Admin.SiteSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
      <script src="../js/wysihtml5-0.3.0.js"></script>
    <script src="../js/advanced.js"></script>
    <script type="text/javascript">
        var Termseditor;
        var Privacyeditor;
        var Faqeditor;
        $(document).ready(function () {
            Termseditor = new wysihtml5.Editor('txtTerms', { toolbar: 'toolbar2', parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: '../css/main.css' });
            Privacyeditor = new wysihtml5.Editor('txtPrivacy', { toolbar: 'toolbar1', parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: '../css/main.css' });
            Faqeditor = new wysihtml5.Editor('txtFaq', { toolbar: 'toolbar3', parserRules: wysihtml5ParserRules, useLineBreaks: false, stylesheets: '../css/main.css' });

            $('#saveSocials').click(function () {
                $.ajax({
                    url: "../Services/Services.asmx/SaveSocials",
                    dataType: "json",
                    type: "post",
                    data: "{'fb':'" + $('#<%= uiTextBoxFbURL.ClientID %>').val() + "', 'tw':'" + $('#<%= uiTextBoxTwitterURL.ClientID %>').val() + "', 'gp':'" + $('#<%= uiTextBoxGURL.ClientID %>').val() + "', 'yt':'" + $('#<%= uiTextBoxYtURL.ClientID %>').val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if (data.d == false) {
                            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                        }
                        else if (data.d == true) {
                            notify('success', 'تم الحفظ بنجاح.');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                    }
                });
            });

            $('#saveTerms').click(function () {
                $.ajax({
                    url: "../Services/Services.asmx/SaveTerms",
                    dataType: "json",
                    type: "post",
                    data: "{'terms':'" + Termseditor.getValue() + "'}",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if (data.d == false) {
                            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                        }
                        else if (data.d == true) {
                            notify('success', 'تم الحفظ بنجاح.');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                    }
                });
            });

            $('#savePrivacy').click(function () {
                $.ajax({
                    url: "../Services/Services.asmx/SavePrivacy",
                    dataType: "json",
                    type: "post",
                    data: "{'privacy':'" + Privacyeditor.getValue() + "'}",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if (data.d == false) {
                            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                        }
                        else if (data.d == true) {
                            notify('success', 'تم الحفظ بنجاح.');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                    }
                });
            });

            $('#saveFaq').click(function () {
                $.ajax({
                    url: "../Services/Services.asmx/SaveFaq",
                    dataType: "json",
                    type: "post",
                    data: "{'Faq':'" + Faqeditor.getValue() + "'}",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if (data.d == false) {
                            notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                        }
                        else if (data.d == true) {
                            notify('success', 'تم الحفظ بنجاح.');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        notify('error', 'حدث خطأ . من فضلك أعد المحاولة.');
                    }
                });
            });
        });
        

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="blockBoxshadow ">
        <h3>
            الإعدادت العامة للموقع
        </h3>
        <hr style="width:90%" />
        <div class="clear" style="height:10px;"></div>
        
        <h5>
            شبكات التواصل الإجتماعى 
        </h5>
        
        <div class="form-horizontal col-lg-12">
            <div class="form-group col-lg-6 pull-right">
                <div class="control-label">
                    <i class="icon-facebook-sign icon-2x"></i> &nbsp; رابط فيس بوك 
                </div>
                <div class="controls">
                    <asp:TextBox ID="uiTextBoxFbURL" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

            </div>

            <div class="form-group col-lg-6 pull-left">
                <div class="control-label">
                    <i class="icon-twitter-sign icon-2x"></i> &nbsp; رابط تويتر 
                </div>
                <div class="controls">
                    <asp:TextBox ID="uiTextBoxTwitterURL" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

            </div>

            <div class="form-group col-lg-6 pull-right">
                <div class="control-label">
                    <i class="icon-google-plus-sign icon-2x"></i> &nbsp; رابط جوجل+ 
                </div>
                <div class="controls">
                    <asp:TextBox ID="uiTextBoxGURL" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

            </div>

            <div class="form-group col-lg-6 pull-left">
                <div class="control-label">
                    <i class="icon-youtube-sign icon-2x"></i> &nbsp; رابط يوتيوب 
                </div>
                <div class="controls">
                    <asp:TextBox ID="uiTextBoxYtURL" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

            </div>

            <div class="form-group col-lg-2 pull-right">
                <a class="btn btn-small btn-main" id="saveSocials">حفظ</a>
                </div>

        </div>
        
         <div class="clear" style="height:10px;"></div>
        <hr style="width:90%" />
        <h5>
            بيان الخصوصية
        </h5>

        
        
        <div class="col-lg-12">
            <div id="toolbar1">
                <div class="btn-group" data-toggle="buttons">

                    <button class="btn btn-default" data-wysihtml5-command='bold' title='CTRL+B'><span class="icon-bold"></span></button>
                    <button class="btn btn-default" data-wysihtml5-command='italic' title='CTRL+I'><span class="icon-italic"></span></button>
                    <button class="btn btn-default" data-wysihtml5-command='underline' title='CTRL+U'><span class="icon-underline"></span></button>

                </div>
                </div>
            <div class="clear" style="height:10px;"></div>
            <textarea id="txtPrivacy" class="form-control" style="height: 300px; padding: 0 !important;"></textarea>

        </div>

        <div class="form-group col-lg-2 pull-right">
                <a class="btn btn-small btn-main" id="savePrivacy">حفظ</a>
                </div>
        <div class="clear" style="height:10px;"></div>
         <hr style="width:90%" />
        <h5>
            الشروط والأحكام
        </h5>

       
        <div class="col-lg-12">
            <div id="toolbar2">
                <div class="btn-group" data-toggle="buttons">

                    <button class="btn btn-default" data-wysihtml5-command='bold' title='CTRL+B'><span class="icon-bold"></span></button>
                    <button class="btn btn-default" data-wysihtml5-command='italic' title='CTRL+I'><span class="icon-italic"></span></button>
                    <button class="btn btn-default" data-wysihtml5-command='underline' title='CTRL+U'><span class="icon-underline"></span></button>

                </div>
                </div>
            <div class="clear" style="height:10px;"></div>
            <textarea id="txtTerms" class="form-control" style="height: 300px; padding: 0 !important;"></textarea>

        </div>
        <div class="form-group col-lg-2 pull-right">
                <a class="btn btn-small btn-main" id="saveTerms">حفظ</a>
                </div>
        
            
        <div class="clear"></div>

         <div class="clear" style="height:10px;"></div>
        <hr style="width:90%" />
        <h5>
            أسئلة شائعة
        </h5>

        
        
        <div class="col-lg-12">
            <div id="toolbar3">
                <div class="btn-group" data-toggle="buttons">

                    <button class="btn btn-default" data-wysihtml5-command='bold' title='CTRL+B'><span class="icon-bold"></span></button>
                    <button class="btn btn-default" data-wysihtml5-command='italic' title='CTRL+I'><span class="icon-italic"></span></button>
                    <button class="btn btn-default" data-wysihtml5-command='underline' title='CTRL+U'><span class="icon-underline"></span></button>

                </div>
                </div>
            <div class="clear" style="height:10px;"></div>
            <textarea id="txtFaq" class="form-control" style="height: 300px; padding: 0 !important;"></textarea>

        </div>

        <div class="form-group col-lg-2 pull-right">
                <a class="btn btn-small btn-main" id="saveFaq">حفظ</a>
                </div>
        <div class="clear" style="height:10px;"></div>
    </div>
</asp:Content>
