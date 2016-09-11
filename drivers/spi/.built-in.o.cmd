cmd_drivers/spi/built-in.o :=  arm-linux-ld -EL    -r -o drivers/spi/built-in.o drivers/spi/spi.o drivers/spi/spi_s3c64xx.o drivers/spi/spidev.o 
