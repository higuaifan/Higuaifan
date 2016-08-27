//公用函数脚本
//考虑封装一下


$(function () {
    var x = 0 ,y = 0 ,oldx = 0 ,oldy = 0 ,time = null;
    var b=$("body");

    //图片悬浮显示预览事件部分,稍大的图片显示详情
    b.on("mousemove",".pic",function(e){
            clearTimeout(time);
            $(".picture").show();
            if(oldx==e.pageX&&oldy==e.pageY){

            }else{
                x=e.pageX+10;
                y=e.pageY+10;
                oldx=x;
                oldy=y;
            }
            
            $(".picture img").attr('src',$(this).attr('src'));
            $(".picture").css('margin-left',x+'px');
            $(".picture").css('padding-top',y+'px');
    });
    b.on("mouseout",".pic",function(e){
        time=setTimeout(function() {
                $(".picture").hide(); 
            });
    });

    //图片点击触发修改事件部分,出发input的click
    b.on("click",".pic",function(){
        $(this).next().click();
    });

    //图片点击修改事件部分,修改原有图片显示
    b.on("change",".inputfile",function(){
        var input=$(this);
        var img_id=input.prev().attr('id');
        var input_id=input.attr('id');
        preImg(input_id,img_id);
    });

    //文字点击修改事件部分
    b.on("click",".str",function(){
        var txt=$(this).html();
        var isFocus=$(this).children('input').is(":focus");
        if(isFocus==false){
            $(this).html('<input type="text">');
            $('input').blur(function(){
                var newtxt=$(this).val();
                $(this).parent().html(newtxt);
            });
            $(this).children('input').val(txt);
            $(this).children('input').focus();
        }
    });



})

function GetHtml(dom){
    var c=dom.attr('class');
    switch(c){
            case 'id':
                return dom.html();
            case 'str':
                return dom.html();
            case 'img':
                return dom.children('img').attr('src');
            default:
                return null;
        }
}




function preImg(sourceId, targetId) { //图片预览功能
    if(sourceId==null)return;
    var url = getFileUrl(sourceId); 
    var imgPre = document.getElementById(targetId); 
    var img=$(imgPre);
    if(url!=null){
        img.attr('data-change','1');
        imgPre.src = url; //修改原图地址预览
    }else{
        img.attr('data-change','0');        
    }
    
} 
function getFileUrl(sourceId) { //获取url
    var url; 
    if (navigator.userAgent.indexOf("MSIE")>=1) { // IE 
        url = document.getElementById(sourceId).value; 
    } else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox 
        url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0)); 
    } else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome 
        url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0)); 
    } 
    return url; 
} 
