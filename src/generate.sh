#!/bin/bash

PROJECT_DIR=$(cd `dirname $0`/..; pwd)
SRC_DIR=$PROJECT_DIR/src
TARGET_DIR=$PROJECT_DIR

cd $SRC_DIR

for file in $(find . -name "*.xml" -not -name "site.xml"); do
  file=$(echo $file | sed -r 's#\./(.*)#\1#g')
  path=$(dirname $file)/$(basename $file .xml)
  path=$(echo $path | sed -r 's#\./(.*)#\1#g')
  mkdir -p $TARGET_DIR/$(dirname $file)
  target_file=$TARGET_DIR/$path.html
  echo "Processing $path..."
  xsltproc -v -o $target_file \
	--xinclude --encoding utf-8 --stringparam page $path \
	./xsl/site.xsl ./site.xml
done

