<dl>
<?php foreach ($this->request->data['Contact'] as $name => $val ): ?>
        <dt><?php echo h($name); ?></dt>
        <dd><?php echo h($val); ?></dd>
<?php endforeach; ?>
</dl>

<?php

echo $this->Form->create('Contact');

foreach ($this->request->data['Contact'] as $name => $val) {
    echo $this->Form->hidden($name, array('value' => $val));
}

echo $this->Form->submit('修正する', array('name' => 'confirm'));
echo $this->Form->submit('送信する', array('name' => 'confirm'));

echo $this->Form->end();
