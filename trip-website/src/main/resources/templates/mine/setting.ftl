<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="../styles/base.css" rel="stylesheet" type="text/css">
    <link href="../js/datepicker/datepicker.css" rel="stylesheet">
    <link href="../styles/setting.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery-upload/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="../js/jquery-upload/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="../js/jquery-upload/jquery.fileupload.js"></script>
    <script src="../js/datepicker/datepicker.js"></script>
    <script type="text/javascript" src="../js/setting.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <link type="text/css" rel="stylesheet" href="/js/plugins/uploadifive/uploadifive.css"/>
    <script type="text/javascript" src="/js/plugins/uploadifive/jquery.uploadifive.min.js"></script>
    <script>
        $(function () {
            $('.btn-submit').click(function () {
                $('#_j_form').ajaxSubmit(function (data) {
                    if (data.success) {
                        window.location.reload();
                    } else {
                        alert("保存失败")
                    }
                })
            })


            //保存图片信息
            $("#btn-HeadImgUrl").click(function () {
                $("#inputform").ajaxSubmit(function (data) {
                    if (data.success) {
                        alert("保存成功");
                        window.location.reload();
                    }
                })
            })

            //图片文件上传
            $("#photoBtn").click(function () {
                $("#coverBtn").click();
            })
            $("#coverBtn").change(function () {
                if (this.value) {
                    $("#coverForm").ajaxSubmit(function (data) {
                        $("#coverImage").attr("src", "/" + data);
                        $("#pic").val("/" + data);
                    })
                }
            })


            //修改手机号码,确认旧手机号码是否正确,并发送验证码
            var va;

            $('#getCode').click(function () {
                va = $('#mobile_input').val();
                //js 正则表达语法:   /^1   $/
                if (/^1\d{10}$/g.test(va)) {
                    $.get("/mine/oldPhone", {phone: va}, function (data) {
                        if (data.success) {
                            $('#mobile_input').next().text('').hide()
                            alert("发送成功")
                            if ($('#getCode').hasClass('disabled')) {
                            } else {
                                var self = $('#getCode');
                                var count = 10;
                                self.addClass('disabled')
                                self.text(count + '秒后重新获取')
                                var timer = setInterval(function () {
                                    count--;
                                    if (count > 0) {
                                        self.text(count + '秒后重新获取');
                                    } else {
                                        clearInterval(timer)
                                        self.text('重新获取验证码')
                                        self.removeClass("disabled");
                                    }

                                }, 1000);
                            }

                        } else {
                            alert("手机号码不正确")
                        }
                    })
                } else {
                    alert("手机格式不正确")
                }
            });

            //提交旧手机
            $('#id_verify').click(function () {
                var code = $('#verifyCode').val();
                $.get("/mine/code", {phone: va, code: code}, function (data) {
                    if (data.success) {
                        $('.mobile-v2').show();
                        $('.mobile-v1').hide();
                        $('.navtag a').removeClass('on');
                        $('.navtag a').eq(1).addClass('on')
                    } else {
                        alert("账号或者验证码不正确")
                    }
                })
            })


            //新手机号绑定
            $('#getChangeCode').click(function () {
                va = $('#newMobile').val();
                console.log(va);
                //js 正则表达语法:   /^1   $/
                if (/^1\d{10}$/g.test(va)) {
                    $.get("/mine/newPhone", {phone: va}, function (data) {
                        if (data.success) {
                            $('#newMobile').next().text('').hide()
                            alert("发送成功")
                            if ($('#getChangeCode').hasClass('disabled')) {
                            } else {
                                var self = $('#getChangeCode');
                                var count = 10;
                                self.addClass('disabled')
                                self.text(count + '秒后重新获取')
                                var timer = setInterval(function () {
                                    count--;
                                    if (count > 0) {
                                        self.text(count + '秒后重新获取');
                                    } else {
                                        clearInterval(timer)
                                        self.text('重新获取验证码')
                                        self.removeClass("disabled");
                                    }

                                }, 1000);
                            }
                        } else {
                            alert(data.msg)
                        }
                    })
                } else {
                    alert("手机格式不正确")
                }
            });

            //提交新手机
            $('#change_mobile').click(function () {

                var code = $('#newverifyCode').val();
                $.get("/mine/newCode", {phone: va, code: code}, function (data) {
                    if (data.success) {
                        window.location.href = "http://localhost/login.html"
                        $('.mobile-v2').show();
                        $('.mobile-v1').hide();
                        $('.navtag a').removeClass('on');
                        $('.navtag a').eq(1).addClass('on')
                    } else {
                        alert("验证码不正确")
                    }
                })
            })


        })
    </script>

