<style>
     .lg2 {
        position: absolute;
        top: 26px;
        left: 150px;
    }
</style>
<div class="navbar cm-navbar">
    <img class="logo" alt="Brand" src="/images/brand.png">
    <img src="/images/logo.png" class="lg2">
    <span class="pageTitle">&nbsp;</span>
    <ul class="nav navbar-nav navbar-right cm-navbar-nav ">
        <li>
            <p class="navbar-text text-info">
                <span class="glyphicon glyphicon-home"></span>
                <a href="http://192.168.16.93" target="_blank">前台首页</a>
            </p>
        </li>
        <li>
            <p class="navbar-text text-info">
                <span class="glyphicon glyphicon-sort"></span>
                <a href="javascript:;" id="putRedis">数据缓存到redis</a>
            </p>
        </li>
        <li>
            <p class="navbar-text text-info">
                <span class="glyphicon glyphicon-download-alt"></span>
                <a href="javascript:;" id="dataDown">redis数据落地</a>
            </p>
        </li>
        <li>
           <p class="navbar-text text-info">
               <span class="glyphicon glyphicon-user"></span>
               逍遥
           </p>
        </li>
        <li><a href="javascript:;">安全退出</a></li>
        <li><a href="javascript:;">个人设置</a></li>
    </ul>
</div>
<script>
    $(function () {
        //redis数据落地 按钮绑定事件
        $('#dataDown').on('click', function () {
            $.get('/dataDown', function (data) {
                checkData(data, "no", "redis数据落地成功");
            });
        });

        //redis数据落地 按钮绑定事件
        $('#putRedis').on('click', function () {
            $.get('/putRedis', function (data) {
                checkData(data, "no", "数据缓存到redis成功");
            });
        });

    });
</script>