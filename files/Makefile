all:
	./build_clients.pl

install:
	mkdir ${DESTDIR}${PREFIX}/share/dshield-sensor
	${BSD_INSTALL_SCRIPT} pfsense.pl ${DESTDIR}${PREFIX}/share/dshield-sensor/pfsense.pl
	${BSD_INSTALL_SCRIPT} pfsense_mailer.php ${DESTDIR}${PREFIX}/share/dshield-sensor/pfsense_mailer.php
	${BSD_INSTALL_SCRIPT} pfsense_preprocessor.php ${DESTDIR}${PREFIX}/share/dshield-sensor/pfsense_preprocessor.php
	mkdir ${DESTDIR}${PREFIX}/etc/dshield-sensor
	${BSD_INSTALL_DATA} dshield-source-exclude.lst ${DESTDIR}${PREFIX}/etc/dshield-sensor/dshield-source-exclude.lst.sample
	${BSD_INSTALL_DATA} dshield-source-port-exclude.lst ${DESTDIR}${PREFIX}/etc/dshield-sensor/dshield-source-port-exclude.lst.sample
	${BSD_INSTALL_DATA} dshield-target-exclude.lst ${DESTDIR}${PREFIX}/etc/dshield-sensor/dshield-target-exclude.lst.sample
	${BSD_INSTALL_DATA} dshield-target-port-exclude.lst ${DESTDIR}${PREFIX}/etc/dshield-sensor/dshield-target-port-exclude.lst.sample
	${BSD_INSTALL_DATA} dshield-target-port-exclude.lst ${DESTDIR}${PREFIX}/etc/dshield-sensor/dshield.cnf.sample
