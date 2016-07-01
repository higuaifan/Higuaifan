'use strict'
$(document).ready(function(){
    $("#tagul li").click(function(){
        console.log($(this).html());
        $("#contents").load("tag/"+$(this).html()+".html");
    });
});