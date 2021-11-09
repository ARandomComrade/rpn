#CFLAGS=-g -Wall -Wstrict-prototypes -ansi -pedantic
CFLAGS=-g -Wall
LFLAGS=-lm

OBJS=rpn.o cmd.o linenoise.o

all: $(OBJS)
	$(CC) $(CFLAGS) -o rpn $(OBJS) $(LFLAGS)

clean:
	-rm -f rpn $(OBJS)

install:
	install -s rpn /usr/local/bin/rpn

tags:
	ctags *.c *.h

$(OBJS): rpn.h linenoise.h
