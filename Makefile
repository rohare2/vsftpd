#$Id: Makefile 20 2015-01-10 16:43:13Z rohare $
#$HeadURL: file:///usr/local/svn/master/etc/Makefile $
#
DIR= /etc/vsftpd

DATA_DIR= /var/ftp

FILES=	vsftpd.conf

DATA1= README
DATA2= README.pub

INST= /usr/bin/install

all: $(FILES) $(DATA1) $(DATA2)

install: uid_chk all
	@for file in ${FILES}; do \
		${INST} -p $$file ${DIR} -o root -g root -m 600; \
	done
	@for file in ${DATA1}; do \
		${INST} -p $$file ${DATA_DIR} -o root -g root -m 644; \
	done
	@for file in ${DATA2}; do \
		${INST} -p $$file ${DATA_DIR}/pub -o root -g root -m 644; \
	done

uid_chk:
	@if [ `id -u` != 0 ]; then echo You must become root first; exit 1; fi
