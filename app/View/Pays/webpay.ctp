<h3>お支払いありがとうございました</h3>
<ul>
<li>お支払い金額: <?php echo $result->amount; ?></li>
<li>カード名義: <?php echo $result->card->name; ?></li>
<li>カード番号: ****-****-****-<?php echo $result->card->last4; ?></li>
</ul>