(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
"use strict";

$("#next").click(function () {
    var firstShow = $(".show").eq(0);

    var left = $("#scroll-div").css("left");
    left = left.replace("px", "");
    if (left > -300) {
        left = left - 120;
        console.log(left);
        $("#scroll-div").animate({ left: left + 'px' });
    }
});

$("#prev").click(function () {
    var firstShow = $(".show").eq(0);

    var left = $("#scroll-div").css("left");
    left = left.replace("px", "");
    if (left < 0) {
        left = left - 0 + 120;
        console.log(left);
        $("#scroll-div").animate({ left: left + 'px' });
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

},{}]},{},[1])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy8uX2Jyb3dzZXItcGFja0A2LjAuMkBicm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCJzcmNcXFBsdWdpblxcanNcXGluZGV4LmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBOzs7QUNFQSxFQUFFLE9BQUYsRUFBVyxLQUFYLENBQWlCLFlBQVk7QUFDekIsUUFBSSxZQUFZLEVBQUUsT0FBRixFQUFXLEVBQVgsQ0FBYyxDQUFkLENBQWhCOztBQUVBLFFBQUksT0FBTyxFQUFFLGFBQUYsRUFBaUIsR0FBakIsQ0FBcUIsTUFBckIsQ0FBWDtBQUNBLFdBQU8sS0FBSyxPQUFMLENBQWEsSUFBYixFQUFtQixFQUFuQixDQUFQO0FBQ0EsUUFBSSxPQUFPLENBQUMsR0FBWixFQUFpQjtBQUNiLGVBQU8sT0FBTyxHQUFkO0FBQ0EsZ0JBQVEsR0FBUixDQUFZLElBQVo7QUFDQSxVQUFFLGFBQUYsRUFBaUIsT0FBakIsQ0FBeUIsRUFBQyxNQUFNLE9BQU8sSUFBZCxFQUF6QjtBQUNIO0FBRUosQ0FYRDs7QUFhQSxFQUFFLE9BQUYsRUFBVyxLQUFYLENBQWlCLFlBQVk7QUFDekIsUUFBSSxZQUFZLEVBQUUsT0FBRixFQUFXLEVBQVgsQ0FBYyxDQUFkLENBQWhCOztBQUVBLFFBQUksT0FBTyxFQUFFLGFBQUYsRUFBaUIsR0FBakIsQ0FBcUIsTUFBckIsQ0FBWDtBQUNBLFdBQU8sS0FBSyxPQUFMLENBQWEsSUFBYixFQUFtQixFQUFuQixDQUFQO0FBQ0EsUUFBSSxPQUFPLENBQVgsRUFBYztBQUNWLGVBQU8sT0FBTyxDQUFQLEdBQVcsR0FBbEI7QUFDQSxnQkFBUSxHQUFSLENBQVksSUFBWjtBQUNBLFVBQUUsYUFBRixFQUFpQixPQUFqQixDQUF5QixFQUFDLE1BQU0sT0FBTyxJQUFkLEVBQXpCO0FBQ0g7QUFFSixDQVhEOztBQWFBLENBQUMsVUFBUyxDQUFULEVBQVc7QUFDUixNQUFFLE1BQUYsRUFBVSxJQUFWLENBQWUsWUFBVTtBQUNyQixVQUFFLGlCQUFGLEVBQXFCLGtCQUFyQixDQUF3QztBQUNwQyxrQkFBSyxHQUQrQixFQUMxQjtBQUNWLGtCQUFLO0FBRitCLFNBQXhDO0FBSUgsS0FMRDtBQU1ILENBUEQsRUFPRyxNQVBIIiwiZmlsZSI6ImdlbmVyYXRlZC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzQ29udGVudCI6WyIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3ZhciBmPW5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIik7dGhyb3cgZi5jb2RlPVwiTU9EVUxFX05PVF9GT1VORFwiLGZ9dmFyIGw9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGwuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sbCxsLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSIsIlxyXG5cclxuJChcIiNuZXh0XCIpLmNsaWNrKGZ1bmN0aW9uICgpIHtcclxuICAgIGxldCBmaXJzdFNob3cgPSAkKFwiLnNob3dcIikuZXEoMCk7XHJcblxyXG4gICAgbGV0IGxlZnQgPSAkKFwiI3Njcm9sbC1kaXZcIikuY3NzKFwibGVmdFwiKTtcclxuICAgIGxlZnQgPSBsZWZ0LnJlcGxhY2UoXCJweFwiLCBcIlwiKTtcclxuICAgIGlmIChsZWZ0ID4gLTMwMCkge1xyXG4gICAgICAgIGxlZnQgPSBsZWZ0IC0gMTIwO1xyXG4gICAgICAgIGNvbnNvbGUubG9nKGxlZnQpO1xyXG4gICAgICAgICQoXCIjc2Nyb2xsLWRpdlwiKS5hbmltYXRlKHtsZWZ0OiBsZWZ0ICsgJ3B4J30pO1xyXG4gICAgfVxyXG5cclxufSk7XHJcblxyXG4kKFwiI3ByZXZcIikuY2xpY2soZnVuY3Rpb24gKCkge1xyXG4gICAgbGV0IGZpcnN0U2hvdyA9ICQoXCIuc2hvd1wiKS5lcSgwKTtcclxuXHJcbiAgICBsZXQgbGVmdCA9ICQoXCIjc2Nyb2xsLWRpdlwiKS5jc3MoXCJsZWZ0XCIpO1xyXG4gICAgbGVmdCA9IGxlZnQucmVwbGFjZShcInB4XCIsIFwiXCIpO1xyXG4gICAgaWYgKGxlZnQgPCAwKSB7XHJcbiAgICAgICAgbGVmdCA9IGxlZnQgLSAwICsgMTIwO1xyXG4gICAgICAgIGNvbnNvbGUubG9nKGxlZnQpO1xyXG4gICAgICAgICQoXCIjc2Nyb2xsLWRpdlwiKS5hbmltYXRlKHtsZWZ0OiBsZWZ0ICsgJ3B4J30pO1xyXG4gICAgfVxyXG5cclxufSk7XHJcblxyXG4oZnVuY3Rpb24oJCl7XHJcbiAgICAkKHdpbmRvdykubG9hZChmdW5jdGlvbigpe1xyXG4gICAgICAgICQoXCIjbXktdGh1bWJzLWxpc3RcIikubVRodW1ibmFpbFNjcm9sbGVyKHtcclxuICAgICAgICAgICAgYXhpczpcInhcIiwgLy9jaGFuZ2UgdG8gXCJ5XCIgZm9yIHZlcnRpY2FsIHNjcm9sbGVyXHJcbiAgICAgICAgICAgIHR5cGU6XCJjbGljay10aHVtYlwiXHJcbiAgICAgICAgfSk7XHJcbiAgICB9KTtcclxufSkoalF1ZXJ5KTsiXX0=
