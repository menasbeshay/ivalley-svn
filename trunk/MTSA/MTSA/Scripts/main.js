$(document).ready(function () {
    $('#nav_land_sub').click(function () {
        $('#landing_sub').css('display', 'block');
        $('#topics').animate({ "left": "-=1440px;" }, "slow");
        $("#landing_sub").animate({ "left": "-=1440px;" }, "slow");
        //$.scrollTo($('#landing_sub'), 900, { axis: "y", easing: easing });
    });

    $('#topics').find("article > span.scrollDetectMiddle").bind("inview", function (event, isInView) {
        if (isInView) {
            
        } else {
            
        }
    });
    
});