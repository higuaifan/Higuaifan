var Admin=function(id,name,pwd,pic,nickname){
    this.id=id;
    this.name=name;
    this.pwd=pwd;
    this.pic=pic;
    this.nickname=nickname;
};
Admin.prototype={
    SetId:function(id){
        this.id=id;
        return this;
    },
    one:function(){
        console.log(this.id);
        return this;
    },
    two:function(){
        console.log(this.name);
        return this;        
    },
    three:function(){
        console.log(this.pwd);
        return this;
    }
}



var a=new Admin(1,'GuaiFan','123','picurl','Higuaifan');


var request=$.ajax({
        url: 'http://localhost:8088/php/Get/Client.php',
        type: 'POST',
        data:{},
        dataType: 'html',
        timeout: 1000,
        error: function(){console.log('Error loading document');},
        success: function(result){
            result= $.parseJSON(result);

            result.forEach(function(admin){
                var a=new Admin(admin.ID,admin.CName,admin.Pwd,admin.Pic,admin.Nickname);
                a.one().two().three();
            });

        }
    });