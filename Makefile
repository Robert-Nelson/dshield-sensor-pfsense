# Created by: Robert Nelson <robertn@the-nelsons.org>
# $FreeBSD$

PORTNAME=	dshield-sensor
PORTVERSION=	2015.04.03
CATEGORIES=	net-mgmt

MAINTAINER=	robertn@the-nelsons.org
COMMENT=	Submit firewall logs to Dshield Sensor periodically

RUN_DEPENDS=	p5-Net-IP:${PORTSDIR}/net-mgmt/p5-Net-IP

USE_GITHUB=	yes
GH_ACCOUNT=	Robert-Nelson
GH_PROJECT=	dshield-framework

DISTVERSIONPREFIX=	v

USES=		perl5 shebangfix
SHEBANG_FILES=	${WRKSRC}/build_clients.pl

USE_PERL5=	build run

NO_ARCH=	yes

.include <bsd.port.pre.mk>

post-extract:
	${CP} ${FILESDIR}/dshield-sensor ${WRKSRC}

post-patch:
	@${REINPLACE_CMD} -e 's,@@DATADIR@@,${DATADIR},g' -e 's,@@ETCDIR@@,${ETCDIR},g' ${WRKSRC}/dshield-sensor ${WRKSRC}/dshield.cnf

do-build:
	cd ${WRKSRC}; ./build_clients.pl
	@${REINPLACE_CMD} ${_SHEBANG_REINPLACE_ARGS} ${WRKSRC}/pfsense.pl

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_SCRIPT} ${WRKSRC}/pfsense.pl ${STAGEDIR}${DATADIR}/pfsense.pl
	${MKDIR} ${STAGEDIR}${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/dshield-source-exclude.lst ${STAGEDIR}${ETCDIR}/dshield-source-exclude.lst.sample
	${INSTALL_DATA} ${WRKSRC}/dshield-source-port-exclude.lst ${STAGEDIR}${ETCDIR}/dshield-source-port-exclude.lst.sample
	${INSTALL_DATA} ${WRKSRC}/dshield-target-exclude.lst ${STAGEDIR}${ETCDIR}/dshield-target-exclude.lst.sample
	${INSTALL_DATA} ${WRKSRC}/dshield-target-port-exclude.lst ${STAGEDIR}${ETCDIR}/dshield-target-port-exclude.lst.sample
	${INSTALL_DATA} ${WRKSRC}/dshield.cnf ${STAGEDIR}${ETCDIR}/dshield.cnf.sample
	${INSTALL_SCRIPT} ${WRKSRC}/dshield-sensor ${STAGEDIR}${PREFIX}/sbin/dshield-sensor

.include <bsd.port.post.mk>
