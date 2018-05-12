CC = xcrun -sdk iphoneos clang
CFLAGS = -Wall -W -pedantic
CFLAGS += -Wno-long-long
CFLAGS += -O2
CFLAGS += -DUSE_SIGNAL=2
CFLAGS += -arch armv7 -mthumb

LD = gcc
LDFLAGS = -arch armv7
LDLIBS =

SOURCES = \
	lzss.c \
	iloader.c

OBJECTS = $(SOURCES:.c=.o)

.c.o:
	$(CC) -o $@ $(CFLAGS) -c $<

all: iloader

iloader: $(OBJECTS)
	$(CC) -o $@ $(LDFLAGS) $^ $(LDLIBS)

clean:
	-$(RM) $(OBJECTS)

realclean: clean
	-$(RM) iloader

dep:
	makedepend -Y $(SOURCES) -f depend

-include depend
