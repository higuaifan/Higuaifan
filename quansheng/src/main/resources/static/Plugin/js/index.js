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

var i = 0;

var refresh = function refresh() {
    $(".section-thumbnail").eq(i).click();
    if (i < 4) i++;else i = 0;
};

window.setInterval(refresh, 3000);

},{}]},{},[1])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCJzcmNcXFBsdWdpblxcanNcXGluZGV4LmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBOzs7QUNBQSxFQUFFLE9BQUYsRUFBVyxLQUFYLENBQWlCLFlBQVk7QUFDekIsUUFBSSxZQUFZLEVBQUUsT0FBRixFQUFXLEVBQVgsQ0FBYyxDQUFkLENBQWhCOztBQUVBLFFBQUksT0FBTyxFQUFFLGFBQUYsRUFBaUIsR0FBakIsQ0FBcUIsTUFBckIsQ0FBWDtBQUNBLFdBQU8sS0FBSyxPQUFMLENBQWEsSUFBYixFQUFtQixFQUFuQixDQUFQO0FBQ0EsUUFBSSxPQUFPLENBQUMsR0FBWixFQUFpQjtBQUNiLGVBQU8sT0FBTyxHQUFkO0FBQ0EsZ0JBQVEsR0FBUixDQUFZLElBQVo7QUFDQSxVQUFFLGFBQUYsRUFBaUIsT0FBakIsQ0FBeUIsRUFBQyxNQUFNLE9BQU8sSUFBZCxFQUF6QjtBQUNIO0FBRUosQ0FYRDs7QUFhQSxFQUFFLE9BQUYsRUFBVyxLQUFYLENBQWlCLFlBQVk7QUFDekIsUUFBSSxZQUFZLEVBQUUsT0FBRixFQUFXLEVBQVgsQ0FBYyxDQUFkLENBQWhCOztBQUVBLFFBQUksT0FBTyxFQUFFLGFBQUYsRUFBaUIsR0FBakIsQ0FBcUIsTUFBckIsQ0FBWDtBQUNBLFdBQU8sS0FBSyxPQUFMLENBQWEsSUFBYixFQUFtQixFQUFuQixDQUFQO0FBQ0EsUUFBSSxPQUFPLENBQVgsRUFBYztBQUNWLGVBQU8sT0FBTyxDQUFQLEdBQVcsR0FBbEI7QUFDQSxnQkFBUSxHQUFSLENBQVksSUFBWjtBQUNBLFVBQUUsYUFBRixFQUFpQixPQUFqQixDQUF5QixFQUFDLE1BQU0sT0FBTyxJQUFkLEVBQXpCO0FBQ0g7QUFFSixDQVhEOztBQWFBLENBQUMsVUFBVSxDQUFWLEVBQWE7QUFDVixNQUFFLE1BQUYsRUFBVSxJQUFWLENBQWUsWUFBWTtBQUN2QixVQUFFLGlCQUFGLEVBQXFCLGtCQUFyQixDQUF3QztBQUNwQyxrQkFBTSxHQUQ4QixFQUN6QjtBQUNYLGtCQUFNO0FBRjhCLFNBQXhDO0FBSUgsS0FMRDtBQU1ILENBUEQsRUFPRyxNQVBIOztBQVNBLElBQUksSUFBSSxDQUFSOztBQUVBLElBQUksVUFBUSxTQUFSLE9BQVEsR0FBVztBQUNuQixNQUFFLG9CQUFGLEVBQXdCLEVBQXhCLENBQTJCLENBQTNCLEVBQThCLEtBQTlCO0FBQ0EsUUFBSSxJQUFJLENBQVIsRUFDSSxJQURKLEtBR0ksSUFBSSxDQUFKO0FBRVAsQ0FQRDs7QUFVQSxPQUFPLFdBQVAsQ0FBbUIsT0FBbkIsRUFBNEIsSUFBNUIiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIiwiJChcIiNuZXh0XCIpLmNsaWNrKGZ1bmN0aW9uICgpIHtcclxuICAgIGxldCBmaXJzdFNob3cgPSAkKFwiLnNob3dcIikuZXEoMCk7XHJcblxyXG4gICAgbGV0IGxlZnQgPSAkKFwiI3Njcm9sbC1kaXZcIikuY3NzKFwibGVmdFwiKTtcclxuICAgIGxlZnQgPSBsZWZ0LnJlcGxhY2UoXCJweFwiLCBcIlwiKTtcclxuICAgIGlmIChsZWZ0ID4gLTMwMCkge1xyXG4gICAgICAgIGxlZnQgPSBsZWZ0IC0gMTIwO1xyXG4gICAgICAgIGNvbnNvbGUubG9nKGxlZnQpO1xyXG4gICAgICAgICQoXCIjc2Nyb2xsLWRpdlwiKS5hbmltYXRlKHtsZWZ0OiBsZWZ0ICsgJ3B4J30pO1xyXG4gICAgfVxyXG5cclxufSk7XHJcblxyXG4kKFwiI3ByZXZcIikuY2xpY2soZnVuY3Rpb24gKCkge1xyXG4gICAgbGV0IGZpcnN0U2hvdyA9ICQoXCIuc2hvd1wiKS5lcSgwKTtcclxuXHJcbiAgICBsZXQgbGVmdCA9ICQoXCIjc2Nyb2xsLWRpdlwiKS5jc3MoXCJsZWZ0XCIpO1xyXG4gICAgbGVmdCA9IGxlZnQucmVwbGFjZShcInB4XCIsIFwiXCIpO1xyXG4gICAgaWYgKGxlZnQgPCAwKSB7XHJcbiAgICAgICAgbGVmdCA9IGxlZnQgLSAwICsgMTIwO1xyXG4gICAgICAgIGNvbnNvbGUubG9nKGxlZnQpO1xyXG4gICAgICAgICQoXCIjc2Nyb2xsLWRpdlwiKS5hbmltYXRlKHtsZWZ0OiBsZWZ0ICsgJ3B4J30pO1xyXG4gICAgfVxyXG5cclxufSk7XHJcblxyXG4oZnVuY3Rpb24gKCQpIHtcclxuICAgICQod2luZG93KS5sb2FkKGZ1bmN0aW9uICgpIHtcclxuICAgICAgICAkKFwiI215LXRodW1icy1saXN0XCIpLm1UaHVtYm5haWxTY3JvbGxlcih7XHJcbiAgICAgICAgICAgIGF4aXM6IFwieFwiLCAvL2NoYW5nZSB0byBcInlcIiBmb3IgdmVydGljYWwgc2Nyb2xsZXJcclxuICAgICAgICAgICAgdHlwZTogXCJjbGljay10aHVtYlwiXHJcbiAgICAgICAgfSk7XHJcbiAgICB9KTtcclxufSkoalF1ZXJ5KTtcclxuXHJcbnZhciBpID0gMDtcclxuXHJcbnZhciByZWZyZXNoPWZ1bmN0aW9uKCkge1xyXG4gICAgJChcIi5zZWN0aW9uLXRodW1ibmFpbFwiKS5lcShpKS5jbGljaygpO1xyXG4gICAgaWYgKGkgPCA0KVxyXG4gICAgICAgIGkrKztcclxuICAgIGVsc2VcclxuICAgICAgICBpID0gMDtcclxuXHJcbn07XHJcblxyXG5cclxud2luZG93LnNldEludGVydmFsKHJlZnJlc2gsIDMwMDApOyJdfQ==
