# docker-centos6-mysql
CentOS 6にMySQL 5.1(OS標準)をインストールしたコンテナを作成  
既にサポートが終了しているため、利用する機会はほぼ無いが、業務で必要になったため、簡易的な開発環境として作成

## 各ファイル一覧
* docker-compose.yml  
  
* Dockerfile  
  
* init.sh  
  テスト用DBをインストールするシェルスクリプト  
  
* init.sql  
  ユーザの作成などのSQLを格納  
  
* aaa.sql  
  mysqldumpで出力したテストデータ
  
* my.cnf  
  MySQLの設定ファイル

## 利用方法
1) init.sqlにDBユーザの設定などをセット
2) テストDBをセット (今回の場合、aaa.sql)
3) init.shにSQLファイルを読み込ますコマンドをセット
4) DockerfileにもSQLファイル名をセット 
5) 必要があれば、my.cnfやdocker-compose.ymlの内容も確認・変更
6) ターミナルにて"docker-compose.yml"があるディレクトリに移動し、`docker compose up -d` を実行し、開発環境の完成

## !!注意!!
これはあくまでも簡易的なコンテナの作成!!
