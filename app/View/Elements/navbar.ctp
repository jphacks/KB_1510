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

       <li style="margin-top: 4%;">

                  <?php //echo $this->Form->create('Teachers',array('action' => 'search'));

            //     echo $this->Form->input('keyword',array('label' => '検索'));
            //     echo $this->Form->end('検索');
            if(!isset($id)){
                $id = 3;
            }
            ?>
            <form method='get' action='searched'>
            <input type="text" name="keyword">
            <input type="submit" value="検索">
            </form>
            </li>

        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><?php
              if($acountSession == null){
                echo $this->Html->link('生徒ログイン', array('controller' => 'users', 'action' => 'login')) . "<li>";
                echo "<li>" . $this->Html->link('講師ログイン', array('controller' => 'teachers', 'action' => 'login'));
              }else{
                echo $this->Html->link('Logout', array('action'=>'logout'));
              }
            ?></li>
            <li><?php echo $this->Html->link('お問い合わせ', array('controller' => 'contact', 'action' => 'index')); ?></li>
        </ul>
    </div>

</div>
</nav>
