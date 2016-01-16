set -eux

git clone git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git util-linux
cd util-linux/

./autogen.sh
./configure --without-python --disable-all-programs --enable-nsenter
make
