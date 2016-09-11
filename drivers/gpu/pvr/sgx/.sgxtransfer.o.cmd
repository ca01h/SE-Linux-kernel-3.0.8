cmd_drivers/gpu/pvr/sgx/sgxtransfer.o := arm-linux-gcc -Wp,-MD,drivers/gpu/pvr/sgx/.sgxtransfer.o.d  -nostdinc -isystem /opt/FriendlyARM/toolschain/4.5.1/lib/gcc/arm-none-linux-gnueabi/4.5.1/include -I/workplace/linux-3.0.8/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s5pv210/include -Iarch/arm/plat-s5p/include -Iarch/arm/plat-samsung/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -marm -fno-dwarf2-cfi-asm -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -fomit-frame-pointer -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Wdeclaration-after-statement -Wpointer-arith -Wmissing-format-attribute -Wno-format-zero-length -Wmissing-prototypes -Wstrict-prototypes -Wno-unused-parameter -Wno-sign-compare -Werror -fno-strict-aliasing -Wno-pointer-arith -Os -DLINUX -D__linux__ -DANDROID -Idrivers/gpu/pvr -DSUPPORT_SGX_NEW_STATUS_VALS -DSUPPORT_SGX_HWPERF -DSYS_USING_INTERRUPTS -DPVR_SECURE_HANDLES -DTRANSFER_QUEUE -DSUPPORT_SGX -DSUPPORT_HW_RECOVERY -DLDM_PLATFORM -DPVR_LINUX_USING_WORKQUEUES -DPVR_LINUX_MISR_USING_PRIVATE_WORKQUEUE -DPVR_LINUX_TIMERS_USING_WORKQUEUES -DSYS_CUSTOM_POWERLOCK_WRAP -DSUPPORT_MEMINFO_IDS -DSYS_SGX_ACTIVE_POWER_LATENCY_MS=100 -DPVRSRV_MODNAME="\"pvrsrvkm\"" -Idrivers/gpu/pvr/sgx -DSUPPORT_GET_DC_BUFFERS_SYS_PHYADDRS -DPVR_LDM_DRIVER_REGISTRATION_NAME="\"pvrsrvkm\"" -DPVR_BUILD_TYPE="\"release\"" -DRELEASE -DPVRSRV_NEED_PVR_DPF -DPVRSRV_NEED_PVR_ASSERT -DSUPPORT_PERCONTEXT_PB -DSUPPORT_SGX_LOW_LATENCY_SCHEDULING -DSUPPORT_ACTIVE_POWER_MANAGEMENT -DPVRSRV_USSE_EDM_STATUS_DEBUG -DPVRSRV_DUMP_MK_TRACE -DPVR_BUILD_DIR="\"smdkc110_android\"" -Idrivers/gpu/pvr/s5pc110 -DDISPLAY_CONTROLLER=s3c_lcd -DSLSI_S5PC110 -DSGX540 -DSUPPORT_SGX540 -DSGX_CORE_REV=120    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(sgxtransfer)"  -D"KBUILD_MODNAME=KBUILD_STR(pvrsrvkm)" -c -o drivers/gpu/pvr/sgx/sgxtransfer.o drivers/gpu/pvr/sgx/sgxtransfer.c

source_drivers/gpu/pvr/sgx/sgxtransfer.o := drivers/gpu/pvr/sgx/sgxtransfer.c

