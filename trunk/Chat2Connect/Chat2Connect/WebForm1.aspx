<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Chat2Connect.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <%--<script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-typeahead.js"></script>
    <script src="js/bootstrap-tagsinput.min.js"></script>
    <%--<script src="js/typeahead.bundle.js"></script>
    <script src="js/tags/textext.core.js"></script>
    <script src="js/tags/textext.plugin.ajax.js"></script>
    <script src="js/tags/textext.plugin.arrow.js"></script>
    <script src="js/tags/textext.plugin.autocomplete.js"></script>
    <script src="js/tags/textext.plugin.clear.js"></script>
    <script src="js/tags/textext.plugin.filter.js"></script>
    <script src="js/tags/textext.plugin.focus.js"></script>
    <script src="js/tags/textext.plugin.prompt.js"></script>
    <script src="js/tags/textext.plugin.suggestions.js"></script>
    <script src="js/tags/textext.plugin.tags.js"></script>

    <link href="css/Tags/textext.core.css" rel="stylesheet" />
    <link href="css/Tags/textext.plugin.arrow.css" rel="stylesheet" />
    <link href="css/Tags/textext.plugin.autocomplete.css" rel="stylesheet" />
    <link href="css/Tags/textext.plugin.clear.css" rel="stylesheet" />
    <link href="css/Tags/textext.plugin.focus.css" rel="stylesheet" />
    <link href="css/Tags/textext.plugin.prompt.css" rel="stylesheet" />
    <link href="css/Tags/textext.plugin.tags.css" rel="stylesheet" />--%>
    <script src="js/tags/tag-it.js"></script>
    <link href="css/Tags/jquery.tagit.css" rel="stylesheet" />
    <link href="css/Tags/tagit.ui-zendesk.css" rel="stylesheet" />



    <script type="text/javascript">
        $(function () {

            new AjaxUpload('#UploadButton', {
                action: 'UploadHandler.ashx',
                onComplete: function (file, response) {
                    $("<div><img src='resources/btndelete.png' onclick=\"DeleteFile('" + response + "')\"  class='delete'/>" + response + "</div>").appendTo('#UploadedFile');
                    $('#UploadStatus').html("file has been uploaded sucessfully");
                    $("#UploadButton").hide();
                },
                onSubmit: function (file, ext) {
                    if (!(ext && /^(png|gif|jpg)$/i.test(ext))) {
                        alert('Invalid File Format.');
                        return false;
                    }
                    $('#UploadStatus').html("Uploading...");
                }
            });

        });


        function DeleteFile(file) {
            $('#UploadStatus').html("deleting...");
            $.ajax({
                url: "UploadHandler.ashx?file=" + file,
                type: "GET",
                cache: false,
                async: true,
                success: function (html) {
                    $('#UploadedFile').html("");
                    $('#UploadStatus').html("file has been deleted");
                    $("#UploadButton").show();

                }
            });

        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" ClientIDMode="Static"></asp:TextBox>

        <script type="text/javascript">
            $(document).ready(function () {

                $('#TextBox1').tagit({
                    autocomplete: {
                        source: function (request, response) {
                            $.ajax({
                                url: "../Services/Services.asmx/SearchMembersExceptFriends",
                                dataType: "json",
                                type: "post",
                                data: "{'query':'" + request.term.toString() + "','MemberID' : '5'}",
                                contentType: "application/json; charset=utf-8",
                                success: function (data) {
                                    response(jQuery.map(data.d, function (item) {
                                        return {
                                            val: item.split('##')[0],
                                            label: item.split('##')[1]
                                        }
                                    }))
                                },
                                error: function (XMLHttpRequest, textStatus, errorThrown) {
                                    alert(errorThrown);
                                }
                            });

                        }
                    },
                    // This will make Tag-it submit a single form value, as a comma-delimited field.
                    singleField: false,

                });
                /*
                $('#TextBox1').textext({
                     plugins: 'autocomplete filter tags ajax',
                     ajax: {
                         url: 'Services/Services.asmx/SearchMembersExceptFriendsMsg',
                         dataType:'json',
                         cacheResults: false,
                         dataCallback: function (query) {
                             return {
                                 'query': query,
                                 'MemberID': 5
                             };
                         }
                     }
                });*/
            });

        </script>
    </div>
    </form>


    


    <table role="presentation" class="mceColorSplitMenu">
        <tbody>
            <tr>
                <td><a role="option" href="javascript:;" title="Black" data-mce-color="#000000" id="_mce_item_31" tabindex="0" style="background-color: rgb(0, 0, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Burnt orange" data-mce-color="#993300" id="_mce_item_32" tabindex="-1" style="background-color: rgb(153, 51, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Dark olive" data-mce-color="#333300" id="_mce_item_33" tabindex="-1" style="background-color: rgb(51, 51, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Dark green" data-mce-color="#003300" id="_mce_item_34" tabindex="-1" style="background-color: rgb(0, 51, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Dark azure" data-mce-color="#003366" id="_mce_item_35" tabindex="-1" style="background-color: rgb(0, 51, 102);"></a></td>
                <td><a role="option" href="javascript:;" title="Navy Blue" data-mce-color="#000080" id="_mce_item_36" tabindex="-1" style="background-color: rgb(0, 0, 128);"></a></td>
                <td><a role="option" href="javascript:;" title="Indigo" data-mce-color="#333399" id="_mce_item_37" tabindex="-1" style="background-color: rgb(51, 51, 153);"></a></td>
                <td><a role="option" href="javascript:;" title="Very dark gray" data-mce-color="#333333" id="_mce_item_38" tabindex="-1" style="background-color: rgb(51, 51, 51);"></a></td>
            </tr>
            <tr>
                <td><a role="option" href="javascript:;" title="Maroon" data-mce-color="#800000" id="_mce_item_39" tabindex="-1" style="background-color: rgb(128, 0, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Orange" data-mce-color="#FF6600" id="_mce_item_40" tabindex="-1" style="background-color: rgb(255, 102, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Olive" data-mce-color="#808000" id="_mce_item_41" tabindex="-1" style="background-color: rgb(128, 128, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Green" data-mce-color="#008000" id="_mce_item_42" tabindex="-1" style="background-color: rgb(0, 128, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Teal" data-mce-color="#008080" id="_mce_item_43" tabindex="-1" style="background-color: rgb(0, 128, 128);"></a></td>
                <td><a role="option" href="javascript:;" title="Blue" data-mce-color="#0000FF" id="_mce_item_44" tabindex="-1" style="background-color: rgb(0, 0, 255);"></a></td>
                <td><a role="option" href="javascript:;" title="Grayish blue" data-mce-color="#666699" id="_mce_item_45" tabindex="-1" style="background-color: rgb(102, 102, 153);"></a></td>
                <td><a role="option" href="javascript:;" title="Gray" data-mce-color="#808080" id="_mce_item_46" tabindex="-1" style="background-color: rgb(128, 128, 128);"></a></td>
            </tr>
            <tr>
                <td><a role="option" href="javascript:;" title="Red" data-mce-color="#FF0000" id="_mce_item_47" tabindex="-1" style="background-color: rgb(255, 0, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Amber" data-mce-color="#FF9900" id="_mce_item_48" tabindex="-1" style="background-color: rgb(255, 153, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Yellow green" data-mce-color="#99CC00" id="_mce_item_49" tabindex="-1" style="background-color: rgb(153, 204, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Sea green" data-mce-color="#339966" id="_mce_item_50" tabindex="-1" style="background-color: rgb(51, 153, 102);"></a></td>
                <td><a role="option" href="javascript:;" title="Turquoise" data-mce-color="#33CCCC" id="_mce_item_51" tabindex="-1" style="background-color: rgb(51, 204, 204);"></a></td>
                <td><a role="option" href="javascript:;" title="Royal blue" data-mce-color="#3366FF" id="_mce_item_52" tabindex="-1" style="background-color: rgb(51, 102, 255);"></a></td>
                <td><a role="option" href="javascript:;" title="Purple" data-mce-color="#800080" id="_mce_item_53" tabindex="-1" style="background-color: rgb(128, 0, 128);"></a></td>
                <td><a role="option" href="javascript:;" title="Medium gray" data-mce-color="#999999" id="_mce_item_54" tabindex="-1" style="background-color: rgb(153, 153, 153);"></a></td>
            </tr>
            <tr>
                <td><a role="option" href="javascript:;" title="Magenta" data-mce-color="#FF00FF" id="_mce_item_55" tabindex="-1" style="background-color: rgb(255, 0, 255);"></a></td>
                <td><a role="option" href="javascript:;" title="Gold" data-mce-color="#FFCC00" id="_mce_item_56" tabindex="-1" style="background-color: rgb(255, 204, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Yellow" data-mce-color="#FFFF00" id="_mce_item_57" tabindex="-1" style="background-color: rgb(255, 255, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Lime" data-mce-color="#00FF00" id="_mce_item_58" tabindex="-1" style="background-color: rgb(0, 255, 0);"></a></td>
                <td><a role="option" href="javascript:;" title="Aqua" data-mce-color="#00FFFF" id="_mce_item_59" tabindex="-1" style="background-color: rgb(0, 255, 255);"></a></td>
                <td><a role="option" href="javascript:;" title="Sky blue" data-mce-color="#00CCFF" id="_mce_item_60" tabindex="-1" style="background-color: rgb(0, 204, 255);"></a></td>
                <td><a role="option" href="javascript:;" title="Brown" data-mce-color="#993366" id="_mce_item_61" tabindex="-1" style="background-color: rgb(153, 51, 102);"></a></td>
                <td><a role="option" href="javascript:;" title="Silver" data-mce-color="#C0C0C0" id="_mce_item_62" tabindex="-1" style="background-color: rgb(192, 192, 192);"></a></td>
            </tr>
            <tr>
                <td><a role="option" href="javascript:;" title="Pink" data-mce-color="#FF99CC" id="_mce_item_63" tabindex="-1" style="background-color: rgb(255, 153, 204);"></a></td>
                <td><a role="option" href="javascript:;" title="Peach" data-mce-color="#FFCC99" id="_mce_item_64" tabindex="-1" style="background-color: rgb(255, 204, 153);"></a></td>
                <td><a role="option" href="javascript:;" title="Light yellow" data-mce-color="#FFFF99" id="_mce_item_65" tabindex="-1" style="background-color: rgb(255, 255, 153);"></a></td>
                <td><a role="option" href="javascript:;" title="Pale green" data-mce-color="#CCFFCC" id="_mce_item_66" tabindex="-1" style="background-color: rgb(204, 255, 204);"></a></td>
                <td><a role="option" href="javascript:;" title="Pale cyan" data-mce-color="#CCFFFF" id="_mce_item_67" tabindex="-1" style="background-color: rgb(204, 255, 255);"></a></td>
                <td><a role="option" href="javascript:;" title="Light sky blue" data-mce-color="#99CCFF" id="_mce_item_68" tabindex="-1" style="background-color: rgb(153, 204, 255);"></a></td>
                <td><a role="option" href="javascript:;" title="Plum" data-mce-color="#CC99FF" id="_mce_item_69" tabindex="-1" style="background-color: rgb(204, 153, 255);"></a></td>
                <td><a role="option" href="javascript:;" title="White" data-mce-color="#FFFFFF" id="_mce_item_70" tabindex="-1" style="background-color: rgb(255, 255, 255);"></a></td>
            </tr>
            <tr>
                <td colspan="8" class="mceMoreColors"><a role="option" id="content_forecolor_more" href="javascript:;" onclick="return false;" class="mceMoreColors" tabindex="-1">More colors</a></td>
            </tr>
        </tbody>
    </table>
</body>
</html>
