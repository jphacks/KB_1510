##マネポケイ仕様書
***
###メニュー

 
- 1.ローカル開発環境(MAMP, Vagrant)  
phpを用いているので必須です。phpmyadminやmysqlが用意できる場所を用意しておいてください。



####2.git 使い方
#####clone (フォルダごと自分のパソコンに落とす)
クローンしたいディレクトリ場所に移動

`
git clone レポジトリurl(今回は　https://github.com/jphacks/KB_10.git)

`
　因みに,
フォルダのリモートレポジトリurl確認方法　

`
git remote -v

`

#####commit、push(フォルダの中身をgithub上に上げる)

`
git add .  //←変更を加えたファイル名　.は、全てという意味

`
git add .とすると全てのファイルをステージングエリアに投げることができる。

`
git commit -m “変更を加えた内容を書く

`

`
(1回目)
git push -u origin master

`
(2回目)
git push

#####pull 
(1回目)
'
git pull -u origin master
'
'
(2回目)
git pull
'

#####ブランチ切る。マージ
git checkout -b branch名
git push -u origin ブランチ名
2回目以降は　git push　のみでOK

######マージコマンド
git checkout master
git merge branch名



####ちょっと中級者用
#####リモートリポジトリ名　　リモートの削除
git remote rm 

#####チェックアウト
ステージングファイル条の変更を元に戻す
git status   変更になったファイルを見る。
git checkout ファイル名　　addしたファイルの状態を元に戻す。　(commit後は不可)

#####チェックアウトでコミットを戻す
git log  コミット履歴が見れる
git checkout commit名　　前のコミットに戻る






 _git checkout app/tmp_

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


####3. テーブル構築
- データベースの設定
「インポート」という方法でこちらのファイルをダウンロードしてデータベースを立ててください。   
[sqlファイル](requirements.sql) 
######ファイルの場所
/Applications/MAMP/htdocs/JPHACKS/KB_10/database/data_moneplay

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

###5. jsonのurl
1. ユーザーリストの取得用json⇢http://localhost:8888/JPHACKS/KB_10/database/data_moneplay/usersjson
2. 場所リストの取得用json⇢http://localhost:8888/JPHACKS/KB_10/database/data_moneplay/placesjson




###6 学習教材
1. [Codeschool](https://www.codeschool.com/)

海外サービスだが教材がわかりやすい。

##以下未編集のもの


