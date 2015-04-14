
$(function () {
    $('.bg-slide').mousemove(function (move) {
        var moveMouse = (move.pageX * -1 / 15);
        $('.bg-slide .slide12').css({
            'background-position': moveMouse + 'px 100%'
        });
    });
    //MOUSE LEAVE, ANIMATE BACKGROUND TO START POSITION
    $('.bg-slide').mouseleave(function () {
        $('.bg-slide .slide12').animate({
            'background-position': '50% 100%'
        });
    });

    $(".hover-both > li").mouseenter(function () {
        var className = $(this).attr('class');
        $("." + className).css({ background: "rgba(255,255,255,0.05)" });

    });
    $(".hover-both > li").mouseleave(function () {
        var className = $(this).attr('class');
        $("." + className).css({ background: "transparent" });

    });

    $("#nav-small").mouseenter(function () {
        $("#nav-large").show("slide", { direction: "left" }, 500);
        $("#logo1, #menu1, #contact1, #social").show("slide", { direction: "left" }, 500);
    });

    $("#header").mouseleave(function () {
        $("#logo1, #menu1, #contact1, #social, #nav-large").delay(100).hide("slide", { direction: "left" }, 1000);
    });

    // Call Back
    function enableButton() {
        $("#switch, #switch1, #toggle-button-up, #toggle-button-down").removeAttr("disabled", "disabled");
        $("#pull-me-down").fadeTo(300, 0.2).fadeTo(300, 1.0).fadeTo(300, 0.2).fadeTo(300, 1.0).fadeTo(300, 0.2).fadeTo(300, 1.0).fadeTo(300, 0.2).fadeTo(300, 1.0).fadeTo(300, 0.2).fadeTo(300, 1.0).fadeTo(300, 0.2).fadeTo(300, 1.0).fadeTo(300, 0.2).fadeTo(300, 1.0);
        autoPull();
    }
    function autoPull() {
        $("#toggle-button-up").delay(4000).fadeOut(100);
        $("#toggle-button-down").delay(4000).fadeIn(100, bulbGlow);
        $("#switch").delay(4000).attr('disabled', 'disabled');
        $("#toggle-button-up").delay(4000).attr('disabled', 'disabled');
    }
    // Show Small Nav Bar
    function showmenu() {
        $("#nav-small").show("slide", { direction: "left" }, 1000, scrollAllow);
        $("#logo, #menu, #contact, #arabic").show("slide", { direction: "left" }, 1000);
    }


    // Show Watch Icon
    function showWatch() {
        $("#watch-video").fadeIn(1000, showmenu);
    }
    // Icons Flowing Out
    function showflowouts() {

        $(".vp, .hp, .wf, .mt").fadeIn(1000, showWatch);

    }
    // PULL ME DOWN
    $("#switch, #toggle-button-up").click(function () {
        $("#toggle-button-up").fadeOut(100);
        $("#toggle-button-down").fadeIn(100, bulbGlow);
        $("#switch").attr('disabled', 'disabled');
        $("#toggle-button-up").attr('disabled', 'disabled');

    });
    $("#toggle-button-down, #switch1").click(function () {
        $("#toggle-button-down").fadeOut(100);
        $("#toggle-button-up").fadeIn(100, bulbOff);
        $("#switch").removeAttr('disabled', 'disabled');
        $("#toggle-button-up").removeAttr('disabled', 'disabled');
    });


    function bulbGlow() {
        $("#bulb-1, #bulb-2, #bulb-3, #bulb-4, #bulb-5, #bulb-6, #bulb-7").fadeOut(0);
        $("#bulboff").delay(0).fadeIn(0);
        $("#bulbon").fadeIn(100, bulbOff1);

    };
    function bulbGlow1() {
        $("#bulbon").fadeIn(100, bulbOff2);

    };
    function bulbGlow2() {
        $("#bulbon").fadeIn(100, showflowouts);

    };
    // Show Logo Slider
    function logoSlider() {
        $("#logo-slide").show("slide", { direction: "up" }, 1000, textSlider);
    };
    function textSlider() {
        $("#sager-text").fadeIn(1000, enableButton);
    };
    function bulbOff1() {
        $("#bulbon").fadeOut(0);

        $("#bulboff").delay(300).fadeIn(50, bulbGlow1);
    };
    function bulbOff2() {
        $("#bulbon").fadeOut(0);

        $("#bulboff").delay(700).fadeIn(50, bulbGlow2);
    };
    function bulbOff() {
        $("#bulbon").fadeOut(0);
        $(".vp, .hp, .wf, .mt").fadeOut(1000);
        $("#bulboff").fadeIn(100);
    };
    function bulb1() {

        $("#bulb-1").delay(500).fadeIn(500);
        $("#bulb-2").delay(1000).fadeIn(500);
        $("#bulb-3").delay(1500).fadeIn(500);
        $("#bulb-4").delay(2000).fadeIn(500);
        $("#bulb-5").delay(2500).fadeIn(500);
        $("#bulb-7").delay(3000).fadeIn(500);
        $("#bulb-6").delay(3500).fadeIn(500, logoSlider);


    };

    // Show Bulb
    function showBulb() {
        $("#bulb-container").show("blind", 2000, bulb1);
    };
    // set effect from select menu value
    $(document).ready(function () {
        showBulb();

        return true;
    });

    $(document).ready(function () {


    });
});


