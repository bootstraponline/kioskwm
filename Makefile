# kioskwm - restricted window manager for kiosks
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c kioskwm.c util.c
OBJ = ${SRC:.c=.o}

all: options kioskwm

options:
	@echo kioskwm build options:
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

kioskwm: ${OBJ}
	@echo ${CC} ${CFLAGS} -o $@
	@${CC} ${CFLAGS} -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f kioskwm ${OBJ} kioskwm-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p kioskwm-${VERSION}
	@cp -R LICENSE Makefile README config.def.h config.mk \
		kioskwm.1 drw.h util.h ${SRC} transient.c kioskwm-${VERSION}
	@tar -cf kioskwm-${VERSION}.tar kioskwm-${VERSION}
	@gzip kioskwm-${VERSION}.tar
	@rm -rf kioskwm-${VERSION}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f kioskwm ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/kioskwm

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/kioskwm

.PHONY: all options clean dist install uninstall
