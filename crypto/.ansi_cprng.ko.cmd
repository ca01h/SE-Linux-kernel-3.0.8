cmd_crypto/ansi_cprng.ko := arm-linux-ld -EL -r  -T /workplace/linux-3.0.8/scripts/module-common.lds --build-id  -o crypto/ansi_cprng.ko crypto/ansi_cprng.o crypto/ansi_cprng.mod.o
