/**
 *  入口文件索引
 *  使用说明：将此文件引入到页面中，可在script标签上定义一个data-main=""属性，
 *  此属性指定页面入口文件。
 *
**/
(function () {

    var entry,
        // 配置所有应用的入口文件，程序将会按照data-main属性中设置的值进行索引查找
        // 如果你在引入此脚本的script标签上没有设置data-main属性，程序将会默认访问home.js文件
        app = {
            home : '{/}home',
            login : '{/}login'
        };

    (function(){
        var dataMain, scripts = document.getElementsByTagName('script'),
            eachScripts = function(el){
                dataMain = el.getAttribute('data-main');
                if(dataMain){
                    entry = dataMain;
                }
            };

        [].slice.call(scripts).forEach(eachScripts);
    })();

    layui.config({
        base: 'layui/lay/modules/'
    }).extend(app).use('login');

    // // 登陆用户查询
    // $.get('getSession',{},function(data){
    //     $("#userName").text(data.name);
    //     $("#userId").val(data.id);
    // },'json');

    // 修改密码
    // $("#updatePass").click(function () {
    //     $.get('updatePass.html',{},function (html) {
    //         var index = layer.open({
    //             type: 1
    //             ,title: '修改密码'
    //             ,area: ['550px', '450px']
    //             ,shade: 0
    //             ,maxmin: true
    //             ,content: html
    //             ,btn: ['修改', '取消']
    //             ,yes: function(){
    //                 var id = $("#userId").val();
    //                 var pass = $("#pass").val();
    //                 var newPass = $("#newPass").val();
    //                 var newPass2 = $("#newPass2").val();
    //
    //                 if(!pass){
    //                     layer.msg('旧密码不能为空');
    //                     return;
    //                 }
    //
    //                 if(!newPass){
    //                     layer.msg('新密码不能为空');
    //                     return;
    //                 }
    //
    //                 if(!newPass2){
    //                     layer.msg('确认密码不能为空');
    //                     return;
    //                 }
    //
    //                 if(newPass2 != newPass){
    //                     layer.msg('两次密码不一致');
    //                     return;
    //                 }
    //
    //                 $.post('user/updatePass',{id:id,pass:pass,newPass:newPass},function (data) {
    //                     if(data.status == -1){
    //                         layer.msg('旧密码错误');
    //                         return;
    //                     }
    //                     layer.msg('修改成功');
    //                     layer.close(index);
    //                 });
    //             }
    //             ,btn2: function(){
    //                 layer.close(index);
    //             }
    //         });
    //     });
    //
    // });

    // 用户菜单查询
    // $.get('/user/getUserMenus',{},function(data){
    //     var menuHtml = '';
    //     for(var i = 0 ; i< data.length;i++){
    //         var item = data[i];
    //         menuHtml += '<li class="layui-nav-item">';
    //         menuHtml += '   <a href="javascript:;">';
    //         menuHtml += '       <em>'+ item.name +'</em>';
    //         menuHtml += '   </a>';
    //
    //         var children = item.children;
    //         if(children){
    //             for(var n = 0; n < children.length; n++){
    //                 var child = children[n];
    //                 menuHtml += '   <dl class="layui-nav-child">';
    //                 menuHtml += '       <dd><a href="'+ child.url +'">'+ child.name +'</a></dd>';
    //                 menuHtml += '   </dl>';
    //             }
    //         }
    //         menuHtml += '</li>';
    //     }
    //     $("#Nav").html(menuHtml);
      layui.use('home');
    //
    // },'json');

})();