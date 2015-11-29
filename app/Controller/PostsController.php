<?php
class PostController extends AppController{

   public function posttest(){

     if(!empty($this->request->data)){

      //キーがPOST内容になっているので
      foreach($this->request->data as $key => $value){
        $Data = $key;
      }
      //PHPで使える配列に。
      $Data = json_decode($Data,true);

      //再度json形式にして返す
      $this->set('data',$Data);
      $this->viewClass = 'Json';
      $this->set('_serialize',array('data'));

     }

   }
}