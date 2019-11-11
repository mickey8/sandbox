#!/bin/bash
GIT_TOKEN=`aws ssm get-parameter --region ap-northeast-1 --name /beluga/git/token --with-decryption | jq -r .Parameter.Value`
VAULT_PASS=`aws ssm get-parameter --region ap-northeast-1 --name /beluga/ansible/vault-password --with-decryption | jq -r .Parameter.Value`
echo $1
git clone https://mickey8:${GIT_TOKEN}@github.com/mickey8/sandbox.git /tmp/sandbox
echo "$VAULT_PASS" > ~/.vault_password
ansible-playbook /tmp/sandbox/ansible/playbooks/test/site.yml --vault-password-file ~/.vault_password
rm -f ~/.vault_password
rm -rf /tmp/sandbox
