#!/bin/bash

version="0.1"
release="1"

rm -rf build/
mkdir -p build/kaji-${version}
#git clone https://github.com/opinkerfi/adagios.git build/adagios-${version}
cd build/kaji-${version}
#git checkout adagios-${version}-${release}

# Prepare source for DEB
cp -r ../../debian .
cd ..
tar czf kaji_${version}.orig.tar.gz kaji-${version}
cd kaji-${version}

dpkg-buildpackage -tc -us -uc


# copy patches
#cp debian/patches/*.patch ../../../opensusebuildservice/home\:sfl-monitoring/shinken
# Copy spec file
#cp ../kaji-${version}.tar.gz kaji.spec ../../
# copy deb files
cd ..
cp kaji*.changes kaji*.dsc kaji*.tar.xz kaji*.tar.gz ../