var rightKey, leftKey, topKey, bottomKey;

function scrollAllow() {

    //Set up the triggers for the arrow keys
    $(document).keydown(function (e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        var keypressed = e.keyCode;
        if (e.keyCode == 37 && typeof leftKey === 'function') {
            leftKey();
        } else if (e.keyCode == 38 && typeof topKey === 'function') {
            topKey();
        } else if (e.keyCode == 39 && typeof rightKey === 'function') {
            rightKey();
        } else if (e.keyCode == 40 && typeof bottomKey === 'function') {
            bottomKey();
        }
    });

    parallax.add($("#video"))
			.add($("#home"))
			.add($("#holography"))
			.add($("#productdes"))
			.add($("#productdes-1"))
			.add($("#services"))
			.add($("#corporate"))
			.add($("#wayfinding"))
			.add($("#polytouch"))
			.add($("#contactus"))
			.add($("#portfolio"))
			.add($("#join"));

    parallax.easing = 'linear';
    parallax.speed = 700;
    parallax.scaling = 0.1;

    //Clears each page navigation on load
    parallax.preload = function () {
        rightKey = leftKey = topKey = bottomKey = "";
    };


    //Setting up page navigation

    function hexHover() {
        $("#service-hex-2").mouseenter(function () {
            $("#hex-2-text").show("slide", { direction: "right" }, 1000);
            $("#service-hex-hover-2").fadeIn(1000);

        });
        $("#service-hex-2").mouseleave(function () {
            $("#service-hex-hover-2").stop(true, true).fadeOut(500);
            $("#hex-2-text").stop(true, true).fadeOut(500);
        });
        $("#service-hex-3").mouseenter(function () {
            $("#hex-3-text").show("slide", { direction: "right" }, 1000);
            $("#service-hex-hover-3").fadeIn(1000);

        });
        $("#service-hex-3").mouseleave(function () {
            $("#service-hex-hover-3").stop(true, true).fadeOut(500);
            $("#hex-3-text").stop(true, true).fadeOut(500);
        });
        $("#service-hex-4").mouseenter(function () {
            $("#hex-4-text").show("slide", { direction: "right" }, 1000);
            $("#service-hex-hover-4").fadeIn(1000);

        });
        $("#service-hex-4").mouseleave(function () {
            $("#service-hex-hover-4").stop(true, true).fadeOut(500);
            $("#hex-4-text").stop(true, true).fadeOut(500);
        });
        $("#service-hex-5").mouseenter(function () {
            $("#hex-5-text").show("slide", { direction: "right" }, 1000);
            $("#service-hex-hover-5").fadeIn(1000);

        });
        $("#service-hex-5").mouseleave(function () {
            $("#service-hex-hover-5").stop(true, true).fadeOut(500);
            $("#hex-5-text").stop(true, true).fadeOut(500);
        });
        $("#service-hex-6").mouseenter(function () {
            $("#hex-6-text").show("slide", { direction: "right" }, 1000);
            $("#service-hex-hover-6").fadeIn(1000);

        });
        $("#service-hex-6").mouseleave(function () {
            $("#service-hex-hover-6").stop(true, true).fadeOut(500);
            $("#hex-6-text").stop(true, true).fadeOut(500);
        });
    }

    function wayButton() {
        $("#button-3d-1").mouseenter(function () {
            /*$( "#button-3d-1-no-hover" ).hide("slide", {direction: "left"}, 500);*/
            $("#button-3d-hover-1").show("slide", { direction: "right" }, 500);

        });
        $("#button-3d-1").mouseleave(function () {
            /*$( "#button-3d-1-no-hover" ).show("slide", {direction: "left"}, 500);*/
            $("#button-3d-hover-1").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
        $("#button-3d-2").mouseenter(function () {
            /*$( "#button-3d-2-no-hover" ).hide("slide", {direction: "left"}, 500);*/
            $("#button-3d-hover-2").show("slide", { direction: "right" }, 500);

        });
        $("#button-3d-2").mouseleave(function () {
            /*$( "#button-3d-2-no-hover" ).show("slide", {direction: "left"}, 500);*/
            $("#button-3d-hover-2").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
    }
    function polyButton() {
        $("#poly-button-1").mouseenter(function () {
            /*$( "#poly-1-no-hover" ).hide("slide", {direction: "left"}, 500);*/
            $("#poly-hover-1").show("slide", { direction: "right" }, 500);

        });
        $("#poly-button-1").mouseleave(function () {
            /*$( "#poly-1-no-hover" ).show("slide", {direction: "left"}, 500);*/
            $("#poly-hover-1").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
        $("#poly-button-2").mouseenter(function () {
            /*$( "#poly-2-no-hover" ).hide("slide", {direction: "left"}, 500);*/
            $("#poly-hover-2").show("slide", { direction: "right" }, 500);

        });
        $("#poly-button-2").mouseleave(function () {
            /*$( "#poly-2-no-hover" ).show("slide", {direction: "left"}, 500);*/
            $("#poly-hover-2").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
        $("#poly-button-3").mouseenter(function () {
            /*$( "#poly-3-no-hover" ).hide("slide", {direction: "left"}, 500);*/
            $("#poly-hover-3").show("slide", { direction: "right" }, 500);

        });
        $("#poly-button-3").mouseleave(function () {
            /*$( "#poly-3-no-hover" ).show("slide", {direction: "left"}, 500);*/
            $("#poly-hover-3").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
    }
    function vidThumb() {
        $(".vid-hover").mouseenter(function () {
            $(".vid-play").show("slide", { direction: "right" }, 500);

        });
        $(".vid-hover").mouseleave(function () {
            $(".vid-play").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
        $(".vid-hover1").mouseenter(function () {
            $(".vid-play1").show("slide", { direction: "right" }, 500);

        });
        $(".vid-hover1").mouseleave(function () {
            $(".vid-play1").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
        $(".vid-hover2").mouseenter(function () {
            $(".vid-play2").show("slide", { direction: "right" }, 500);

        });
        $(".vid-hover2").mouseleave(function () {
            $(".vid-play2").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
        $(".vid-hover3").mouseenter(function () {
            $(".vid-play3").show("slide", { direction: "right" }, 500);

        });
        $(".vid-hover3").mouseleave(function () {
            $(".vid-play3").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
        $(".vid-hover4").mouseenter(function () {
            $(".vid-play4").show("slide", { direction: "right" }, 500);

        });
        $(".vid-hover4").mouseleave(function () {
            $(".vid-play4").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
        $(".vid-hover5").mouseenter(function () {
            $(".vid-play5").show("slide", { direction: "right" }, 500);

        });
        $(".vid-hover5").mouseleave(function () {
            $(".vid-play5").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
        $(".vid-hover6").mouseenter(function () {
            $(".vid-play6").show("slide", { direction: "right" }, 500);

        });
        $(".vid-hover6").mouseleave(function () {
            $(".vid-play6").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
        $(".vid-hover7").mouseenter(function () {
            $(".vid-play7").show("slide", { direction: "right" }, 500);

        });
        $(".vid-hover7").mouseleave(function () {
            $(".vid-play7").stop(true, true).hide("slide", { direction: "right" }, 500);

        });
    }
    function navClick() {

        $(".products").bind('click', function () {
            parallax["holography"].bottom();

        });
        $(".pds").bind('click', function () {
            parallax["productdes"].bottom();

        });
        $(".cbs").bind('click', function () {
            parallax["corporate"].bottom();

        });
        $(".ps").bind('click', function () {
            parallax["portfolio"].bottom();

        });
        $(".jus").bind('click', function () {
            parallax["join"].bottom();

        });
        $(".services").bind('click', function () {
            parallax["services"].bottom();
        });
        $("._3dway").bind('click', function () {
            parallax["wayfinding"].bottom();
        });
        $(".contact").bind('click', function () {
            parallax["contactus"].bottom();
        });
        $(".multi").bind('click', function () {
            parallax["polytouch"].bottom();
        });
        $(".home-icon ").bind('click', function () {
            parallax["home"].top();
        });
    }
    function resetMenu() {
        $(".products, .services, ._3dway, .multi, .contact").removeAttr("style", "background-color:rgba(255,255,255,0.05);");

        
    }

    function resetAllVideos() {
        mediaPlayer0 = document.getElementById('media-video');
        mediaPlayer0.pause();
        mediaPlayer1 = document.getElementById('holo-video');
        mediaPlayer9 = document.getElementById('presenter-video');
        mediaPlayer1.pause();
        mediaPlayer9.pause();
        mediaPlayer4 = document.getElementById('product-des-video');
        mediaPlayer4.pause();
        mediaPlayer2 = document.getElementById('service-video-cont');
        mediaPlayer2.pause();
        mediaPlayer5 = document.getElementById('3dflashvideo');
        mediaPlayer5.pause();
        mediaPlayer6 = document.getElementById('poly-vid');
        mediaPlayer6.pause();
        // reset all youtube videos 
        try {
            $('#testmon_vedio').stopYTP();
            $('#testmon_play').fadeIn("slow");
        } catch (err) { }

        try {
            $('.subgallery.column1.gridsInPlace #_3agarat_play').stopYTP();
            $('.subgallery.column1.gridsInPlace #_3agarat_play').fadeIn("slow");
        } catch (err) { }

        //reset css
        $('#port-text-def').removeClass('active');
    }

    parallax.home.onload = function () {
        resetAllVideos();
        navClick();
        $('#home').bind('mousewheel', function (e) {
            if (e.originalEvent.wheelDelta < 0) {
                //scroll down
                console.log('Down');
                parallax["holography"].bottom();
                $("#home-wrap").fadeOut(100);
            } else {
                //scroll up
                console.log('Up');
            }

            //prevent page fom scrolling
            return false;
        });

        $('#home').bind('DOMMouseScroll', function (e) {
            if (e.originalEvent.detail > 0) {
                parallax["holography"].bottom();
                $("#home-wrap").fadeOut(100);
            } else {
                //scroll up
                console.log('Up');
            }

            //prevent page fom scrolling
            return false;
        });

        resetMenu();
        $(".cbs, .pds").hide();
        $(".ps, .jus").show();
        $("#home-wrap").fadeIn();
        $(".products, .wf").bind('click', function () {
            parallax["holography"].bottom();
            $("#home-wrap").fadeOut(100);
        });

        $(".services, .vp").bind('click', function () {
            parallax["services"].bottom();
            $("#home-wrap").fadeOut(100);
        });
        $(".mt").bind('click', function () {
            parallax["polytouch"].bottom();
            $("#home-wrap").fadeOut(100);
        });
        $("._3dway, .hp").bind('click', function () {
            parallax["wayfinding"].bottom();
            $("#home-wrap").fadeOut(100);
        });
        $(".contact").bind('click', function () {
            parallax["contactus"].bottom();
            $("#home-wrap").fadeOut(100);
        });

        $("#watch-video").bind('click', function () {
            parallax["video"].right();
            $("#home-wrap").hide(100);
        });
        $(document).keydown(function (e) {
            if (e.keyCode == 40 || e.keyCode == 39) {
                $("#home-wrap").hide(100);

            }
        });
        setRight("video", "Video");
        setBottom("holography", "Holography");
    };

    parallax.video.onload = function () {
        resetAllVideos();
        $("#video-cover").show(100);
        mediaPlayer0 = document.getElementById('media-video');
        navClick();
        $(".cbs, .pds").hide();
        $(".ps, .jus").show();
        setLeft("home", "Home");
        $("#arrow-video").bind('click', function () {
            parallax["home"].left();
            mediaPlayer0.pause();
        });
        $("#watch-video-text, #watch-video-icon").click(function () {
            $("#video-cover").hide(500);
            mediaPlayer0.play();

        });
        $(".start-video-again").click(function () {
            //mediaPlayer0.src = "media/demo1.mp4";
            mediaPlayer0.play();

        });
        $(document).keydown(function (e) {
            if (e.keyCode == 37) {
                mediaPlayer0.pause();
            }
        });
    };

    parallax.holography.onload = function () {
        resetAllVideos();
        mediaPlayer1 = document.getElementById('holo-video');
        mediaPlayer9 = document.getElementById('presenter-video');
        mediaPlayer9.src = "media/3MB.mp4";
        if (document.location.href.indexOf("arabic") > -1)
            mediaPlayer9.src = "media/ffwebpresenter_a.mp4";
        mediaPlayer9.load();
        mediaPlayer9.play();
        mediaPlayer9.onended = function (e) {
            $("#play").fadeOut(0);
            $("#pause1").fadeIn(0);
        };

        $('#holography').removeAttr("style", "position:absolute");
        $("#holography-cover").fadeIn(200);
        $('#holography').bind('mousewheel', function (e) {
            if (e.originalEvent.wheelDelta < 0) {
                //scroll down
                console.log('Down');
                parallax["services"].bottom();
                mediaPlayer1.pause();
                mediaPlayer9.pause();
                $("#holography-cover").fadeOut(500);
            } else {
                parallax["home"].top();
                $("#holography-cover").fadeOut(500);
                console.log('Up');
                mediaPlayer1.pause();
                mediaPlayer9.pause();
            }

            //prevent page fom scrolling
            return false;
        });

        $('#holography').bind('DOMMouseScroll', function (e) {
            if (e.originalEvent.detail > 0) {
                parallax["services"].bottom();
                mediaPlayer1.pause();
                mediaPlayer9.pause();
                $("#holography-cover").fadeOut(500);
            } else {
                parallax["home"].top();
                $("#holography-cover").fadeOut(500);
                mediaPlayer1.pause();
                mediaPlayer9.pause();
                console.log('Up');
            }

            //prevent page fom scrolling
            return false;
        });

        navClick();
        resetMenu();
        vidThumb();
        $("#mac").show("slide", { direction: "up" }, 2000);
        /*$(".pds").show();
        $(".cbs").hide();*/
        $(".ps, .jus").show();
        $("#mac1").mouseenter(function () {
            /*$(".media-icon-hover").stop( true, true ).removeAttr("style", "visibility:hidden");*/

        });
        $("#mac1").mouseleave(function () {
            /*$(".media-icon-hover").stop( true, true ).attr("style","visibility:hidden");*/

        });

        $("#shadow").fadeIn(2000);
        /*
                $("#presenter").stop( true, true ).show("slide", {direction: "right"}, 3000);
        */
        $("#read-more").delay(3000).show();
        $(".products").attr("style", "background-color:rgba(255,255,255,0.05);");
        $(".heading1").fadeIn(1000);
        /*$( ".heading1" ).effect("scale", {percent: 150, scale: 'content',  origin: ["right", "top"]},1000);*/
        $("#read-more").click(function () {
            $("#holography-cover").fadeOut(500);
            parallax["productdes"].right();
            mediaPlayer1.pause();
            mediaPlayer9.pause();
            /*
				$("#presenter").hide("slide", {direction: "right"}, 3000);
				$("#read-more").hide();
				$("#holo-middle").hide("slide", {direction: "up"}, 1000);
				$("#shadow").delay(2000).css("opacity","0", 1000);
			*/
        });

        $("#mac1, .media-icon-hover, .vid-hover, .vid-hover1, .vid-hover2").click(function () {
            /*
				$( "#mac1, .media-icon-hover" ).fadeOut(500);
				$( "#mac2" ).fadeIn(500);
			*/


        });
        $("#play").click(function () {
            mediaPlayer9.pause();
            $("#play").fadeOut(0);
            $("#pause1").fadeIn(0);
        });
        $("#volume").click(function () {
            mediaPlayer9.volume = 0.0;
            $("#volume").fadeOut(0);
            $("#no-volume").fadeIn(0);

        });

        $("#pause1").click(function () {
            mediaPlayer9.play();
            $("#pause1").fadeOut(0);
            $("#play").fadeIn(0);


        });

        $("#no-volume").click(function () {
            mediaPlayer9.volume = 1.0;
            $("#no-volume").fadeOut(0);
            $("#volume").fadeIn(0);

        });
        $("#arrow-holo-more").click(function () {
            $(".vid-hover4, .vid-hover5, .vid-hover6, .vid-hover7").fadeIn(10);
            $(".vid-hover, .vid-hover1, .vid-hover2, .vid-hover3").fadeOut(10);
        });
        $("#arrow-holo-more-left").click(function () {
            $(".vid-hover, .vid-hover1, .vid-hover2, .vid-hover3").fadeIn(10);
            $(".vid-hover4, .vid-hover5, .vid-hover6, .vid-hover7").fadeOut(10);
        });
        $(".vid-hover").click(function () {            
            mediaPlayer1.src = "media/videos/holo1.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer1.src = "media/videos/arabic/holo1.mp4";
            mediaPlayer1.load();
            mediaPlayer1.play();
            mediaPlayer9.pause();

        });
        $(".vid-hover1").click(function () {
            mediaPlayer1.src = "media/videos/holo2.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer1.src = "media/videos/arabic/holo2.mp4";
            mediaPlayer1.load();
            mediaPlayer1.play();
            mediaPlayer9.pause();

        });
        $(".vid-hover2").click(function () {
            mediaPlayer1.src = "media/videos/holo3.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer1.src = "media/videos/arabic/holo3.mp4";
            mediaPlayer1.load();
            mediaPlayer1.play();
            mediaPlayer9.pause();
        });
        $(".vid-hover3").click(function () {
            mediaPlayer1.src = "media/videos/holo4.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer1.src = "media/videos/arabic/holo4.mp4";
            mediaPlayer1.load();
            mediaPlayer1.play();
            mediaPlayer9.pause();
        });
        $(".vid-hover4").click(function () {
            mediaPlayer1.src = "media/videos/holo5.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer1.src = "media/videos/arabic/holo5.mp4";
            mediaPlayer1.load();
            mediaPlayer1.play();
            mediaPlayer9.pause();
        });
        $(".vid-hover5").click(function () {
            mediaPlayer1.src = "media/videos/holo6.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer1.src = "media/videos/arabic/holo6.mp4";
            mediaPlayer1.load();
            mediaPlayer1.play();
            mediaPlayer9.pause();
        });
        $(".vid-hover6").click(function () {
            mediaPlayer1.src = "media/videos/holo7.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer1.src = "media/videos/arabic/holo7.mp4";
            mediaPlayer1.load();
            mediaPlayer1.play();
            mediaPlayer9.pause();
        });
        $(".vid-hover7").click(function () {
            mediaPlayer1.src = "media/videos/holo8.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer1.src = "media/videos/arabic/holo8.mp4";
            mediaPlayer1.load();
            mediaPlayer1.play();
            mediaPlayer9.pause();
        });
        $(document).keydown(function (e) {
            if (e.keyCode == 40 || e.keyCode == 39 || e.keyCode == 38) {
                /*
                    
                    $("#presenter").hide("slide", {direction: "right"}, 3000);
                    $("#read-more").hide();
                    $("#holo-middle").hide("slide", {direction: "up"}, 1000);
                    $("#shadow").delay(2000).css("opacity","0", 1000);
                */
                mediaPlayer1.pause();
                mediaPlayer9.pause();
                $("#holography-cover").fadeOut(500);
            }
        });

        setTop("home", "Home");
        setRight("productdes", "Home");
        setBottom("services", "Home");


    };

    parallax.productdes.onload = function () {
        resetAllVideos();
        mediaPlayer4 = document.getElementById('product-des-video');
        mediaPlayer4.src = "media/demo1.mp4";
        mediaPlayer4.load();
        mediaPlayer4.play();
        navClick();
        resetMenu();
        /*$(".pds").show();*/
        $(".ps, .jus").show();
        $(".cbs").hide();
        $(".products").attr("style", "background-color:rgba(255,255,255,0.05);");
        $(".heading2").fadeIn(1000);
        setLeft("holography", "Holography Projection");
        $("#arrow-product-des").bind('click', function () {
            parallax["holography"].left();
            mediaPlayer4.pause();
        });
        $(document).keydown(function (e) {
            if (e.keyCode == 37) {
                mediaPlayer4.pause();
            }
        });
    };

    parallax.services.onload = function () {
        resetAllVideos();
        mediaPlayer2 = document.getElementById('service-video-cont');
        $("#services-cover").fadeIn();

        $('#services').bind('mousewheel', function (e) {
            if (e.originalEvent.wheelDelta < 0) {
                mediaPlayer2.pause();
                //scroll down
                console.log('Down');
                parallax["polytouch"].bottom();
                $("#services-cover").fadeOut(500);
            } else {
                mediaPlayer2.pause();
                parallax["holography"].top();
                console.log('Up');
                $("#services-cover").fadeOut(500);
            }

            //prevent page fom scrolling
            return false;
        });

        $('#services').bind('DOMMouseScroll', function (e) {
            if (e.originalEvent.detail > 0) {
                mediaPlayer2.pause();
                parallax["polytouch"].bottom();
                $("#services-cover").fadeOut(500);
            } else {
                mediaPlayer2.pause();
                parallax["holography"].top();
                $("#services-cover").fadeOut(500);
                console.log('Up');
            }

            //prevent page fom scrolling
            return false;
        });
        /*$(".cbs").show();*/
        $(".pds").hide();
        $(".ps, .jus").show();
        navClick();
        resetMenu();
        /* hexHover(); */
        $(".services").attr("style", "background-color:rgba(255,255,255,0.05);");
        $(".heading3").fadeIn(1000);
        $("#discover").bind('click', function () {
            parallax["corporate"].right();
            $("#services-cover").fadeOut(500);

        });


        $(document).keydown(function (e) {
            if (e.keyCode == 40 || e.keyCode == 39 || e.keyCode == 38) {
                $("#services-cover").fadeOut(500);
                mediaPlayer2.pause();
                $(mediaPlayer2).css('z-index', '-99');
            }
        });

        $("#service-hex-2, #service-video, #service-media").click(function () {
            mediaPlayer2.src = "media/videos/s_mobile.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer2.src = "media/videos/arabic/s_mobile.mp4";
            mediaPlayer2.load();            
            mediaPlayer2.play();
            $(mediaPlayer2).css('z-index', '1');

        });
        $("#service-hex-3").click(function () {
            mediaPlayer2.src = "media/videos/s_anim.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer2.src = "media/videos/arabic/s_anim.mp4";
            mediaPlayer2.load();
            mediaPlayer2.play();
            $(mediaPlayer2).css('z-index', '1');
        });
        $("#service-hex-4").click(function () {
            mediaPlayer2.src = "media/videos/s_vp.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer2.src = "media/videos/arabic/s_vp.mp4";
            mediaPlayer2.load();
            mediaPlayer2.play();
            $(mediaPlayer2).css('z-index', '1');
            /*
				$( "#service-vid-1, #service-vid-2, #service-vid-4, #service-vid-5" ).hide(500);
				$( "#service-vid-3" ).fadeIn(500);
			*/
        });
        $("#service-hex-5").click(function () {
            mediaPlayer2.src = "media/videos/s_web.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer2.src = "media/videos/arabic/s_web.mp4";
            mediaPlayer2.load();
            mediaPlayer2.play();
            $(mediaPlayer2).css('z-index', '1');
            /*
				$( "#service-vid-1, #service-vid-2, #service-vid-3, #service-vid-5" ).hide(500);
				$( "#service-vid-4" ).fadeIn(500);
			*/

        });
        $("#service-hex-6").click(function () {
            mediaPlayer2.src = "media/videos/s_3dv.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer2.src = "media/videos/arabic/s_3dv.mp4";
            mediaPlayer2.load();
            mediaPlayer2.play();
            $(mediaPlayer2).css('z-index', '1');
            /*
				$( "#service-vid-1, #service-vid-2, #service-vid-3, #service-vid-4" ).hide(500);
				$( "#service-vid-5" ).fadeIn(500);
			*/

        });

        setTop("holography", "Holography Projection");
        setRight("corporate", "Corporate Branding");
        setBottom("polytouch", "Polytouch");
    };

    parallax.corporate.onload = function () {
        resetAllVideos();
        $(".pds").hide();
        $(".ps, .jus").show();
        navClick();
        resetMenu();
        $("#corp-1, #corp-2").show('slide', { direction: "left" }, 500);
        $("#corp-3").delay(500).show('slide', { direction: "left" }, 500);
        $("#corp-4").delay(1000).show('slide', { direction: "left" }, 500);
        $(".services").attr("style", "background-color:rgba(255,255,255,0.05);");
        setLeft("services", "Services");
        /*$(".cbs").show();*/
        $("#arrow-corporate").bind('click', function () {
            parallax["services"].left();
        });
        $(document).keydown(function (e) {
            if (e.keyCode == 37) {
                /*
                    $( "#corp-1, #corp-2, #corp-3, #corp-4" ).hide();
                */
            }
        });
    };

    parallax.wayfinding.onload = function () {
        resetAllVideos();
        //mediaPlayer5 = document.getElementById('way-vid');
        mediaPlayer5 = document.getElementById('3dflashvideo');
        mediaPlayer5.load();
        mediaPlayer5.play();
        $('#wayfinding').removeAttr("style", "position:absolute");
        $("#wayfinding-cover").fadeIn(300);
        $('#wayfinding').bind('mousewheel', function (e) {
            if (e.originalEvent.wheelDelta < 0) {
                //scroll down
                console.log('Down');
                parallax["contactus"].bottom();
                $("#wayfinding-cover").fadeOut(500);
                mediaPlayer5.pause();
            } else {
                parallax["polytouch"].top();
                console.log('Up');
                $("#wayfinding-cover").fadeOut(500);
                mediaPlayer5.pause();
            }

            //prevent page fom scrolling
            return false;
        });

        $('#wayfinding').bind('DOMMouseScroll', function (e) {
            if (e.originalEvent.detail > 0) {
                parallax["contactus"].bottom();
                $("#wayfinding-cover").fadeOut(500);
                mediaPlayer5.pause();
            } else {
                parallax["polytouch"].top();
                console.log('Up');
                $("#wayfinding-cover").fadeOut(500);
                mediaPlayer5.pause();
            }

            //prevent page fom scrolling
            return false;
        });
        navClick();
        $("#way-vid, .watch-button").click(function () {

            mediaPlayer5.src = "media/videos/3dway.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer5.src = "media/videos/arabic/3dway.mp4";
            mediaPlayer5.load();
            mediaPlayer5.play();

        });
        /*		
            $("#arrow-wayfinding").bind('click', function(){
                parallax["polytouch"].right();
                            mediaPlayer5.pause();
        });
            */
        resetMenu();
        $(".cbs, .pds").hide();
        $(".ps, .jus").show();
        $("._3dway").attr("style", "background-color:rgba(255,255,255,0.05);");
        $("#way-left").fadeIn(300);
        $("#way-left").animate({ left: "7.4%" }, 200);
        $("#way-right").fadeIn(300);
        $("#way-right").animate({ right: "40px" }, 200);
        $(".heading4").fadeIn(1000);
        $(document).keydown(function (e) {

            if (e.keyCode == 40 || e.keyCode == 38) {
                $("#wayfinding-cover").fadeOut(500);
                /*
                                $( "#way-left" ).stop().animate({ left: "50px" });
                                $( "#way-right" ).stop().animate({ right: "0px" });
                */
                mediaPlayer5.pause();
            }
        });

        setTop("polytouch", "Polytouch");
        setBottom("contactus", "contactus Us");
    };
    parallax.polytouch.onload = function () {
        resetAllVideos();
        $("#polytouch-cover").fadeIn(300);
        $('#polytouch').bind('mousewheel', function (e) {
            if (e.originalEvent.wheelDelta < 0) {
                //scroll down
                console.log('Down');
                parallax["wayfinding"].bottom();
                $("#polytouch-cover").fadeOut(500);
                mediaPlayer6.pause();
            } else {
                parallax["services"].top();
                console.log('Up');
                $("#polytouch-cover").fadeOut(500);
                mediaPlayer6.pause();
            }

            //prevent page fom scrolling
            return false;
        });

        $('#polytouch').bind('DOMMouseScroll', function (e) {
            if (e.originalEvent.detail > 0) {
                parallax["wayfinding"].bottom();
                $("#polytouch-cover").fadeOut(500);
                mediaPlayer6.pause();
            } else {
                parallax["services"].top();
                console.log('Up');
                $("#polytouch-cover").fadeOut(500);
                mediaPlayer6.pause();
            }

            //prevent page fom scrolling
            return false;
        });
        mediaPlayer6 = document.getElementById('poly-vid');
        $("#poly-tv, #poly-button-2").click(function () {
            if ($.browser.mozilla == true)
                return;
            mediaPlayer6.src = "media/videos/polytouch.mp4";
            if (document.location.href.indexOf("arabic") > -1)
                mediaPlayer6.src = "media/videos/arabic/polytouch.mp4";
            mediaPlayer6.load();
            mediaPlayer6.play();

        });
        $("#way-left1").fadeIn(300);
        $("#way-left1").animate({ left: "7.4%" }, 200);
        $("#way-right1").fadeIn(300);
        $("#way-right1").animate({ right: "10px" }, 200);
        $(".heading4").fadeIn(1000);
        $("#arrow-polytouch").bind('click', function () {
            parallax["wayfinding"].left();
            mediaPlayer6.pause();
        });
        navClick();
        resetMenu();
        $(".ps, .jus").show();
        $(".cbs, .pds").hide();
        $(".multi").attr("style", "background-color:rgba(255,255,255,0.05);");
        $(".heading5").fadeIn(1000);

        $(document).keydown(function (e) {

            if (e.keyCode == 40 || e.keyCode == 38) {
                /*
                                $( "#way-left1" ).stop().animate({ left: "50px" });
                                $( "#way-right1" ).stop().animate({ right: "0px" });
                */
                mediaPlayer6.pause();
            }
        });

        setTop("services", "Services");
        setBottom("wayfinding", "3D Wayfinding");
    };

    parallax.contactus.onload = function () {
        resetAllVideos();
        $('#contactus').bind('mousewheel', function (e) {
            if (e.originalEvent.wheelDelta < 0) {
                //scroll down
                console.log('Down');
                $('#ContactModal').modal('hide');
            } else {
                parallax["wayfinding"].top();
                console.log('Up');
                $('#ContactModal').modal('hide');
            }

            //prevent page fom scrolling
            return false;
        });

        $('#contactus').bind('DOMMouseScroll', function (e) {
            if (e.originalEvent.detail > 0) {
                $('#ContactModal').modal('hide');
            } else {
                parallax["wayfinding"].top();
                console.log('Up');
                $('#ContactModal').modal('hide');
            }

            //prevent page fom scrolling
            return false;
        });
        navClick();
        resetMenu();
        $(".ps, .jus").show();
        $(".cbs, .pds").hide();
        $(".contact").attr("style", "background-color:rgba(255,255,255,0.05);");
        $("#watch-port").click(function () {
            parallax["portfolio"].right();
            $('#ContactModal').modal('hide');
        });
        $(".heading6").fadeIn(1000);

        $(".contact-image").mouseenter(function () {
            $(".contact-image-hover").fadeIn(500);

        });
        $(".contact-image").mouseleave(function () {
            $(".contact-image-hover").fadeOut(500);

        });
        $(document).keydown(function (e) {

            if (e.keyCode == 39 || e.keyCode == 38) {
                $('#ContactModal').modal('hide');
            }
        });
        setRight("portfolio", "Portfolio");
        setTop("wayfinding", "3D Wayfiniding");
        var center = map.getCenter();
        google.maps.event.trigger(map, "resize");
        map.setCenter(center);
    };

    parallax.portfolio.onload = function () {
        resetAllVideos();
        navClick();
        resetMenu();
       
        $('#port-text-def').addClass('active');
        $(".ps, .jus").show();
        $(".cbs, .pds").hide();
        $(".contact").attr("style", "background-color:rgba(255,255,255,0.05);");
        $(".heading7").fadeIn(1000);


        $("#work-with-us").click(function () {
            parallax["join"].right();
        });
        $("#arrow-portfolio").bind('click', function () {
            parallax["contactus"].left();
        });
        setLeft("contactus", "contactus Us");
        setRight("join", "Join");
        $('#portfolio_grid').fadeOut();
        $('#default_port').fadeIn();
        $('#port-text-def').fadeIn();
        $('#port-text-caption').fadeOut();
    };
    
    parallax.join.onload = function () {
        resetAllVideos();
        $(".ps, .jus").show();
        $(".cbs, .pds").hide();
        navClick();
        resetMenu();
        $(".contact").attr("style", "background-color:rgba(255,255,255,0.05);");
        $(".heading8").fadeIn(1000);
        setLeft("portfolio", "Portfolio");
        $("#arrow-join").bind('click', function () {
            parallax["portfolio"].left();
        });
    };

    //Sets the correct triggers for the arrows, plus arrow keys
    function setRight(page, text) {
        $("#rightText").text(text);
        $("#rightControl").show().unbind('click').click(function () {
            parallax[page].right();
        });
        rightKey = function () {
            parallax[page].right();
        };
    }

    function setLeft(page, text) {
        $("#leftText").text(text);
        $("#leftControl").show().unbind('click').click(function () {
            parallax[page].left();
        });
        leftKey = function () {
            parallax[page].left();
        };
    }

    function setTop(page, text) {
        $("#topText").text(text);
        $("#topControl").show().unbind('click').click(function () {
            parallax[page].top();
        });
        topKey = function () {
            parallax[page].top();
        };
    }

    function setBottom(page, text) {
        $("#bottomText").text(text);
        $("#bottomControl").show().unbind('click').click(function () {
            parallax[page].bottom();
        });
        bottomKey = function () {
            parallax[page].bottom();
        };
    }

    parallax.home.show();

}
