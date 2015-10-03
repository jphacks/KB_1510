<nav class="navbar navbar-trans navbar-fixed-top" role="navigation">
<div class="container">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapsible">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <?php echo $this->Html->link($title_for_layout, array('controller' => 'posts', 'action' => 'index', 'class' => 'navbar-brand text-success')); ?>
    </div>
    <div class="navbar-collapse collapse" id="navbar-collapsible">
        <ul class="nav navbar-nav navbar-left">
            <li><a href="#section1">TOP</a></li>
            <li><a href="#section2">サービス概要</a></li>
            <li><a href="#section3">講師・受講者登録/ログイン</a></li>
            <li><a href="#section4">講師一覧</a></li>
        </ul>
        <!-- contactとloginについては後で実装するため後回し
        <ul class="nav navbar-nav navbar-right">
            <li><a href="http://appart-linux.cloudapp.net/test_prokate/contact/" data-toggle="modal">お問い合わせ</a></li>
            <?php #php echo "<li><a href='".$loginUrl."'>ログイン</i></a></li>" ?>
        </ul>
        -->
    </div>
</div>
</nav>
