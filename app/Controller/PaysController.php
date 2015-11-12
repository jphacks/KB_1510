<?php
	App::uses('AppController', 'Controller');
	App::import('Vendor', 'autoload');
	use WebPay\WebPay;

	/**
	 * Static content controller
	 *
	 * Override this controller by placing a copy in controllers directory of an application
	 *
	 * @package       app.Controller
	 * @link http://book.cakephp.org/2.0/en/controllers/pages-controller.html
	 */

	class PaysController extends AppController {
		public function beforeFilter(){
	    	parent::beforeFilter();
	    	$this->Auth->allow('webpay');
	  	}

		public $components = array('Flash');

		public function index(){
			$this->set('title_for_layout', 'Pro Kate | プロカテ（クレカ決済テスト）');
		}

		// サンプルコード
		public function webpay(){
			$amount = rand(1000,40000);	// 1000円〜40000円の範囲（ランダム）
			
			$webpay = new WebPay('test_secret_eIZc8b2y5cM67K50JA7MY0No');
			$result = $webpay->charge->create(array(
	   			"amount"=>intval($amount, 10),
	   			"currency"=>"jpy",
	   			"customer"=>"cus_4lMari2GX1d7fpp"
			));

			$this->set('result',$result);
		}
	}
?>