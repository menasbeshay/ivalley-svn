

/*-----------------------------------------------------------------------------------*/
/*	Menu Dropdown Control
/*-----------------------------------------------------------------------------------*/
$('.main-nav li').hover(function () {
    $(this).children('ul').stop(true, true).slideDown(500);
}, function () {
    $(this).children('ul').stop(true, true).slideUp(500);
});




/* template selection */

$(document).ready(function () {

    $("#portfolio-list2 li .hoverdiv").click(function (event) {
       
        // Work starts here
        $('#portfolio-list2 > li .hoverdiv').removeClass("templateHover");
        $(this).addClass("templateHover");
        return false;
    });
    
});