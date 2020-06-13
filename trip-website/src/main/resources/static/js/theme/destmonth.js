$(function() {
    $('.mfw-header').on('mouseenter', function() {
        $(this).removeClass('header-place-default');
    }).on('mouseleave', function() {
        $(this).addClass('header-place-default');
    });

    $('.search-input').bind('input propertychange', function() {
        var val = $(this).val();
        // debugger;
        if (val) {
            $('.search-suggest-panel').show();
        } else {
            $('.search-suggest-panel').hide();
        }
    });
    $('.search-suggest-panel').on('mouseenter', function() {

    }).on('mouseleave', function() {
        var self = this;
        setTimeout(function() {
            $(self).hide();
        }, 1500);
    });

    $.get("/destination/monthDest", {timeId:1}, function (data) {
        $(".J_seasonmdds").append(data);
    })

    $('.row-season .r-navbar a').on('mouseenter', function() {
        var mid = $(this).data("mid");
        if(!mid){
            return;
        }
        $('.row-season .r-navbar a').removeClass('on');
        $(this).addClass('on');

        $('.row-season .month-list').addClass('hide');

        //请求页面
        if($(".month-list-"+mid).size() != 0){
            $(".month-list-"+mid).removeClass('hide');
            return;
        }
        $.get("/destination/monthDest", {timeId:mid}, function (data) {
            if($(".month-list-"+mid).size() == 0){
                $(".J_seasonmdds").append(data);
            }
            $(".month-list-"+mid).removeClass('hide');
        })

    });

    // //pagelet-block样式,当季    精选嵌入页面样式
    // $('.pagelet-block .r-navbar a').on('mouseenter', function() {
    //     var idx = $(this).index();//点击位置索引,起始为null
    //     idx = idx == 0 ? 0 : idx / 2;
    //     $('.pagelet-block .r-navbar a').removeClass('on');
    //     //有人点击时,产生样式
    //     $(this).addClass('on');
    //     //上一个位置样式取消
    //     $('.pagelet-block .tiles').eq(idx-1).removeClass('hide');
    // });


    // $('.pagelet-block .r-navbar a').on('mouseenter', function() {
    //     var idx = $(this).index();
    //     idx = idx == 0 ? 0 : idx / 2;
    //     $('.pagelet-block .r-navbar a').removeClass('on');
    //     $(this).addClass('on');
    //     $('.pagelet-block .tiles').addClass('hide');
    //     $('.pagelet-block .tiles').eq(idx-1).removeClass('hide');
    // });


    $('.suggest-list li').click(function() {
        window.location.href = "./index.ftl"
    })
});