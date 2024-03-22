OBJS		 = hello.o
PRG			 = HELLO.PRG

CC           = cc65
AS           = ca65
LD           = ld65

ASFLAGS      = --cpu 65SC02
LDFLAGS		 =

all: $(PRG)

$(PRG): $(OBJS)
	$(LD) $(LDFLAGS) -C cx16.cfg $(OBJS) -o $@

$(OBJS): %.o: %.s
	$(AS) $(ASFLAGS) -o $@ $?

clean:
	rm -f $(OBJS)
	rm -f $(PRG)
