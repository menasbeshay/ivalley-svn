<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARMaster.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="GlobalLogistics.WebSite.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/imtech_pager.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    

    <div id="Intcontent">
        <div>
            <table>
                <tbody>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="151">
                            Country
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="106">
                            Dialing Code
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="152">
                            Country
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="106">
                            Dialing Code
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Albania
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            355
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Algeria
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            213
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Andorra
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            376
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Angola
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            244
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Antigua
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            268
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Argentina
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            54
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Armenia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            374
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Australia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            61
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Azerbaijan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            994
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Bahamas
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            242
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Bahrain
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            973
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Bangladesh
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            880
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Barbados
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            246
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Belarus
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            375
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Belgium
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            32
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Belize
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            100
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Belize
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            501
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Benin
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            229
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Bhutan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            975
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Bolivia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            591
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Bosnia and Herzegovina
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            387
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Botswana
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            267
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Brazil
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            55
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Brunei
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            673
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Bulgaria
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            359
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Burkina Faso
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            226
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Burundi
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            257
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Cambodia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            855
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Cameroon
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            237
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Canada
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            1
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Cape Verde
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            238
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Central African Republic
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            236
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Chad
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            235
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Chile
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            56
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            China
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            86
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Colombia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            57
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Comoros
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            269
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Congo
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            242
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Costa Rica
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            506
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="152">
                            Croatia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="106">
                            385
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <table>
                <tbody>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="136">
                            <strong>Country</strong>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="137">
                            <span class="int_code"><strong>Dialing Code</strong></span>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="137">
                            <span class="int_country"><strong>Country</strong></span>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="137">
                            <span class="int_code"><strong>Dialing Code</strong></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Cuba
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            53
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Cyprus
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            357
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Czech Republic
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            420
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Denmark
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            45
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Djibouti
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            253
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Dominica
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            767
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Dominican Republic
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            809
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Ecuador
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            593
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Egypt
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            20
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            El Salvador
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            503
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Equatorial Guinea
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            240
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Eritrea
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            291
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Estonia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            372
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Ethiopia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            251
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Fiji
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            679
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Finland
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            358
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            France
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            33
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Gabon
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            241
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Georgia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            995
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Germany
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            49
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Ghana
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            233
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Greece
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            30
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Grenada
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            473
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Guatemala
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            502
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Guinea
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            224
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Guinea-Bissau
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            245
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Guyana
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            592
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Haiti
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            509
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Honduras
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            503
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Hungary
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            36
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Iceland
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            354
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            India
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            91
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Indonesia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            62
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Iran
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            98
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Iraq
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            964
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Ireland
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            353
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Italy
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            39
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Jamaica
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            876
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Japan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            81
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Jordan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            962
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <table>
                <tbody>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="136">
                            <strong><span class="int_code">Country</span></strong>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="137">
                            <strong><span class="int_code">Dialing Code</span></strong>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="137">
                            <span class="int_country"><strong>Country</strong></span>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="137">
                            <span class="int_code"><strong>Dialing Code</strong></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Kazakhstan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            7
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Kenya
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            254
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Kiribati
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            686
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Kuwait
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            965
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Kyrgyzstan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            996
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Laos
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            856
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Latvia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            371
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Lebanon
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            961
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Lesotho
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            266
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Liberia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            231
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Libya
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            218
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Liechtenstein
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            423
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Lithuania
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            370
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Luxembourg
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            352
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Macedonia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            389
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Madagascar
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            261
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Malawi
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            265
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Malaysia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            60
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Maldives
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            960
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Mali
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            223
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Malta
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            356
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Marshall Islands
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            692
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Mauritius
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            230
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Mexico
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            52
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Micronesia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            691
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Moldova
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            373
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Monaco
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            377
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Mongolia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            976
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Morocco
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            212
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Mozambique
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            258
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Myanmar Burma
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            95
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Namibia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            264
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Nauru
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            674
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Nepal
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            977
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Netherlands
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            31
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            New Zealand
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            64
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Nicaragua
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            505
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Niger
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            227
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="136">
                            Nigeria
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            234
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            Norway
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="137">
                            47
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <table>
                <tbody>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="143">
                            <strong>Country</strong>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="107">
                            <span class="int_code"><strong>Dialing Code</strong></span>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="151">
                            <span class="int_country"><strong>Country</strong></span>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="113">
                            <span class="int_code"><strong>Dialing Code</strong></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Oman
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            968
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Pakistan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            92
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Palau
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            680
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Panama
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            507
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Papua New Guinea
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            675
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Paraguay
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            595
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Peru
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            51
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Philippines
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            63
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Poland
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            48
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Portugal
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            351
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Qatar
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            974
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Romania
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            40
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Russia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            7
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Rwanda
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            250
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Saint Kitts and Nevis
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            869
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Saint Lucia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            758
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            San Marino
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            378
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Sao Tome and Principe
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            239
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Saudi Arabia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            966
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Senegal
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            221
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Serbia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            381
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Seychelles
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            248
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Sierra Leone
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            232
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Singapore
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            65
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Slovakia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            421
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Slovenia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            386
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Solomon Islands
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            677
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Somalia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            252
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            South Africa
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            27
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Spain
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            34
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Sri Lanka
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            94
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Sudan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            249
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Suriname
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            597
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Swaziland
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            268
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Sweden
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            46
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Switzerland
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            41
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Syria
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            963
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Taiwan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            886
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" class="contentlist_border" width="143">
                            Tajikistan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="107">
                            992
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="151">
                            Tanzania
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="113">
                            255
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <table>
                <tbody>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border gradient-bg"
                            width="143">
                            <strong>Country</strong>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="114">
                            <span class="int_code"><strong>Dialing Code</strong></span>
                        </td>
                        <td align="left" valign="top" class="contentlist_border gradient-bg"
                            width="139">
                            <span class="int_country"><strong>Country</strong></span>
                        </td>
                        <td align="center" valign="top" class="contentlist_border gradient-bg"
                            width="140">
                            <span class="int_code"><strong>Dialing Code</strong></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border" width="143">
                            Thailand
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="114">
                            66
                        </td>
                        <td align="left" valign="top" class="contentlist_border" width="139">
                            Togo
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="140">
                            228
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border" width="143">
                            Tonga
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="114">
                            676
                        </td>
                        <td align="left" valign="top" class="contentlist_border" width="139">
                            Trinidad and Tobago
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="140">
                            868
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border" width="143">
                            Tunisia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="114">
                            216
                        </td>
                        <td align="left" valign="top" class="contentlist_border" width="139">
                            Turkey
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="140">
                            90
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border" width="143">
                            Turkmenistan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="114">
                            993
                        </td>
                        <td align="left" valign="top" class="contentlist_border" width="139">
                            Tuvalu
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="140">
                            688
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border" width="143" height="26">
                            Uganda
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="114" height="26">
                            256
                        </td>
                        <td align="left" valign="top" class="contentlist_border" width="139" height="26">
                            Ukraine
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="140" height="26">
                            380
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border" width="143">
                            United Arab Emirates
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="114">
                            971
                        </td>
                        <td align="left" valign="top" class="contentlist_border" width="139">
                            United Kingdom
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="140">
                            44
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border" width="143">
                            United States
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="114">
                            1
                        </td>
                        <td align="left" valign="top" class="contentlist_border" width="139">
                            Uruguay
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="140">
                            598
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border" width="143">
                            Uzbekistan
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="114">
                            998
                        </td>
                        <td align="left" valign="top" class="contentlist_border" width="139">
                            Vanuatu
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="140">
                            678
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border" width="143">
                            Venezuela
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="114">
                            58
                        </td>
                        <td align="left" valign="top" class="contentlist_border" width="139">
                            Vietnam
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="140">
                            84
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" class="contentlist_border" width="143">
                            Zambia
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="114">
                            260
                        </td>
                        <td align="left" valign="top" class="contentlist_border" width="139">
                            Zimbabwe
                        </td>
                        <td align="center" valign="top" class="contentlist_border" width="140">
                            263
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div id="pagingControls">
    </div>
    <script type="text/javascript">
        var pager = new Imtech.Pager();
        $(document).ready(function () {
            pager.paragraphsPerPage = 1; // set amount elements per page
            pager.pagingContainer = $('#Intcontent'); // set of main container
            pager.paragraphs = $('div', pager.pagingContainer); // set of required containers
            pager.showPage(1);
        });
    </script>
</asp:Content>
