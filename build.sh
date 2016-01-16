set -eux

git clone git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git util-linux
cd util-linux/

./autogen.sh
./configure --without-python --disable-all-programs --enable-nsenter
make

# CD back to root
cd ..

SHA1=$(git rev-parse HEAD)
mkdir -p build/current

# Actual build contents
cp util-linux/nsenter build/current/
git remote show origin | grep 'Fetch URL' | sed 's/.*Fetch URL: //' > build/current/origin

# And clone for relevant SHA1
cp -r build/current "build/$SHA1"
