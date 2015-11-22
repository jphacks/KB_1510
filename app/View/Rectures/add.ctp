<h2>レクチャーメニュー追加</h2>
<div class="Rectures form">
<?php echo $this->Form->create('Recture'); ?>
  <fieldset>
  <?php  //var_dump($acountSession['Teacher']); ?>
    <legend><?php echo __('Add Recture'); ?></legend>
    <?php echo $this->Form->input('name', array(
      'type' => "hidden", 'value' => $acountSession['Teacher']['username']
    )); //セッション中の講師の名前を格納

    echo $this->Form->input('Recture.teacher_id', array(
      'type' => "hidden", 'value' => $acountSession['id']
    )); //セッション中の講師のIDを格納
    echo $this->Form->input('title', array(
      "label" => "タイトル"
    ));
     echo $this->Form->input('language', array(
      "label" => "言語"
    ));
      echo $this->Form->input('goal', array(
      'label' => "到達レベル"
    ));
    echo $this->Form->input('body', array(
      'label' => "内容"
    ));

    echo $this->Form->input('time', array(
      'label' => '所要時間'
    ));

    echo $this->Form->input('fee', array(
      'label' => '受講料'
    ));
    ?>
  </fieldset>
<?php echo $this->Form->end(__('登録する')); ?>
</div>
