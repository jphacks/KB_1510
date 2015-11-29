<?php
class FooController extends Controller {
  var $name = 'Foo';
  var $components = array('Geo');

  function index () {
    $data = $this->Geo->getAreaData();
    $lonA = 34.694404; //経度
    $latA = 135.182215; //緯度

    //距離を計算したい2点間の経度・緯度を入れる
    $calc = $this->Geo->calc_distance($lonA, $latA, $data['lon'], $data['lat']);
    $this->set('calc',$calc);
  }
}