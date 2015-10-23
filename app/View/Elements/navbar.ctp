<nav class="navbar navbar-trans navbar-fixed-top" role="navigation">
<div class="container">

    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapsible">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <?php echo $this->Html->link($title_for_layout, '/', array('class' => 'navbar-brand text-success')); ?>
    </div>

    <div class="navbar-collapse collapse" id="navbar-collapsible">
        <ul class="nav navbar-nav navbar-left">
            <li><?php echo $this->Html->link('Top', '/'); ?></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><?php echo $this->Html->link('お問い合わせ', array('controller' => 'contact', 'action' => 'index')); ?></li>
            <li><?php
              if($acountSession == null){
                echo $this->Html->link('Login', array('controller' => 'users', 'action' => 'login')); #ログインはmodal
              }else{
                echo $this->Html->link('Logout', array('action'=>'logout'));
              }
            ?></li>
        </ul>
    </div>

</div>
</nav>
