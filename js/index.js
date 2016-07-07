'use strict'
$(document).ready(function(){
    //全局部分设置一个div #picture
//需要显示image图片的父div .bigpic



    $(function () {
        var x = 0;
        var y = 0;
        var oldx=0;
        var oldy=0;
        var time;
        

        $(".bigpic img").bind({
            mousemove:function(e){
                clearTimeout(time);
                $("#picture").show();
                if(oldx==e.pageX&&oldy==e.pageY){

                }else{
                    x=e.pageX+10;
                    y=e.pageY+10;
                    oldx=x;
                    oldy=y;
                }
                
                $("#picture img").attr('src',$(this).attr('src'));
                $("#picture").css('margin-left',x+'px');
                $("#picture").css('padding-top',y+'px');
            },
            mouseout:function(){
                time=setTimeout(function() {
                    $("#picture").hide(); 
                });
            }
        })
    });
});



//图片在线修改模块开始
//@sourceId 图片的地址
//@targetId 需要修改图片id
        function preImg(sourceId, targetId) { //上传图片预览功能
            var url = getFileUrl(sourceId); 
            //console.log(url,targetId);
            
            var imgPre = document.getElementById(targetId); 
            if(url!=null){
                //console.log("url:"+url);
                imgPre.src = url; 
                // console.log("img:"+imgPre);
                // imgPre.id='changeimg';
            }else{
                //imgPre.id='';
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

//图片在线修改模块结束



//图片上传模块 
//@id 对应form的id
//@urls 要上传过去的脚本地址
//例 urls="../../Pic/RestaurantPic/"+foodid+".jpg";//保存地址
//@datas 数据数组
//返回true of false
function loadpicture(id,urls,datas){
            $.ajaxFileUpload({
                url:urls,
                secureuri:false,
                data:datas,
                fileElementId:id,
                dataType: 'json',
                success: function (data)
                {
                    return true;
                },
                error: function (data) {
                    return false;
                }
            })
            return true;
    }

