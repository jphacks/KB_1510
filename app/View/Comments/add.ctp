
<?php
/* ここで作成する form の ID がのちに必要になります。
   CakePHPが自動的にに付与するIDは #MyRecordAddForm となりますが、任意に引数でセットすることも可能です。
 */

echo $this->Form->create(null, array('url'=>'#'));

echo $this->Form->input('my_field');

// 送信ボタンにはデフォルトではIDが付与されないので引数でセットします

echo $this->Form->input('送信', array('id' => 'formSubmit'));
echo $this->Form->end();
?>

 

<div id='messageArea'></div><!-- レスポンスメッセージの表示エリア -->

<ul id='lastUpdate'></ul><!-- 最新データのリストアップエリア -->

 

<?php
$this->Html->scriptStart(array('inline' => false));
?>

<!-- /* ここに javascript を記述します。

ここに書いた javascript の記述は、いったん HtmlHelper 内に退避させたあと、レイアウトファイルに吐き出されます。

次項参照 */ -->

$(document).ready(function(){
  
  
  
    $('#formSubmit').click(function(){
  
            /* 1：送信ボタンを押した時の処理。つまり、jQuery.ajax() の実行 */
      
            $.ajax({
           
            type: 'POST',
           
             url: '<?php echo $this->Html->url(null, true); ?>',
           
            data: $( '#MyRecordAddForm' ).serializeArray(),
           
            success: function(data, textStatus, jqXHR) { 
            /* Ajax が成功したときの処理 */
            var jsonObj = $.parseJSON(data);
      
            updateMessageBox(jsonObj.message, jsonObj.succeed);
      
            if (jsonObj.succeed) {
      
                $('#MyRecordMyField').val(''); // 更新が成功したときのみ、インプットフィールドの値を空にする
      
                updateRecords();
      
            }
      
      
      
        },
      
      error: function(jqXHR, textStatus, errorThrown) { 
            /* Ajax に失敗したときの処理 */
            updateMessageBox('失敗しました:' + errorThrown, false);
        }
    });
  });
  
  
  
        /* 2:ホームの通常の送信機能を取り除く */
  
    $('#MyRecordAddForm').submit(function(){
  
        return false;
  
    });
  
  
  
    /* 3:#lastUpdate 内のデータを更新する関数(後述) */
  
   function updateRecords() {
    
      $.ajax( {
    
             type: 'POST',
    
              url: '<?php echo $this->Html->url('/comments/get_last_update/', true); ?>',
    
             data: {"num" : 10},
    
          success: function(data, dataType) {
    
              $("#lastUpdate").empty();
    
              var jsonObj = $.parseJSON(data);
    
              var length = jsonObj.lastUpdate.length;
    
              for( var i = 0; i < length; i++ ) {
    
                  var li = $('<li/>').text( jsonObj.lastUpdate[i].MyRecord.my_field ).fadeIn();
    
                  $("#lastUpdate").append(li);
    
              }
    
          },
    
          error: function (HMLhttpRequest, textStatus, errorThrown) {
              alert(textStatus + " : " + errorThrown);
          }
       });
    
    
  function updateMessageBox(text, succeed) {
    
      var color = succeed ? 'green' : 'red';
    
      var msg = $('<p/>').attr('id', 'resMessage').css('color', color).text(text).fadeIn();
    
      $('#messageArea').append(msg);
    
      setTimeout(function() {
    
          $('#resMessage').fadeOut();
    
      }, 2000 );
  }

  
  
  
    /* 4:#msgBox 内にメッセージを表示させて消す関数(後述) */
  
    function updateMessageBox( msg, status ) {
  
    }
  
  });
});


<?php 
$this->Html->script('jquery.js'); // webroot/js ディレクトリに jquery.js がある場合を想定
echo $this->fetch('script');
$this->Html->scriptEnd();
