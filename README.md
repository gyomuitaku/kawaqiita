## サーバ起動手順
- docker、docker-composeのインストール

### コマンド

#### vagrant upみたいなもの(gem追加してbundle install時にも使う)
- docker-compose build
#### postgreデータベースマイグレーション
- docker-compose run web rake db:create db:migrate
#### サーバー起動
- docker-compose up 



###　削除コマンド(プロジェクト終了時、滅びの呪文)
- docker-compose down --rmi all --volumes --remove-orphans
docker-composeで作られた、コンテナ、イメージ、ボリューム、ネットワークそして未定義コンテナ、全てを一括消去するコマンドを説明する。
