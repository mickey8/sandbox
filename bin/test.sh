#!/bin/bash
GIT_TOKEN=`aws ssm get-parameter --name /beluga/git/token --with-decryption | jq -r .Parameter.Value`
VAULT_PASS=`aws ssm get-parameter --name /beluga/ansible/vault-password --with-decryption | jq -r .Parameter.Value`
echo $1
cd /tmp && git clone https://mickey8:${GIT_TOKEN}@github.com/mickey8/sandbox.git
echo "$VAULT_PASS" | ansible-playbook /tmp/sandbox/ansible/playbooks/test/site.yml --ask-vault-pass
