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
make CC=clang O=out lineage-msm8998-yoshino-lilac_defconfig

echo
echo "Build The Good Stuff"
echo 

make CC=clang O=out -j$(nproc --all)

echo
echo "Making flashable zip"
echo

echo
echo "Clean up"
echo
rm ./AnyKernel3/iliac/Pop_kernel-iliac-Q-rx-x.zip
rm ./AnyKernel3/iliac/Image.gz-dtb

echo
echo "copying new files"
echo
cp ./out/arch/arm64/boot/Image.gz-dtb ./AnyKernel3/iliac/
cp ./out/block/test-iosched.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/char/rdbg.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/input/misc/bu520x1nvx.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/input/misc/fpc1145_platform.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/media/platform/msm/broadcast/tspp.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/media/platform/msm/dvb/adapter/mpq-adapter.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/media/platform/msm/dvb/demux/mpq-dmx-hw-plugin.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/media/usb/gspca/gspca_main.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/misc/ldo_vibrator.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/misc/pn553.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/misc/sim_detect.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/platform/msm/msm_11ad/msm_11ad_proxy.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/scsi/ufs/ufs_test.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/staging/kscl/kscl.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/net/bridge/br_netfilter.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cp ./out/drivers/staging/qcacld-3.0/wlan.ko ./AnyKernel3/iliac/modules/system/vendor/lib/modules/
cd ./AnyKernel3/iliac/
zip -r9 Pop_kernel-iliac-Q-rx-x.zip * -x .git README.md *placeholder
