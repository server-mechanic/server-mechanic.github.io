#!/bin/bash

SRC_DIR=$(cd `dirname $0`; pwd)/src

PUBLIC_DIR=$1
if [ -z "$PUBLIC_DIR" ]; then
PUBLIC_DIR=$(cd `dirname $0`; pwd)/public
fi

mkdir -p $PUBLIC_DIR

cd $SRC_DIR
cp -uvR assets/ $PUBLIC_DIR/
# legacy
cp -uvR images/ $PUBLIC_DIR/

for file in $(find . -name "*.xml" -not -name "site.xml"); do
  file=$(echo $file | sed -r 's#\./(.*)#\1#g')
  path=$(dirname $file)/$(basename $file .xml)
  path=$(echo $path | sed -r 's#\./(.*)#\1#g')
  mkdir -p $PUBLIC_DIR/$(dirname $file)
  target_file=$PUBLIC_DIR/$path.html
  #if [ ! $target_file -o $file -nt $target_file ]; then
  echo "############################"
  echo "# Processing $path..."
  echo "############################"
  xsltproc -v -o $target_file \
	--xinclude --encoding utf-8 --stringparam page $path \
	./xsl/site.xsl ./site.xml
  #fi
done

