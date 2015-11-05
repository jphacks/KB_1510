<h3>投稿ページ</h3>
<?php echo $this->Form->create('Profile', array('type' => 'file', 'action' => 'post')); ?>
    <?php echo $this->Form->input('Profile.photo', array('type' => 'file', 'label' => '投稿画像')); ?>
    <?php echo $this->Form->input('Profile.photo_dir', array('type' => 'hidden')); ?>
<?php echo $this->Form->end('Submit'); ?>