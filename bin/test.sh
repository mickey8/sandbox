#!/bin/bash
VAULT_PASS=`aws ssm get-parameter --name /beluga/ansible/vault-password --with-decryption | jq -r .Parameter.Value`
echo $1
cd /tmp && git clone https://github.com/mickey8/sandbox.git
echo "$VAULT_PASS" | ansible-playbook /tmp/sandobox/ansible/playbooks/test/site.yml --ask-vault-pass
