
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>设置新密码 - 骡窝窝</title>
    <meta property="mfw:partner-platform" content="">
    <link href="https://css.mafengwo.net/css/cv/css+login+login_v2:mobile+css+omc+login-omc+login-omc^ZlY^1550829726.css"
          rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script>
        $(function () {
            $("#Mybutton").click(function () {
                $("#_j_reset_mobile_form").ajaxSubmit(function (data) {
                    if (data.success) {
                        location.href = "/login.html"
                    } else {
                        alert(data.msg)
                    }
                })
            })
        })
    </script>


<#--<#include "../common/mineNavbar.ftl">-->
</head>
<body background="/3ad73525-0345-49ab-b6dc-1fad0c798937.jpg">


<div class="wrapper">
    <div class="container">
        <a href="http://localhost/" title="返回首页" class="logo">骡窝窝</a>
        <div class="signup-forms">
            <div class="signup-box">
                <div class="add-info">
                    <div class="hd">设置新密码</div>
                    <div class="alert alert-info">短信验证码已下发，请注意查收。</div>
                    <form action="/mine/mobile" method="post" id="_j_reset_mobile_form">
                        <div class="form-field">
                            <input name="password" type="password" placeholder="您的密码" autocomplete="off"
                                   data-verification-name="密码"
                                   class="verification[required,minSize[6],maxSize[50]],funcCall[checkPasswordStrong]]"/>
                            <div class="err-tip"></div>
                        </div>
                        <div class="form-field">
                            <input name="rpassword" type="password" placeholder="确认密码" autocomplete="off"
                                   data-verification-name="密码" class="verification[equals[password]]"/>
                            <div class="err-tip"></div>
                        </div>
                        <div class="form-field">
                            <input name="smscode" type="text" placeholder="短信验证码" autocomplete="off"
                                   data-verification-name="短信验证码" class="verification[required]">
                            <div class="err-tip"></div>
                        </div>
                        <div class="submit-btn">
                            <button type="button" id="Mybutton">完成</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
