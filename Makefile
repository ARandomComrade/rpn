#CFLAGS=-g -Wall -Wstrict-prototypes -ansi -pedantic
CFLAGS=-g -Wall
LFLAGS=-lm

OBJS=rpn.o cmd.o linenoise.o

all: 
	@$(MAKE) sys$$(uname -s)

sys:
	@echo Error: unknown operating system

sysLinux: $(OBJS)
	$(CC) $(CFLAGS) -o rpn $(OBJS) $(LFLAGS) -lbsd

sysOpenBSD: $(OBJS)
	$(CC) $(CFLAGS) -o rpn $(OBJS) $(LFLAGS)

clean:
	-rm -f rpn $(OBJS)

install:
	install -s rpn /usr/local/bin/rpn

$(OBJS): rpn.h linenoise.h

