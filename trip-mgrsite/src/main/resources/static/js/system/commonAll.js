//公共组件
//数组传值时，不添加[]
$.ajaxSettings.traditional = true;

$(function () {
    //统一全局配置
    $.messager.model = {
        ok: {text: "确定"},
        cancel: {text: "取消"}
    };
});

/**方法：检测 json 返回结果并且弹出自动消失的消息窗口
 * 参数 data：返回的json结果
 * 参数 href：如果返回结果是成功的话跳转的页面
 * 参数 trueMsg：成功时可复写的成功提示信息
 * 参数 falseMsg：失败时可复写的成功提示信息
 */
function checkData(data, href, trueMsg, falseMsg) {
    if (data.success) {
        if (trueMsg) {
            $.messager.alert(trueMsg);
        } else {
            //$.messager.popup("操作成功");
            $.messager.alert("操作成功");
        }
        window.setTimeout(function () {
            if (href == null) {
                window.location.reload();
            } else if (href != 'no') {
                window.location.href = href;
            }
        }, 1000)
    } else {
        //操作失败
        $.messager.alert("操作失败：" + data.msg);
        /*$.messager.alert( function () {
            //如果 data.message 为空，说明被权限拦截器给拦截了
            if (data.msg != null) {
                if (falseMsg) {
                    return falseMsg;
                } else {
                    return data.msg;
                }
            } else {
                return "网络异常";
            }
        } );*/
        console.log("操作失败");
    }

}