</head>
<#assign currentMineNav="mine"/>
<body style="position: relative;">

<#include "../common/mineNavbar.ftl">
<div class="main">
    <div class="banner">
        <div class="banner_img banner_note" id="_j_banner">
        </div>
        <div class="tags_bar second_tags_bar">
            <div class="center clearfix">
                <div class="MAvatar clearfix">
                    <div class="MAvaImg flt1">
                        <img width="120" height="120" alt=""

                             src="${user.headImgUrl!}">
                    </div>
                    <div class="MAvaEasyWord flt1">
                        <span class="MAvaName">${user.nickname!}(${user.city})</span>
                        <span class="MAvaLevel">Lv.${user.level!}</span>
                    </div>
                </div>
            <#include "../common/mineMenu.ftl">
            </div>
        </div>
    </div>
</div>
<div class="wrapper clearfix">
    <div class="aside">
        <a href="javascript:;" class="on"><i class="i1"></i>我的信息</a>
        <a href="javascript:;"><i class="i2"></i>我的头像</a>
        <a href="javascript:;"><i class="i3"></i>绑定设置</a>
        <a href="javascript:;"><i class="i4"></i>账号安全</a>
        <!-- <a href="javascript:;"><i class="i8"></i>我的窝设置</a> -->
        <a href="javascript:;"><i class="i9"></i>黑名单管理</a>
        <a href="javascript:;"><i class="i10"></i>我的钱包</a>
    </div>
    <div class="content">
        <div class="hd">
            <strong>我的信息</strong>
            <span>
                    资料完善度
                    <div class="progress">
                        <div class="num">85%</div>
                        <div class="on" style="width:85%"></div>
                    </div>
                </span>
        </div>

        <div class="userinfo">
            <form action="/mine/update" method="post" id="_j_form">
                <input type="hidden" name="id" value="${user.id}">
                <div class="alert alert-danger"
                     style="color: #a94442;background-color: #f2dede;border-color: #ebccd1;display:none"></div>
                <dl class="clearfix">
                    <dt>名号：</dt>
                    <dd><input type="text" name="nickname" value="${user.nickname}" maxlength="16"
                               autocomplete="off"
                               data-verification-name="名号" class="verification[required,funcCall[checkNickname]]">
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt>性别：</dt>
                    <dd>
                        <label><span class="cssradio"><input type="radio" name="gender" value="1"
                                                             checked="true"><span></span></span>男</label>
                        <label><span class="cssradio"><input type="radio" name="gender"
                                                             value="0"><span></span></span>女</label>
                        <label><span class="cssradio"><input type="radio" name="gender"
                                                             value="2"><span></span></span>保密</label>
                    </dd>

                    <script>
                        $(function () {

                            $('.cssradio').find("input[type='radio'][value='${user.gender}']").prop('checked', true);
                        })
                    </script>

                </dl>
                <dl class="clearfix">
                    <dt>居住城市：</dt>
                    <dd>
                        <div class="input-group">
                            <input type="text" name="city" value="${user.city}" data-city="广州" autocomplete="off"
                                   data-verification-name="居住城市">
                            <ul class="input-suggest"></ul>
                        </div>
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt>出生日期:</dt>
                    <dd>
                        <input type="text" readonly="true" name="birthday"
                               value="${user.birthday?string('yyyy-MM-dd')}"
                               data-toggle="datepicker" class="" autocomplete="off">
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt>个人简介：</dt>
                    <dd><textarea name="info" data-verification-name="个人简介" placeholder="例：摄影师/旅居澳洲/潜水爱好者"
                                  class="verification[maxSize[100]]" maxlength="100">${user.info}</textarea></dd>
                </dl>
                <dl class="clearfix">
                    <dt>收货地址：</dt>
                    <dd class="myaddress">
                        <a href="javascript:;">新增收货地址</a>
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt></dt>
                    <dd class="tips">
                        <p class="title"><b>**</b>提示信息<b>**</b></p>
                        <p>如果您在马蜂窝活动中获得奖品，我们将按照该收货地址发送奖品，
                            所以请填写 真实有效 的收货信息。</p>
                    </dd>
                </dl>
                <div class="btn-sub">
                    <button class="btn-submit" type="submit">保存</button>
                </div>
            </form>
        </div>
    </div>
    <div class="content hide">
        <div class="hd">
            <strong>我的头像</strong>
            <span>
                    资料完善度
                    <div class="progress">
                        <div class="num">85%</div>
                        <div class="on" style="width:85%"></div>
                    </div>
                </span>
        </div>
        <div class="userlogo">
            <div class="userlogo">
                <form action="/mine/updateHeadImgUrl" method="post" id="inputform">
                    <div class="btn-sub">
                    <#--用户id-->
                        <input type="hidden" name="id" value="${user.id}">
                        <img src="${(user.headImgUrl)!}" width="200" height="200" border="0" id="coverImage"><span
                            class="choseBtn"</span>
                        <input type="hidden" name="headImgUrl" id="pic" value="${(user.headImgUrl)!}">
                    </div>
                    <div class="btn-sub" id="photoBtn">
                        <div class="btn" style="position: relative; z-index: 1;">选择图片</div>
                    </div>
                    <div class="btn-sub">
                        <button type="button" id="btn-HeadImgUrl" class="btn">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="content hide"></div>
    <div class="content hide">
        <div class="hd">
            <strong>账号安全</strong>
            <span>
                    资料完善度
                    <div class="progress">
                        <div class="num">85%</div>
                        <div class="on" style="width:85%"></div>
                    </div>
                </span>
        </div>
        <div class="userpass">
            <dl class="clearfix">
                <dt>密码：</dt>
                <dd>
                    <a href="javascript:;" id="set-pw-btn">修改密码</a>
                    <div id="set-pw" class="hide">
                        <div class="ways">
                            <a href="/mine/phone" class="byphone"><i></i>
                                <p>手机验证修改</p>
                            </a>
                            <a href="javascript:;" class="bymail disable"><i></i>
                                <p>邮箱验证修改</p>
                            </a>
                        </div>
                    </div>
                </dd>
            </dl>
            <dl class="clearfix">
                <dt>绑定邮箱：</dt>
                <dd>
                ${user.email}<span class="status"><a class="vertifyMail" style="margin-left: 15px;"
                                                     href="javascript:;">验证邮箱</a></span>
                </dd>
            </dl>
            <dl class="clearfix">
                <dt>绑定手机：</dt>
                <dd>
                <#if user.phone??>${user.phone?substring(0,3)}***${user.phone?substring(8,11)}</#if>
                    <span class="status"><i></i>已绑定 <a class="modifyMobile" style="margin-left: 15px;"
                                                       href="javascript:;">更改号码</a></span>
                </dd>
            </dl>
            <dl class="clearfix logout">
                <dt>账号注销：</dt>
                <dd><a href="javascript:;">申请注销</a></dd>
            </dl>
            <ul class="logout-question">
                <li class="_j_question"><a>注销账号有哪些影响？ </a></li>
                <li class="_j_question"><a>注销账号的条件有哪些？ </a></li>
                <li class="_j_question"><a>已完成商家入驻，是否可以注销？</a></li>
                <li class="_j_question"><a>攻略号是否可以注销？</a></li>
                <li class="_j_question"><a>手机号未绑定可以注销账号吗？</a></li>
                <li class="_j_question"><a>绑定的手机号已更换，如何注销账号？</a></li>
                <li class="_j_question"><a>申请了注销是否还能撤销？</a></li>
                <li class="_j_question"><a>账号注销后，是否可以重新注册新账号？ </a></li>
                <li class="_j_question"><a>注销账户申请的审核时间是多久？</a></li>
            </ul>
            <br><br>
        </div>
    </div>
    <div class="content hide">
        <div class="hd">
            <strong>黑名单管理</strong>
            <span>
                    资料完善度
                    <div class="progress">
                        <div class="num">85%</div>
                        <div class="on" style="width:85%"></div>
                    </div>
                </span>
        </div>
        <div class="blacklist">
            <div class="bd clearfix">
                <dl class="col-search">
                    <dt class="s-bar focus">
                        <input id="name" class="inp-t" type="text" placeholder="输入用户昵称搜索指定用户">
                        <input id="search" class="inp-b" type="button">
                    </dt>
                    <dd>
                        <ul class="search-list">
                            <#if us??>
                        <#list us as u>
                            <li class="_j_question">${u.nickname}</li>
                        </#list>
                            </#if>
                        </ul>
                        <div class="action"><a id="add_blacklist" class="btn" href="javascript:void(0)">加入黑名单</a>
                        </div>
                    </dd>
                </dl>
                <dl class="col-list">
                    <dt>我的黑名单</dt>
                    <dd>
                        <ul id="blacklist">
                        </ul>
                    </dd>
                </dl>
                <div class="tips">＊你将不会收到此黑名单中用户发来的私信</div>
            </div>
        </div>
    </div>
    <div class="content hide">
        <div class="hd">
            <a class="btn-payPassword"
               href="/home/setting.php/setpaypwd?callback=%2Fsetting%2Fwallet%2F"><i></i>设置支付密码</a>
            <strong>我的钱包</strong>
            <span>
                    资料完善度
                    <div class="progress">
                        <div class="num">85%</div>
                        <div class="on" style="width:85%"></div>
                    </div>
                </span>
        </div>
        <div class="userwallet">
            <div class="bd">
                <div class="balance clearfix">
                    <div class="total">
                        <div class="honey">蜂蜜余额
                            <span><i class="icon-honey"></i><em>20</em></span>
                        </div>
                    </div>
                </div>
                <div class="income">
                    <div class="income_t clearfix">
                        <ul class="clearfix">
                            <li class="jq-nav-switch on" d_type="honey">
                                蜂蜜明细
                                <span class="bar"></span>
                            </li>
                        </ul>
                        <a href="http://www.mafengwo.cn/i/2947856.html" class="link">蜂蜜常见问题</a>
                    </div>
                    <table>
                        <thead>
                        <tr>
                            <td>收支明细</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>2019-05-22 17:52:20</td>
                            <td>
                                <p title="点评－预定并入住酒店后发表点评获得奖励">点评－预定并入住酒店后发表点评获得奖励</p>
                            </td>
                            <td class="reward">
                                蜂蜜：<span class="num" width="20"><em>+20</em></span></td>
                        </tr>
                        </tbody>
                    </table>
                    <div align="right" id="_j_tn_pagination" class="m-pagination">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content hide">
        <div class="hd">
            <strong>修改绑定手机</strong>
            <span>
                    资料完善度
                    <div class="progress">
                        <div class="num">85%</div>
                        <div class="on" style="width:85%"></div>
                    </div>
                </span>
        </div>

        <div id="setmail" class="setmail set-mobile-v2">
            <!--setMobile step2 -->
            <div class="navtag">
                <a class="step1 on" href="javascript:;"><i></i>身份验证</a><a class="step2"
                                                                          href="javascript:;"><i></i>修改绑定手机</a><a
                    class="step3" href="javascript:;"><i></i>完成修改</a>
            </div>
            <div class="set-mobile mobile-v1">
                <div class="tips">我们将向该手机发送验证码，请在下方输入您看到的验证码</div>
                <dl class="clearfix">
                    <dt>原手机号：</dt>
                    <dd>
                        <div class="sel-way">
                            <input type="text" id="mobile_input" placeholder="原手机号" value="">
                        </div>
                        <a class="btn-code getIdVerifyCode" id="getCode">获取验证码</a>
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt>验证码：</dt>
                    <dd><input id="verifyCode" type="text" value="" placeholder="请输入验证码"></dd>
                </dl>
                <div class="btns">
                    <a id="id_verify" class="btn-sub">提交</a>
                </div>
            </div>
            <div class="set-mobile mobile-v2">
                <dl class="clearfix">
                    <dt style="width:120px;">新的手机号码：</dt>
                    <dd>
                        <div class="sel-way">
                            <input id="newMobile" type="text" value="" placeholder="新手机号">
                        </div>
                        <a id="getChangeCode" class="btn-code">获取验证码</a>
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt style="width:116px;">验证码：</dt>
                    <dd><input id="newverifyCode" type="text" value="" placeholder="请输入4位数字验证码"></dd>
                </dl>
                <div class="btns" style="padding-left:126px">
                    <input id="c_code" type="hidden" value="588709">
                    <a id="change_mobile" class="btn-sub" type="text" value="">提交</a>
                <#--<button id="change_mobile" class="btn-sub" type="button">提交</button>-->
                </div>
            </div>
            <!--setMobile step2 end-->
        </div>
    </div>
    <div class="content hide">
        <div class="hd">
            <strong>设置邮箱</strong>
            <span>
                    资料完善度
                    <div class="progress">
                        <div class="num">85%</div>
                        <div class="on" style="width:85%"></div>
                    </div>
                </span>
        </div>
        <div class="setmail">
            <!--setMail-->
            <div class="navtag">
                <a class="step1 on" href="javascript:;"><i></i>输入邮箱</a><a class="step2"
                                                                          href="javascript:;"><i></i>前往邮箱验证</a><a
                    class="step3 " href="javascript:;"><i></i>完成绑定</a>
            </div>
            <div class="set-mail" id="changeEmail">
                <dl class="clearfix">
                    <dt>新的邮箱：</dt>
                    <dd><input type="text" id="email" value=""></dd>
                </dl>
                <div class="tips">我们将向该邮箱发送验证邮件，点击该邮件中的链接完成验证。</div>
                <div class="btns">
                    <a class="btn-sub" id="verify" href="javascript:;">发送验证邮件</a>
                    <a class="btn-exit" href="javascript:;">取消</a>
                </div>
            </div>
            <div class="set-mail" id="verifyEmail" style="display: none;">
                <p class="t1">邮件已发送到您的邮箱：<strong>etest@gmail.com</strong><a href="javascript:;"
                                                                            id="changeBtn">修改邮箱地址</a><br>请点击邮箱中的验证链接完成验证
                </p>
                <p class="go-email"><a class="btn-sub" id="resendEmail" href="javascript:;">重新发送验证邮件</a> <a
                        class="btn-sub" target="_blank" href="javascript:;">前往邮箱验证</a></p>
                <p class="t3">没有收到邮件？</p>
                <p class="t4">1.电子邮件偶尔会有延时状况，请耐心等待<br>2.尝试到垃圾邮件里找找看</p>
            </div>
            <!--setMail end-->
        </div>
    </div>
