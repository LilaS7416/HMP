export ARCH=arm64 && export SUBARCH=arm64
export CROSS_COMPILE=/home/andrea/aarch64-opt-linux-android/bin/aarch64-opt-linux-android-
mkdir -p out
make O=out clean
make O=out mrproper
make O=out lineage-msm8998-yoshino-poplar_defconfig
make O=out -j4
