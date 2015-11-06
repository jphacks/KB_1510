
<!-- 共通footer -->

<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-4 column">
                <h4>プレス・SNS</h4>
                <ul class="nav">
                    <li><a href="https://twitter.com/info_prokate" target="_blank">Twitter</a></li>
                </ul>
                <ul class="share">
                    <li><?php echo $this->Facebook->share('https://prokate.com'); ?></li>
                    <li><?php echo $this->Facebook->like(); ?></li>
                </ul>
            </div>
            <div class="col-xs-4 column">
                <h4>サポート</h4>
                <ul class="nav">
                    <li><a href="#">はじめての方へ</a></li>
                    <li><a href="#">ご利用ガイド</a></li>
                    <li><a href="#">よくある質問</a></li>
                    <li><a href="<?php echo 'http://'.$_SERVER["HTTP_HOST"].$this->webroot.'contact'; ?>">お問い合わせ</a></li>
                </ul>
            </div>
            <div class="col-xs-4 column">
                <h4>会社情報</h4>
                <ul class="nav">
                    <li><a href="http://appart.co.jp" target="_blank">株式会社APパートナーズ</a></li>
                    <li><a href="<?php echo 'http://'.$_SERVER["HTTP_HOST"].$this->webroot.'pages/agreement'; ?>">利用規約</a></li>
                    <li><a href="<?php echo 'http://'.$_SERVER["HTTP_HOST"].$this->webroot.'pages/privacy'; ?>">プライバシーポリシー</a></li>
                </ul>
            </div>
        </div>
        <!--/row-->
        <p class="copyright">© 2015 Tech Spreaders in AP Partners</p>
    </div>
</footer>
