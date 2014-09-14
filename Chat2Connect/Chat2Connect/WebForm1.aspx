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
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
        <asp:TextBox ID="TextBox1" runat="server" ClientIDMode="Static"></asp:TextBox>

        <%--<script type="text/javascript">
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

        </script>--%>
    </div>
        <div style="direction:rtl">
        <p class="auto-style1">
            <strong>س / هل استطيع التسجيل بأكثر من حساب على بريد الكتروني واحد ؟
            <br class="auto-style1" />
            </strong>نعم تستطيع التسجيل بثلاث حسابات على بريد الكتروني واحد.
        </p>
        <p class="auto-style1">
            <strong>س / هل مسموح التسجيل بحساب عربي وانجليزي ؟
            <br class="auto-style1" />
            </strong>لا يسمح بذلك لانه يعتبر حساب مميز.
        </p>
            <p class="auto-style1">
                <strong>س / كيف احصل على حساب مميز ؟
                <br class="auto-style1" />
                </strong>الحساب المميز يعتبر حرف او حرفين او رقم او رقمين او حرف ورقم عربي وانجليزي مثلا ( ح) او (Aأ) وتحصل عليه عن طريق الرصيد في حسابك.
        </p>
            <p class="auto-style1">
                <strong>س / مافائدة سؤال الامان وجوابه عند التسجيل ؟
                <br class="auto-style1" />
                </strong>وضع سؤال الامان وجواب الامان اذا رغبت في تعديل الرقم السري (الباسورد) لحسابك او تغير بريدك الالكتروني المسجل عليه الحساب
 او اردت تنفيذ اي عمليه ننقاط وهذا يعتبر الامان الكامل لحسابك من المتطفلين ولايتغير سؤال الامان وجوابه .
        </p>
            <p class="auto-style1">
                <strong>س / ماتنصحني به عند تسجيلي في الموقع ؟
</strong>
            </p>
            <ul>
                <li class="auto-style1">اولا ننصحك بحفظ سؤال الامان وجوابه بعيدا عن اصدقائك وعدم البوح به لاي شخص حتى موظفين المساعدة (Help) .
</li>
                <li class="auto-style1">الذهاب الى كلمة حسابي في اعلا الصفحة على اليمين في الشريط الاسود (البروفايل) وتعبئة معلوماتك ورفع صورة والدخول لاعدادات الحساب حتى يكتمل .
</li>
                <li class="auto-style1">انشئ غرفتك باسم واضح اذا رغبت ( واختار القسم الذي يناسبك). </li>
            </ul>
            <p class="auto-style1">
                <strong>س / كم العدد المسموح في غرفتي وهل استطيع رفع العدد في الغرفة ؟
                <br class="auto-style1" />
                </strong>العدد المسموح لغرفتك 500 زائر واذا رغبت ترقية غرفتك الى عدد اكثر2000 زائر يجب عليك الذهاب الى رصيدك وترقية الغرفة
 وتختار لون الترقيه (لون الصبغة ) ارجواني فاتح وهذا يناسب اذا مالكة الغرفة انثى او ارجواني غامق وهذا يناسب الشباب.
        </p>
            <p class="auto-style1">
                <strong>س / هل يوجد تميز للغرف ؟</strong>
                <br class="auto-style1" />
نعم الطريقة الاولى ترقية غرفتك من 500 زائر الى 2000 زائر وهذا يتطلب شراء بوت ترقية 
الطريقة الثانية تميز اسم غرفتك حرف او حرفين او ثلاثة حروف وكذلك الارقام عربي او انجليزي وهذا يتطلب شراء اسم مميز
 وراجع موظفين المساعدة في قائمة الاصدقاء  وهذا يجعل غرفتك في اعلى القائمه في الغرف.
        </p>
            <p class="auto-style1">
                <strong>س / مافائدة قسم رسائلي  ؟</strong>
                <br class="auto-style1" />
هو صندوق بريد داخل الموقع ترسل وتستقبل رسائل اصدقائك في اي وقت .
        </p>
            <p class="auto-style1">
                <strong>س / مامعنى غرفة مؤقته ؟
                <br class="auto-style1" />
                </strong>هذه الغرفة تستوعب حد اقصى عشرة اصدقاء في وقت واحد في غرفة مؤقتة ولايوجد فيها مالك او مدير او مراقب ولاتظهر في قوائم
 الغرف وتكون مخفية عن الجميع ولايدخلها اي شخص الا بدعوة من احد المتواجدين في الغرفة المؤقتة وعند خروج اخر زائر من الغرفة تختفي تماما.
        </p>
            <p class="auto-style1">
                <strong>س /كيف انشي غرفة مؤقته  ؟</strong>
                <br class="auto-style1" />
اذهب الى الاجراءات واضغط على كلمة انشاء غرفة موقته وسوف يظهر لك في نفس الصفحة اصدقائك المضافين
 في قائمة الاصدقاء اختر من ترغب دعوته للغرفة المؤقتة وسوف تصله رسالة منك تدعوة للغرفة.
        </p>
            <p class="auto-style1">
                <strong>س / هل يوجد في غرفتي التي انشئتها اعدادات تحكم ؟
                <br class="auto-style1" />
                </strong>نعم تستطيع تعين مدراء او مراقبين من اصدقائك حيث المدير لديه جميع صلاحيات المالك ماعدا تقفيل الغرفة نهائيا ويجب عليك
 التدقيق في تعيين مدراء لغرفتك ويوجد طرد24ساعة وطرد اسبوع وطرد شهر وطرد نهائي ولمالك الغرفة الصلاحية الكاملة في ادارة غرفته.
        </p>
            <p class="auto-style1">
                <strong>س /انشات غرفة وعند دخولي للغرفه وجدت غرفة الادارة ماذا تعني ؟
                <br class="auto-style1" />
                </strong>غرفة الادارة تظهر فقط للمالك والمدير والمراقب ولاتظهر للزوار حتى تستطيع الادارة النقاش في خصوصية بعيدا عن باقي الزوار.
        </p>
            <p class="auto-style1">
                <strong>س /ما فائدة الـ (cam) في الغرفة ؟
                <br class="auto-style1" />
                </strong>اذا اراد شخص فتح كامة او اراد عرض مقطع فيديو على الجميع.
        </p>
            <p class="auto-style1">
                <strong>س / هل الـ (mic) للجميع ؟
                <br class="auto-style1" />
                </strong>حسب نظام مالك الغرفة يسمح او يرفض وهذا شي اختياري للمالك او لادارتة.
        </p>
            <p class="auto-style1">
                <strong>س /مامعنى تحميل ملفات الموجوده في الغرف ؟
