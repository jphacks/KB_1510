<?php
App::uses('AppController', 'Controller');

class ContactController extends AppController{

  public $components = array('Session');

    public function beforeFilter(){
    parent::beforeFilter();

    $this->Auth->allow('resetpass');
  }

  public function index(){
    if (!$this->request->is('post') || !$this->request->data) {
        return;
    }

    $this->Contact->set($this->request->data);

    /*if (!$this->Contact->validates()) {
        $this->Session->setFlash('入力内容に不備があります。');
        return;
    }*/

    switch ($this->request->data['confirm']) {
        case '確認する':
            $this->render('confirm');$this->render('confirm');
            break;
        case '送信する':
            if ($this->sendContact($this->request->data['Contact'])) {
                $this->Session->setFlash('お問い合わせを受け付けました。');
        				return $this->redirect(array('controller' => 'contact', 'action' => 'index'));
            } else {
                $this->Session->setFlash('エラーが発生しました。');
                $this->redirect('/contact');
            }
            break;
    }
  }


  private function sendContact($content){

    App::uses('CakeEmail', 'Network/Email');
    $email = new CakeEmail('azure_sendgrid');

    return $email
        ->to(array($content['email'] => $content['subject']))
        ->bcc("econoics0it0bem0116@gmail.com")
        ->viewVars($content)
        ->template('default')
        ->send();
  }


  public function resetpass(){
    $this->render(resetpass);
  }

}
