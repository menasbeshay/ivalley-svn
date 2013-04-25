

/*-----------------------------------------------------------------------------------*/
/*	Menu Dropdown Control
/*-----------------------------------------------------------------------------------*/
$('.main-nav li').hover(function () {
    $(this).children('ul').stop(true, true).slideDown(500);
}, function () {
    $(this).children('ul').stop(true, true).slideUp(500);
});
