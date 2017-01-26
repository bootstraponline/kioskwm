# saucewm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dwm.c util.c
OBJ = ${SRC:.c=.o}

all: options saucewm

options:
	@echo saucewm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo ${CC} ${CFLAGS}  $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	@echo creating $@ from config.def.h
	@cp config.def.h $@

saucewm: ${OBJ}
	@echo ${CC} ${CFLAGS} -o $@
	@${CC} ${CFLAGS} -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f saucewm ${OBJ} saucewm-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p saucewm-${VERSION}
	@cp -R LICENSE TODO BUGS Makefile README config.def.h config.mk \
		dwm.1 drw.h util.h ${SRC} dwm.png transient.c saucewm-${VERSION}
	@tar -cf saucewm-${VERSION}.tar saucewm-${VERSION}
	@gzip saucewm-${VERSION}.tar
	@rm -rf saucewm-${VERSION}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f saucewm ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/saucewm

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/saucewm

.PHONY: all options clean dist install uninstall
