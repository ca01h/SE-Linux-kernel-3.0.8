cmd_drivers/gpio/built-in.o :=  arm-linux-ld -EL    -r -o drivers/gpio/built-in.o drivers/gpio/gpiolib.o drivers/gpio/gpio-plat-samsung.o drivers/gpio/gpio-s5pv210.o 
