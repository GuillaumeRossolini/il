#!/usr/bin/env bash
#
# Script to install and build dependencies up to final programs like
#  the httpd and nginx web servers,
#  several versions of the PHP language,
#  and some compression and image tools
#
# /!\ This is intended for demonstration purposes on a clean Debian install
# /!\ Do not use on a Production server unless you understand what you are doing
#
{
apt-get install ntp certbot locate make gcc g++ gcc-multilib pkg-config autoconf automake \
  zip libbz2-dev libfreetype6-dev libgif-dev docbook-xsl python-dev python3-dev golang git \
  unzip mailutils htop postfix libsasl2-modules libtool sudo sysstat dpkg-dev python \
  libde265-dev tcl8.5 libxpm-dev libunistring-dev libfftw3-dev openbsd-inetd libicu-dev

TMPV_AUTOCONF=2.69
TMPV_AUTOMAKE_MIN=1.13.4
TMPV_AUTOMAKE_MAX=1.16.1
TMPV_CMAKE=3.12.2
TMPV_LIBTOOL=2.4.6
TMPV_LIBZIP=1.5.1
TMPV_ZLIB=1.2.11
TMPV_LIBGPGERR=1.32
TMPV_LIBGCRYPT=1.8.3
TMPV_OPENSSL_MAX=1.1.1
TMPV_OPENSSL_MIN=1.0.2p
TMPV_LIBSSH2=1.8.0
TMPV_LIBIDN=1.17
TMPV_LIBIDN2=2.0.0
TMPV_LIBICONV=1.15
TMPV_LIBEVENT=2.1.8
TMPV_LIBEV=4.24
TMPV_XZ=5.2.4
TMPV_LIBXML2=2.9.8
TMPV_LIBXSLT=1.1.32
TMPV_LIBMETALINK=0.1.3
TMPV_JPEG=9c
TMPV_LIBPNG=1.6.34
TMPV_FREETYPE=2.9.1
TMPV_GSS=1.0.3
TMPV_JEMALLOC=5.1.0
TMPV_JANSSON=2.11
TMPV_SPDYLAY=1.4.0
TMPV_CARES=1.14.0
TMPV_NGHTTP2=1.34.0
TMPV_IMAP=2007f
TMPV_LIBPSL=0.20.2
TMPV_ICU=62.1
TMPV_BROTLI=1.0.6
TMPV_RTMPDUMP=2.3
TMPV_CURL=7.61.1
TMPV_OPENJPEG=2.3.0
TMPV_JPEGINFO=1.6.1
TMPV_JPEGOPTIM=1.4.6
TMPV_PCRE=8.42
TMPV_PCRE2=10.32
TMPV_APR=1.6.5
TMPV_APRTUTIL=1.6.1
TMPV_GAWK=4.2.1
TMPV_JBIG2DEC=0.15
TMPV_TIFF=4.0.9
TMPV_YASM=1.3.0
TMPV_ZOPFLI=1.0.2
TMPV_ADVANCECOMP=2.1
TMPV_WEBP=1.0.0
TMPV_LIBVPX=1.7.0
TMPV_JASPER=2.0.14
TMPV_LITTLECMS=2.9
TMPV_GHOSTPDL=9.25
TMPV_LIBFPX=1.3.1-10
TMPV_GRAPHVIZ=2.40.1
TMPV_IMAGICK=7.0.8-11
TMPV_FDKAAC=0.1.6
TMPV_NASM=2.13.03
TMPV_FFMPEG=4.0.2
TMPV_PHANTOMJS=2.1.1
TMPV_HTTPD=2.4.35
TMPV_LIBSODIUM=1.0.16
TMPV_PUREFTPD=1.0.47
TMPV_NGINXMVTS=0.1.18
TMPV_NGINX_MIN=1.14.0
TMPV_NGINX_MAX=1.15.3
TMPV_REDIS=4.0.11
TMPV_BISON=3.1
TMPV_RE2C=1.1.1
TMPV_TIDY=5.6.0
TMPV_PHP56=5.6.39
TMPV_PHP70=7.0.33
TMPV_PHP71=7.1.25
TMPV_PHP72=7.2.13
TMPV_PHP73=7.3.0

TMPV_PECL_AMQP=1.9.3
TMPV_PECL_HTTP_BRANCH5=2.6.0
TMPV_PECL_HTTP_BRANCH7=3.2.0
TMPV_PECL_REDIS=4.1.1
TMPV_PECL_RAPHF_BRANCH5=1.1.2
TMPV_PECL_RAPHF_BRANCH7=2.0.0
TMPV_PECL_PROPRO_BRANCH5=1.0.2
TMPV_PECL_PROPRO_BRANCH7=2.1.0
TMPV_PECL_IMAGICK=3.4.3
TMPV_PECL_TIMEZONEDB=2018.5
TMPV_PECL_SSH2_BRANCH5=0.13
TMPV_PECL_SSH2_BRANCH7=1.1.12
TMPV_PECL_LIBSODIUM_BRANCH5=1.0.7
TMPV_PECL_LIBSODIUM_BRANCH7=2.0.12
TMPV_PECL_TIDY=1.2
TMPV_PECL_CPHALCON=3.4.1
TMPV_PECL_XDEBUG_BRANCH5=2.5.5
TMPV_PECL_XDEBUG_BRANCH7=2.6.1

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/autoconf/autoconf-$TMPV_AUTOCONF.tar.gz && \
tar -xzf autoconf-$TMPV_AUTOCONF.tar.gz && \
cd autoconf-$TMPV_AUTOCONF && \
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/automake/automake-$TMPV_AUTOMAKE_MIN.tar.gz && \
tar -xzf automake-$TMPV_AUTOMAKE_MIN.tar.gz && \
cd automake-$TMPV_AUTOMAKE_MIN && \
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/automake/automake-$TMPV_AUTOMAKE_MAX.tar.gz && \
tar -xzf automake-$TMPV_AUTOMAKE_MAX.tar.gz && \
cd automake-$TMPV_AUTOMAKE_MAX && \
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://cmake.org/files/v3.12/cmake-$TMPV_CMAKE.tar.gz && \
tar -xzf cmake-$TMPV_CMAKE.tar.gz && \
cd cmake-$TMPV_CMAKE && \
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://ftp.nluug.nl/pub/gnu/libtool/libtool-$TMPV_LIBTOOL.tar.gz && \
tar -xzf libtool-$TMPV_LIBTOOL.tar.gz && \
cd libtool-$TMPV_LIBTOOL && \
make clean >/dev/null ; ./configure --enable-ltdl-install && make && sudo make install
ln -s /usr/local/lib/libltdl.so /usr/lib/libltdl.so

remote_basename=$(echo "$TMPV_LIBZIP" | tr "." "-")
cd /usr/local/src && \
wget https://github.com/nih-at/libzip/archive/rel-$remote_basename.tar.gz -O libzip-$TMPV_LIBZIP.tar.gz && \
tar -xzf libzip-$TMPV_LIBZIP.tar.gz && mv libzip-rel-$remote_basename libzip-$TMPV_LIBZIP && \
cd libzip-$TMPV_LIBZIP && \
rm -R build 2>/dev/null ; mkdir build 2>/dev/null && \
cd build && cmake .. && make clean >/dev/null ; make && sudo make install

cd /usr/local/src && \
wget https://github.com/madler/zlib/archive/v$TMPV_ZLIB.tar.gz -O zlib-$TMPV_ZLIB.tar.gz && \
tar -xzf zlib-$TMPV_ZLIB.tar.gz && \
cd zlib-$TMPV_ZLIB && \
make clean >/dev/null ; ./configure --shared --prefix=/usr/local && make && sudo make install

cd /usr/local/src && \
wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-$TMPV_LIBGPGERR.tar.bz2 && \
tar -xjf libgpg-error-$TMPV_LIBGPGERR.tar.bz2 && \
cd libgpg-error-$TMPV_LIBGPGERR && \
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-$TMPV_LIBGCRYPT.tar.bz2 && \
tar -xjf libgcrypt-$TMPV_LIBGCRYPT.tar.bz2 && \
cd libgcrypt-$TMPV_LIBGCRYPT && \
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://www.openssl.org/source/openssl-$TMPV_OPENSSL_MAX.tar.gz && \
tar -xzf openssl-$TMPV_OPENSSL_MAX.tar.gz && \
cd openssl-$TMPV_OPENSSL_MAX && \
make clean 2>/dev/null ; ./config --prefix=/usr/local --openssldir=/usr/local/openssl no-gost shared zlib no-ssl2 -fPIC && \
make depend && make && sudo make install && openssl version
ln -s /usr/local/lib/libssl.so.1.1 /usr/lib/libssl.so.1.1
ln -s /usr/local/lib/libcrypto.so.1.1 /usr/lib/libcrypto.so.1.1

cd /usr/local/src && \
wget https://www.openssl.org/source/openssl-$TMPV_OPENSSL_MIN.tar.gz && \
tar -xzf openssl-$TMPV_OPENSSL_MIN.tar.gz && \
cd openssl-$TMPV_OPENSSL_MIN && \
make clean 2>/dev/null ; ./config --prefix=/usr/local --openssldir=/usr/local/openssl no-gost shared zlib no-ssl2 -fPIC && \
make depend && make && sudo make install && openssl version
ln -s /usr/local/lib/libssl.so.1.0.0 /usr/lib/libssl.so.1.0.0
ln -s /usr/local/lib/libcrypto.so.1.0.0 /usr/lib/libcrypto.so.1.0.0

cd /usr/local/src && \
wget https://www.libssh2.org/download/libssh2-$TMPV_LIBSSH2.tar.gz && \
tar -xzf libssh2-$TMPV_LIBSSH2.tar.gz && \
cd libssh2-$TMPV_LIBSSH2 && \
make clean >/dev/null ; ./configure --with-openssl --with-libz && make && sudo make install

cd /usr/local/src && \
wget https://alpha.gnu.org/gnu/libidn/libidn-$TMPV_LIBIDN.tar.gz && \
tar -xzf libidn-$TMPV_LIBIDN.tar.gz && \
cd libidn-$TMPV_LIBIDN && \
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://alpha.gnu.org/gnu/libidn/libidn2-$TMPV_LIBIDN2.tar.gz && \
tar -xzf libidn2-$TMPV_LIBIDN2.tar.gz && \
cd libidn2-$TMPV_LIBIDN2 && \
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://ftp.gnu.org/pub/gnu/libiconv/libiconv-$TMPV_LIBICONV.tar.gz
tar -xzf libiconv-$TMPV_LIBICONV.tar.gz
cd libiconv-$TMPV_LIBICONV
make clean >/dev/null ; ./configure --enable-shared && make && sudo make install

cd /usr/local/src && \
wget https://github.com/libevent/libevent/releases/download/release-$TMPV_LIBEVENT-stable/libevent-$TMPV_LIBEVENT-stable.tar.gz
tar -xzf libevent-$TMPV_LIBEVENT-stable.tar.gz
cd libevent-$TMPV_LIBEVENT-stable
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget http://dist.schmorp.de/libev/libev-$TMPV_LIBEV.tar.gz
tar -xzf libev-$TMPV_LIBEV.tar.gz
cd libev-$TMPV_LIBEV
make clean >/dev/null ; ./configure && make && sudo make install
ln -s /usr/local/lib/libev.so.4 /usr/lib/libev.so.4

cd /usr/local/src && \
wget https://tukaani.org/xz/xz-$TMPV_XZ.tar.bz2 && \
tar -xjf xz-$TMPV_XZ.tar.bz2 && \
cd xz-$TMPV_XZ && \
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget ftp://xmlsoft.org/libxml2/libxml2-$TMPV_LIBXML2.tar.gz && \
tar -xzf libxml2-$TMPV_LIBXML2.tar.gz && \
cd libxml2-$TMPV_LIBXML2 && \
make clean 2>/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget ftp://xmlsoft.org/libxml2/libxslt-$TMPV_LIBXSLT.tar.gz && \
tar -xzf libxslt-$TMPV_LIBXSLT.tar.gz && \
cd libxslt-$TMPV_LIBXSLT && \
make clean 2>/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://launchpad.net/libmetalink/trunk/libmetalink-$TMPV_LIBMETALINK/+download/libmetalink-$TMPV_LIBMETALINK.tar.bz2 && \
tar -xjf libmetalink-$TMPV_LIBMETALINK.tar.bz2 && \
cd libmetalink-$TMPV_LIBMETALINK && \
./configure --with-libxml2 --with-xml-prefix=/usr/local && \
make clean >/dev/null ; make && sudo make install
ln -s /usr/local/lib/libmetalink.so.3 /usr/lib/libmetalink.so.3

cd /usr/local/src && \
wget http://www.ijg.org/files/jpegsrc.v$TMPV_JPEG.tar.gz && \
tar -xzf jpegsrc.v$TMPV_JPEG.tar.gz && \
cd jpeg-$TMPV_JPEG && \
make clean >/dev/null ; ./configure --enable-shared && make && sudo make install

cd /usr/local/src && \
wget https://ftp-osl.osuosl.org/pub/libpng/src/libpng16/libpng-$TMPV_LIBPNG.tar.gz && \
tar -xzf libpng-$TMPV_LIBPNG.tar.gz && \
cd libpng-$TMPV_LIBPNG && \
make clean >/dev/null ; ./configure 'CPPFLAGS=-I/usr/local/include' 'LDFLAGS=-L/usr/local/lib' --prefix=/usr/local --with-zlib-prefix=/usr/local --disable-static && \
make && make check && sudo make install

cd /usr/local/src && \
wget https://download.savannah.gnu.org/releases/freetype/freetype-$TMPV_FREETYPE.tar.bz2 && \
tar -xjf freetype-$TMPV_FREETYPE.tar.bz2 && \
cd freetype-$TMPV_FREETYPE && \
make clean >/dev/null ; ./configure --with-zlib --with-png && make && sudo make install

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/gss/gss-$TMPV_GSS.tar.gz && \
tar -xzf gss-$TMPV_GSS.tar.gz && \
cd gss-$TMPV_GSS && \
./configure --with-libiconv-prefix=/usr/local && \
make clean >/dev/null ; make && sudo make install

cd /usr/local/src && \
wget https://github.com/jemalloc/jemalloc/releases/download/$TMPV_JEMALLOC/jemalloc-$TMPV_JEMALLOC.tar.bz2 && \
tar -xjf jemalloc-$TMPV_JEMALLOC.tar.bz2 && \
cd jemalloc-$TMPV_JEMALLOC && \
make clean >/dev/null ; ./configure && make && sudo make install
ln -s /usr/local/lib/libjemalloc.so.2 /usr/lib/libjemalloc.so.2

cd /usr/local/src && \
wget http://www.digip.org/jansson/releases/jansson-$TMPV_JANSSON.tar.bz2 && \
tar -xjf jansson-$TMPV_JANSSON.tar.bz2 && \
cd jansson-$TMPV_JANSSON && \
make clean >/dev/null ; ./configure && make && sudo make install
ln -s /usr/local/lib/libjansson.so.4 /usr/lib/libjansson.so.4

#cd /usr/local/src && \
#wget https://github.com/tatsuhiro-t/spdylay/releases/download/v$TMPV_SPDYLAY/spdylay-$TMPV_SPDYLAY.tar.bz2 && \
#tar -xjf spdylay-$TMPV_SPDYLAY.tar.bz2 && \
#cd spdylay-$TMPV_SPDYLAY && \
#make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://c-ares.haxx.se/download/c-ares-$TMPV_CARES.tar.gz && \
tar -xzf c-ares-$TMPV_CARES.tar.gz && \
cd c-ares-$TMPV_CARES && \
make clean >/dev/null ; ./configure && make && sudo make install
ln -s /usr/local/lib/libcares.so.2 /usr/lib/libcares.so.2

cd /usr/local/src && \
wget https://github.com/nghttp2/nghttp2/releases/download/v$TMPV_NGHTTP2/nghttp2-$TMPV_NGHTTP2.tar.bz2 && \
tar -xjf nghttp2-$TMPV_NGHTTP2.tar.bz2 && \
cd nghttp2-$TMPV_NGHTTP2 && \
make clean >/dev/null ; ./configure --with-libxml2 --with-jemalloc --disable-examples --enable-app && \
make && sudo make install && nghttp --version

#cd /usr/local/src && \
#wget https://www.mirrorservice.org/sites/ftp.cac.washington.edu/imap/imap-$TMPV_IMAP.tar.gz && \
#tar -xzf imap-$TMPV_IMAP.tar.gz && \
#cd imap-$TMPV_IMAP && \
#make clean >/dev/null ; make ldb IP6=4 EXTRACFLAGS=-fPIC

cd /usr/local/src && \
wget https://github.com/rockdaboot/libpsl/releases/download/libpsl-$TMPV_LIBPSL/libpsl-$TMPV_LIBPSL.tar.gz && \
tar -xzf libpsl-$TMPV_LIBPSL.tar.gz && \
cd libpsl-$TMPV_LIBPSL && \
make clean >/dev/null ; ./configure && make && sudo make install

#_tmpv=el-$(echo "$TMPV_ICU" | tr "." "_")
#cd /usr/local/src && \
#wget https://download.icu-project.org/files/icu4c/$TMPV_ICU/icu4c-$_tmpv-src.tgz && \
#tar -xzf icu4c-$_tmpv-src.tgz && \
#cd icu4c-$_tmpv-src/source && \
#chmod +x runConfigureICU configure install-sh && \
#./runConfigureICU Linux && make && sudo make install

cd /usr/local/src && \
wget https://github.com/google/brotli/archive/v$TMPV_BROTLI.tar.gz -O brotli-$TMPV_BROTLI.tar.gz && \
tar -xzf brotli-$TMPV_BROTLI.tar.gz && \
cd brotli-$TMPV_BROTLI && \
make clean >/dev/null ; ./configure-cmake && make && sudo make install
ln -s /usr/local/lib/libbrotlicommon.so.1 /usr/lib/libbrotlicommon.so.1

cd /usr/local/src && \
wget https://rtmpdump.mplayerhq.hu/download/rtmpdump-$TMPV_RTMPDUMP.tgz
tar -xzf rtmpdump-$TMPV_RTMPDUMP.tgz
cd rtmpdump-$TMPV_RTMPDUMP
make clean 2>/dev/null ; make && sudo make install

cd /usr/local/src && \
wget https://curl.haxx.se/download/curl-$TMPV_CURL.tar.bz2 && \
tar -xjf curl-$TMPV_CURL.tar.bz2 && \
cd curl-$TMPV_CURL && \
make clean >/dev/null ; ./configure --enable-shared --with-ssl --with-nghttp2 --with-zlib --with-libmetalink --with-gssapi --with-libssh2 --with-brotli --with-librtmp && \
make && sudo make install && curl --version &&
ln -s /usr/local/lib/libcurl.so.4 /usr/lib/libcurl.so.4
curl https://cert-test.sandbox.google.com/ --head --fail --silent --show-error | head -n1

cd /usr/local/src && \
wget https://github.com/uclouvain/openjpeg/archive/v$TMPV_OPENJPEG.tar.gz -O openjpeg-$TMPV_OPENJPEG.tar.gz && \
tar -xzf openjpeg-$TMPV_OPENJPEG.tar.gz && \
cd openjpeg-$TMPV_OPENJPEG && \
rm -R build 2>/dev/null ; mkdir build && \
cd build && cmake .. && make && sudo make install && \
ln -s /usr/local/lib/libopenjp2.so.7 /usr/lib/libopenjp2.so.7

cd /usr/local/src && \
wget https://www.kokkonen.net/tjko/src/jpeginfo-$TMPV_JPEGINFO.tar.gz && \
tar -xzf jpeginfo-$TMPV_JPEGINFO.tar.gz && \
cd jpeginfo-$TMPV_JPEGINFO && \
make clean >/dev/null ; ./configure --with-libjpeg=/usr/local && \
make && sudo make install

cd /usr/local/src && \
wget https://www.kokkonen.net/tjko/src/jpegoptim-$TMPV_JPEGOPTIM.tar.gz && \
tar -xzf jpegoptim-$TMPV_JPEGOPTIM.tar.gz && \
cd jpegoptim-$TMPV_JPEGOPTIM && \
./configure --with-libjpeg=/usr/local && \
make && make strip && sudo make install

cd /usr/local/src && \
wget https://ftp.pcre.org/pub/pcre/pcre-$TMPV_PCRE.tar.bz2 && \
tar -xjf pcre-$TMPV_PCRE.tar.bz2 && \
cd pcre-$TMPV_PCRE && \
make clean 2>/dev/null ; ./configure --enable-utf --enable-pcre16 --enable-pcre32 --enable-unicode-properties --enable-pcregrep-libz --enable-pcregrep-libbz2 --enable-jit && \
make && sudo make install

cd /usr/local/src && \
wget https://ftp.pcre.org/pub/pcre/pcre2-$TMPV_PCRE2.tar.bz2 && \
tar -xjf pcre2-$TMPV_PCRE2.tar.bz2 && \
cd pcre2-$TMPV_PCRE2 && \
make clean 2>/dev/null ; ./configure --enable-utf --enable-pcre2-16 --enable-pcre2-32 --enable-unicode-properties --enable-pcre2grep-libz --enable-pcre2grep-libbz2 --enable-jit && \
make && sudo make install

cd /usr/local/src && \
wget http://apache.crihan.fr/dist/apr/apr-$TMPV_APR.tar.bz2 && \
tar -xjf apr-$TMPV_APR.tar.bz2 && \
cd apr-$TMPV_APR && \
make clean 2>/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget http://mirror.ibcp.fr/pub/apache//apr/apr-util-$TMPV_APRUTIL.tar.bz2 && \
tar -xjf apr-util-$TMPV_APRUTIL.tar.bz2 && \
cd apr-util-$TMPV_APRUTIL && \
make clean 2>/dev/null ; ./configure --with-apr=/usr/local/src/apr-$TMPV_APR --with-openssl=/usr/local && \
make && sudo make install

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/gawk/gawk-$TMPV_GAWK.tar.gz && \
tar -xzf gawk-$TMPV_GAWK.tar.gz && \
cd gawk-$TMPV_GAWK && \
make clean 2>/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://github.com/ArtifexSoftware/jbig2dec/archive/$TMPV_JBIG2DEC.tar.gz -O jbig2dec-$TMPV_JBIG2DEC.tar.gz && \
tar -xzf jbig2dec-$TMPV_JBIG2DEC.tar.gz && \
cd jbig2dec-$TMPV_JBIG2DEC && \
make clean 2>/dev/null ; ./autogen.sh && ./configure && make && sudo make install

cd /usr/local/src && \
wget https://download.osgeo.org/libtiff/tiff-$TMPV_TIFF.tar.gz && \
tar -xzf tiff-$TMPV_TIFF.tar.gz && \
cd tiff-$TMPV_TIFF && \
make clean >/dev/null ; ./configure 'CPPFLAGS=-I/usr/local/include' 'LDFLAGS=-L/usr/local/lib' && \
make && sudo make install

cd /usr/local/src && \
wget https://www.tortall.net/projects/yasm/releases/yasm-$TMPV_YASM.tar.gz && \
tar -xzf yasm-$TMPV_YASM.tar.gz && \
cd yasm-$TMPV_YASM && \
make clean 2>/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://github.com/google/zopfli/archive/zopfli-$TMPV_ZOPFLI.tar.gz && \
tar -xzf zopfli-$TMPV_ZOPFLI.tar.gz && \
cd zopfli-zopfli-$TMPV_ZOPFLI && \
make clean >/dev/null 2>/dev/null ; make && make zopflipng && \
cp zopfli /usr/local/sbin/ && cp zopflipng /usr/local/sbin/

cd /usr/local/src && \
wget https://github.com/amadvance/advancecomp/releases/download/v$TMPV_ADVANCECOMP/advancecomp-$TMPV_ADVANCECOMP.tar.gz && \
tar -xzf advancecomp-$TMPV_ADVANCECOMP.tar.gz && \
cd advancecomp-$TMPV_ADVANCECOMP && \
make clean >/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget https://codeplexarchive.blob.core.windows.net/archive/projects/jxrlib/jxrlib.zip && \
mkdir jxrlib ; cd jxrlib && unzip ../jxrlib.zip
cd /usr/local/src/jxrlib/sourceCode/jxrlib && \
make clean 2>/dev/null ; make && cp build/Jxr*App /usr/local/bin/

cd /usr/local/src && \
wget https://github.com/webmproject/libwebp/archive/v$TMPV_WEBP.tar.gz -O libwebp-$TMPV_WEBP.tar.gz && \
tar -xzf libwebp-$TMPV_WEBP.tar.gz && \
cd libwebp-$TMPV_WEBP && \
./autogen.sh && ./configure --enable-libwebpmux --enable-libwebpdemux --enable-libwebpdecoder --enable-libwebpextras --with-giflibdir=/usr/local
make && sudo make install && cwebp -version
ln -s /usr/local/lib/libwebpdemux.so.2 /usr/lib/libwebpdemux.so.2
ln -s /usr/local/lib/libwebp.so.7 /usr/lib/libwebp.so.7

cd /usr/local/src && \
wget https://github.com/webmproject/libvpx/archive/v$TMPV_LIBVPX.tar.gz -O libvpx-$TMPV_LIBVPX.tar.gz && \
tar -xzf libvpx-$TMPV_LIBVPX.tar.gz && \
cd libvpx-$TMPV_LIBVPX && \
make clean >/dev/null ; ./configure --enable-pic --enable-shared && make && sudo make install

cd /usr/local/src && \
wget https://github.com/mdadams/jasper/archive/version-$TMPV_JASPER.tar.gz -O jasper-$TMPV_JASPER.tar.gz && \
tar -xzf jasper-$TMPV_JASPER.tar.gz && mv jasper-version-$TMPV_JASPER jasper-$TMPV_JASPER && \
mkdir jasper-$TMPV_JASPER/build ; cd jasper-$TMPV_JASPER && \
cmake -G "Unix Makefiles" -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr/local && \
cd build && make clean all && sudo make install

cd /usr/local/src && \
wget https://github.com/mm2/Little-CMS/archive/lcms$TMPV_LITTLECMS.tar.gz && \
tar -xzf lcms$TMPV_LITTLECMS.tar.gz && \
cd Little-CMS-lcms$TMPV_LITTLECMS && \
./configure && make && sudo make install

$_tmpv=el-$(echo "$TMPV_GHOSTPDL" | tr -d ".")
cd /usr/local/src && \
wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$_tmpv/ghostpdl-$TMPV_GHOSTPDL.tar.gz && \
tar -xzf ghostpdl-$TMPV_GHOSTPDL.tar.gz && \
cd ghostpdl-$TMPV_GHOSTPDL && \
make clean >/dev/null ; ./configure && make && sudo make install && make so && make soinstall

cd /usr/local/src && \
wget https://www.imagemagick.org/download/delegates/libfpx-$TMPV_LIBFPX.tar.bz2 && \
tar -xjf libfpx-$TMPV_LIBFPX.tar.bz2 && \
cd libfpx-$TMPV_LIBFPX && \
make clean >/dev/null ; ./configure && make && sudo make install

#now that we have more adequate libs, rebuild freetype
cd /usr/local/src && \
cd freetype-$TMPV_FREETYPE && \
make clean >/dev/null ; ./configure --with-zlib --with-png && make && sudo make install

cd /usr/local/src && \
wget https://graphviz.gitlab.io/pub/graphviz/stable/SOURCES/graphviz.tar.gz -O graphviz-$TMPV_GRAPHVIZ.tar.gz && \
tar -xzf graphviz-$TMPV_GRAPHVIZ.tar.gz && \
cd graphviz-$TMPV_GRAPHVIZ && \
make clean >/dev/null ; ./configure --with-webp=yes --with-freetype2=yes --enable-ltdl --enable-php && make && sudo make install

cd /usr/local/src && \
wget https://www.imagemagick.org/download/ImageMagick-$TMPV_IMAGICK.tar.bz2 && \
tar -xjf ImageMagick-$TMPV_IMAGICK.tar.bz2 && \
cd ImageMagick-$TMPV_IMAGICK && \
make clean >/dev/null ; ./configure --prefix=/usr/local --enable-shared --disable-openmp --with-modules=no --with-webp=yes --with-gslib=no --with-openjp2=yes --with-gvc=yes --with-fftw=yes --with-heic=yes --with-gslib=yes && \
make && sudo make install && magick --version

cd /usr/local/src && \
wget https://github.com/mstorsjo/fdk-aac/archive/v$TMPV_FDKAAC.tar.gz -O fdk-aac-$TMPV_FDKAAC.tar.gz && \
tar -xzf fdk-aac-$TMPV_FDKAAC.tar.gz && \
cd fdk-aac-$TMPV_FDKAAC && \
./autogen.sh && autoreconf --force --install && ./configure --enable-shared --enable-static && make && sudo make install

cd /usr/local/src && \
wget https://www.nasm.us/pub/nasm/releasebuilds/$TMPV_NASM/nasm-$TMPV_NASM.tar.bz2 && \
tar -xjf nasm-$TMPV_NASM.tar.bz2 && \
cd nasm-$TMPV_NASM
make clean 2>/dev/null ; ./configure && make && sudo make install

cd /usr/local/src && \
wget ftp://ftp.videolan.org/pub/x264/snapshots/last_x264.tar.bz2 -O x264.tar.bz2 && \
rm -R x264-snapshot-* ; tar -xjf x264.tar.bz2 && \
cd x264-snapshot-* && \
make clean 2>/dev/null ; ./configure --enable-shared --enable-static --enable-libfdk-aac --disable-asm && make && sudo make install

cd /usr/local/src && \
wget https://github.com/FFmpeg/FFmpeg/archive/n$TMPV_FFMPEG.tar.gz -O ffmpeg-$TMPV_FFMPEG.tar.gz && \
tar -xzf ffmpeg-$TMPV_FFMPEG.tar.gz && \
cd FFmpeg-n$TMPV_FFMPEG && \
make clean 2>/dev/null ; ./configure --enable-gpl --enable-nonfree --enable-libx264 --enable-shared --enable-libvpx --enable-libwebp --enable-libfreetype --enable-libopenjpeg --enable-libfdk-aac --enable-linux-perf && make && sudo make install

cd /usr/local/src && \
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$TMPV_PHANTOMJS-linux-x86_64.tar.bz2 && \
tar -xjf phantomjs-$TMPV_PHANTOMJS-linux-x86_64.tar.bz2 && \
mkdir /usr/local/phantomjs ; cd phantomjs-$TMPV_PHANTOMJS-linux-x86_64 && \
cp bin/phantomjs /usr/local/bin/phantomjs && cp examples/* /usr/local/phantomjs/

cd /usr/local/src && \
wget http://mirrors.ircam.fr/pub/apache//httpd/httpd-$TMPV_HTTPD.tar.bz2 && \
rm -R httpd-$TMPV_HTTPD 2>/dev/null; tar -xjf httpd-$TMPV_HTTPD.tar.bz2 && cd /usr/local/src/httpd-$TMPV_HTTPD && \
./buildconf --with-apr=/usr/local/src/apr-$TMPV_APR --with-apr-util=/usr/local/src/apr-util-$TMPV_APRUTIL && \
./configure --prefix=/usr/local/apache2 --with-program-name=apache2 --with-mpm=prefork --disable-cgi --disable-imap --disable-autoindex --enable-mods-static="actions alias allowmethods auth-basic auth-digest authn-core authn-file authz-core authz-host authz-user autoindex brotli cache deflate dir disk-cache dumpio env expires file-cache filter headers http include info logio log-config mem-cache mime nghttp2-staticlib-deps negotiation proxy proxy-fcgi proxy-http proxy-html proxy-wstunnel rewrite remoteip setenvif slotmem_shm so socache-shmcb ssl status substitute unique-id unixd xml2enc" && \
make && sudo make install

cd /usr/local/src && \
wget https://github.com/jedisct1/libsodium/releases/download/$TMPV_LIBSODIUM/libsodium-$TMPV_LIBSODIUM.tar.gz
tar -xzf libsodium-$TMPV_LIBSODIUM.tar.gz
cd libsodium-$TMPV_LIBSODIUM
make clean >/dev/null ; ./autogen.sh && ./configure && make && sudo make install
ln -s /usr/local/lib/libsodium.so.23 /usr/lib/libsodium.so.23

cd /usr/local/src && \
wget https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-$TMPV_PUREFTPD.tar.bz2 && \
tar -xjf pure-ftpd-$TMPV_PUREFTPD.tar.bz2 && \
cd pure-ftpd-$TMPV_PUREFTPD && \
./configure CFLAGS="-I/usr/local/include" LDFLAGS="-L/usr/local/lib" --with-puredb --with-tls --with-rfc2640 --with-ftpwho && \
make clean >/dev/null ; make && sudo make install-strip
#ftp     stream  tcp     nowait  root    /usr/local/sbin/pure-ftpd --tls=3 -c 15 -C 15 -l puredb:/etc/pure-ftpd/pureftpd.pdb -X -E -j -R -Y 2 -z -p 50000:50400

cd /usr/local/src && \
rm -R ngx_brotli 2>/dev/null ; git clone --recursive https://github.com/google/ngx_brotli && \
cd ngx_brotli && git submodule update --init --recursive

cd /usr/local/src && \
rm -R ngx_http_substitutions_filter_module 2>/dev/null ; git clone git://github.com/yaoweibin/ngx_http_substitutions_filter_module.git

cd /usr/local/src && \
wget https://github.com/vozlt/nginx-module-vts/archive/v$TMPV_NGINXMVTS.tar.gz -O nginx-module-vts-$TMPV_NGINXMVTS-$TMPV_NGINXMVTS.tar.gz && \
tar -xzf nginx-module-vts-$TMPV_NGINXMVTS-$TMPV_NGINXMVTS.tar.gz && \
cd nginx-module-vts-$TMPV_NGINXMVTS

cd /usr/local/src && \
wget https://nginx.org/download/nginx-$TMPV_NGINX_MIN.tar.gz && \
tar -xzf nginx-$TMPV_NGINX_MIN.tar.gz && \
cd nginx-$TMPV_NGINX_MIN && \
make clean 2>/dev/null ; ./configure --with-cc-opt="-Wno-deprecated-declarations -I/usr/local/include" --with-ld-opt="-L/usr/local/lib" --with-cpu-opt=amd64 --sbin-path=/usr/local/sbin --with-http_ssl_module --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module --with-mail_ssl_module --with-http_gunzip_module --with-http_stub_status_module --with-http_gzip_static_module --with-stream --with-stream_ssl_module --with-pcre --with-http_v2_module --with-http_realip_module --add-module=/usr/local/src/nginx-module-vts-0.1.18 --add-module=/usr/local/src/ngx_http_substitutions_filter_module --add-module=/usr/local/src/ngx_brotli --conf-path=/etc/nginx/nginx.conf && \
make && ./objs/nginx -V && sudo make install

cd /usr/local/src && \
wget https://nginx.org/download/nginx-$TMPV_NGINX_MAX.tar.gz && \
tar -xzf nginx-$TMPV_NGINX_MAX.tar.gz && \
cd nginx-$TMPV_NGINX_MAX && \
make clean 2>/dev/null ; ./configure --with-cc-opt="-Wno-deprecated-declarations -I/usr/local/include" --with-ld-opt="-L/usr/local/lib" --with-cpu-opt=amd64 --sbin-path=/usr/local/sbin --with-http_ssl_module --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module --with-mail_ssl_module --with-http_gunzip_module --with-http_stub_status_module --with-http_gzip_static_module --with-stream --with-stream_ssl_module --with-pcre --with-http_v2_module --with-http_realip_module --add-module=/usr/local/src/nginx-module-vts-0.1.18 --add-module=/usr/local/src/ngx_http_substitutions_filter_module --add-module=/usr/local/src/ngx_brotli --conf-path=/etc/nginx/nginx.conf && \
make && ./objs/nginx -V && sudo make install

cd /usr/local/src && \
wget http://download.redis.io/releases/redis-$TMPV_REDIS.tar.gz && \
tar -xzf redis-$TMPV_REDIS.tar.gz
cd redis-$TMPV_REDIS
make clean 2>/dev/null && make && make test && sudo make install

cd /usr/local/src && \
wget https://ftp.gnu.org/gnu/bison/bison-$TMPV_BISON.tar.gz && \
tar -xzf bison-$TMPV_BISON.tar.gz && \
cd bison-$TMPV_BISON && \
./configure && make && sudo make install

cd /usr/local/src && \
wget https://github.com/skvadrik/re2c/archive/$TMPV_RE2C.tar.gz -O re2c-$TMPV_RE2C.tar.gz && \
tar -xzf re2c-$TMPV_RE2C.tar.gz && \
cd re2c-$TMPV_RE2C/re2c && \
./autogen.sh ; make && sudo make install

cd /usr/local/src && \
wget https://github.com/htacg/tidy-html5/archive/$TMPV_TIDY.tar.gz -O tidy-$TMPV_TIDY.tar.gz && \
tar -xzf tidy-$TMPV_TIDY.tar.gz && \
cd tidy-html5-$TMPV_TIDY
cd build/cmake && cmake ../.. -DCMAKE_BUILD_TYPE=Release && sudo make install

cd /usr/local/src/pecl && \
wget https://pecl.php.net/get/amqp-$TMPV_PECL_AMQP.tgz && tar -xzf amqp-$TMPV_PECL_AMQP.tgz && \
wget https://pecl.php.net/get/pecl_http-$TMPV_PECL_HTTP_BRANCH5.tgz && tar -xzf pecl_http-$TMPV_PECL_HTTP_BRANCH5.tgz && \
wget https://pecl.php.net/get/pecl_http-$TMPV_PECL_HTTP_BRANCH7.tgz && tar -xzf pecl_http-$TMPV_PECL_HTTP_BRANCH7.tgz && \
wget https://pecl.php.net/get/redis-$TMPV_PECL_REDIS.tgz && tar -xzf redis-$TMPV_PECL_REDIS.tgz && \
wget https://pecl.php.net/get/raphf-$TMPV_PECL_RAPHF_BRANCH5.tgz && tar -xzf raphf-$TMPV_PECL_RAPHF_BRANCH5.tgz && \
wget https://pecl.php.net/get/raphf-$TMPV_PECL_RAPHF_BRANCH7.tgz && tar -xzf raphf-$TMPV_PECL_RAPHF_BRANCH7.tgz && \
wget https://pecl.php.net/get/propro-$TMPV_PECL_PROPRO_BRANCH5.tgz && tar -xzf propro-$TMPV_PECL_PROPRO_BRANCH5.tgz && \
wget https://pecl.php.net/get/propro-$TMPV_PECL_PROPRO_BRANCH7.tgz && tar -xzf propro-$TMPV_PECL_PROPRO_BRANCH7.tgz && \
wget https://pecl.php.net/get/imagick-$TMPV_PECL_IMAGICK.tgz && tar -xzf imagick-$TMPV_PECL_IMAGICK.tgz && \
wget https://pecl.php.net/get/timezonedb-$TMPV_PECL_TIMEZONEDB.tgz && tar -xzf timezonedb-$TMPV_PECL_TIMEZONEDB.tgz && \
wget https://pecl.php.net/get/ssh2-$TMPV_PECL_SSH2_BRANCH5.tgz && tar -xzf ssh2-$TMPV_PECL_SSH2_BRANCH5.tgz && \
wget https://pecl.php.net/get/ssh2-$TMPV_PECL_SSH2_BRANCH7.tgz && tar -xzf ssh2-$TMPV_PECL_SSH2_BRANCH7.tgz && \
wget https://pecl.php.net/get/libsodium-$TMPV_PECL_LIBSODIUM_BRANCH5.tgz && tar -xzf libsodium-$TMPV_PECL_LIBSODIUM_BRANCH5.tgz && \
wget https://pecl.php.net/get/libsodium-$TMPV_PECL_LIBSODIUM_BRANCH7.tgz && tar -xzf libsodium-$TMPV_PECL_LIBSODIUM_BRANCH7.tgz && \
wget https://pecl.php.net/get/tidy-$TMPV_PECL_TIDY.tgz && tar -xzf tidy-$TMPV_PECL_TIDY.tgz && sed -i 's/buffio.h/tidybuffio.h/' tidy-$TMPV_PECL_TIDY/*.* && sed -i 's/tidytidybuffio.h/tidybuffio.h/' tidy-$TMPV_PECL_TIDY/*.* && \
wget https://github.com/phalcon/cphalcon/archive/v$TMPV_PECL_CPHALCON.tar.gz -O cphalcon-$TMPV_PECL_CPHALCON.tar.gz && tar -xzf cphalcon-$TMPV_PECL_CPHALCON.tar.gz && \
wget https://pecl.php.net/get/xdebug-$TMPV_PECL_XDEBUG_BRANCH5.tgz && tar -xzf xdebug-$TMPV_PECL_XDEBUG_BRANCH5.tgz && \
wget https://pecl.php.net/get/xdebug-$TMPV_PECL_XDEBUG_BRANCH7.tgz && tar -xzf xdebug-$TMPV_PECL_XDEBUG_BRANCH7.tgz

cd /usr/local/src && \
wget https://secure.php.net/distributions/php-$TMPV_PHP56.tar.bz2 && \
cd /usr/local/src && \
rm -R php-$TMPV_PHP56 2>/dev/null ; tar -xjf php-$TMPV_PHP56.tar.bz2 && \
cd /usr/local/src/php-$TMPV_PHP56 && \
rm -R ext/amqp 2>/dev/null ; mkdir ext/amqp && cp -R ../pecl/amqp-$TMPV_PECL_AMQP/* ext/amqp/ && \
rm -R ext/http 2>/dev/null ; mkdir ext/http && cp -R ../pecl/pecl_http-$TMPV_PECL_HTTP_BRANCH5/* ext/http/ && \
rm -R ext/redis 2>/dev/null ; mkdir ext/redis && cp -R ../pecl/redis-$TMPV_PECL_REDIS/* ext/redis/ && \
rm -R ext/raphf 2>/dev/null ; mkdir ext/raphf && cp -R ../pecl/raphf-$TMPV_PECL_RAPHF_BRANCH5/* ext/raphf/ && \
rm -R ext/propro 2>/dev/null ; mkdir ext/propro && cp -R ../pecl/propro-$TMPV_PECL_PROPRO_BRANCH5/* ext/propro/ && \
rm -R ext/imagick 2>/dev/null ; mkdir ext/imagick && cp -R ../pecl/imagick-$TMPV_PECL_IMAGICK/* ext/imagick/ && \
rm -R ext/timezonedb 2>/dev/null ; mkdir ext/timezonedb && cp -R ../pecl/timezonedb-$TMPV_PECL_TIMEZONEDB/* ext/timezonedb/ && \
rm -R ext/ssh2 2>/dev/null ; mkdir ext/ssh2 && cp -R ../pecl/ssh2-$TMPV_PECL_SSH2_BRANCH5/* ext/ssh2/ && \
rm -R ext/libsodium 2>/dev/null ; mkdir ext/libsodium && cp -R ../pecl/libsodium-$TMPV_PECL_LIBSODIUM_BRANCH5/* ext/libsodium/ && \
rm -R ext/tidy 2>/dev/null ; mkdir ext/tidy && cp -R ../pecl/tidy-$TMPV_PECL_TIDY/* ext/tidy/ && \
#rm -R ext/cphalcon 2>/dev/null ; mkdir ext/cphalcon && cp -R ../pecl/cphalcon-$TMPV_PECL_CPHALCON/* ext/cphalcon/
#rm -R ext/xdebug 2>/dev/null ; mkdir ext/xdebug && cp -R ../pecl/xdebug-$TMPV_PECL_XDEBUG_BRANCH5/* ext/xdebug/
cd /usr/local/src/php-$TMPV_PHP56 && \
rm configure 2>/dev/null ; ./buildconf --force && \
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php56 --disable-all --with-apxs2=/usr/local/apache2/bin/apxs --with-iconv=/usr/local/lib --with-icu-dir=/usr/local --enable-libxml --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --with-sqlite3 --enable-pdo --with-pdo-mysql --with-pdo-sqlite --with-zlib=/usr/local --with-openssl --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --with-libxml-dir --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --enable-zip --with-geoip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --enable-gd-native-ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-freetype-dir=/usr/local --with-vpx-dir=/usr/local --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-raphf --enable-propro --with-http-libevent-dir=/usr/local --with-http --enable-opcache --with-librabbitmq-dir=/usr/local --with-amqp --with-libsodium --with-mhash --with-mcrypt --with-tidy --with-ssh2=shared
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php56 --disable-all --with-apxs2=/usr/local/apache2/bin/apxs --with-iconv=/usr/local/lib --enable-libxml --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --with-sqlite3 --enable-pdo --with-pdo-mysql --with-pdo-sqlite --with-zlib=/usr/local --with-openssl --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --with-libxml-dir --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --enable-zip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --enable-gd-native-ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-freetype-dir=/usr/local --with-vpx-dir=/usr/local --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-raphf --enable-propro --with-http-libevent-dir=/usr/local --with-http --enable-opcache --with-librabbitmq-dir=/usr/local --with-amqp --with-libsodium --with-ssh2=shared && \
make && ./sapi/cli/php -m && ./sapi/cli/php -v && sudo make install && \
cd /usr/local/src/php-$TMPV_PHP56/ext/xdebug && sh /usr/local/php56/bin/phpize && ./configure --with-php-config=/usr/local/php56/bin/php-config && make && sudo make install && cd /usr/local/src/php-$TMPV_PHP56 && \
cd /usr/local/src/php-$TMPV_PHP56/ext/cphalcon/build && ./install --phpize /usr/local/php56/bin/phpize --php-config /usr/local/php56/bin/php-config && cd /usr/local/src/php-$TMPV_PHP56 && \
php56 -m && php56 -v

cd /usr/local/src && \
wget https://secure.php.net/distributions/php-$TMPV_PHP70.tar.bz2
cd /usr/local/src && \
rm -R php-$TMPV_PHP70 2>/dev/null ; tar -xjf php-$TMPV_PHP70.tar.bz2 && \
cd /usr/local/src/php-$TMPV_PHP70
rm -R ext/amqp 2>/dev/null ; mkdir ext/amqp ; cp -R ../pecl/amqp-$TMPV_PECL_AMQP/* ext/amqp/ && \
rm -R ext/http 2>/dev/null ; mkdir ext/http ; cp -R ../pecl/pecl_http-$TMPV_PECL_HTTP_BRANCH7/* ext/http/ && \
rm -R ext/redis 2>/dev/null ; mkdir ext/redis ; cp -R ../pecl/redis-$TMPV_PECL_REDIS/* ext/redis/ && \
rm -R ext/raphf 2>/dev/null ; mkdir ext/raphf ; cp -R ../pecl/raphf-$TMPV_PECL_RAPHF_BRANCH7/* ext/raphf/ && \
rm -R ext/propro 2>/dev/null ; mkdir ext/propro ; cp -R ../pecl/propro-$TMPV_PECL_PROPRO_BRANCH7/* ext/propro/ && \
rm -R ext/imagick 2>/dev/null ; mkdir ext/imagick ; cp -R ../pecl/imagick-$TMPV_PECL_IMAGICK/* ext/imagick/ && \
rm -R ext/timezonedb 2>/dev/null ; mkdir ext/timezonedb ; cp -R ../pecl/timezonedb-$TMPV_PECL_TIMEZONEDB/* ext/timezonedb/ && \
rm -R ext/ssh2 2>/dev/null ; mkdir ext/ssh2 ; cp -R ../pecl/ssh2-$TMPV_PECL_SSH2_BRANCH7/* ext/ssh2/ && \
rm -R ext/libsodium 2>/dev/null ; mkdir ext/libsodium ; cp -R ../pecl/libsodium-$TMPV_PECL_LIBSODIUM_BRANCH5/* ext/libsodium/ && \
rm -R ext/tidy 2>/dev/null ; mkdir ext/tidy && cp -R ../pecl/tidy-$TMPV_PECL_TIDY/* ext/tidy/ && \
cd /usr/local/src/php-$TMPV_PHP70 && \
rm configure 2>/dev/null ; ./buildconf --force && \
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php70 --disable-all --with-iconv=/usr/local/lib --enable-libxml --with-libxml-dir --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --enable-pdo --with-pdo-mysql --with-zlib=/usr/local --with-openssl --with-openssl-dir=/usr/local/lib --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --enable-zip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --enable-gd-native-ttf --with-jpeg-dir --with-png-dir --with-xpm-dir --with-freetype-dir --with-webp-dir --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-opcache --with-librabbitmq-dir=/usr/local --with-amqp --with-libsodium --with-ssh2=shared && \
make && ./sapi/cli/php -m && ./sapi/cli/php -v && \
make install && php70 -m && php70 -v && \
cd /usr/local/src/php-$TMPV_PHP70/ext/xdebug && sh /usr/local/php70/bin/phpize && ./configure --with-php-config=/usr/local/php70/bin/php-config && make && sudo make install && cd /usr/local/src/php-$TMPV_PHP70 && \
cd /usr/local/src/php-$TMPV_PHP70/ext/cphalcon/build && ./install --phpize /usr/local/php70/bin/phpize --php-config /usr/local/php70/bin/php-config && cd /usr/local/src/php-$TMPV_PHP70 && \
php70 -m && php70 -v

cd /usr/local/src && \
wget https://secure.php.net/distributions/php-$TMPV_PHP71.tar.bz2 && \
cd /usr/local/src && \
rm -R php-$TMPV_PHP71 2>/dev/null ; tar -xjf php-$TMPV_PHP71.tar.bz2 && \
cd /usr/local/src/php-$TMPV_PHP71
rm -R ext/amqp 2>/dev/null ; mkdir ext/amqp ; cp -R ../pecl/amqp-$TMPV_PECL_AMQP/* ext/amqp/ && \
rm -R ext/http 2>/dev/null ; mkdir ext/http ; cp -R ../pecl/pecl_http-3.1.0/* ext/http/ && \
rm -R ext/redis 2>/dev/null ; mkdir ext/redis ; cp -R ../pecl/redis-$TMPV_PECL_REDIS/* ext/redis/ && \
rm -R ext/raphf 2>/dev/null ; mkdir ext/raphf ; cp -R ../pecl/raphf-$TMPV_PECL_RAPHF_BRANCH7/* ext/raphf/ && \
rm -R ext/propro 2>/dev/null ; mkdir ext/propro ; cp -R ../pecl/propro-$TMPV_PECL_PROPRO_BRANCH7/* ext/propro/ && \
rm -R ext/imagick 2>/dev/null ; mkdir ext/imagick ; cp -R ../pecl/imagick-$TMPV_PECL_IMAGICK/* ext/imagick/ && \
rm -R ext/timezonedb 2>/dev/null ; mkdir ext/timezonedb ; cp -R ../pecl/timezonedb-$TMPV_PECL_TIMEZONEDB/* ext/timezonedb/ && \
rm -R ext/ssh2 2>/dev/null ; mkdir ext/ssh2 ; cp -R ../pecl/ssh2-$TMPV_PECL_SSH2_BRANCH7/* ext/ssh2/ && \
rm -R ext/libsodium 2>/dev/null ; mkdir ext/libsodium ; cp -R ../pecl/libsodium-$TMPV_PECL_LIBSODIUM_BRANCH5/* ext/libsodium/ && \
rm -R ext/tidy 2>/dev/null ; mkdir ext/tidy && cp -R ../pecl/tidy-$TMPV_PECL_TIDY/* ext/tidy/ && \
rm -R ext/cphalcon 2>/dev/null ; mkdir ext/cphalcon ; cp -R ../pecl/cphalcon-$TMPV_PECL_CPHALCON/* ext/cphalcon/ && \
rm -R ext/xdebug 2>/dev/null ; mkdir ext/xdebug ; cp -R ../pecl/xdebug-$TMPV_PECL_XDEBUG_BRANCH7/* ext/xdebug/ && \
cd /usr/local/src/php-$TMPV_PHP71 && \
rm configure 2>/dev/null ; ./buildconf --force && \
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php71 --disable-all --with-iconv=/usr/local/lib --enable-libxml --with-libxml-dir=/usr/local --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --enable-pdo --with-pdo-mysql --with-zlib=/usr/local --with-openssl --with-openssl-dir=/usr/local/lib --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --enable-zip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --enable-gd-native-ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-xpm-dir=/usr/local --with-freetype-dir=/usr/local --with-webp-dir=/usr/local --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-opcache --with-librabbitmq-dir=/usr/local --with-amqp --with-libsodium --with-ssh2=shared && \
make && ./sapi/cli/php -m && ./sapi/cli/php -v && \
make install && php71 -m && php71 -v && \
cd /usr/local/src/php-$TMPV_PHP71/ext/xdebug && sh /usr/local/php71/bin/phpize && ./configure --with-php-config=/usr/local/php71/bin/php-config && make && sudo make install && cd /usr/local/src/php-$TMPV_PHP71 && \
cd /usr/local/src/php-$TMPV_PHP71/ext/cphalcon/build && ./install --phpize /usr/local/php71/bin/phpize --php-config /usr/local/php71/bin/php-config && cd /usr/local/src/php-$TMPV_PHP71 && \
php71 -m && php71 -v

cd /usr/local/src && \
wget https://secure.php.net/distributions/php-$TMPV_PHP72.tar.bz2 && \
cd /usr/local/src && \
rm -R php-$TMPV_PHP72 2>/dev/null ; tar -xjf php-$TMPV_PHP72.tar.bz2 && \
cd /usr/local/src/php-$TMPV_PHP72 && \
rm -R ext/amqp 2>/dev/null ; mkdir ext/amqp ; cp -R ../pecl/amqp-$TMPV_PECL_AMQP/* ext/amqp/ && \
rm -R ext/redis 2>/dev/null ; mkdir ext/redis ; cp -R ../pecl/redis-$TMPV_PECL_REDIS/* ext/redis/ && \
rm -R ext/imagick 2>/dev/null ; mkdir ext/imagick ; cp -R ../pecl/imagick-$TMPV_PECL_IMAGICK/* ext/imagick/ && \
rm -R ext/timezonedb 2>/dev/null ; mkdir ext/timezonedb ; cp -R ../pecl/timezonedb-$TMPV_PECL_TIMEZONEDB/* ext/timezonedb/ && \
rm -R ext/ssh2 2>/dev/null ; mkdir ext/ssh2 ; cp -R ../pecl/ssh2-$TMPV_PECL_SSH2_BRANCH7/* ext/ssh2/ && \
rm -R ext/libsodium 2>/dev/null ; mkdir ext/libsodium ; cp -R ../pecl/libsodium-$TMPV_PECL_LIBSODIUM_BRANCH5/* ext/libsodium/ && \
rm -R ext/tidy 2>/dev/null ; mkdir ext/tidy && cp -R ../pecl/tidy-$TMPV_PECL_TIDY/* ext/tidy/ && \
rm -R ext/cphalcon 2>/dev/null ; mkdir ext/cphalcon ; cp -R ../pecl/cphalcon-$TMPV_PECL_CPHALCON/* ext/cphalcon/ && \
rm -R ext/xdebug 2>/dev/null ; mkdir ext/xdebug ; cp -R ../pecl/xdebug-$TMPV_PECL_XDEBUG_BRANCH7/* ext/xdebug/ && \
cd /usr/local/src/php-$TMPV_PHP72 && \
rm configure 2>/dev/null ; ./buildconf --force && \
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php72 --disable-all --with-iconv=/usr/local/lib --enable-libxml --with-libxml-dir=/usr/local --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --enable-pdo --with-pdo-mysql --with-zlib=/usr/local --with-openssl --with-openssl-dir=/usr/local/lib --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --with-libzip=/usr/local --enable-zip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-xpm-dir=/usr/local --with-freetype-dir=/usr/local --with-webp-dir=/usr/local --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-opcache --with-librabbitmq-dir=/usr/local --with-amqp --with-sodium --with-ssh2=shared && \
make && ./sapi/cli/php -m && ./sapi/cli/php -v && \
make install && php72 -m && php72 -v && \
cd /usr/local/src/php-$TMPV_PHP72/ext/xdebug && sh /usr/local/php72/bin/phpize && ./configure --with-php-config=/usr/local/php72/bin/php-config && make && sudo make install && cd /usr/local/src/php-$TMPV_PHP72 && \
cd /usr/local/src/php-$TMPV_PHP72/ext/cphalcon/build && ./install --phpize /usr/local/php72/bin/phpize --php-config /usr/local/php72/bin/php-config && cd /usr/local/src/php-$TMPV_PHP72 && \
php72 -m && php72 -v

cd /usr/local/src && \
wget https://secure.php.net/distributions/php-$TMPV_PHP73.tar.bz2 && \
cd /usr/local/src && \
rm -R php-$TMPV_PHP73 2>/dev/null ; tar -xjf php-$TMPV_PHP73.tar.bz2 && \
cd /usr/local/src/php-$TMPV_PHP73 && \
rm -R ext/amqp 2>/dev/null ; mkdir ext/amqp ; cp -R ../pecl/amqp-$TMPV_PECL_AMQP/* ext/amqp/ && \
rm -R ext/redis 2>/dev/null ; mkdir ext/redis ; cp -R ../pecl/redis-$TMPV_PECL_REDIS/* ext/redis/ && \
rm -R ext/imagick 2>/dev/null ; mkdir ext/imagick ; cp -R ../pecl/imagick-$TMPV_PECL_IMAGICK/* ext/imagick/ && \
rm -R ext/timezonedb 2>/dev/null ; mkdir ext/timezonedb ; cp -R ../pecl/timezonedb-$TMPV_PECL_TIMEZONEDB/* ext/timezonedb/ && \
rm -R ext/ssh2 2>/dev/null ; mkdir ext/ssh2 ; cp -R ../pecl/ssh2-$TMPV_PECL_SSH2_BRANCH7/* ext/ssh2/ && \
rm -R ext/libsodium 2>/dev/null ; mkdir ext/libsodium ; cp -R ../pecl/libsodium-$TMPV_PECL_LIBSODIUM_BRANCH5/* ext/libsodium/ && \
rm -R ext/tidy 2>/dev/null ; mkdir ext/tidy && cp -R ../pecl/tidy-$TMPV_PECL_TIDY/* ext/tidy/ && \
rm -R ext/cphalcon 2>/dev/null ; mkdir ext/cphalcon ; cp -R ../pecl/cphalcon-$TMPV_PECL_CPHALCON/* ext/cphalcon/ && \
rm -R ext/xdebug 2>/dev/null ; mkdir ext/xdebug ; cp -R ../pecl/xdebug-$TMPV_PECL_XDEBUG_BRANCH7/* ext/xdebug/ && \
cd /usr/local/src/php-$TMPV_PHP73 && \
rm configure 2>/dev/null ; ./buildconf --force && \
make clean 2>/dev/null ; ./configure --prefix=/usr/local/php73 --disable-all --with-iconv=/usr/local/lib --enable-libxml --with-libxml-dir=/usr/local --enable-xml --enable-dom --enable-ctype --with-curl=/usr/local --enable-json --enable-session --enable-simplexml --enable-pdo --with-pdo-mysql --with-zlib=/usr/local --with-openssl --with-openssl-dir=/usr/local/lib --enable-soap --enable-bcmath --with-bz2 --enable-calendar --enable-exif --enable-ftp --with-gd --with-gettext --enable-mbstring --with-pcre-dir --with-pcre-regex=/usr/local --enable-shmop --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-xsl --with-libzip=/usr/local --enable-zip --enable-filter --enable-hash --with-mysqli --enable-tokenizer --enable-xmlreader --enable-xmlwriter --enable-posix --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-xpm-dir=/usr/local --with-freetype-dir=/usr/local --with-webp-dir=/usr/local --with-imagick=/usr/local --enable-redis --enable-timezonedb --enable-fileinfo --enable-intl --with-kerberos --enable-opcache --with-sodium && \
make && ./sapi/cli/php -m && ./sapi/cli/php -v && sudo make install && php73 -m && php73 -v && \
cd /usr/local/src/php-$TMPV_PHP73/ext/xdebug && sh /usr/local/php73/bin/phpize && ./configure --with-php-config=/usr/local/php73/bin/php-config && make && sudo make install && cd /usr/local/src/php-$TMPV_PHP73 && \
cd /usr/local/src/php-$TMPV_PHP73/ext/cphalcon/build && ./install --phpize /usr/local/php73/bin/phpize --php-config /usr/local/php73/bin/php-config && cd /usr/local/src/php-$TMPV_PHP73 && \
php73 -m && php73 -v

}