</strong>ت<br class="auto-style1" />
                حميل ملفات يتجزاء الى ثلاثة : 
        </p>
            <ol>
                <li class="auto-style1">مقطع فيديو من اليوتيوب وهو ان تنسخ عنوان المقطع من اليوتيوب وتلصقة في المستطيل وترسله للغرفه وسوف يظهر الفيديو للجميع .</li>
                <li class="auto-style1">تحميل صورة من جهازك وارسالها في الغرفة وسوف تظهر للجميع.
</li>
                <li class="auto-style1">تسجيل رسالة صوتية مدتها دقيقة وارسالها للغرفة وسوف تظهر للجميع في الغرفة. </li>
            </ol>
            <p class="auto-style1">
                <strong>س /هل استطيع تغير حالتي ؟</strong>
                <br class="auto-style1" />
نعم عند الضغط على صورتك التي بجانب اسمك في الموقع تستطيع تغير حالتك.
        </p>
            <p class="auto-style1">
                <strong>س /يوجد مستطيل تحت اسمي مافائدتة؟</strong>
                <br class="auto-style1" />
هذا يسمى حائط حسابك يستوعب 70 حرف تكتب حالتك كماتريد.
        </p>
            <p class="auto-style1">
                <strong>س / مامعنى علامة الاستفهام ( المساعدة ) ؟</strong>
ا</p>
            <p class="auto-style1">
                ذا كان لديك استفسار او اقتراح او شكوى او مشكلة في احد الاقسام او في جزء من حسابك تستطيع ان ترسل رسالتك حسب نوع الرسالة 
ويجب عليك في هذي الحالة تحديد  نوع الرساله واختصار لموضوعك وسوف يتم الرد عليك خلال24 ساعة.
        </p>
            <p class="auto-style1">
                <strong>س /مامعنى علامة مفتاح ؟</strong>
                <br class="auto-style1" />
يعني خروجك من الموقع.
        </p>
            <p class="auto-style1">
                <strong>س /كيف ابحث عن اصدقائي واضيفهم لقائمتي ؟
                <br class="auto-style1" />
                </strong>يوجد في قائمة اصدقائك علامه شخص وبجانبة علامة + اضغط عليها وابحث عنه بالبريد الالكتروني لصديقك او باسمه في الموقع.
        </p>
            <p class="auto-style1">
                <strong>س / هل استطيع تعديل اسمي؟</strong>
                <br class="auto-style1" />
لا تستطيع.
        </p>
            <p class="auto-style1">
                <strong>س / كيف انشئ قائمة جديدة في قائمة الاصدقاء ؟
                <br class="auto-style1" />
                </strong>اذهب الى اجراءات واختار انشاء مجموعة في قائم الاصدقاء وسوف تظهر لك في قائمة الاصدقاء.
        </p>
            <p class="auto-style1">
                <strong>س / مامعنى دعوة اصدقاء في الغرفة ؟</strong>
                <br class="auto-style1" />
تستطيع ارسال دعوة الى اصدقائك المتواجدين في القائمة لدخول الغرفة التي انت متواجد فيها.
        </p>
            </div>
    </form>


    


