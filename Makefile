# Out-of-tree build for AW87390 speaker amplifier
# Backported from mainline Linux 6.7+

obj-m += snd-soc-aw87390.o snd-soc-aw88395-lib.o

snd-soc-aw87390-objs := aw87390.o
snd-soc-aw88395-lib-objs := aw88395/aw88395_device.o aw88395/aw88395_lib.o

ccflags-y += -I$(src) -I$(src)/aw88395

KSRC ?= /lib/modules/$(shell uname -r)/build

all:
	$(MAKE) -C $(KSRC) M=$(PWD) modules

clean:
	$(MAKE) -C $(KSRC) M=$(PWD) clean

install:
	$(MAKE) -C $(KSRC) M=$(PWD) modules_install
