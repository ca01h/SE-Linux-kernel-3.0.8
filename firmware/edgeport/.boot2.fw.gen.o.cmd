cmd_firmware/edgeport/boot2.fw.gen.o := arm-linux-gcc -Wp,-MD,firmware/edgeport/.boot2.fw.gen.o.d  -nostdinc -isystem /opt/FriendlyARM/toolschain/4.5.1/lib/gcc/arm-none-linux-gnueabi/4.5.1/include -I/workplace/linux-3.0.8/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s5pv210/include -Iarch/arm/plat-s5p/include -Iarch/arm/plat-samsung/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables  -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -include asm/unified.h -msoft-float -gdwarf-2        -c -o firmware/edgeport/boot2.fw.gen.o firmware/edgeport/boot2.fw.gen.S

source_firmware/edgeport/boot2.fw.gen.o := firmware/edgeport/boot2.fw.gen.S

deps_firmware/edgeport/boot2.fw.gen.o := \
  /workplace/linux-3.0.8/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \

firmware/edgeport/boot2.fw.gen.o: $(deps_firmware/edgeport/boot2.fw.gen.o)

$(deps_firmware/edgeport/boot2.fw.gen.o):
