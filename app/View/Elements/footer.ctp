
<!-- 共通footer -->

<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-md-3 column">
                <h4>Follow Us</h4>
                <ul class="nav">
                    <li><a href="https://twitter.com/info_prokate">Twitter</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-3 column">
                <h4>Contact Us</h4>
                <ul class="nav">
                    <li><a href="http://appart-linux.cloudapp.net/test_prokate/contact/">Email</a></li>
                </ul>
            </div>
            <?php echo $this->Facebook->share('https://prokate.com');
                  echo $this->Facebook->like();
            ?>
        </div>
        <!--/row-->
        <p class="copyright">© 2015 Tech Spreaders</p>
    </div>
</footer>
