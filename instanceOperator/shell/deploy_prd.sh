#!/bin/bash

. ./env/.env_prd

if [ -z $instance_id ]; then
    echo "インスタンスIDを指定してください"
    exit 1
fi
echo "インスタンスID："$instance_id

if [ -z $hostedzone_id ]; then
    echo "ホストゾーンIDを指定してください"
    exit 1
fi
echo "ホストゾーンID："$hostedzone_id

if [ -z $domain_name ]; then
    echo "ドメインネームを指定してください"
    exit 1
fi
echo "ドメインネーム："$domain_name

if [ -z $webhook_url ]; then
    echo "webhook_urlを指定してください"
    exit 1
fi
echo "webhook_url："$webhook_url

if [ -z $avatar_url ]; then
    echo "avatar_urlを指定してください"
    exit 1
fi
echo "avatar_url："$avatar_url

cd ../
read -p "デプロイを実施しますか？: " ANSWER
case $ANSWER in "Yes")
    echo "デプロイを実施します。"
    export STAGE="prd"
    export WEBHOOK_URL=$webhook_url
    export DOMAIN_NAME=$domain_name
    export HOSTEDZONE_ID=$hostedzone_id
    export INSTANCE_ID=$instance_id
    export AVATAR_URL=$avatar_url
    serverless deploy
    ;;
    * ) echo "デプロイは実施しません。"
esac