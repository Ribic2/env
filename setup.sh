#!/bin/bash
# Crate docker required networks

docker network create \
  --driver=bridge \
  --subnet=172.22.1.0/24 \
  --opt com.docker.network.bridge.name=br-mailcow \
  mailcow-network


docker network create shared_net

docker network create discourse_network

#git clone mailcow-dockerized

# Copy docker-compose.yml to mail
# cp -f ./config/docker-compose-mailcow.yml ./services/mailcow/docker-compose.yml

# Create mailcow.conf from .env
#grep -E '^(MAILCOW_|DBNAME=|DBUSER=|DBPASS=|DBROOT=|REDISPASS=|HTTP_|HTTPS_|SMTP_|SMTPS_|SUBMISSION_|IMAP_|IMAPS_|POP_|POPS_|SIEVE_|DOVEADM_|SQL_PORT=|REDIS_PORT=|TZ=|COMPOSE_PROJECT_NAME=|DOCKER_COMPOSE_VERSION=|ACL_ANYONE=|MAILDIR_GC_TIME=|ADDITIONAL_SAN=|AUTODISCOVER_SAN=|ADDITIONAL_SERVER_NAMES=|SKIP_LETS_ENCRYPT=|ENABLE_SSL_SNI=|SKIP_IP_CHECK=|SKIP_HTTP_VERIFICATION=|SKIP_UNBOUND_HEALTHCHECK=|SKIP_CLAMD=|SKIP_SOGO=|SKIP_FTS=|FTS_HEAP=|FTS_PROCS=|ALLOW_ADMIN_EMAIL_LOGIN=|USE_WATCHDOG=|WATCHDOG_NOTIFY_BAN=|WATCHDOG_NOTIFY_START=|WATCHDOG_EXTERNAL_CHECKS=|WATCHDOG_VERBOSE=|LOG_LINES=|IPV4_NETWORK=|IPV6_NETWORK=|MAILDIR_SUB=|SOGO_EXPIRE_SESSION=|DOVECOT_MASTER_USER=|DOVECOT_MASTER_PASS=|ACME_CONTACT=|SPAMHAUS_DQS_KEY=|DISABLE_NETFILTER_ISOLATION_RULE=)' .env > ./services/mailcow/mailcow.conf

#echo "✅ mailcow.conf has been generated from .env"
