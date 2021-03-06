# 概要
EC2インスタンスの起動停止を行う関数処理全般です。

### handler/ec2_operator
API GatewayをトリガーにEC2の起動停止を行います。

### handler/set_route53_record.py
EC2が起動/停止した際にRoute53のレコード削除追加を行います。

### handler/notification_for_discord.py
discordへのメッセージ通知を行います。

# 開発環境
nodejsで動作するServerless Frameworkを使用して開発しています。
yarnで必要なパッケージをインストールすることができます。

```bash
$ yarn install
```

# デプロイ
ディレクトリを移動してスクリプトを実行することでデプロイが可能です。
デプロイにはshell/env/に.envが必要です。

```text
slell
└── env
    ├── prd
    └── dev
       └── .env　各環境変数を`key=value`形式で記載
```

デプロイ

```bash
$ bash deploy_prd.sh
```

アンデプロイ

```bash
$ bash remove_prd.sh
```