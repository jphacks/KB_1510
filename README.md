##Prokate：プログラミング家庭教師
***
###メニュー

1. プロカテとは
2. チーム構成
2. プロカテ開発の際の環境設定
	1. ローカル開発環境設定
	2. ウェブ上のテストサーバー
	3. 【要確認】pushする際の注意
	4. データベース設定(database.php)
	5. テーブル構築 
3. システム概要
4. システム詳細
	1. 各コントローラーの機能
	2. 各コントローラーの関係性
	3. テーブル一覧
	4. テーブル構成
5. 学習教材

***

###1. プロカテとは
プログラミングの家庭教師サービス

***

###2. チーム構成
####監督
笠島

####ディレクター
高橋

####開発チーム
高橋・東口・深谷・三輪

####デザインチーム
村谷

####マーケティングチーム
森・八神

***

###3. プロカテ開発の際の環境設定
####3.1 ローカル開発環境設定
サーバーを経由したウェブアプリケーションなので「[ローカル開発環境](http://ecsite.jugem.jp/?eid=25)」が必要になります。  

- [bitbucket](https://bitbucket.org/appitg/prokate_cake)  
こちらで自分PCの適当な場所にレポジトリー作成してpullしてください。  
- ローカル開発環境(MAMP, Vagrant)  
phpを用いているので必須です。phpmyadminやmysqlが用意できる場所を用意しておいてください。


####3.2 ウェブ上のテストサーバー
ウェブ上で実際に動いているかテストするためのテストサーバーはこちらのURLになります。  
※こちらで開発したものを反映させるためにはサーバー側からpullしなければいけません。

- [テストサーバーurl](http://appart-linux.cloudapp.net/cake_prokate/)

####3.3 【要確認】pushする際の注意
app/tmp以下のキャッシュファイルが入っているのでこれを除いてpushしないと各自のPCで溜まったキャッシュファイルが衝突してエラーが起きる現象が起きています。  

######【対応策】  
1. _git add [変更したファイル名]_

git add .と全てのファイルをステージングエリアに投げてcommitしてpushしてしまうと上の現象が発生する。  
（例）  
Contoroller内のTeachersController.phpをいじった場合  

`
git add Controller/TeachersController.php
`

`
git commit -m ""
`

`
git push origin
`

例の通りadd->commit->pushしてください。


2. _git checkout app/tmp_

git checkoutによってtmp以下のファイルの変更がキャンセルされます。これによってtmp以下のファイルをaddしないように毎回すればgit add .で構いません。  
（例）  
Contoroller内のTeachersController.phpをいじった場合  

`
git checkout tmp/ 
`

`
git add .
`

以下はわかる通り。


####3.5 テーブル構築
- データベースの設定
「インポート」という方法でこちらのファイルをダウンロードしてデータベースを立ててください。   
[sqlファイル](requirements.sql)  

[参考：phpmyadminでインポートする方法](http://www.dbonline.jp/phpmyadmin/export-import/index3.html)  
[参考：MySQLコマンドでインポートする方法](http://qiita.com/rato303/items/2e614f23e5feee150ffc)

***

###4. システム概要
####4.1 システム全体像
![files](README/files.png)
cakePHPでは、主に3つのフォルダをいじります。

- Model: サーバーとのデータのやりとり
- Controller: ModelとViewの橋渡し（ロジック部分）
- View: 見た目のhtmlの出力

サーバーサイドを担当する人はModel, Controllerをいじることが多くて、フロントサイドを担当する人はController, Viewをいじることが多いかと思います。

***

###5. システム詳細
1. 各コントローラーの機能
2. 各コントローラーの関係性
3. テーブル一覧
4. テーブルごとの役割

####5.1 各コントローラーの機能
| Controller                    | 役割                                     |
|-------------------------------|------------------------------------------|
| UsersController               | 生徒のプロフィール情報関連               |
| TeachersController            | 講師のプロフィール情報関連               |
| MessagesController            | メッセージ一覧を表示するため             |
| Indivisual_MessagesController | 個別メッセージをやりとりするため         |
| ContactController             | お問い合わせ関連                         |
| ApiController                 | jsonをまとめて返すため（今使ってない。） |

#####今後使わないController

- PostsController

生徒からの要望を公募できる機能。優先順位は低いと判断し撤去

- User_MatchingController

TeacherMatchingControllerと機能が一致しているので。

- SendMeddagesController

IndivisualMessageControllerと機能が一致しているので。 

####5.2 各コントローラーの関係性
####ver2 
![コントローラーの関係性](README/outline_ver2.png)

####ver3
![コントローラーの関係性](README/outline_ver3.png)
- 講師プロフィール  
【ファイル場所】  
コントローラー app/Controller/TeachersController.php
モデル app/Model/Teacher.php   
ビュー app/View/Teachers/add.ctp, edit.ctp
- 生徒プロフィール
 【ファイル場所】  
コントローラー app/Controller/UsersController.php
モデル app/Model/User.php   
ビュー app/View/Users/add.ctp, edit.ctp

####5.3 テーブル一覧
| テーブル名          | 役割                           |
|---------------------|--------------------------------|
| users               | 生徒情報                       |
| teacher             | 講師情報                       |
| teachermatching     | マッチングした生徒と講師の情報 |
| messages            | メッセージの一覧の情報         |
| indivisual_messages | 個別メッセージの情報           |
| comments            | 今後使うかも                               |

#####今後使わないテーブル

- mentors
- posts
- user_matchings


***

###6 学習教材
1. [Codeschool](https://www.codeschool.com/)

海外サービスだが教材がわかりやすい。

##以下未編集のもの


##フロント側
###トップページ
![トップ](README/Home.png)
pass : prokate/index.php  
トップページは上記のファイルにて記述  
しかし、head部分やnav, footerなどは別ファイルから参照している（詳細は後述）
###共通部分
サービスを通して共通している部分はElementというcakePHPの技を使って記述
####ナビゲーションバー
pass : prokate/app/View/Elements/navbar.ctp  
navbar.ctpを見るとナビゲーション部分のみのコードが確認できる。メニューバーをいじりたいときはこちらで記述
###フッター
pass : prokate/app/View/Elements/footer.ctp  
footer.ctpにてフッター部分の記述。

###画像とかcssとかjsとかってどこにあるの？
画像とかの静的ファイル（毎回全く変化しないファイル）は以下のパスに格納されます。
![webroot](README/webroot.png)
pass : app/webroot
例えばcssファイルはcssのなか、画像ファイルはimg、jsファイルはjsという要領です。  
ちなみに、これらのよびだしかたもHTMLHelperというcakephpの技法で呼び出します。コードを書く量減っておすすめです。（今は全部先立って設定しているので気にしなくていいです。）  
####実際コードを書く場所
cssをいじりたい場合  
app/webroot/css/style.cssに書いていってください。  

jsをいじりたい場合  
app/webroot/css/script.jsに書いていってください。

###便利な小技達
####リンクを貼る


#####HTMLではこの記述のところ  
```
<a href="">???</a>
```
できるだけ相対パスで記述したほうが保守性が高い。cakePHPでは決まり文句的な書き方があるのでそちらを紹介。  
#####cakephpでの書き方
######例1

```
<?php echo $this->Html->link('Top', '/'); ?>
```  
例えばこう書くとHTML部分では、  

```
<a href="/prokate/">Top</a>
```  

となるのでトップページのindex.phpに行きます。

######例2
「講師のマイページに飛びたい」とか「生徒のログイン画面に飛びたい」とかが主なニーズですよね。  
そのときは、この公式を覚えればおけです。
  
```
<?php echo $this->Html->link('表示したい内容', array('controller' => 'コントローラーの名前', 'action' => 'アクションの名前'); ?>
```  

コントローラーっていうのは、いわゆる「講師」なのか「生徒」なのかどの機能部分を使うのかっていう話です。  
アクションっていうのは「講師」機能の特にどの画面・処理へ飛ばしたいのかっていうことです。 
 
例えば、講師の追加登録画面にリンクを飛ばしたい場合を考えてみましょう。  
この場合は、講師機能はTeachersController.phpとかなのでControllerの名前はteachersです。  
そしてTeachersController.phpを開いてみるとこんなファイルです。
![teacherscontroller](README/teacherscontroller.png)
  
action名っていうのは「public function」の後のヤツです。indexとかviewとかaddです。  

- index(): 講師機能のトップページ（講師情報の一覧できる場所)
- view(): 講師個別のマイページ
- add(): 登録

とそれぞれ画面ごとにアクションっていうのがあります。これを指定すればリンクに飛べます。  

さて、今回の例は「講師の追加登録画面にリンクを飛ばしたい。」なのでこうなります。  

```
<?php echo $this->Html->link('新規登録', array('controller' => 'teachers', 'action' => 'add')); ?>
```


[HTMLヘルパーcookbook](http://book.cakephp.org/2.0/ja/core-libraries/helpers/html.html)  
詳細はこちら  


##バックエンド側
####データベースの設定、操作(find,set)
次のコマンドで、データベースの内容を取得し、モデルのインスタンス（モデルの機能を、所定の条件で持たせたオブジェクト）を、viewに生成します。
  
######例3 全て持ってくる
```
$this->set('user', $this->User->find('all'); //ユーザーモデルの全ての情報 。
//viewでは、$userというインスタンスが生成される。
```  

######例4　指定のidを持ってくる
```
$this->set('user', $this->User->findById($id)); //ユーザーモデルの全ての,idカラムの値が$idのユーザー情報 
```  

######例5　特定の条件で持ってくる
```
  $params = array( //$paramsという情報に、以下の条件を持たせる。
        'order' => 'modified desc', //modefiedの最新順に上から表示するという指定
        'limit' => 20 //20件取得するという指定
      ); 
$this->set('user', $this->User->find('all', $params)); //$paramsという条件をもたせたUserモデルのインスタンス$userを、Viewに生成
```  

他にも、実際にSQL文で持ってくるなどの方法もあります。
詳細はこちら 
[findcookbook](http://book.cakephp.org/2.0/ja/models/retrieving-your-data.html)  


####viewでの書き方
Controllerのsetで命名した、
$インスタンス名[モデル名]['カラム名']で、dbのquery同様に、情報を取ってこれます。
######例6
```
//例4で、$id=4とした場合。//[setを含んだfunction名].ctpにて
echo $user['User']['name']; //Userモデルのカラムのidの値が4の、nameカラムの値が表示される。
//= mysql_db_query("所定のdb","select name from users where id = 4");
``` 

##Component(コンポーネント)
####AuthComponent
ユーザーログイン認証の実装を行うComponent。AppControllerに、共通の機能を実装する処理を実装し、各クラス(Controller)に継承させることで、機能の引き継ぎが行える。また、各クラスごとのAuthクラスメソッドに処理を施すと、継承先のクラスごとに固有の処理が行える。beforeFilterというメソッドは、各Controllerの関数を呼び出す前に呼び出される。このような処理により、認証などの前処理を行うことが出来る。
  
######例 ログインせずに画面を見る（Controllerの関数を呼び出す）許可
```
$this->Auth->allow('add', 'logout'); //addと、logoutという機能に関しては、ログイン認証なしに呼び出せる。 
```  
この機能を使いこなせば、同じ環境で、ログインを気にせずにいろんなViewの編集ができるので、覚えておくと便利。

##作業場所参照

###講師側機能実装部分  

- app/View/Teachers/
- app/Controller/TeachersController.php
- app/Model/Teacher.php

以上の3つのフォルダとファイルで具体的な機能を実装してます。

###生徒側機能実装部分
- app/View/Users/
- app/Controller/UsersController.php
- app/Model/User.php

###お問い合わせ機能実装部分
- app/View/Contact/
- app/View/Email/text/default.ctp
- app/Controller/ContactController.php
- app/Model/Contact.php