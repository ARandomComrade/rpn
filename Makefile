#CFLAGS=-g -Wall -Wstrict-prototypes -ansi -pedantic
#LFLAGS=-lm -lbsd
CFLAGS=-g -Wall
LFLAGS=-lm

OBJS=rpn.o cmd.o linenoise.o

rpn: $(OBJS)
	$(CC) $(CFLAGS) -o rpn $(OBJS) $(LFLAGS)

linux: $(OBJS)
	$(CC) $(CFLAGS) -o rpn $(OBJS) $(LFLAGS) -lbsd

clean:
	-rm -f rpn $(OBJS)

install:
	install -s rpn /usr/local/bin/rpn

$(OBJS): rpn.h

