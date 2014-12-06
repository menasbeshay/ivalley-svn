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
                    $('.slideFooter').css('display', 'none');
                    $('#ds_p' + slideIndex).css('display', 'block');
                }
                else {
                    $('.slideFooter').css('display', 'none');
                }

            }
            else {
                $.fn.fullpage.setAllowScrolling(true);
                $.fn.fullpage.setKeyboardScrolling(true);
                $('#nextTopic').css('display', 'block');
                $('.slideFooter').css('display', 'none');
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
                'title': 'View details',
                'MainTitle': 'Advertisement',
                'description': '<ul class="applist"><li>Indoor advertising signage</li> <li>Outdoor advertising signage</li><li> Kiosk systems advertising module</li></ul>',
                'thumbnail': ['../images/Icons/png/1.png'],
                'large': ['../images/Icons/png/large/1.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'view details',
                'MainTitle': 'Airports',
                'description': '<ul class="applist"><li>Wayfinding</li> <li>indoor advertising signage</li><li>POS</li><li>Trips schedule information</li><li>Self Check-In </li></ul>',
                'thumbnail': ['../images/Icons/png/2.png'],
                'large': ['../images/Icons/png/large/2.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Public transportation',
                'description': '<ul class="applist"><li>Wayfinding</li> <li>indoor advertising signage</li><li>POS</li><li>Trips schedule information</li><li>Self Check-In </li></ul>',
                'thumbnail': ['../images/Icons/png/3.png'],
                'large': ['../images/Icons/png/large/3.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Banks',
                'description': '<ul class="applist"><li>Indoor advertising signage</li> <li>Employees self-service</li><li>Attendance fingerprint </li><li>Branches queuing management</li><li>Customers self-service</li><li>Management systems</li></ul>',
                'thumbnail': ['../images/Icons/png/4.png'],
                'large': ['../images/Icons/png/large/4.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Hotels',
                'description': '<ul class="applist"><li>Indoor advertising signage</li> <li>Employees self-service</li><li>Self-Service Check-In & Out </li><li>Wayfinding</li><li>Kitchen & room service operation systems management</li></ul>',
                'thumbnail': ['../images/Icons/png/5.png'],
                'large': ['../images/Icons/png/large/5.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Hospitals',
                'description': '<ul class="applist"><li>Wayfinding</li><li>Indoor advertising signage</li> <li>Patients service systems</li><li>Hospital management systems</li><li>Employees Self-Service</li></ul>',
                'thumbnail': ['../images/Icons/png/6.png'],
                'large': ['../images/Icons/png/large/6.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Hospitality',
                'description': '<ul class="applist"><li>Indoor advertising signage</li> <li>Menu display</li><li> Employees self-service</li><li>Self-Service Sales</li></ul>',
                'thumbnail': ['../images/Icons/png/7.png'],
                'large': ['../images/Icons/png/large/7.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Business',
                'description': '<ul class="applist"><li>Indoor advertising signage</li> <li>Employees self-service</li><li>Attendance fingerprint </li><li>Queuing  management</li><li>Customers self-service</li><li>POS</li><li>Consulting & Planning</li><li>Tradeshows</li></ul>',
                'thumbnail': ['../images/Icons/png/8.png'],
                'large': ['../images/Icons/png/large/8.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Public buildings & Real Estate',
                'description': '<ul class="applist"><li>Indoor advertising signage</li> <li>Real Estate marketing</li><li>Wayfinding</li><li>Real Estate management systems</li><li>POS</li><li>Information systems</li></ul>',
                'thumbnail': ['../images/Icons/png/9.png'],
                'large': ['../images/Icons/png/large/9.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Shopping',
                'description': '<ul class="applist"><li>Indoor advertising signage</li> <li>POS</li><li> Virtual fitting room</li><li>Products catalogue & information</li><li>Products Wayfinding</li><li>Employees Self-Service</li></ul>',
                'thumbnail': ['../images/Icons/png/10.png'],
                'large': ['../images/Icons/png/large/10.png'],
                'button_list': [],
                'tags': []

            },

            {
                'title': 'View details',
                'MainTitle': 'Industries',
                'description': '<ul class="applist"><li>Production management</li> <li>Showroom products display</li><li>Employees Self-Service</li><li>Tradeshows</li></ul>',
                'thumbnail': ['../images/Icons/png/11.png'],
                'large': ['../images/Icons/png/large/11.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Education',
                'description': '<ul class="applist"><li>Wayfinding for universities</li> <li>Students information</li><li>Student Self-Service</li><li>Educational materials display</li><li>Indoor advertising signage</li><li>Fingerprint staff attendance control</li><li>Consulting & Planning</li><li>Employees Self-Service</li><li>Queuing management</li><li>Tradeshows & Exhibitions</li></ul>',
                'thumbnail': ['../images/Icons/png/12.png'],
                'large': ['../images/Icons/png/large/12.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Stadiums',
                'description': '<ul class="applist"><li>Stadiums tickets dispensing</li> <li>Stadiums tickets barcode scanning</li><li> Indoor & Outdoor advertising signage</li><li>POS</li><li>Information systems</li><li>Employees Self-Service</li></ul>',
                'thumbnail': ['../images/Icons/png/13.png'],
                'large': ['../images/Icons/png/large/13.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Information points',
                'description': '<ul class="applist"><li>Wayfinding </li> <li>Public information systems</li><li> Public advertising</li><li>Indoor advertising</li></ul>',
                'thumbnail': ['../images/Icons/png/14.png'],
                'large': ['../images/Icons/png/large/14.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Government services',
                'description': '<ul class="applist"><li>Public information</li> <li>Public Self-Service</li><li>Employees Self-Service</li><li>Tradeshows</li></ul>',
                'thumbnail': ['../images/Icons/png/15.png'],
                'large': ['../images/Icons/png/large/15.png'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Hajj',
                'description': '<ul class="applist"><li>Wayfinding for pilgrims & Visitors</li> <li>Information systems</li><li> Trains & Buses schedules</li><li>Tickets dispensing </li><li>Outdoor Advertising</li><li>Lost & Found Info</li><li>Employees Self-Service</li><li>POS</li><li>Internet communications</li><li>Security communications</li></ul>',
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
                'title': 'View details',
                'MainTitle': 'POS / Kiosk systems',
                'description': '<p>Combine e-commerce with in-store commerce and extend your shelf space.The short installation depth and flat surface are ideal for integration at the point of sale.</p><span class="label label-default">Application areas : </span><ul class="applist"><li>in-store e-commerce</li> <li>interactive guide</li><li>product consultant / POS terminal</li><li>self-check-out / customer terminal (integrated POS thermal printer)</li></ul>',
                'thumbnail': ['../images/products/multitouchscreens/pos_small.jpg'],
                'large': ['../images/products/multitouchscreens/pos.jpg'],
                'button_list': [],
                'tags': []

            },

            {
                'title': 'View details',
                'MainTitle': 'Hospitality/Order terminals',
                'description': '<p>Polytouch® can also assist you in many areas of the sector of Hospitality/Order terminals. Present your standard processes such as check-in easily on the Polytouch®  and reduce the time for payment processes considerably.</p><span class="label label-default">Application areas : </span><ul class="applist"><li>check-in/check-out terminal</li> <li>concierge system</li><li> personal entertainment system</li><li>campaign management via QR codes</li><li>product presentations and digital signage</li></ul>',
                'thumbnail': ['../images/products/multitouchscreens/hospitality_small.jpg'],
                'large': ['../images/products/multitouchscreens/hospitality.jpg'],
                'button_list': [],
                'tags': []

            },
            {
                'title': 'View details',
                'MainTitle': 'Communication',
                'description': '<p>Showcase your interactive content and create new shopping experiences, e.g., in shopping malls.</p><span class="label label-default">Application areas : </span><ul class="applist"><li>interactive videos and product demonstrations</li> <li>visualization of details and product options</li><li>lead management </li><li>content handling (data sheets, videos, etc.)</li></ul>',
                'thumbnail': ['../images/products/multitouchscreens/communication_small.jpg'],
                'large': ['../images/products/multitouchscreens/communication.jpg'],
                'button_list': [],
                'tags': []

            },
            
            
            {
                'title': 'View details',
                'MainTitle': 'Banking',
                'description': '<p>The demand for innovative and interactive presentation possibilities is on the rise, particularly in the banking sector. Customers expect product presentations to appeal to their emotions. Polytouch® adds this new dimension to product presentation!</p><span class="label label-default">Application areas : </span><ul class="applist"><li>financial services</li> <li>insurances services</li><li>real estate sector</li></ul>',
                'thumbnail': ['../images/products/multitouchscreens/banking_small.jpg'],
                'large': ['../images/products/multitouchscreens/banking.jpg'],
                'button_list': [],
                'tags': []

            },

            {
                'title': 'View details',
                'MainTitle': 'Vending/Ticketing',
                'description': '<p>Especially for applications with high frequency and an easily comprehensible choice of products. Polytouch® offers your customers a convenient and fast carrying out of the purchase process of tickets as well as excellent cross and upselling potentials.</p><span class="label label-default">Application areas : </span><ul class="applist"><li>ticketing terminal</li> <li>directions terminal</li><li> alternative outlets out of the stores</li></ul>',
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


});