make O=out ARCH=arm64 pop-kernel-poplar_defconfig

PATH="/home/andrea/linux-x86/clang-r383902/bin:/home/andrea/aarch64-linux-android-4.9/bin:/home/andrea/arm-linux-androideabi-4.9/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android- \
                      CROSS_COMPILE_ARM32=arm-linux-androideabi-
