
#!/usr/bin/env bash

WORK_DIR=$(pwd)

git submodule update --remote
cd ella && git checkout 1.11.1 && cd ${WORK_DIR}
cd ella-anno && git checkout v2.0.3 && cd ${WORK_DIR}

cd dev

rm -rf logs
rm -rf data

mkdir -p logs
mkdir -p data/{analysis,attachments,igv-data,fixtures}
mkdir -p data/analysis/{incoming,imported}
mkdir -p data/fixtures/genepanels

echo "Copying over user data"
cp dev-data/usergroups.json data/fixtures
cp dev-data/users.json data/fixtures

echo "Copying over analysis data"
cp ../ella/src/vardb/testdata/unannotated/brca_sample_1.vcf data/analysis/incoming

echo "Copying over genepanel data"
cp -rf ../ella/src/vardb/testdata/clinicalGenePanels/HBOC_v01 data/fixtures/genepanels

docker-compose stop; docker-compose rm -f -v
docker-compose up -d  --remove-orphans
sleep 10
#docker-compose exec ella bash -c "/ella/ops/test/reset_testdata.py --testset default"
docker-compose exec ella bash -c "ella-cli database make-production"
docker-compose exec ella \
    bash -c \
    "ella-cli deposit genepanel --genepanel_name HBOC --genepanel_version v01 \\
        --transcripts_path /data/fixtures/genepanels/HBOC_v01/HBOC_v01.transcripts.csv \\
        --phenotypes_path /data/fixtures/genepanels/HBOC_v01/HBOC_v01.phenotypes.csv
    "
docker-compose exec ella bash -c "ella-cli users add_groups /data/fixtures/usergroups.json"
docker-compose exec ella bash -c "ella-cli users add_many /data/fixtures/users.json"
#docker-compose exec ella bash -c "ella-cli igv-download ${IGV_DATA}"
