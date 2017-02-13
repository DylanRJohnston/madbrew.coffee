#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

mup stop

ssh root@madbrew.coffee -p 2222 "/opt/letsencrypt/letsencrypt-auto certonly --standalone -d madbrew.coffee --renew-by-default"

rsync -raL -e "ssh -p 2222" root@madbrew.coffee:/etc/letsencrypt/live/madbrew.coffee/* ./app/private

gpg -ear dylan.r.johnston@gmail.com -r kenny457802550@gmail.com "./app/private/fullchain.pem"
gpg -ear dylan.r.johnston@gmail.com -r kenny457802550@gmail.com "./app/private/privkey.pem"

mup setup

mup start
