<?php  $profile = $teacher['User']; ?>

 <div class="myteachers">
        <!-- 自分の生徒一覧表示 -->
        <h2><?php echo $profile['username'] ?>さんの生徒一覧</h2>
        <?php //var_dump($teacher['Teachermatching']); ?><br>
        <?php foreach ($user['Teachermatching'] as $teacher): ?>
          <tr>
          <td><?php echo h($teacher['id']) ?></td>
          <td><?php echo $this->Html->link('講師：'.$teacher['name'], array('controller' => 'teachers', 'action' => 'view', $teacher['teacher_id'])); ?></td>
          </tr><br>
        <?php endforeach ?>
 </div>