<div class="row">
                
                <div class="col-sm-2">名前：</div>
                <div class="col-sm-10"><textarea class="text" name="nickname"  id="nickname" cols="40" rows="1"></textarea></div>
                <br><br>
                <div class="col-sm-12">コンタクトを取るコメントを入力しよう！(300字以内) </div> 
                <div class="col-sm-2">書き込み：</div>
                <div class="col-sm-10"><textarea class="text" name="contents"   id="comment_val" cols="40" rows="4"></textarea></div>
                <div class="col-sm-2">削除パス：</div>
                <div class="col-sm-10" ><textarea class="text" name="pass"  id="pass" cols="40" rows="1"></textarea></div>
                    
                <input type="button" value="コメントする" id="comment_post" class="btn btn-primary pull-right" >


            </div>

<ul><?php //debug($teacher); ?>

<?php 
foreach($comment as $list): ?>
	<li><?php echo $list['Comment']['modified']; ?><br><?php echo $this->HTML->link($list['Comment']['commenter'],array('controller'=>'teachers','action' =>'view',$list['Comment']['teacher_id'])) ?> :</li><li> <?php echo h($list['Comment']['body']); ?></li>
<?php endforeach;?>
</ul>