<%--    <table role="presentation" class="mceColorSplitMenu">
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


    <table class="jfk-palette-table" cellspacing="0" cellpadding="0" style="-webkit-user-select: none;">
        <tbody class="jfk-palette-body" style="-webkit-user-select: none;">
            <tr class="jfk-palette-row" role="row" style="-webkit-user-select: none;">
                <td class="jfk-palette-cell" id="jfk-palette-cell-20" role="gridcell" aria-selected="false" aria-label="light red berry 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light red berry 3" style="background-color: rgb(230, 184, 175); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-21" role="gridcell" aria-selected="false" aria-label="light red 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light red 3" style="background-color: rgb(244, 204, 204); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-22" role="gridcell" aria-selected="false" aria-label="light orange 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light orange 3" style="background-color: rgb(252, 229, 205); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-23" role="gridcell" aria-selected="false" aria-label="light yellow 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light yellow 3" style="background-color: rgb(255, 242, 204); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-24" role="gridcell" aria-selected="false" aria-label="light green 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light green 3" style="background-color: rgb(217, 234, 211); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-25" role="gridcell" aria-selected="false" aria-label="light cyan 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light cyan 3" style="background-color: rgb(208, 224, 227); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-26" role="gridcell" aria-selected="false" aria-label="light cornflower blue 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light cornflower blue 3" style="background-color: rgb(201, 218, 248); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-27" role="gridcell" aria-selected="false" aria-label="light blue 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light blue 3" style="background-color: rgb(207, 226, 243); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-28" role="gridcell" aria-selected="false" aria-label="light purple 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light purple 3" style="background-color: rgb(217, 210, 233); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-29" role="gridcell" aria-selected="false" aria-label="light magenta 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light magenta 3" style="background-color: rgb(234, 209, 220); -webkit-user-select: none;"></div>
                </td>
            </tr>
            <tr class="jfk-palette-row" role="row" style="-webkit-user-select: none;">
                <td class="jfk-palette-cell" id="jfk-palette-cell-30" role="gridcell" aria-selected="false" aria-label="light red berry 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light red berry 2" style="background-color: rgb(221, 126, 107); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-31" role="gridcell" aria-selected="false" aria-label="light red 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light red 2" style="background-color: rgb(234, 153, 153); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-32" role="gridcell" aria-selected="false" aria-label="light orange 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light orange 2" style="background-color: rgb(249, 203, 156); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-33" role="gridcell" aria-selected="false" aria-label="light yellow 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light yellow 1" style="background-color: rgb(255, 229, 153); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-34" role="gridcell" aria-selected="false" aria-label="light green 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light green 2" style="background-color: rgb(182, 215, 168); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-35" role="gridcell" aria-selected="false" aria-label="light cyan 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light cyan 2" style="background-color: rgb(162, 196, 201); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-36" role="gridcell" aria-selected="false" aria-label="light cornflower blue 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light cornflower blue 2" style="background-color: rgb(164, 194, 244); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-37" role="gridcell" aria-selected="false" aria-label="light blue 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light blue 2" style="background-color: rgb(159, 197, 232); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-38" role="gridcell" aria-selected="false" aria-label="light purple 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light purple 2" style="background-color: rgb(180, 167, 214); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-39" role="gridcell" aria-selected="false" aria-label="light magenta 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light magenta 2" style="background-color: rgb(213, 166, 189); -webkit-user-select: none;"></div>
                </td>
            </tr>
            <tr class="jfk-palette-row" role="row" style="-webkit-user-select: none;">
                <td class="jfk-palette-cell" id="jfk-palette-cell-40" role="gridcell" aria-selected="false" aria-label="light red berry 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light red berry 1" style="background-color: rgb(204, 65, 37); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-41" role="gridcell" aria-selected="false" aria-label="light red 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light red 1" style="background-color: rgb(224, 102, 102); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-42" role="gridcell" aria-selected="false" aria-label="light orange 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light orange 1" style="background-color: rgb(246, 178, 107); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-43" role="gridcell" aria-selected="false" aria-label="light yellow 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light yellow 2" style="background-color: rgb(255, 217, 102); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-44" role="gridcell" aria-selected="false" aria-label="light green 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light green 1" style="background-color: rgb(147, 196, 125); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-45" role="gridcell" aria-selected="false" aria-label="light cyan 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light cyan 1" style="background-color: rgb(118, 165, 175); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-46" role="gridcell" aria-selected="false" aria-label="light cornflower blue 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light cornflower blue 1" style="background-color: rgb(109, 158, 235); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-47" role="gridcell" aria-selected="false" aria-label="light blue 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light blue 1" style="background-color: rgb(111, 168, 220); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-48" role="gridcell" aria-selected="false" aria-label="light purple 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light purple 1" style="background-color: rgb(142, 124, 195); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-49" role="gridcell" aria-selected="false" aria-label="light magenta 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="light magenta 1" style="background-color: rgb(194, 123, 160); -webkit-user-select: none;"></div>
                </td>
            </tr>
            <tr class="jfk-palette-row" role="row" style="-webkit-user-select: none;">
                <td class="jfk-palette-cell" id="jfk-palette-cell-50" role="gridcell" aria-selected="false" aria-label="dark red berry 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark red berry 1" style="background-color: rgb(166, 28, 0); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-51" role="gridcell" aria-selected="false" aria-label="dark red 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark red 1" style="background-color: rgb(204, 0, 0); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-52" role="gridcell" aria-selected="false" aria-label="dark orange 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark orange 1" style="background-color: rgb(230, 145, 56); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-53" role="gridcell" aria-selected="false" aria-label="dark yellow 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark yellow 1" style="background-color: rgb(241, 194, 50); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-54" role="gridcell" aria-selected="false" aria-label="dark green 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark green 1" style="background-color: rgb(106, 168, 79); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-55" role="gridcell" aria-selected="false" aria-label="dark cyan 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark cyan 1" style="background-color: rgb(69, 129, 142); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-56" role="gridcell" aria-selected="false" aria-label="dark cornflower blue 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark cornflower blue 1" style="background-color: rgb(60, 120, 216); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-57" role="gridcell" aria-selected="false" aria-label="dark blue 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark blue 1" style="background-color: rgb(61, 133, 198); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-58" role="gridcell" aria-selected="false" aria-label="dark purple 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark purple 1" style="background-color: rgb(103, 78, 167); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-59" role="gridcell" aria-selected="false" aria-label="dark magenta 1" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark magenta 1" style="background-color: rgb(166, 77, 121); -webkit-user-select: none;"></div>
                </td>
            </tr>
            <tr class="jfk-palette-row" role="row" style="-webkit-user-select: none;">
                <td class="jfk-palette-cell" id="jfk-palette-cell-60" role="gridcell" aria-selected="false" aria-label="dark red berry 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark red berry 2" style="background-color: rgb(133, 32, 12); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-61" role="gridcell" aria-selected="false" aria-label="dark red 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark red 2" style="background-color: rgb(153, 0, 0); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-62" role="gridcell" aria-selected="false" aria-label="dark orange 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark orange 2" style="background-color: rgb(180, 95, 6); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-63" role="gridcell" aria-selected="false" aria-label="dark yellow 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark yellow 2" style="background-color: rgb(191, 144, 0); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-64" role="gridcell" aria-selected="false" aria-label="dark green 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark green 2" style="background-color: rgb(56, 118, 29); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-65" role="gridcell" aria-selected="false" aria-label="dark cyan 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark cyan 2" style="background-color: rgb(19, 79, 92); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-66" role="gridcell" aria-selected="false" aria-label="dark cornflower blue 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark cornflower blue 2" style="background-color: rgb(17, 85, 204); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-67" role="gridcell" aria-selected="false" aria-label="dark blue 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark blue 2" style="background-color: rgb(11, 83, 148); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-68" role="gridcell" aria-selected="false" aria-label="dark purple 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark purple 2" style="background-color: rgb(53, 28, 117); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-69" role="gridcell" aria-selected="false" aria-label="dark magenta 2" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark magenta 2" style="background-color: rgb(116, 27, 71); -webkit-user-select: none;"></div>
                </td>
            </tr>
            <tr class="jfk-palette-row" role="row" style="-webkit-user-select: none;">
                <td class="jfk-palette-cell" id="jfk-palette-cell-70" role="gridcell" aria-selected="false" aria-label="dark red berry 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark red berry 3" style="background-color: rgb(91, 15, 0); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-71" role="gridcell" aria-selected="false" aria-label="dark red 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark red 3" style="background-color: rgb(102, 0, 0); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-72" role="gridcell" aria-selected="false" aria-label="dark orange 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark orange 3" style="background-color: rgb(120, 63, 4); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-73" role="gridcell" aria-selected="false" aria-label="dark yellow 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark yellow 3" style="background-color: rgb(127, 96, 0); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-74" role="gridcell" aria-selected="false" aria-label="dark green 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark green 3" style="background-color: rgb(39, 78, 19); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-75" role="gridcell" aria-selected="false" aria-label="dark cyan 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark cyan 3" style="background-color: rgb(12, 52, 61); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-76" role="gridcell" aria-selected="false" aria-label="dark cornflower blue 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark cornflower blue 3" style="background-color: rgb(28, 69, 135); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-77" role="gridcell" aria-selected="false" aria-label="dark blue 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark blue 3" style="background-color: rgb(7, 55, 99); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-78" role="gridcell" aria-selected="false" aria-label="dark purple 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark purple 3" style="background-color: rgb(32, 18, 77); -webkit-user-select: none;"></div>
                </td>
                <td class="jfk-palette-cell" id="jfk-palette-cell-79" role="gridcell" aria-selected="false" aria-label="dark magenta 3" style="-webkit-user-select: none;">
                    <div class="jfk-palette-colorswatch" title="dark magenta 3" style="background-color: rgb(76, 17, 48); -webkit-user-select: none;"></div>
                </td>
            </tr>
        </tbody>
    </table>


    <div id="main" style="background-color:#D9D9D9;">
		<h1>Color Names</h1>
		<p>You can use this color names if you have a color blindness or if you prefer to have more descriptive color names.</p>
		

		<h2>Red color names</h2> 
