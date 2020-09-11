echo
echo "Setup"
echo 

mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
make O=out clean
make O=out mrproper

echo
echo "Issue Build Commands"
echo

export CLANG_PATH=/home/andrea/linux-x86/clang-r383902/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=/home/andrea/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=/home/andrea/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

echo
echo "Set DEFCONFIG"
echo 
make CC=clang O=out lineage-msm8998-yoshino-maple_dsds_defconfig

echo
echo "Build The Good Stuff"
echo 

make CC=clang O=out -j$(nproc --all)
