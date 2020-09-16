#!/usr/bin/env bash

cd /tmp

git clone https://gitlab.com/alleles/ella
cd ella
export BRANCH=1.11.1
git checkout 1.11.1
make build


docker tag local/ella-1.11.1:latest dabbleofdevops/ella:1.11.1
docker tag local/ella-1.11.1:latest dabbleofdevops/ella:latest
docker push dabbleofdevops/ella:latest
docker push dabbleofdevops/ella:1.11.1

cd /tmp

git clone https://gitlab.com/alleles/ella-anno
cd ella-anno
git checkout v2.0.3
echo "pyrsistent==0.16.0" >> pip-requirements
make build

docker tag local/anno-v2.0.3:latest dabbleofdevops/ella-anno:v2.0.3
docker tag local/anno-v2.0.3:latest dabbleofdevops/ella-anno:latest
docker push dabbleofdevops/ella-anno:latest
docker push dabbleofdevops/ella-anno:v2.0.3