<p> 
</p><table class="colortable"> 
<tbody><tr style="color:indianred;"><td>&nbsp;</td><td class="whitename">IndianRed</td><td class="white">CD5C5C</td><td>&nbsp;</td></tr> 
<tr style="color:lightcoral;"><td>&nbsp;</td><td class="whitename">LightCoral</td><td class="white">F08080</td><td>&nbsp;</td></tr> 
<tr style="color:salmon;"><td>&nbsp;</td><td class="whitename">Salmon   </td><td class="white">FA8072</td><td>&nbsp;</td></tr> 
<tr style="color:darksalmon;"><td>&nbsp;</td><td class="whitename">DarkSalmon</td><td class="white">E9967A</td><td>&nbsp;</td></tr> 
<tr style="color:lightsalmon;"><td>&nbsp;</td><td class="whitename">LightSalmon</td><td class="white">FFA07A</td><td>&nbsp;</td></tr> 
<tr style="color:crimson;"><td>&nbsp;</td><td class="whitename">Crimson  </td><td class="white">DC143C</td><td>&nbsp;</td></tr> 
<tr style="color:red;"><td>&nbsp;</td><td class="whitename">Red      </td><td class="white">FF0000</td><td>&nbsp;</td></tr> 
<tr style="color:fireBrick;"><td>&nbsp;</td><td class="whitename">FireBrick</td><td class="white">B22222</td><td>&nbsp;</td></tr> 
<tr style="color:darkred;"><td>&nbsp;</td><td class="whitename">DarkRed  </td><td class="white">8B0000</td><td>&nbsp;</td></tr> 
</tbody></table> 
<p></p>  
<h2>Pink color names</h2> 
<p> 
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- BelowColorChart -->
<ins class="adsbygoogle" style="display:inline-block;width:728px;height:90px" data-ad-client="ca-pub-6483924506584584" data-ad-slot="3874231427" data-adsbygoogle-status="done"><ins style="display:inline-table;border:none;height:90px;margin:0;padding:0;position:relative;visibility:visible;width:728px;background-color:transparent"><ins id="aswift_0_anchor" style="display:block;border:none;height:90px;margin:0;padding:0;position:relative;visibility:visible;width:728px;background-color:transparent"><iframe width="728" height="90" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" onload="var i=this.id,s=window.google_iframe_oncopy,H=s&amp;&amp;s.handlers,h=H&amp;&amp;H[i],w=this.contentWindow,d;try{d=w.document}catch(e){}if(h&amp;&amp;d&amp;&amp;(!d.body||!d.body.firstChild)){if(h.call){setTimeout(h,0)}else if(h.match){try{h=s.upd(h,i)}catch(e){}w.location.replace(h)}}" id="aswift_0" name="aswift_0" style="left:0;position:absolute;top:0;"></iframe></ins></ins></ins>
<script>
    (adsbygoogle = window.adsbygoogle || []).push({});
</script>
</p><table class="colortable"> 
<tbody><tr style="color:pink;"><td>&nbsp;</td><td class="whitename">Pink     </td><td class="white">FFC0CB</td><td>&nbsp;</td></tr> 
<tr style="color:lightpink;"><td>&nbsp;</td><td class="whitename">LightPink</td><td class="white">FFB6C1</td><td>&nbsp;</td></tr> 
<tr style="color:hotpink;"><td>&nbsp;</td><td class="whitename">HotPink  </td><td class="white">FF69B4</td><td>&nbsp;</td></tr> 
<tr style="color:deeppink;"><td>&nbsp;</td><td class="whitename">DeepPink </td><td class="white">FF1493</td><td>&nbsp;</td></tr> 
<tr style="color:mediumvioletred;"><td>&nbsp;</td><td class="whitename">MediumVioletRed</td><td class="white">C71585</td><td>&nbsp;</td></tr> 
<tr style="color:palevioletred;"><td>&nbsp;</td><td class="whitename">PaleVioletRed  </td><td class="white">DB7093</td><td>&nbsp;</td></tr> 
</tbody></table> 
<p></p>  

