export NEUTRON_PATH="$(pwd)/neutron-clang"
          export PATH="$NEUTRON_PATH/bin:$PATH"
          export LD_LIBRARY_PATH="$HOME/.neutron-tc/lib:$NEUTRON_PATH/lib:$LD_LIBRARY_PATH"
          
          make O=out ARCH=arm64 r8s_defconfig
          
          make O=out ARCH=arm64 \
              CC=clang \
              LLVM=1 \
              LLVM_IAS=1 \
              CROSS_COMPILE=aarch64-linux-gnu- \
              CROSS_COMPILE_COMPAT=arm-linux-gnueabi- \
              KCFLAGS="-w" \
              AR=llvm-ar \
              NM=llvm-nm \
              OBJCOPY=llvm-objcopy \
              OBJDUMP=llvm-objdump \
              STRIP=llvm-strip \
              HOSTLD=ld \
              -j$(nproc --all)
