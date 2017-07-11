#! /bin/bash

INPUT=/data/wsi/img/TCGA-49-4514-01Z-00-DX1.9c304807-2a0c-44f7-97cc-fbd30f2c740f.svs
CASE=TCGA-49-4514-01Z-00-DX1
PATIENT=TCGA-49-4514

date
docker run --rm -v /data/wsi:/data/wsi \
       -e OMP_NUM_THREADS=64 \
       -e ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1 \
       tmkurc/pathomics_analysis \
       mainSegmentFeatures -t wsi -i $INPUT \
       -o /data/wsi/output1 -s 0,0 -b 2048,2048 -d 2048,2048 \
       -a "test:j2" -e “test run j1” \
       -c $CASE -p $PATIENT \
       -j 2 -v mask:img:overlay -z /data/wsi/$CASE.zip
date
