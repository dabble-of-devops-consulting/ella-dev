#!/usr/bin/env bash

cd demo

mkdir -p logs
mkdir -p data/{analysis,attachments,igv-data,fixtures}
mkdir -p data/analysis/{incoming,imported}
mkdir -p data/fixtures/genepanels

docker-compose stop; docker-compose rm -f -v
docker-compose up -d
sleep 60
docker-compose exec ella bash -c "/ella/ops/test/reset_testdata.py --testset default"

echo "open up your browser at http://localhost:5000 to see the ella demo"