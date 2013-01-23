jQuery(function(){
    $("#slider").chopSlider({
        /* slide element */
        slide : ".slide",
        /* controlers */
        /*nextTrigger : "a#slide-next",
        prevTrigger : "a#slide-prev",*/
        hideTriggers : true,
        sliderPagination : ".slider-pagination",
        /* captions */
        useCaptions : true,
        everyCaptionIn : ".sl-descr",
        showCaptionIn : ".caption",
        captionTransform : "scale(0) translate(-600px,0px) rotate(45deg)",
        /* autoplay */
        autoplay : true,
        autoplayDelay : 5000,
        /* for Browsers that support 3D transforms */
        t3D : csTransitions['3DFlips']['random'], /* all will be picked up randomly */
        t2D : [ csTransitions['multi']['random'], csTransitions['vertical']['random'] ],
        noCSS3 : csTransitions['noCSS3']['random'],
        mobile : csTransitions['mobile']['random'],
        onStart: function(){},
        onEnd: function(){}
    })
})