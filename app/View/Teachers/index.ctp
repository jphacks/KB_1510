<section class="container-fluid" id="section1">
    <div class="v-center">
        <h1 class="text-center">Pro Kate</h1>
        <h2 class="text-center lato animate slideInDown">Teacher and Student for you </h2>
        <p class="text-center">
            <br>
            <?php echo $this->Html->image('facebook_login.png', array('width' => '300', 'height' => '70', 'alt' => 'facebook_login',
					 	'url' => array('controller' => 'users', 'action' => 'login'))); ?>
        </p>
    </div>
        <div class="scroll-down bounceInDown animated">
            <span>
                <i class="fa fa-angle-down fa-2x"></i>
            </span>
        </div>
        </a>
</section>

<section class="container-fluid" id="section2">
    <h1 class="text-center">Pro Kateとは</h1>
		<?php echo $this->Html->image('logo.png', array('class' => 'logo_top')); ?>
    <div class="col-sm-6 col-sm-offset-3">
      <h3 class="text-center lato slideInUp animate">プログラミングを学びたい人・教えたい人<br>のためのマッチングサービスです。<br><br>登録簡単！<br><br>
講師側は、簡単なスキルを登録するだけで、教育の依頼が来ます！<br><br>
受講者側は、安く、我々が提供する質の良いテキストを元に、従来より安く、プログラミングの授業が受けられます！</h3>
      <br>
      <div class="row">
      <h3>こんな人にオススメ！</h3>
        <div class="media-body media-middle">
            <p>・これからプログラミングを学びたい人<br>
・スキルはあるけど、忙しくてなかなか従事できない人<br>・案件を受けるほどのプロフェッショナルなスキルはなくても、初学者に教えられるだけの自信のある人</p>
        </div>
    </div>
    </div>
</section>

<section class="container-fluid" id="section3">
    <div class="container v-center">
        <div class="row">
          <div class="col-xs-4 col-xs-offset-1 text-center">
            <div class="panel panel-default slideInLeft animate">
							<?php echo $this->Html->link('講師登録／ログイン', array('controller' => 'teachers', 'action' => 'add'), array('class' => 'center-block btn btn-default btn-lg btn-huge lato animate slideInRight')); ?>
            </div>
          </div>
          <div class="col-xs-4 col-xs-offset-1 text-center">
            <div class="panel panel-default slideInUp animate">
							<?php echo $this->Html->link('生徒登録／ログイン', array('controller' => 'users', 'action' => 'add'), array('class' => 'center-block btn btn-default btn-lg btn-huge lato animate slideInRight')); ?>
            </div>
          </div>
        </div>
    </div>
    <!--/container-->
</section>

<section class="container-fluid" id="section4">
  <h2 class="text-center">講師一覧</h2>
  <div class="container-fluid">
    <div class="row">
      <?php foreach($teacher as $list): ?>
      	<li class="col-md-3"><?php echo h($list['Teacher']['username']) ?> by <?php echo h($list['Teacher']['job']); ?>
        <?php echo $this->Html->link('詳細', array('controller' => 'teachers', 'action' => 'view', $list['Teacher']['id'])); ?>
        </li>
      <?php endforeach;?>
  </div>
  <?php echo $this->Html->link('もっと見る', array('controller' => 'teachers', 'action' => 'lists'), array('class' => 'btn btn-success')); ?>
</div>
</section>
<br>
<section class="container-fluid" id="section5">
  <h2 class="text-center">生徒一覧</h2>
  <div class="container-fluid">
    <div class="row">
      <?php foreach($user as $list): ?>
        <li class="col-md-3"><?php echo h($list['User']['username']) ?> by <?php echo h($list['User']['job']); ?>
        <?php echo $this->Html->link('詳細', array('controller' => 'users', 'action' => 'view', $list['User']['id'])); ?>
        </li>
      <?php endforeach;?>
  </div>
  <?php echo $this->Html->link('もっと見る', array('controller' => 'users', 'action' => 'lists'), array('class' => 'btn btn-success')); ?>
</div>
</section>
