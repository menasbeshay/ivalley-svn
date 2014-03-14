<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test_page.aspx.cs" Inherits="I_Stock.test_page" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="assets/bootstrap-rtl/css/bootstrap-rtl.min.css" rel="stylesheet" />
    <link href="assets/bootstrap-rtl/css/bootstrap-responsive-rtl.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_responsive.css" rel="stylesheet" />
    <link href="css/style_default.css" rel="stylesheet" id="style_color" />
    <link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css" />
    <link href="css/jquery-ui-1.10.3.custom.min.css" rel="stylesheet"
        type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" 
            ></asp:TextBox>
        <br />
        <br />
        <br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="Admin\Reports\Report_GetItemsBalances.rdlc">
            </LocalReport>
        </rsweb:ReportViewer>
    </div>
    <!-- Load javascripts at bottom, this will reduce page load time -->
    <%--<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>--%>
    <script src="js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/bootstrap-rtl/js/bootstrap.min.js"></script>    
    <script type="text/javascript" >
        $(document).ready(function () {
            
            $("#TextBox1").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "modules/stockservice.asmx/GetItems",
                        dataType: "json",
                        type: "Post",
                        data: "{ 'query' : '" + request.term.toString() + "' }",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    val: item.split('-')[0],
                                    label: item.split('-')[1]
                                }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest);
                        }
                    });

                },
                select: function (e, i) {
                    $("#<%=hfCustomerId.ClientID %>").val(i.item.val);
                },
                minLength: 1
            });

        });
    </script>
    </form>
</body>
</html>
