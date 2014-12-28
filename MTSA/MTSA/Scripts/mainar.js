$(document).ready(function () {
    var polytouchvideo;
    $('#superContainer').fullpage({
        navigation: false,
        scrollOverflow: true,
        slidesNavigation: false,        
        resize: false,
        verticalCentered: false,        
        afterLoad: function (anchorLink, index) {            
            if ($('#nextsection_' + index).length) {
                $('#nextTopic span').html($('#nextsection_' + index).html());
                $('#nextTopic').css('display', 'block');
            }
            else
                $('#nextTopic').css('display', 'none');

            // kiosk first page
            if (index == 4) {
                $('.slideFooter').css('display', 'none');
                $('#k_p0').css('display', 'block');
            }
            else
                $('.slideFooter').css('display', 'none');

            $('.section .animleft').removeClass('active');
            $('.section .animright').removeClass('active');
            $('.section.active .animleft').addClass('active');
            $('.section.active .animright').addClass('active');


            if (index == 6) {
                $('#3dflashvideo').get(0).play();
                $('#reflashvideo').get(0).pause();

            }

            else if (index == 7) {
                $('#reflashvideo').get(0).play();
                $('#3dflashvideo').get(0).pause();
            }

            else {
                $('#reflashvideo').get(0).pause();
                $('#3dflashvideo').get(0).pause();
            }
        },
        afterSlideLoad: function (anchorLink, index, slideAnchor, slideIndex) {
            if (slideIndex > 0) {
                $.fn.fullpage.setAllowScrolling(false);
                $.fn.fullpage.setKeyboardScrolling(false);
                $('#nextTopic').css('display', 'none');
                // projects
                if (index == 1 && slideIndex != 2) {
                    var contentWrap = $("#content-wrap");
                    var catPages = $(".cat-pages");
                    var ascroll = $('a.page-scroll');
                    catPages.removeClass('cat-left-0').removeClass('cat-left-50').addClass('cat-left-25');
                    contentWrap.removeClass("content-wrap-left").removeClass("content-wrap-right").removeClass('cat-left-0').removeClass('cat-left-50').addClass('cat-left-25');
                    catPages.removeClass('cat-pages-active');
                    ascroll.removeClass('nav-current');
                    setTimeout(function () {
                        catPages.css("display", "none");
                        // back to 1st project
                        $(ascroll[0]).trigger('click');
                        $(catPages[0]).css('display', 'block');
                    }, 1000);

                    
                }
                if (index == 1 && slideIndex == 1) {
                    // open 9th item in grid 
                    var link = $($('#appholder > ul > li > a')[8]);
                    if (!link.parent().hasClass('og-expanded')) {
                        setTimeout(function () { link.trigger("click") }, 200);
                    }
                }

                // move from polytouch screen video slide
                if (index == 2 && slideIndex != 0) {
                    $('#polytouchVideo').fadeOut("slow");
                    $('#polytouchvideoOverLayer').fadeIn("slow");
                    try {
                        $('#polytouchVideo').stopYTP();
                    } catch (err) { }
                }
                if (index == 2 && slideIndex == 1)
                {
                    $('#multitouchflashvideo').get(0).play();
                }
                if (index == 2 && slideIndex == 3)
                {
                    // open 1st item in grid 
                    var link = $('#polywts > ul > li > a:first');
                    if (!link.parent().hasClass('og-expanded')) {
                        setTimeout(function () { link.trigger("click") }, 200);
                    }
                }
                

                if (index == 3 && slideIndex > 0) {
                    $('.slideFooter.ds').css('display', 'none');
                    $('#ds_p' + slideIndex).css('display', 'block');
                }
                else {
                    $('.slideFooter.ds').css('display', 'none');
                }

                if (index == 4) {
                    $('.slideFooter.ks').css('display', 'none');
                    $('#k_p' + slideIndex).css('display', 'block');
                } else {
                    $('.slideFooter.ks').css('display', 'none');
                }
                

            }
            else {
                $.fn.fullpage.setAllowScrolling(true);
                $.fn.fullpage.setKeyboardScrolling(true);
                $('#nextTopic').css('display', 'block');
                $('.slideFooter').css('display', 'none');
                if (index == 4) {
                    $('.slideFooter').css('display', 'none');
                    $('#k_p' + slideIndex).css('display', 'block');
                }

                
            }

            $('.section .animleft').removeClass('active');
            $('.section .animright').removeClass('active');
            $('.section .active .animleft').addClass('active');
            $('.section .active .animright').addClass('active');
        },
        onSlideLeave: function (anchorLink, index, slideIndex, direction) {
            if (slideIndex > 0 && (direction != "left" || direction != "right"))
            { }
        },
        onLeave: function (index, nextIndex, direction) {
            if (index == 2) {
                $('#polytouchVideo').fadeOut("slow");
                $('#polytouchvideoOverLayer').fadeIn("slow");
                try {
                    $('#polytouchVideo').stopYTP();
                } catch (err) { }
            }
        }
    });

    $('.BackToHome').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.setAllowScrolling(true);
        $.fn.fullpage.setKeyboardScrolling(true);
        $.fn.fullpage.moveSlideLeft();
    });

    $('.MoveRight').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.setAllowScrolling(false);
        $.fn.fullpage.setKeyboardScrolling(false);
        $.fn.fullpage.moveSlideRight();
    });

    $('#nextTopic').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.moveSectionDown();
    });

    /* navigation */
    $('#mts').click(function (e) {
        e.preventDefault();        
        $.fn.fullpage.moveTo(2,0);
    });
    $('#ds').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.moveTo(3, 0);
    });
    $('#ks').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.moveTo(4, 0);
    });
    $('#ed').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.moveTo(5, 0);
    });
    $('#way').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.moveTo(6, 0);
    });
    $('#rs').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.moveTo(7, 0);
    });
    $('#contact').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.moveTo(8,0);
    });
    $('#wts').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.moveTo(1, 1);
    });
    $('#pro').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.moveTo(1, 2);
    });
    $('#ts').click(function (e) {
        e.preventDefault();
        $.fn.fullpage.moveTo(1, 3);
    });
    


    $('.appicon').each(function () {
        var $this = $(this);
        var popoverContent = $this.find('.appcontent');
        $this.popover({
            trigger: 'hover',
            html: true,
            content: popoverContent
        });
    });

    $("#polytouchVideo").mb_YTPlayer({ videoURL: 'QXfxHrnLBK8', containment: '#polytouchVideo', loop: false, autoPlay: false });
    

    $('#playVideo').click(function () {
        $('#polytouchVideo').fadeIn("slow");
        $('#polytouchvideoOverLayer').fadeOut("slow");
        $("#polytouchVideo").playYTP();
    });

    $("#polytouchVideo").on("YTPEnd", function () {
        $('#polytouchVideo').fadeOut("slow");
        $('#polytouchvideoOverLayer').fadeIn("slow");
    });

    $('.stopback').click(function () {
        $('#polytouchVideo').fadeOut("slow");
        $('#polytouchvideoOverLayer').fadeIn("slow");
        try {
            $('#polytouchVideo').stopYTP();
        } catch (err) { }
    });

    $('.tip').tooltip();


    $('#nextTopic span').html($('#nextsection_1').html());


    $("#appholder").elastic_grid({
        'items':
        [
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'الإعلانات',
                'description': '<ul class="applist"><li>لوحات الإعلانات الداخلية</li> <li>لوحات الإعلانات الخارجيّة</li><li> الإعلانات على منصات الشاشات المختلفة</li></ul>',
                'thumbnail': ['../images/Icons/png/1.png'],
                'large': ['../images/Icons/png/large/1.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'المطارات',
                'description': '<ul class="applist"><li>دليل مباني المطار الإرشادي</li> <li>لوحات الإعلانات الداخلية</li><li>نقاط البيع</li><li>مواعيد الرحلات</li><li>التسجيل الذاتي واستصدار بطاقات صعود الطائرة</li></ul>',
                'thumbnail': ['../images/Icons/png/2.png'],
                'large': ['../images/Icons/png/large/2.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'المواصلات العامة',
                'description': '<ul class="applist"><li>دليل المبنى </li> <li>لوحات الإعلانات الداخلية</li><li>نقاط البيع</li><li>مواعيد الرحلات</li><li>التسجيل الذاتي واستصدار تذاكر السفر</li></ul>',
                'thumbnail': ['../images/Icons/png/3.png'],
                'large': ['../images/Icons/png/large/3.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'البنوك',
                'description': '<ul class="applist"><li>لوحات الإعلانات الداخلية</li> <li>خدمة الموظفين الذاتيّة</li><li>مراقبة حضور الموظفين بالبصمة</li><li>إدارة نظام الإنتظار بالفروع</li><li>خدمة العملاء الذاتيّة</li><li>الأنظمة الإدارية</li></ul>',
                'thumbnail': ['../images/Icons/png/4.png'],
                'large': ['../images/Icons/png/large/4.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'الفنادق',
                'description': '<ul class="applist"><li>لوحات الإعلانات الداخلية</li> <li>خدمة الموظفين الذاتيّة</li><li>تسجيل الدخول والمغادرة الذاتي</li><li>دليل مباني الفندق الإرشادي</li><li>إدارة أنظمة المطبخ وخدمة الغرف</li></ul>',
                'thumbnail': ['../images/Icons/png/5.png'],
                'large': ['../images/Icons/png/large/5.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'المستشفيات',
                'description': '<ul class="applist"><li>دليل مباني المستشفى الإرشادي</li><li>لوحات الإعلانات الداخلية</li> <li>أنظمة خدمة المرضى</li><li>أنظمة إدارة المستشفى</li><li>خدمة الموظفين الذاتيّة</li></ul>',
                'thumbnail': ['../images/Icons/png/6.png'],
                'large': ['../images/Icons/png/large/6.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'منشاءات الضيافة',
                'description': '<ul class="applist"><li>لوحات الإعلانات الداخلية</li> <li>عرض قائمة الطعام</li><li> خدمة الموظفين الذاتيّة</li><li>الخدمة الذاتية للبيع</li></ul>',
                'thumbnail': ['../images/Icons/png/7.png'],
                'large': ['../images/Icons/png/large/7.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'إدارة الأعمال',
                'description': '<ul class="applist"><li>لوحات الإعلانات الداخلية</li> <li>خدمة الموظفين الذاتيّة</li><li>مراقبة حضور الموظفين بالبصمة</li><li>إدارة نظام الإنتظار </li><li>خدمة العملاء الذاتيّة</li><li>نقاط البيع</li><li>الإستشارات والتخطيط</li><li>المعارض التجاريّة</li></ul>',
                'thumbnail': ['../images/Icons/png/8.png'],
                'large': ['../images/Icons/png/large/8.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'المباني العامة والعقارات',
                'description': '<ul class="applist"><li>لوحات الإعلانات الداخلية</li> <li>تسويق العقارات</li><li>الدليل الإرشادي للمباني العامة</li><li>أنظمة إدارة العقارات</li><li>نقاط البيع الذاتيّة</li><li>أنظمة المعلومات العامة</li></ul>',
                'thumbnail': ['../images/Icons/png/9.png'],
                'large': ['../images/Icons/png/large/9.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'التسوق',
                'description': '<ul class="applist"><li>لوحات الإعلانات الداخلية</li> <li>أنظمة نقاط البيع الذاتيّة</li><li> غرف قياس الملابس الإفتراضية</li><li>معلومات المنتجات وكتيباتها</li><li>الدليل الإرشادي لأماكن المنتجات</li><li>خدمة الموظفين الذاتيّة</li></ul>',
                'thumbnail': ['../images/Icons/png/10.png'],
                'large': ['../images/Icons/png/large/10.png'],
                'button_list': [],
                'tags': []

            },

            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'الصناعات',
                'description': '<ul class="applist"><li>إدارة الإنتاج</li> <li>عرض المنتجات بصالة العرض</li><li>خدمة الموظفين الذاتيّة</li><li>المعارض التجارية</li></ul>',
                'thumbnail': ['../images/Icons/png/11.png'],
                'large': ['../images/Icons/png/large/11.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'التعليم',
                'description': '<ul class="applist"><li>دليل مباني الجامعات الإرشادي</li> <li>معلومات الطلاب</li><li>الخدمة الذاتيّة للطلاب</li><li>عروض المواد التعليمية</li><li>لوحات الإعلانات الداخلية</li><li>مراقبة حضور الموظفين بنظام البصمة</li><li>الإستشارات والتخطيط</li><li>خدمة الموظفين الذاتية</li><li>نظام إدارة الإنتظار</li><li>المعارض التجارية</li></ul>',
                'thumbnail': ['../images/Icons/png/12.png'],
                'large': ['../images/Icons/png/large/12.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'الملاعب الرياضية',
                'description': '<ul class="applist"><li>إصدار تذاكر المباريات</li> <li>قراءة باركود التذاكر</li><li> لوحات الإعلانات الداخلية والخارجية</li><li>نقاط البيع الذاتيّة</li><li>أنظمة المعلومات</li><li>خدمة الموظفين الذاتيّة</li></ul>',
                'thumbnail': ['../images/Icons/png/13.png'],
                'large': ['../images/Icons/png/large/13.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'الاستعلامات',
                'description': '<ul class="applist"><li>الدليل الإرشادي للمباني العامة </li> <li>أنظمة المعلومات العامة</li><li> الإعلانات العامة</li><li>الإعلانات الداخلية</li></ul>',
                'thumbnail': ['../images/Icons/png/14.png'],
                'large': ['../images/Icons/png/large/14.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'الخدمات الحكومية',
                'description': '<ul class="applist"><li>المعلومات العامة</li> <li>الخدمات العامة الذاتية</li><li>خدمة الموظفين الذاتيّة</li><li>المعارض التجارية</li></ul>',
                'thumbnail': ['../images/Icons/png/15.png'],
                'large': ['../images/Icons/png/large/15.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'الحج',
                'description': '<ul class="applist"><li>الدليل الإرشادي للحجاج والزوار</li> <li>أنظمة المعلومات</li><li> مواعيد وسائل النقل (القطارات والحافلات)</li><li>إصدار التذاكر</li><li>لوحات الإعلانات الخارجية</li><li>المفقودات والموجودات</li><li>خدمة الموظفين الذاتيّة</li><li>نقاط البيع</li><li>إتصالات الإنترنت</li><li>الإتصالات الأمنيّة</li></ul>',
                'thumbnail': ['../images/Icons/png/16.png'],
                'large': ['../images/Icons/png/large/16.png'],
                'button_list': [],
                'tags': []

            }



        ]

    });

    // where to use - mutli touch screen 
    $("#polywts").elastic_grid({
        'items':
        [

            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'أنظمة نقـاط البيـع',
                'description': '<p style="direction:rtl">إجمع بين تجارتك الإلكترونية والبيع داخل المتجر وأعمل على زيادة عرض منتجاتك . الشاشة بحجمها الذكي وعمقها المحدود هي حل مثالي لللإستخدام في نقاط البيع بشكل عام . </p><span class="label label-default" style="direction:rtl">أماكن الإستخدام </span><br /><ul class="applist" style="direction:rtl"><li>البيع داخل المتاجر</li> <li>الدليل الإرشادي التفاعلي</li><li>إستشارات البيع ونقاط البيع</li><li>الدفع الذاتي / صرّاف العملاء بإضافة الطابعة الحرارية</li></ul>',
                'thumbnail': ['../images/products/multitouchscreens/pos_small.jpg'],
                'large': ['../images/products/multitouchscreens/pos.jpg'],
                'button_list': [],
                'tags': []

            },

            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'الضيافة/نقاط الطلب والشراء',
                'description': '<p style="direction:rtl">تستطيعPolytouch®  المساهمة في عدة مجالات خاصة بقطاع الضيافة ونفاط الطلب والشراء. يمكن إستخدامها مثلا للتسجيل الذاتي الكامل للدخول أو المغادرة بالفنادق بقصد إختصار وقت التسجيل وإجراءات الدفع.</p><span class="label label-default" style="direction:rtl">أماكن الإستخدام  </span><br /><ul class="applist" style="direction:rtl"><li>نظام التسجيل والمغادرة الذاتي بالفنادق</li> <li>خدمة معلومات النزلاء</li><li> أنظمة الترفيه الشخصي</li><li>إدارة الحملات باستخدام رمز  QR</li><li>اللوحات الإعلانية الرقمية والعروض</li></ul>',
                'thumbnail': ['../images/products/multitouchscreens/hospitality_small.jpg'],
                'large': ['../images/products/multitouchscreens/hospitality.jpg'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'التســويق',
                'description': '<p style="direction:rtl">قم بعرض المحتويات الخاصة بأعمالك باسلوب تفاعلي وأخلق تجربة تسوق جديدة كما في مراكز التسوق العامة</p><span class="label label-default" style="direction:rtl">أماكن الإستخدام </span><br /><ul class="applist" style="direction:rtl"><li>عرض الفيديو والمنتجات التفاعلي</li> <li>توضيح تفاصيل المنتجات والإختيارات المتاحة</li><li>الإدارات القيادية</li><li>إدارة محتويات التسويق كالفيديو والعروض والمعلومات</li></ul>',
                'thumbnail': ['../images/products/multitouchscreens/communication_small.jpg'],
                'large': ['../images/products/multitouchscreens/communication.jpg'],
                'button_list': [],
                'tags': []

            },
            
            
            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'الأعمال البنكيّة',
                'description': '<p style="direction:rtl">يزداد الطلب على العروض التفاعلية المبتكرة وخصوصا في القطاع البنكي .  العملاء يتوقعون أن تكون عروض المنتجات متفاعلة ومتوافقة مع  ميولهم. بولي تتش  Polytouch ®  تضيف هذا البعد لعروض المنتجات.</p><span class="label label-default" style="direction:rtl">أماكن الإستخدام </span><br /><ul class="applist" style="direction:rtl"><li>الخدمات المصـرفيّة</li> <li>خدمات التأمين</li><li>القطاع العقــاري</li></ul>',
                'thumbnail': ['../images/products/multitouchscreens/banking_small.jpg'],
                'large': ['../images/products/multitouchscreens/banking.jpg'],
                'button_list': [],
                'tags': []

            },

            {
                'title': 'مشاهدة التفاصيل',
                'MainTitle': 'التذاكر/آلات الخدمة الذاتية',
                'description': '<p style="direction:rtl">الإستخدامات المصحوبة بحركة طلب عالية وخيارات سهلة من المنتجات تقدم Polytouch ®  لعملاء تلك الإستخدامات حلول شاملة وسريعة  لشراء التذاكر أو المساهمة في زيادة مبيعات المنتج من خلال تبسيط عملية الشراء.</p><span class="label label-default" style="direction:rtl">أماكن الإستخدام</span><br /><ul class="applist" style="direction:rtl"><li>نقاط بيع التذاكر</li> <li>الخدمات الإرشاديّة والمعلوماتيّة</li><li>المبيعات خارج المتجر</li></ul>',
                'thumbnail': ['../images/products/multitouchscreens/tiketing_small.jpg'],
                'large': ['../images/products/multitouchscreens/tiketing.jpg'],
                'button_list': [],
                'tags': []

            }



        ]

    });


    $("#content-wrap, .cat-pages").niceScroll({
        cursorcolor: "#d7d7d7",
        cursorwidth: "6px",
        cursorborder: "none",
        cursorborderradius: "8px",
        horizrailenabled: false,
        autohidemode: false
    });
    
  //  $('.mutliGallery').each(function () { $(this).hoverdir(); });

    // NAVIGATION
    $(function () {

        "use strict";

        $('a.page-scroll').bind('click', function (event) {

            var contentWrap = $("#content-wrap");
            var catPages = $(".cat-pages");
            var sectionId = $(this).attr('href');
            var rmenu = $('#responsive-menu');
            var ascroll = $('a.page-scroll');

            $("#content-wrap, .cat-pages").getNiceScroll().hide(0);
            ascroll.removeClass('nav-current');
            $(this).addClass('nav-current');
            rmenu.addClass('responsive-menu');
            clearTimeout(prr1); clearTimeout(prr2); clearTimeout(prr3); clearTimeout(prl1); clearTimeout(prl2); clearTimeout(prl3); clearTimeout(prn1); clearTimeout(prn2);
            clearTimeout(pll1); clearTimeout(pll2); clearTimeout(pll2); clearTimeout(plr1); clearTimeout(plr2); clearTimeout(plr3); clearTimeout(pln1); clearTimeout(pln2);

            setTimeout(function () {
                rmenu.css("opacity", "1");
            }, 100);

            if (!$(sectionId).hasClass('cat-pages-active')) {
                catPages.removeClass('cat-pages-active');
                $(sectionId).addClass('cat-pages-active');

                if ($(this).hasClass("page-right")) {

                    if (contentWrap.hasClass("content-wrap-right")) {

                        catPages.css("z-index", "2").removeClass('cat-left-0').removeClass('cat-left-25').addClass('cat-left-50');
                        var prr1 = setTimeout(function () {
                            catPages.css("display", "none");
                            $(sectionId).css({ "display": "block", "z-index": "3" });
                            catPages.removeClass('cat-left-50').removeClass('cat-left-0').addClass('cat-left-25');
                        }, 300);
                        var prr2 = setTimeout(function () {
                            $(sectionId).removeClass('cat-left-0').removeClass('cat-left-25').addClass('cat-left-50');
                        }, 350);
                        var prr3 = setTimeout(function () {
                            $("#content-wrap, .cat-pages").delay(1300).getNiceScroll().show(0).resize();
                        }, 1300);

                    } else if (contentWrap.hasClass("content-wrap-left")) {
                        catPages.removeClass('cat-left-50').removeClass('cat-left-25').addClass('cat-left-0');
                        var prl1 = setTimeout(function () {
                            catPages.css("display", "none");
                            $(sectionId).css("display", "block");
                        }, 1000);
                        var prl2 = setTimeout(function () {
                            $(sectionId).removeClass('cat-left-50').removeClass('cat-left-0').addClass('cat-left-50');
                        }, 1050);
                        var prl3 = setTimeout(function () {
                            $("#content-wrap, .cat-pages").delay(2100).getNiceScroll().show(0).resize();
                        }, 2000);
                    }

                    else {

                        $(sectionId).css("display", "block");
                        var prn1 = setTimeout(function () {
                            $(sectionId).removeClass('cat-left-0').removeClass('cat-left-25').addClass('cat-left-50').addClass('cat-pages-responsive-0');
                        }, 1);
                        var prn2 = setTimeout(function () {
                            $("#content-wrap, .cat-pages").delay(1300).getNiceScroll().show(0).resize();
                        }, 1300);
                    }

                    contentWrap.removeClass('cat-left-50').removeClass('cat-left-25').addClass('cat-left-0').removeClass("content-wrap-right").addClass("content-wrap-left");

                } else {

                    if (contentWrap.hasClass("content-wrap-left")) {

                        catPages.removeClass('cat-left-50').removeClass('cat-left-25').addClass('cat-left-0');
                        var pll1 = setTimeout(function () {
                            catPages.css("display", "none");
                            $(sectionId).css("display", "block");
                            catPages.removeClass('cat-left-50').removeClass('cat-left-0').addClass('cat-left-25');
                        }, 300);
                        var pll2 = setTimeout(function () {
                            $(sectionId).removeClass('cat-left-50').removeClass('cat-left-25').addClass('cat-left-0');
                        }, 350);
                        var pll3 = setTimeout(function () {
                            $("#content-wrap, .cat-pages").delay(1300).getNiceScroll().show(0).resize();
                        }, 1300);

                    } else if (contentWrap.hasClass("content-wrap-right")) {
                        catPages.removeClass('cat-left-0').removeClass('cat-left-25').addClass('cat-left-50');
                        var plr1 = setTimeout(function () {
                            catPages.css("display", "none");
                            $(sectionId).css("display", "block");
                        }, 1000);
                        var plr2 = setTimeout(function () {
                            $(sectionId).removeClass('cat-left-50').removeClass('cat-left-25').addClass('cat-left-0');
                        }, 1050);
                        var plr3 = setTimeout(function () {
                            $("#content-wrap, .cat-pages").delay(2100).getNiceScroll().show(0).resize();
                        }, 2000);
                    }

                    else {

                        $(sectionId).css("display", "block");
                        var pln1 = setTimeout(function () {
                            $(sectionId).removeClass('cat-left-50').removeClass('cat-left-25').addClass('cat-left-0').addClass('cat-pages-responsive-0');
                        }, 1);
                        var pln2 = setTimeout(function () {
                            $("#content-wrap, .cat-pages").delay(1300).getNiceScroll().show(0).resize();
                        }, 1300);
                    }

                    contentWrap.removeClass('cat-left-0').removeClass('cat-left-25').addClass('cat-left-50').removeClass("content-wrap-left").addClass("content-wrap-right");
                }
            } else {
                catPages.removeClass('cat-left-0').removeClass('cat-left-50').addClass('cat-left-25');
                contentWrap.removeClass("content-wrap-left").removeClass("content-wrap-right").removeClass('cat-left-0').removeClass('cat-left-50').addClass('cat-left-25');
                catPages.removeClass('cat-pages-active');
                ascroll.removeClass('nav-current');
                setTimeout(function () {
                    catPages.css("display", "none");
                }, 1000);
            }

            return false;
        });
    });


    // zoom images
    $('img.zoom').each(function () {
        $(this)
        .wrap('<span style="display:block" class="imgzoom"></span>')
        .css('display', 'block')
        .parent()
        .zoom();       
    });


    // stop video
    $('.stopback').trigger('click');

});