<h2>Orange color names</h2> 
<p>  
</p><table class="colortable"> 
<tbody><tr style="color:lightsalmon;"><td>&nbsp;</td><td class="whitename">LightSalmon   </td><td class="white">FFA07A</td><td>&nbsp;</td></tr> 
<tr style="color:coral;"><td>&nbsp;</td><td class="whitename">Coral    </td><td class="white">FF7F50</td><td>&nbsp;</td></tr> 
<tr style="color:tomato;"><td>&nbsp;</td><td class="whitename">Tomato   </td><td class="white">FF6347</td><td>&nbsp;</td></tr> 
<tr style="color:orangered;"><td>&nbsp;</td><td class="whitename">OrangeRed</td><td class="white">FF4500</td><td>&nbsp;</td></tr> 
<tr style="color:darkorange;"><td>&nbsp;</td><td class="whitename">DarkOrange</td><td class="white">FF8C00</td><td>&nbsp;</td></tr> 
<tr style="color:orange;"><td>&nbsp;</td><td class="whitename">Orange   </td><td class="white">FFA500</td><td>&nbsp;</td></tr> 
</tbody></table> 
<p></p>  
<h2>Yellow color names</h2> 
<p>   
</p><table class="colortable"> 
<tbody><tr style="color:gold;"><td>&nbsp;</td><td class="whitename">Gold     </td><td class="white">FFD700</td><td>&nbsp;</td></tr> 
<tr style="color:yellow;"><td>&nbsp;</td><td class="whitename">Yellow   </td><td class="white">FFFF00</td><td>&nbsp;</td></tr> 
<tr style="color:lightyellow;"><td>&nbsp;</td><td class="whitename">LightYellow</td><td class="white">FFFFE0</td><td>&nbsp;</td></tr> 
<tr style="color:lemonchiffon;"><td>&nbsp;</td><td class="whitename">LemonChiffon   </td><td class="white">FFFACD</td><td>&nbsp;</td></tr> 
<tr style="color:lightgoldenrodyellow;"><td>&nbsp;</td><td class="whitename">LightGoldenrodYellow</td><td class="white">FAFAD2</td><td>&nbsp;</td></tr> 
<tr style="color:papayawhip;"><td>&nbsp;</td><td class="whitename">PapayaWhip</td><td class="white">FFEFD5</td><td>&nbsp;</td></tr> 
<tr style="color:moccasin;"><td>&nbsp;</td><td class="whitename">Moccasin </td><td class="white">FFE4B5</td><td>&nbsp;</td></tr> 
<tr style="color:peachpuff;"><td>&nbsp;</td><td class="whitename">PeachPuff</td><td class="white">FFDAB9</td><td>&nbsp;</td></tr> 
<tr style="color:palegoldenrod;"><td>&nbsp;</td><td class="whitename">PaleGoldenrod  </td><td class="white">EEE8AA</td><td>&nbsp;</td></tr> 
<tr style="color:khaki;"><td>&nbsp;</td><td class="whitename">Khaki    </td><td class="white">F0E68C</td><td>&nbsp;</td></tr> 
<tr style="color:darkkhaki;"><td>&nbsp;</td><td class="whitename">DarkKhaki</td><td class="white">BDB76B</td><td>&nbsp;</td></tr> 
</tbody></table> 
<p></p>  
<h2>Purple color names</h2> 
<p>   
</p><table class="colortable"> 
<tbody><tr style="color:lavender;"><td>&nbsp;</td><td class="whitename">Lavender </td><td class="white">E6E6FA</td><td>&nbsp;</td></tr> 
<tr style="color:thistle;"><td>&nbsp;</td><td class="whitename">Thistle  </td><td class="white">D8BFD8</td><td>&nbsp;</td></tr> 
<tr style="color:plum;"><td>&nbsp;</td><td class="whitename">Plum     </td><td class="white">DDA0DD</td><td>&nbsp;</td></tr> 
<tr style="color:violet;"><td>&nbsp;</td><td class="whitename">Violet   </td><td class="white">EE82EE</td><td>&nbsp;</td></tr> 
<tr style="color:orchid;"><td>&nbsp;</td><td class="whitename">Orchid   </td><td class="white">DA70D6</td><td>&nbsp;</td></tr> 
<tr style="color:fuchsia;"><td>&nbsp;</td><td class="whitename">Fuchsia  </td><td class="white">FF00FF</td><td>&nbsp;</td></tr> 
<tr style="color:Magenta;"><td>&nbsp;</td><td class="whitename">Magenta  </td><td class="white">FF00FF</td><td>&nbsp;</td></tr> 
<tr style="color:mediumorchid;"><td>&nbsp;</td><td class="whitename">MediumOrchid   </td><td class="white">BA55D3</td><td>&nbsp;</td></tr> 
<tr style="color:mediumpurple;"><td>&nbsp;</td><td class="whitename">MediumPurple   </td><td class="white">9370DB</td><td>&nbsp;</td></tr> 
<tr style="color:#9966CC;"><td>&nbsp;</td><td class="whitename">Amethyst </td><td class="white">9966CC</td><td>&nbsp;</td></tr> 
<tr style="color:blueviolet;"><td>&nbsp;</td><td class="whitename">BlueViolet</td><td class="white">8A2BE2</td><td>&nbsp;</td></tr> 
<tr style="color:darkviolet;"><td>&nbsp;</td><td class="whitename">DarkViolet</td><td class="white">9400D3</td><td>&nbsp;</td></tr> 
<tr style="color:darkorchid;"><td>&nbsp;</td><td class="whitename">DarkOrchid</td><td class="white">9932CC</td><td>&nbsp;</td></tr> 
<tr style="color:darkmagenta;"><td>&nbsp;</td><td class="whitename">DarkMagenta</td><td class="white">8B008B</td><td>&nbsp;</td></tr> 
<tr style="color:purple;"><td>&nbsp;</td><td class="whitename">Purple   </td><td class="white">800080</td><td>&nbsp;</td></tr> 
<tr style="color:indigo;"><td>&nbsp;</td><td class="whitename">Indigo   </td><td class="white">4B0082</td><td>&nbsp;</td></tr> 
<tr style="color:slateblue;"><td>&nbsp;</td><td class="whitename">SlateBlue</td><td class="white">6A5ACD</td><td>&nbsp;</td></tr> 
<tr style="color:darkslateblue;"><td>&nbsp;</td><td class="whitename">DarkSlateBlue  </td><td class="white">483D8B</td><td>&nbsp;</td></tr> 
<tr style="color:mediumslateblue;"><td>&nbsp;</td><td class="whitename">MediumSlateBlue</td><td class="white">7B68EE</td><td>&nbsp;</td></tr> 
</tbody></table> 
<p></p>  
<h2>Green color names</h2> 
<p>   
</p><table class="colortable"> 
<tbody><tr style="color:greenyellow;"><td>&nbsp;</td><td class="whitename">GreenYellow</td><td class="white">ADFF2F</td><td>&nbsp;</td></tr> 
<tr style="color:chartreuse;"><td>&nbsp;</td><td class="whitename">Chartreuse</td><td class="white">7FFF00</td><td>&nbsp;</td></tr> 
<tr style="color:lawngreen;"><td>&nbsp;</td><td class="whitename">LawnGreen</td><td class="white">7CFC00</td><td>&nbsp;</td></tr> 
<tr style="color:lime;"><td>&nbsp;</td><td class="whitename">Lime     </td><td class="white">00FF00</td><td>&nbsp;</td></tr> 
<tr style="color:limegreen;"><td>&nbsp;</td><td class="whitename">LimeGreen</td><td class="white">32CD32</td><td>&nbsp;</td></tr> 
<tr style="color:palegreen;"><td>&nbsp;</td><td class="whitename">PaleGreen</td><td class="white">98FB98</td><td>&nbsp;</td></tr> 
<tr style="color:lightgreen;"><td>&nbsp;</td><td class="whitename">LightGreen</td><td class="white">90EE90</td><td>&nbsp;</td></tr> 
<tr style="color:mediumspringgreen;"><td>&nbsp;</td><td class="whitename">MediumSpringGreen</td><td class="white">00FA9A</td><td>&nbsp;</td></tr> 
<tr style="color:springgreen;"><td>&nbsp;</td><td class="whitename">SpringGreen</td><td class="white">00FF7F</td><td>&nbsp;</td></tr> 
<tr style="color:mediumseagreen;"><td>&nbsp;</td><td class="whitename">MediumSeaGreen </td><td class="white">3CB371</td><td>&nbsp;</td></tr> 
<tr style="color:seagreen;"><td>&nbsp;</td><td class="whitename">SeaGreen </td><td class="white">2E8B57</td><td>&nbsp;</td></tr> 
<tr style="color:forestgreen;"><td>&nbsp;</td><td class="whitename">ForestGreen</td><td class="white">228B22</td><td>&nbsp;</td></tr> 
<tr style="color:green;"><td>&nbsp;</td><td class="whitename">Green    </td><td class="white">008000</td><td>&nbsp;</td></tr> 
<tr style="color:darkgreen;"><td>&nbsp;</td><td class="whitename">DarkGreen</td><td class="white">006400</td><td>&nbsp;</td></tr> 
<tr style="color:yellowgreen;"><td>&nbsp;</td><td class="whitename">YellowGreen</td><td class="white">9ACD32</td><td>&nbsp;</td></tr> 
<tr style="color:olivedrab;"><td>&nbsp;</td><td class="whitename">OliveDrab</td><td class="white">6B8E23</td><td>&nbsp;</td></tr> 
<tr style="color:olive;"><td>&nbsp;</td><td class="whitename">Olive    </td><td class="white">808000</td><td>&nbsp;</td></tr> 
<tr style="color:darkolivegreen;"><td>&nbsp;</td><td class="whitename">DarkOliveGreen </td><td class="white">556B2F</td><td>&nbsp;</td></tr> 
<tr style="color:mediumaquamarine;"><td>&nbsp;</td><td class="whitename">MediumAquamarine</td><td class="white">66CDAA</td><td>&nbsp;</td></tr> 
<tr style="color:darkseagreen;"><td>&nbsp;</td><td class="whitename">DarkSeaGreen   </td><td class="white">8FBC8F</td><td>&nbsp;</td></tr> 
<tr style="color:lightseagreen;"><td>&nbsp;</td><td class="whitename">LightSeaGreen  </td><td class="white">20B2AA</td><td>&nbsp;</td></tr> 
<tr style="color:darkcyan;"><td>&nbsp;</td><td class="whitename">DarkCyan </td><td class="white">008B8B</td><td>&nbsp;</td></tr> 
<tr style="color:teal;"><td>&nbsp;</td><td class="whitename">Teal     </td><td class="white">008080</td><td>&nbsp;</td></tr> 
</tbody></table> 
<p></p>  
<h2>Blue color names</h2> 
<p>   
</p><table class="colortable"> 
<tbody><tr style="color:aqua;"><td>&nbsp;</td><td class="whitename">Aqua     </td><td class="white">00FFFF</td><td>&nbsp;</td></tr> 
<tr style="color:cyan;"><td>&nbsp;</td><td class="whitename">Cyan     </td><td class="white">00FFFF</td><td>&nbsp;</td></tr> 
<tr style="color:lightcyan;"><td>&nbsp;</td><td class="whitename">LightCyan</td><td class="white">E0FFFF</td><td>&nbsp;</td></tr> 
<tr style="color:paleturquoise;"><td>&nbsp;</td><td class="whitename">PaleTurquoise  </td><td class="white">AFEEEE</td><td>&nbsp;</td></tr> 
<tr style="color:aquamarine;"><td>&nbsp;</td><td class="whitename">Aquamarine</td><td class="white">7FFFD4</td><td>&nbsp;</td></tr> 
<tr style="color:turquoise;"><td>&nbsp;</td><td class="whitename">Turquoise</td><td class="white">40E0D0</td><td>&nbsp;</td></tr> 
<tr style="color:mediumturquoise;"><td>&nbsp;</td><td class="whitename">MediumTurquoise</td><td class="white">48D1CC</td><td>&nbsp;</td></tr> 
<tr style="color:darkturquoise;"><td>&nbsp;</td><td class="whitename">DarkTurquoise  </td><td class="white">00CED1</td><td>&nbsp;</td></tr> 
<tr style="color:cadetblue;"><td>&nbsp;</td><td class="whitename">CadetBlue</td><td class="white">5F9EA0</td><td>&nbsp;</td></tr> 
<tr style="color:steelblue;"><td>&nbsp;</td><td class="whitename">SteelBlue</td><td class="white">4682B4</td><td>&nbsp;</td></tr> 
<tr style="color:lightsteelblue;"><td>&nbsp;</td><td class="whitename">LightSteelBlue </td><td class="white">B0C4DE</td><td>&nbsp;</td></tr> 
<tr style="color:powderblue;"><td>&nbsp;</td><td class="whitename">PowderBlue</td><td class="white">B0E0E6</td><td>&nbsp;</td></tr> 
<tr style="color:lightblue;"><td>&nbsp;</td><td class="whitename">LightBlue</td><td class="white">ADD8E6</td><td>&nbsp;</td></tr> 
<tr style="color:skyblue;"><td>&nbsp;</td><td class="whitename">SkyBlue  </td><td class="white">87CEEB</td><td>&nbsp;</td></tr> 
<tr style="color:lightskyblue;"><td>&nbsp;</td><td class="whitename">LightSkyBlue   </td><td class="white">87CEFA</td><td>&nbsp;</td></tr> 
<tr style="color:deepskyblue;"><td>&nbsp;</td><td class="whitename">DeepSkyBlue</td><td class="white">00BFFF</td><td>&nbsp;</td></tr> 
<tr style="color:dodgerblue;"><td>&nbsp;</td><td class="whitename">DodgerBlue</td><td class="white">1E90FF</td><td>&nbsp;</td></tr> 
<tr style="color:cornflowerblue;"><td>&nbsp;</td><td class="whitename">CornflowerBlue </td><td class="white">6495ED</td><td>&nbsp;</td></tr> 
<tr style="color:mediumslateblue;"><td>&nbsp;</td><td class="whitename">MediumSlateBlue</td><td class="white">7B68EE</td><td>&nbsp;</td></tr> 
<tr style="color:royalblue;"><td>&nbsp;</td><td class="whitename">RoyalBlue</td><td class="white">4169E1</td><td>&nbsp;</td></tr> 
<tr style="color:blue;"><td>&nbsp;</td><td class="whitename">Blue     </td><td class="white">0000FF</td><td>&nbsp;</td></tr> 
<tr style="color:mediumblue;"><td>&nbsp;</td><td class="whitename">MediumBlue</td><td class="white">0000CD</td><td>&nbsp;</td></tr> 
<tr style="color:darkblue;"><td>&nbsp;</td><td class="whitename">DarkBlue </td><td class="white">00008B</td><td>&nbsp;</td></tr> 
<tr style="color:navy;"><td>&nbsp;</td><td class="whitename">Navy     </td><td class="white">000080</td><td>&nbsp;</td></tr> 
<tr style="color:midnightblue;"><td>&nbsp;</td><td class="whitename">MidnightBlue   </td><td class="white">191970</td><td>&nbsp;</td></tr> 
</tbody></table> 
<p></p>  
 
