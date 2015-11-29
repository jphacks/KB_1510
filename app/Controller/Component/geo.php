<?php
App::import('Vendor','Geomobilejp_Mobile', array('file' => 'Geomobilejp'.DS.'Mobile.php'));
App::import('Vendor','Geomobilejp_Converter', array('file' => 'Geomobilejp'.DS.'Converter.php'));
App::import('Vendor','Geomobilejp_IArea', array('file' => 'Geomobilejp'.DS.'IArea.php'));

class GeoComponent extends Object {

  private $mobile;
  private $area;

  public function __construct() {
    $this->mobile = new Geomobilejp_Mobile;
    $conv = new Geomobilejp_Converter(
                                      $this->mobile->getLatitude(),
                                      $this->mobile->getLongitude(),
                                      $this->mobile->getDatum()
                                      );

    $iarea = new Geomobilejp_IArea;
    $this->area = $iarea->seekArea($conv);
  }

  public function getAreaData() {
    return array('code' => $this->area->getIAreaCode(),
                 'name' => $this->area->getName(),
                 'lat' => $this->mobile->getLatitude(),
                 'lon' => $this->mobile->getLongitude(),
                 );
  }

  public function calc_distance($lonA,$latA,$lonB,$latB) {
    //Ａ地点の経度・緯度を小数に
    preg_match("/(\d+)\.(\d+)\.(\d+)\.(\d+)/", $lonA, $regs);
    $a_long = $regs[1] + $regs[2] / 60 + $regs[3] / 3600 + $regs[4] / 36000;
    preg_match("/(\d+)\.(\d+)\.(\d+)\.(\d+)/", $latA, $regs);
    $a_lati = $regs[1] + $regs[2] / 60 + $regs[3] / 3600 + $regs[4] / 36000;

    //Ｂ地点の経度・緯度を小数に
    preg_match("/(\d+)\.(\d+)\.(\d+)\.(\d+)/", $lonB, $regs);
    $b_long = $regs[1] + $regs[2] / 60 + $regs[3] / 3600 + $regs[4] / 36000;
    preg_match("/(\d+)\.(\d+)\.(\d+)\.(\d+)/", $latB, $regs);
    $b_lati = $regs[1] + $regs[2] / 60 + $regs[3] / 3600 + $regs[4] / 36000;

    //ラジアンに変換
    $a_long = deg2rad($a_long);
    $a_lati = deg2rad($a_lati);
    $b_long = deg2rad($b_long);
    $b_lati = deg2rad($b_lati);

    $latave = ($a_lati + $b_lati) / 2;
    $latidiff = $a_lati - $b_lati;
    $longdiff = $a_long - $b_long;

    //子午線曲率半径
    $meridian = 6334834 / sqrt(pow(1 - 0.006674 * sin($latave) * sin($latave), 3));//日本測地系
    //  $meridian = 6335439 / sqrt(pow(1 - 0.006694 * sin($latave) * sin($latave), 3));//世界測地系

    //卯酉線曲率半径
    $primevertical = 6377397 / sqrt(1 - 0.006674 * sin($latave) * sin($latave));//日本測地系
    //  $primevertical = 6378137 / sqrt(1 - 0.006694 * sin($latave) * sin($latave));//世界測地系

    //Hubenyの簡易式
    $x = $meridian * $latidiff;
    $y = $primevertical * cos($latave) * $longdiff;
    return sqrt($x * $x + $y * $y);
  }
}