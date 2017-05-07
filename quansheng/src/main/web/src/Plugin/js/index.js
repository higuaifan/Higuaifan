$("#next").click(function () {
    let firstShow = $(".show").eq(0);

    let left = $("#scroll-div").css("left");
    left = left.replace("px", "");
    if (left > -300) {
        left = left - 120;
        console.log(left);
        $("#scroll-div").animate({left: left + 'px'});
    }

});

$("#prev").click(function () {
    let firstShow = $(".show").eq(0);

    let left = $("#scroll-div").css("left");
    left = left.replace("px", "");
    if (left < 0) {
        left = left - 0 + 120;
        console.log(left);
        $("#scroll-div").animate({left: left + 'px'});
    }

});

(function ($) {
    $(window).load(function () {
        $("#my-thumbs-list").mThumbnailScroller({
            axis: "x", //change to "y" for vertical scroller
            type: "click-thumb"
        });
    });
})(jQuery);

var i = 0;

var refresh=function() {
    $(".section-thumbnail").eq(i).click();
    if (i < 4)
        i++;
    else
        i = 0;

};


window.setInterval(refresh, 3000);