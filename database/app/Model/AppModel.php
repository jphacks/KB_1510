<?php
/**
 * Application model for CakePHP.
 *
 * This file is application-wide model file. You can put all
 * application-wide model-related methods here.
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Model
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

App::uses('Model', 'Model');

/**
 * Application model for Cake.
 *
 * Add your application-wide methods in the class below, your models
 * will inherit them.
 *
 * @package       app.Model
 */
class AppModel extends Model {
  /*public function __construct($id = null, $table = null, $ds = null) {

    // データソースへの参照を取得
    $dbSource = ConnectionManager::getDataSource ($this->useDbConfig);

    // ローカル環境かどうかでデータベース名の切り替え
    if ($_SERVER ['REMOTE_ADDR'] == '127.0.0.1') {
            $dbName = 'default';
    } else {
            $dbName = 'test_server';
    }

    // データベース名の書き換え
    $dbSource->config ['database'] = $dbName;

    parent::__construct ($id, $table, $ds);

  }*/
}
