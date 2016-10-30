#$Id: Makefile 20 2015-01-10 16:43:13Z rohare $
#$HeadURL: file:///usr/local/svn/master/etc/Makefile $
#
DIR= /etc/vsftpd

FILES=	vsftpd.conf

INST= /usr/bin/install

all: $(FILES)

install: uid_chk all
	@for file in ${FILES}; do \
		${INST} -p $$file ${DIR} -o root -g root -m 600; \
	done

uid_chk:
	@if [ `id -u` != 0 ]; then echo You must become root first; exit 1; fi