</div>
<div class="mfw-toolbar" id="_j_mfwtoolbar" style="display: block;">
    <div class="toolbar-item-top" style="display: none;">
        <a role="button" class="btn _j_gotop">
            <i class="icon_top"></i>
            <em>返回顶部</em>
        </a>
    </div>
    <div class="toolbar-item-feedback">
        <a role="button" data-japp="feedback" class="btn">
            <i class="icon_feedback"></i>
            <em>意见反馈</em>
        </a>
    </div>
    <div class="toolbar-item-code">
        <a role="button" class="btn">
            <i class="icon_code"></i>
        </a>
        <a role="button" class="mfw-code _j_code">


            <img src="https://p1-q.mafengwo.net/s1/M00/6C/51/wKgIC1t_6TuASybrAADGUPUHjr021.jpeg?imageMogr2%2Fthumbnail%2F%21450x192r%2Fgravity%2FCenter%2Fcrop%2F%21450x192%2Fquality%2F90"
                 width="450" height="192">
        </a>
        <!--<div class="wx-official-pop"><img src="http://images.mafengwo.net/images/qrcode-weixin.gif"><i class="_j_closeqrcode"></i></div>-->
    </div>

</div>
</body>
<!--文件上传-->
<form action="/mine/uploadImg" method="post" id="coverForm" enctype="multipart/form-data">
    <input type="file" name="pic" id="coverBtn" style="display: none;">
</form>

</html>