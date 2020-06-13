
//从目的地页面跳到过滤页面需要截取url上后面的参数
//获取url上的请求参数
function getParams() {
    //获取问号及问号后面的内容
    var url = window.location.search;  //?id=24&name=22
    var params = {};
    if (url.indexOf("?") != -1) {
        //截取问号后面的内容,再使用&分割多个属性
        var arr = url.substr(1).split("&");  //id=24&name=22
        for (var i = 0; i < arr.length; i++) {
            //使用=分割为keyvalue
            var keyValue = arr[i].split("=");
            params[keyValue[0]] = keyValue[1];
        }
    }
    //params是个数组
    return params;
}

$(function() {
    //调用函数获取url上拼接的参数
    var params = getParams();

    //修改提交表单的值
    if (params.groupId){
            var typevalue = params.id;
            $("#themeId").val(typevalue);
            //回显选中
            $(".search_time a").removeClass("on");
            $(".search_time .festival a[data-typevalue="+ typevalue +"]").addClass("on");

        }else {
            var themeId = params.id;
            $("#themeId").val(themeId);
            //回显选中
            $(".theme_dest a").removeClass("on");
            $(".theme_dest a[data-themeid="+ themeId +"]").addClass("on");
    }

    //要提交了表单才会有data回调函数的值,然后把查询到的数据拼接到内容中
    $("#searchForm").ajaxForm(function (data) {
        $("#destinationSearchPageData").html(data);
    })
    //一提交表单就会触发发送异步请求到
    $("#searchForm").submit();



     var timeId;
     var themeId;
    $(".search_time a").click(function () {
        // var type = $(this).data("type");
        timeId = $(this).data("mid");
        // themeId = $(this).data("themeid");
        // var typevalue = $(this).data("typevalue");
        $(".search_time a").removeClass("on");

        $(this).addClass("on");
        // $("#type").val(type);
        $("#timeId").val(timeId)
        $("#themeId").val(themeId);
        $("#currentPage").val(1);
        $("#searchForm").submit();
    });

    $(".theme_dest a").click(function () {
        themeId = $(this).data("themeid");

        $(".theme_dest a").removeClass("on");

        $(this).addClass("on");

        $("#themeId").val(themeId);
        $("#currentPage").val(1);

        $("#searchForm").submit();
    });

    $(".search_day a").click(function () {
        var dayType = $(this).data("daytype");

        $(".search_day a").removeClass("on");

        $(this).addClass("on");

        $("#dayType").val(dayType);
        $("#currentPage").val(1);

        $("#searchForm").submit();
    });

});