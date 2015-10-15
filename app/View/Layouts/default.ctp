<?php
/**
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.View.Layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

?>
<!DOCTYPE html>
<html lang='ja'>
<head>
	<?php echo $this->Html->charset(); ?>
	<title>
		<?php echo $title_for_layout ?>:
	</title>
	<?php
		echo $this->Html->meta('icon');
		echo $this->Html->css(array('animate.min', 'bootstrap.min', 'font-awesome.min', 'style'));
		echo $this->fetch('meta');
		echo $this->fetch('css');
		echo $this->fetch('script');
	?>
</head>
<body>
	<div id="container">
		<!-- ナビゲーション -->
		<div class="header">
			<?php echo $this->element('navbar'); ?>
		</div>

		<!-- コンテンツ部分 -->
		<div id="content">
			<?php echo $this->Flash->render(); ?>
			<?php echo $this->fetch('content'); ?>
		</div>

		<!-- フッター部分 -->
		<?php echo $this->element('footer'); ?>
	</div>
	<?php echo $this->Html->script(array('//code.jquery.com/jquery-2.1.4.min.js', 'bootstrap.min' , 'script')); ?>
</body>
</html>