<h2>Brown color names</h2> 
<p>    
</p><table class="colortable"> 
<tbody><tr style="color:cornsilk;"><td>&nbsp;</td><td class="whitename">Cornsilk </td><td class="white">FFF8DC</td><td>&nbsp;</td></tr> 
<tr style="color:blanchedalmond;"><td>&nbsp;</td><td class="whitename">BlanchedAlmond </td><td class="white">FFEBCD</td><td>&nbsp;</td></tr> 
<tr style="color:bisque;"><td>&nbsp;</td><td class="whitename">Bisque   </td><td class="white">FFE4C4</td><td>&nbsp;</td></tr> 
<tr style="color:navajowhite;"><td>&nbsp;</td><td class="whitename">NavajoWhite</td><td class="white">FFDEAD</td><td>&nbsp;</td></tr> 
<tr style="color:wheat;"><td>&nbsp;</td><td class="whitename">Wheat    </td><td class="white">F5DEB3</td><td>&nbsp;</td></tr> 
<tr style="color:burlywood;"><td>&nbsp;</td><td class="whitename">BurlyWood</td><td class="white">DEB887</td><td>&nbsp;</td></tr> 
<tr style="color:tan;"><td>&nbsp;</td><td class="whitename">Tan      </td><td class="white">D2B48C</td><td>&nbsp;</td></tr> 
<tr style="color:rosybrown;"><td>&nbsp;</td><td class="whitename">RosyBrown</td><td class="white">BC8F8F</td><td>&nbsp;</td></tr> 
<tr style="color:sandybrown;"><td>&nbsp;</td><td class="whitename">SandyBrown</td><td class="white">F4A460</td><td>&nbsp;</td></tr> 
<tr style="color:goldenrod;"><td>&nbsp;</td><td class="whitename">Goldenrod</td><td class="white">DAA520</td><td>&nbsp;</td></tr> 
<tr style="color:darkgoldenrod;"><td>&nbsp;</td><td class="whitename">DarkGoldenrod  </td><td class="white">B8860B</td><td>&nbsp;</td></tr> 
<tr style="color:Peru;"><td>&nbsp;</td><td class="whitename">Peru     </td><td class="white">CD853F</td><td>&nbsp;</td></tr> 
<tr style="color:chocolate;"><td>&nbsp;</td><td class="whitename">Chocolate</td><td class="white">D2691E</td><td>&nbsp;</td></tr> 
<tr style="color:saddlebrown;"><td>&nbsp;</td><td class="whitename">SaddleBrown</td><td class="white">8B4513</td><td>&nbsp;</td></tr> 
<tr style="color:sienna;"><td>&nbsp;</td><td class="whitename">Sienna   </td><td class="white">A0522D</td><td>&nbsp;</td></tr> 
<tr style="color:brown;"><td>&nbsp;</td><td class="whitename">Brown    </td><td class="white">A52A2A</td><td>&nbsp;</td></tr> 
<tr style="color:maroon;"><td>&nbsp;</td><td class="whitename">Maroon   </td><td class="white">800000</td><td>&nbsp;</td></tr> 
</tbody></table> 
<p></p>  
<h2>White color names</h2> 
<p>   
</p><table class="colortable"> 
<tbody><tr style="color:white;"><td>&nbsp;</td><td class="whitename">White    </td><td class="white">FFFFFF</td><td>&nbsp;</td></tr> 
<tr style="color:snow;"><td>&nbsp;</td><td class="whitename">Snow     </td><td class="white">FFFAFA</td><td>&nbsp;</td></tr> 
<tr style="color:honeydew;"><td>&nbsp;</td><td class="whitename">Honeydew </td><td class="white">F0FFF0</td><td>&nbsp;</td></tr> 
<tr style="color:mintcream;"><td>&nbsp;</td><td class="whitename">MintCream</td><td class="white">F5FFFA</td><td>&nbsp;</td></tr> 
<tr style="color:azure;"><td>&nbsp;</td><td class="whitename">Azure    </td><td class="white">F0FFFF</td><td>&nbsp;</td></tr> 
<tr style="color:aliceblue;"><td>&nbsp;</td><td class="whitename">AliceBlue</td><td class="white">F0F8FF</td><td>&nbsp;</td></tr> 
<tr style="color:ghostwhite;"><td>&nbsp;</td><td class="whitename">GhostWhite</td><td class="white">F8F8FF</td><td>&nbsp;</td></tr> 
<tr style="color:whitesmoke;"><td>&nbsp;</td><td class="whitename">WhiteSmoke</td><td class="white">F5F5F5</td><td>&nbsp;</td></tr> 
<tr style="color:seashell;"><td>&nbsp;</td><td class="whitename">Seashell </td><td class="white">FFF5EE</td><td>&nbsp;</td></tr> 
<tr style="color:beige;"><td>&nbsp;</td><td class="whitename">Beige    </td><td class="white">F5F5DC</td><td>&nbsp;</td></tr> 
<tr style="color:oldlace;"><td>&nbsp;</td><td class="whitename">OldLace  </td><td class="white">FDF5E6</td><td>&nbsp;</td></tr> 
<tr style="color:floralwhite;"><td>&nbsp;</td><td class="whitename">FloralWhite</td><td class="white">FFFAF0</td><td>&nbsp;</td></tr> 
<tr style="color:ivory;"><td>&nbsp;</td><td class="whitename">Ivory    </td><td class="white">FFFFF0</td><td>&nbsp;</td></tr> 
<tr style="color:antiquewhite;"><td>&nbsp;</td><td class="whitename">AntiqueWhite   </td><td class="white">FAEBD7</td><td>&nbsp;</td></tr> 
<tr style="color:linen;"><td>&nbsp;</td><td class="whitename">Linen    </td><td class="white">FAF0E6</td><td>&nbsp;</td></tr> 
<tr style="color:lavenderblush;"><td>&nbsp;</td><td class="whitename">LavenderBlush  </td><td class="white">FFF0F5</td><td>&nbsp;</td></tr> 
<tr style="color:mistyrose;"><td>&nbsp;</td><td class="whitename">MistyRose</td><td class="white">FFE4E1</td><td>&nbsp;</td></tr> 
</tbody></table> 
<p></p>  
<h2>Grey color names</h2> 
<p>   
</p><table class="colortable"> 
<tbody><tr style="color:gainsboro;"><td>&nbsp;</td><td class="whitename">Gainsboro</td><td class="white">DCDCDC</td><td>&nbsp;</td></tr> 
<tr style="color:lightgrey;"><td>&nbsp;</td><td class="whitename">LightGrey</td><td class="white">D3D3D3</td><td>&nbsp;</td></tr> 
<tr style="color:silver;"><td>&nbsp;</td><td class="whitename">Silver   </td><td class="white">C0C0C0</td><td>&nbsp;</td></tr> 
<tr style="color:darkgray;"><td>&nbsp;</td><td class="whitename">DarkGray </td><td class="white">A9A9A9</td><td>&nbsp;</td></tr> 
<tr style="color:gray;"><td>&nbsp;</td><td class="whitename">Gray     </td><td class="white">808080</td><td>&nbsp;</td></tr> 
<tr style="color:dimgray;"><td>&nbsp;</td><td class="whitename">DimGray  </td><td class="white">696969</td><td>&nbsp;</td></tr> 
<tr style="color:lightslategray;"><td>&nbsp;</td><td class="whitename">LightSlateGray </td><td class="white">778899</td><td>&nbsp;</td></tr> 
<tr style="color:slategray;"><td>&nbsp;</td><td class="whitename">SlateGray</td><td class="white">708090</td><td>&nbsp;</td></tr> 
<tr style="color:darkslategray;"><td>&nbsp;</td><td class="whitename">DarkSlateGray  </td><td class="white">2F4F4F</td><td>&nbsp;</td></tr> 
<tr style="color:black;"><td>&nbsp;</td><td class="whitename">Black    </td><td class="white">000000</td><td>&nbsp;</td></tr> 
</tbody></table> 
<br> 
		<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- BelowColorPicker -->
