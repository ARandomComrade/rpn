#CFLAGS=-g -Wall -Wstrict-prototypes -ansi -pedantic
#LFLAGS=-lm -lbsd
CFLAGS=-g -Wall
LFLAGS=-lm

OBJS=rpn.o cmd.o linenoise.o

all: 
	@$(MAKE) uname$$(uname -s)

uname:
	@echo Error: unknown operating system

unameLinux: $(OBJS)
	$(CC) $(CFLAGS) -o rpn $(OBJS) $(LFLAGS) -lbsd

unameOpenBSD: $(OBJS)
	$(CC) $(CFLAGS) -o rpn $(OBJS) $(LFLAGS)

clean:
	-rm -f rpn $(OBJS)

install:
	install -s rpn /usr/local/bin/rpn

$(OBJS): rpn.h

