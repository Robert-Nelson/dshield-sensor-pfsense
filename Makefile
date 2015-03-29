# Created by: Robert Nelson <robertn@the-nelsons.org>
# $FreeBSD$

PORTNAME=	dshield-sensor-pfsense
PORTVERSION=	2015.03.29
CATEGORIES=	net-mgmt

MAINTAINER=	robertn@the-nelsons.org
COMMENT=	Submit firewall logs to Dshield Sensor periodically

RUN_DEPENDS=	p5-Net-IP:${PORTSDIR}/net-mgmt/p5-Net-IP

USE_GITHUB=	yes
GH_ACCOUNT=	Robert-Nelson
GH_PROJECT=	dshield-framework

DISTVERSIONPREFIX=	v

USES=		perl5

USE_PERL5=	build run
USE_PHP=	yes
WANT_PHP_CLI=	yes

.include <bsd.port.pre.mk>

post-extract:
	${CP} ${FILESDIR}/Makefile ${WRKSRC}
	@${REINPLACE_CMD} -e 's,/usr/bin/perl,/usr/local/bin/perl,' ${WRKSRC}/build_clients.pl

post-build:
	@${REINPLACE_CMD} -e 's,/usr/bin/perl,/usr/local/bin/perl,' ${WRKSRC}/pfsense.pl

post-install:
	${INSTALL_SCRIPT} ${FILESDIR}/dshield-sensor ${STAGEDIR}${PREFIX}/sbin/dshield-sensor

.include <bsd.port.post.mk>
