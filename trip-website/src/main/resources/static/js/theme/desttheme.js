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

    $.get("/destination/theme", {catalogId:1}, function (data) {
        $(".J_catemdds").append(data);
    })

    $('.row-theme .r-navbar a').on('mouseenter', function() {
        var tid = $(this).data("tid");
        if(!tid){
            return;
        }
        $('.row-theme .r-navbar a').removeClass('on');
        $(this).addClass('on');

        $('.row-theme .theme-list').addClass('hide');

        //请求页面
        if($(".theme-list-"+tid).size() != 0){
            $(".theme-list-"+tid).removeClass('hide');
            return;
        }
        /*获取除了国内的其他区域的数据*/
        $.get("/destination/theme", {catalogId:tid}, function (data) {
            if($(".theme-list-"+tid).size() == 0){
                $(".J_catemdds").append(data);
            }
            $(".theme-list-"+tid).removeClass('hide');
        })

    });

    // $('.pagelet-block .r-navbar a').on('mouseenter', function() {
    //     var idx = $(this).index();
    //     idx = idx == 0 ? 0 : idx / 2;
    //     $('.pagelet-block .r-navbar a').removeClass('on');
    //     $(this).addClass('on');
    //     $('.pagelet-block .tiles').addClass('hide');
    //     $('.pagelet-block .tiles').eq(idx).removeClass('hide');
    // });

    $('.suggest-list li').click(function() {
        window.location.href = "./index2.ftl"
    })
});