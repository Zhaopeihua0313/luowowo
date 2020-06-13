//弹出，3秒消失
function popup(msg) {
    $('body').append('<div id="over_container"><div id="over_message">' + msg + '</div></div>')
    setTimeout(function () {
        $('#over_container').remove();
    }, 3000)
}

//均在原 dialog2 上做二开
//普通自定义提示框
function dialogCommon(msg, showTime, url) {
    var info = {
        style: 'android',   //ios android
        titleShow: false,
        overlayClose: true,
        content: msg
    };
    if(showTime) { info.autoClose = showTime }
    info.onClosed = function () {
        if(url) {
            if (url != 'no') {
                if (url == 'back') {
                        history.go(-1);
                } else if (url == 'back2') {
                        history.go(-2);
                } else {
                        window.location.href = url;
                }
            }
        } else {
            history.go(0);
        }
    };
    $(document).dialog(info);
}

//检测 json 返回的 data 并且弹出消息提示框
function checkData(data, showTime, successMsg, successUrl, errorUrl, errorMsg) {
    console.log(data);
    if (!successMsg) {
        successMsg = "操作成功";
    }
    if (!errorMsg) {
        //errorMsg = data.responseJSON.msg;
        errorMsg = "操作失败";
    }
    if (data.msg != null) {
        errorMsg = data.msg;
    }
    if (data.success) {
        console.log("操作成功");
        dialogCommon(successMsg, showTime, successUrl);
    } else {
        console.log("操作失败");
        dialogCommon(errorMsg, showTime, errorUrl)
    }
}

