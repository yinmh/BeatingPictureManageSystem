layui.define(['element'],function(exports){

    var $ = layui.$;
    $('.input-field').on('change',function(){
        var $this = $(this),
            value = $.trim($this.val()),
            $parent = $this.parent();

        if(value !== '' && !$parent.hasClass('field-focus')){
            $parent.addClass('field-focus');
        }else{
            $parent.removeClass('field-focus');
        }
    })

    $("#loginButton").click(function(){
       //window.location.href = 'index';
        $("#loginForm").submit();
    });

    document.body.addEventListener('keyup', function (e) {
        console.log(e)
        if (e.keyCode == '13') {
            $("#loginForm").submit();
        }
    });

    exports('login');
});