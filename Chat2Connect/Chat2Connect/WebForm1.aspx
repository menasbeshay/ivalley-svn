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
</body>
</html>