<ins class="adsbygoogle" style="display:inline-block;width:728px;height:90px" data-ad-client="ca-pub-6483924506584584" data-ad-slot="8304431024" data-adsbygoogle-status="done"><ins style="display:inline-table;border:none;height:90px;margin:0;padding:0;position:relative;visibility:visible;width:728px;background-color:transparent"><ins id="aswift_1_anchor" style="display:block;border:none;height:90px;margin:0;padding:0;position:relative;visibility:visible;width:728px;background-color:transparent"><iframe width="728" height="90" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" onload="var i=this.id,s=window.google_iframe_oncopy,H=s&amp;&amp;s.handlers,h=H&amp;&amp;H[i],w=this.contentWindow,d;try{d=w.document}catch(e){}if(h&amp;&amp;d&amp;&amp;(!d.body||!d.body.firstChild)){if(h.call){setTimeout(h,0)}else if(h.match){try{h=s.upd(h,i)}catch(e){}w.location.replace(h)}}" id="aswift_1" name="aswift_1" style="left:0;position:absolute;top:0;"></iframe></ins></ins></ins>
<script>
    (adsbygoogle = window.adsbygoogle || []).push({});
</script>
<br> 
<br> 
<a href="http://creativecommons.org/licenses/by-sa/3.0/" target="_blank" class="footer">Data on this page is under Creative Commons Attribution-ShareAlike License</a> 

		<br><br>

<!--<div class="fblike"></div>-->
<div class="fbrecomend">
<a title="Publish in Facebook" target="_blank" href="http://www.facebook.com/sharer.php?u=http://html-color-codes.info/color-names/">
<div class="socialsprite" style="background-position: -0px -0px; width: 24px; height: 24px">&nbsp;</div>
</a>
</div>
<div class="twrecomend">
<a title="Twit it" target="_blank" href="http://twitter.com/home?status=http://html-color-codes.info/color-names/">
<div class="socialsprite" style="background-position: -0px -34px; width: 24px; height: 24px">&nbsp;</div>
</a>
</div>
	</div>--%>
</body>
</html>
