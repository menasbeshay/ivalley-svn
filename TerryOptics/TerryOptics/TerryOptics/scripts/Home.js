(function ($) {
    $("#main_content_wrapper").addClass("new-wrapper");
    var containerWidth = 0;
    var clickCounter = 0;
    if ($("#four-grid-espot").hasClass("isA")) {
        $('.zone [id ^= "WC_ContentAreaESpot_div_15_"]').filter(function () {
            return $(this).children().length > 0
        }).each(function (i) {
            var zone = $(this).closest(".zone");
            containerWidth = $(this).width();
            var current, counter, zone, total, previousButton, nextButton; current = 1;
            total = zone.find('[id^="WC_ContentAreaESpot_td_2_"]').length;
            containerWidth *= total; $(this).css("width", containerWidth + "px");
            counter = $("<div/>").addClass("counter").text(current + " / " + total);
            previousButton = $("<a />").addClass("previous").attr("href", "#");
            nextButton = $("<a />").addClass("next").attr("href", "#");
            previousButton.addClass("disabled");
            if (total == 1) { nextButton.addClass("disabled") }
            zone.wrapInner('<div class="productRotator" />');
            zone.prepend(previousButton); zone.append(nextButton);
            zone.append(counter);
            previousButton.click(function () {
                if (current != 1) {
                    var container = zone.find("[id^=WC_ContentAreaESpot_div_15]");
                    container.css("position", "relative").animate({ left: "+=626px" }, 500);
                    current -= 1; zone.find(counter).text(current + " / " + total);
                    if (current == 1) { previousButton.addClass("disabled") }
                    nextButton.removeClass("disabled")
                } return false
            });
            nextButton.click(function () {
                if (current != total) {
                    var container = zone.find("[id^=WC_ContentAreaESpot_div_15]");
                    container.css("position", "relative").animate({ left: "-=626px" }, 500);
                    current += 1; zone.find(counter).text(current + " / " + total);
                    if (current == total) { nextButton.addClass("disabled") }
                    previousButton.removeClass("disabled")
                } return false
            })
        })
    } else {
        $('.zone [id ^= "WC_ContentAreaESpot_div_15_"]').filter(function () {
            return $(this).children().length > 0
        }).each(function (i) {
            var zone = $(this).closest(".zone");
            containerWidth = $(this).width();
            var current, counter, zone, total, previousButton, nextButton, counterWidth = 0, counterMargin = -8; current = 1;
            total = zone.find('[id^="WC_ContentAreaESpot_td_2_"]').length; containerWidth *= total;
            $(this).css("width", containerWidth + "px");
            counter = $("<ul/>").addClass("counter");
            for (j = 0; j < total; j++) {
                counterWidth += 10; counterMargin += 8; counter.append("<li/>")
            }
            var marginLeft = (counterWidth + counterMargin) / 2;
            counter.css("marginLeft", "-" + marginLeft + "px");
            counter.children().eq(clickCounter).addClass("active");
            previousButton = $("<a />").addClass("previous").attr("href", "#");
            nextButton = $("<a />").addClass("next").attr("href", "#");
            previousButton.addClass("disabled");
            if (total == 1) {
                nextButton.addClass("disabled")
            }
            zone.wrapInner('<div class="productRotator" />');
            zone.prepend(previousButton); 
            zone.append(nextButton);
            zone.append(counter); 
            previousButton.click(function () {
                if (current != 1) {
                    var container = zone.find("[id^=WC_ContentAreaESpot_div_15]");
                    container.css("position", "relative").animate({ left: "+=310px" }, 500);
                    current -= 1;
                    if (current == 1) {
                        previousButton.addClass("disabled")
                    }
                    nextButton.removeClass("disabled");
                    clickCounter--;
                    console.log(clickCounter);
                    counter.children().eq(clickCounter + 1).removeClass("active").prev().addClass("active")
                } return false
            });
            nextButton.click(function () {
                if (current != total) {
                    var container = zone.find("[id^=WC_ContentAreaESpot_div_15]");
                    container.css("position", "relative").animate({ left: "-=310px" }, 500);
                    current += 1;
                    if (current == total) {
                        nextButton.addClass("disabled")
                    }
                    previousButton.removeClass("disabled");
                    clickCounter++; counter.children().eq(clickCounter - 1).removeClass("active").next().addClass("active")
                }
                return false
            })
        })
    }
    $(".zone").each(function () {
        var content = $(this).find(".genericESpot .espot_content");
        var slides = content.children(".slide"); if (content.length == slides.length && slides.length > 1) {
            var zone = $(this).wrapInner('<div class="heroRotator" />');
            var controlBar = $("<ul />").addClass("controlBar");
            var sp = $("<span />").text("play");
            var playPauseButton = $("<li />").addClass("play-pause").addClass("playing"); playPauseButton.append(sp);
            var slideButtons = [];
            var rotationSpeed = 5000;
            var remain = slides.length - 3;
            var right = -(remain * 23);
            var right2 = (remain * 24);
            for (var i = 0; i < slides.length; i++) {
                var button = $("<li />").addClass("controlButton").text(i + 1);
                var thumbnail = slides.eq(i).siblings(".thumb");
                var arrow = $("<div />").addClass("thumb-arrow");
                if (i > 1 && slides.length > 2) {
                    thumbnail.css("right", right + "px");
                    arrow.css("left", "");
                    arrow.css("right", right2 + "px");
                    right += 23; right2 -= 23
                }
                else {
                    if (slides.length <= 3) {
                        right = -(Math.floor(47 / (i + 1)));
                        right2 = (Math.floor(52 / (i + 1)));
                        thumbnail.css("right", right + "px");
                        arrow.css("left", "");
                        arrow.css("right", right2 + "px")
                    }
                }
                button.append(thumbnail);
                thumbnail.append(arrow);
                controlBar.append(button);
                slideButtons.push(button);
                button.mouseover(function (e) {
                    $(this).find(".thumb").show()
                });
                button.mouseout(function (e) {
                    $(this).find(".thumb").hide()
                })
            }
            playPauseButton.appendTo(controlBar);
            slideButtons[0].addClass("current");
            slides.eq(0).addClass("current");
            controlBar.appendTo(zone);
            controlBar.find(".controlButton").each(function (index, el) {
                var button = $(el);
                var slide = slides.eq(index);
                button.click(function () {
                    var animating = zone.data("animating");
                    if (!button.is(".current") && !animating) {
                        zone.data("animating", true);
                        zone.find(".slide.current, .controlButton.current").removeClass("current");
                        var showNewSlideFunc = function () {
                            zone.find(".controlButton").eq(index).addClass("current");
                            zone.find(".slide").eq(index).addClass("current").fadeIn(250, function () {
                                zone.data("animating", false)
                            })
                        };
                        if (zone.find(".slide:visible").length > 0) {
                            zone.find(".slide:visible").fadeOut(250, showNewSlideFunc)
                        }
                        else {
                            zone.find(".slide").hide(); showNewSlideFunc()
                        }
                    }
                })
            });
            zone.find(".slide").not(".current").hide();
            playPauseButton.click(function () {
                playPauseButton.toggleClass("playing")
            });
            if (zone.find("input.rotationSpeed").length > 0) {
                var rotSpeed = parseFloat(zone.find("input.rotationSpeed").val());
                if (rotSpeed) {
                    rotationSpeed = rotSpeed * 1000
                }
            }
            setInterval(function () {
                if (playPauseButton.is(".playing")) {
                    var buttons = controlBar.find(".controlButton");
                    var currentButton = buttons.filter(".current");
                    var index = (buttons.index(currentButton) + 1) % buttons.length; buttons.eq(index).click()
                }
            }, rotationSpeed)
        }
        $("#bgEspot").appendTo("body").width($(document).width()).height($(document).height())
    });
    $(".hover").mouseover(function () {
        $(this).animate({ opacity: 0 }, 250)
    });
    $(".hover").mouseout(function () {
        $(this).animate({ opacity: 1 }, 250)
    })
})
(jQuery);