deps_drivers/gpu/pvr/sgx/sgxtransfer.o := \
  /opt/FriendlyARM/toolschain/4.5.1/lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stddef.h \
  drivers/gpu/pvr/sgxdefs.h \
  drivers/gpu/pvr/sgxerrata.h \
  drivers/gpu/pvr/sgxfeaturedefs.h \
  drivers/gpu/pvr/img_types.h \
  drivers/gpu/pvr/img_defs.h \
  drivers/gpu/pvr/sgx540defs.h \
    $(wildcard include/config/mask.h) \
    $(wildcard include/config/shift.h) \
  drivers/gpu/pvr/services_headers.h \
  drivers/gpu/pvr/services.h \
  drivers/gpu/pvr/servicesext.h \
  drivers/gpu/pvr/pdumpdefs.h \
  drivers/gpu/pvr/servicesint.h \
  drivers/gpu/pvr/s5pc110/sysinfo.h \
  drivers/gpu/pvr/power.h \
  drivers/gpu/pvr/resman.h \
  drivers/gpu/pvr/queue.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/types.h \
  include/asm-generic/int-ll64.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/posix_types.h \
  include/linux/seq_file.h \
  include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /opt/FriendlyARM/toolschain/4.5.1/lib/gcc/arm-none-linux-gnueabi/4.5.1/include/stdarg.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/string.h \
  include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/have/arch/mutex/cpu/relax.h) \
  include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  include/linux/const.h \
  include/linux/spinlock_types.h \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/debug/spinlock.h) \
  include/linux/spinlock_types_up.h \
  include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/prove/rcu.h) \
  include/linux/rwlock_types.h \
  include/linux/linkage.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/linkage.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/system.h \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  include/linux/irqflags.h \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  include/linux/typecheck.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/irqflags.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/hwcap.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
    $(wildcard include/config/outer/cache.h) \
  include/asm-generic/cmpxchg-local.h \
  include/asm-generic/atomic-long.h \
  include/linux/mutex-debug.h \
  include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/spinlock/sleep.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  include/linux/bitops.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/bitops.h \
  include/asm-generic/bitops/non-atomic.h \
  include/asm-generic/bitops/fls64.h \
  include/asm-generic/bitops/sched.h \
  include/asm-generic/bitops/hweight.h \
  include/asm-generic/bitops/arch_hweight.h \
  include/asm-generic/bitops/const_hweight.h \
  include/asm-generic/bitops/lock.h \
  include/asm-generic/bitops/le.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/linux/swab.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/swab.h \
  include/linux/byteorder/generic.h \
  include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  include/linux/printk.h \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  include/linux/dynamic_debug.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/div64.h \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  include/linux/bitmap.h \
  include/linux/nodemask.h \
    $(wildcard include/config/highmem.h) \
  include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  drivers/gpu/pvr/srvkm.h \
  drivers/gpu/pvr/kerneldisplay.h \
  drivers/gpu/pvr/syscommon.h \
  drivers/gpu/pvr/s5pc110/sysconfig.h \
    $(wildcard include/config/h//.h) \
  drivers/gpu/pvr/ra.h \
  drivers/gpu/pvr/hash.h \
  drivers/gpu/pvr/osfunc.h \
  include/linux/hardirq.h \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/generic/hardirqs.h) \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
    $(wildcard include/config/no/hz.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tiny/preempt/rcu.h) \
  include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/use/domains.h) \
  include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/hardirq.h \
    $(wildcard include/config/local/timers.h) \
  include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/irq.h \
  arch/arm/mach-s5pv210/include/mach/irqs.h \
  arch/arm/plat-s5p/include/plat/irqs.h \
  include/linux/irq_cpustat.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/memory.h \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/arm/patch/phys/virt/16bit.h) \
  arch/arm/mach-s5pv210/include/mach/memory.h \
    $(wildcard include/config/mach/smdkc110.h) \
  /workplace/linux-3.0.8/arch/arm/include/asm/sizes.h \
  include/asm-generic/sizes.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  drivers/gpu/pvr/device.h \
  drivers/gpu/pvr/buffer_manager.h \
  drivers/gpu/pvr/perproc.h \
  drivers/gpu/pvr/handle.h \
  drivers/gpu/pvr/pvr_debug.h \
  drivers/gpu/pvr/metrics.h \
  drivers/gpu/pvr/buffer_manager.h \
  drivers/gpu/pvr/sgxinfo.h \
  drivers/gpu/pvr/sgxscript.h \
  drivers/gpu/pvr/sgxapi_km.h \
  drivers/gpu/pvr/sgxdefs.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/unistd.h \
    $(wildcard include/config/oabi/compat.h) \
  drivers/gpu/pvr/sgx_mkif_km.h \
  drivers/gpu/pvr/pdump_km.h \
  drivers/gpu/pvr/pdump_osfunc.h \
  drivers/gpu/pvr/pdump.h \
  drivers/gpu/pvr/sgx/mmu.h \
  drivers/gpu/pvr/sgx/sgxinfokm.h \
  drivers/gpu/pvr/device.h \
  drivers/gpu/pvr/power.h \
  drivers/gpu/pvr/sgxscript.h \
  drivers/gpu/pvr/pvr_bridge.h \
  include/linux/ioctl.h \
  /workplace/linux-3.0.8/arch/arm/include/asm/ioctl.h \
  include/asm-generic/ioctl.h \
  drivers/gpu/pvr/pvrmmap.h \
  drivers/gpu/pvr/sgx/sgx_bridge_km.h \
  drivers/gpu/pvr/sgxapi_km.h \
  drivers/gpu/pvr/sgx_bridge.h \
  drivers/gpu/pvr/sgxinfo.h \
  drivers/gpu/pvr/pvr_bridge.h \
  drivers/gpu/pvr/perproc.h \
  drivers/gpu/pvr/osfunc.h \
  drivers/gpu/pvr/pvr_debug.h \
  drivers/gpu/pvr/sgx/sgxutils.h \
  drivers/gpu/pvr/ttrace.h \
  drivers/gpu/pvr/services_headers.h \
  drivers/gpu/pvr/ttrace_common.h \
  drivers/gpu/pvr/ttrace_tokens.h \

drivers/gpu/pvr/sgx/sgxtransfer.o: $(deps_drivers/gpu/pvr/sgx/sgxtransfer.o)

$(deps_drivers/gpu/pvr/sgx/sgxtransfer.o):
