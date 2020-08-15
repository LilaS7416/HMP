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

export CLANG_PATH=/home/andrea/linux-x86/clang-r383902c/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=/home/andrea/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=/home/andrea/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

echo
echo "Set DEFCONFIG"
echo 
make CC=clang O=out pop-kernel-poplar_defconfig

echo
echo "Build The Good Stuff"
echo 

make CC=clang O=out -j$(nproc --all)

echo
echo "Making anykernel zip"
echo 

#rm ./anykernel/poplar/zImage-dtb
#cp ./out/arch/arm/boot/zImage-dtb ./victara-anykernel
cp ./out.{ko} ./AnyKernel/poplar/modules/vendor/lib/modules
#cd anykernel/poplar
#rm ./Pop_kernel-poplar-Q-rx-x.zip
#zip -r9 Pop_kernel-poplar-Q-rx-x.zip * -x .git README.md *placeholder
#cd ..
#cd ..
