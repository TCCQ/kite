CFILES = $(wildcard *.c)
OFILES = $(CFILES:.c=.o)
GCCFLAGS = -Wall -ffreestanding -nostdinc -nostdlib -nostartfiles -mstrict-align
CROSS_COMPILE = aarch64-linux-gnu-

all: clean kernel8.img

boot.o: boot.S
	${CROSS_COMPILE}gcc $(GCCFLAGS) -c boot.S -o boot.o

%.o: %.c
	${CROSS_COMPILE}gcc $(GCCFLAGS) -c $< -o $@

kernel8.img: boot.o $(OFILES)
	${CROSS_COMPILE}gcc -nostdlib boot.o $(OFILES) -T link.ld -o kernel8.elf
	${CROSS_COMPILE}objcopy -O binary kernel8.elf kernel8.img

clean:
	rm kernel8.elf *.o *.img > /dev/null 2> /dev/null || true
