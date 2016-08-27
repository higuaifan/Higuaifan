var Client=function(id,name,pwd,pic,nickname){//理论上应该拿出来比较清晰
    this.id=id;
    this.name=name;
    this.pwd=pwd;
    this.pic=pic;
    this.nickname=nickname;
};
Client.prototype={
    SetId:function(id){
        this.id=id;
        return this;
    },
    Getid:function(){
        return this.id;
    },
    Getname:function(){
        return this.name;        
    },
    Getpassword:function(){
        return this.pwd;
    },
    Getpic:function(){
        return this.pic;
    },
    Getnickname:function(){
        return this.nickname;
    }
}


var Head=React.createClass({//头部组件
    render:function(){
        return (<tr>
                    <th>id</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>头像图片</th>
                    <th>昵称</th>
                </tr>);
    }
});

var Img=React.createClass({//图片组件
    render:function(){
        return (
            <th className="img">
                <img id={"img-"+this.props.id} className="pic" src={this.props.client_image} alt="头像图片" />
                <input className="inputfile" type="file" id={this.props.id+"-0"} />
            </th>
        );
    }
});

var Cell=React.createClass({//数据组件
    render:function(){
        return (<tr>
                    <th className="id">{this.props.id}</th>
                    <th className="str">{this.props.client_name}</th>
                    <th className="str">{this.props.client_password}</th>
                    <Img id={this.props.id} client_image={this.props.client_image}/>
                    <th className="str">{this.props.client_nickname}</th>
                    <th>
                        <span className="save">保存</span>
                        <span className="del">删除</span>
                    </th>
                </tr>);
    }
});

var array=new Array();
var Table = React.createClass({
  getInitialState: function() {
    return {
      arr:null
    };
  },
  componentDidMount: function() {
    this.serverRequest=$.get('/Service/Get/Client.php',function(result){
        result= $.parseJSON(result);
        var i=0;
        result.forEach(function(client){
            var a=new Client(client.id,client.client_name,client.client_password,client.client_image,client.client_nickname);
            var client=[a.Getid(),a.Getname(),a.Getpassword(),a.Getpic(),a.Getnickname(),i];
            i++;
            array.push(client);
        });
        this.setState({
            arr:array
        });
    }.bind(this));
  },
  componentWillUnmount: function() {  
    this.serverRequest.abort();  
  },
  render: function() {
    return (
        <tbody>
            <Head />
            {
                array.map(function(c){
                    return <Cell key={c} id={c[0]} client_name={c[1]} client_password={c[2]} client_image={c[3]} client_nickname={c[4]} />
                })
            }
        </tbody>
    );
  }
});

ReactDOM.render(
    <table>
        <Table />
    </table>,
    document.getElementById('right')
);

var b=$("body");
b.on("click",".save",function(){
    var member=$(this).parent().siblings();
    // console.log(member);
    member.each(function(e){
        GetHtml($(this));
    });

    var map=new Map();
    map.id=GetHtml($(member[0]));
    map.client_name=GetHtml($(member[1]));
    map.client_password=GetHtml($(member[2]));
    map.client_image=GetHtml($(member[3]));
    map.client_nickname=GetHtml($(member[4]));
    console.log(map);
    
    $.post('/Control/UpdateClient.php',map,function(result){
        if(result=='true'){
            alert('保存成功！');
            location.reload(true);
        }else{
            alert('保存失败！');
        }
    });
})