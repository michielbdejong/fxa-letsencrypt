FROM ubuntu

MAINTAINER michielbdejong <michiel@mozilla.com>

RUN apt-get update -y && apt-get install -y \
    apache2 \
    augeas-lenses \
    binutils \
    cpp \
    cpp-4.8 \
    dialog \
    gcc \
    gcc-4.8 \
    git \
    libapache2-mod-nss \
    libasan0 \
    libatomic1 \
    libaugeas0 \
    libc-dev-bin \
    libc6-dev \
    libcloog-isl4 \
    libexpat1-dev \
    libffi-dev \
    libgcc-4.8-dev \
    libgmp10 \
    libgomp1 \
    libisl10 \
    libitm1 \
    libmpc3 \
    libmpfr4 \
    libpython-dev \
    libpython-stdlib \
    libpython2.7 \
    libpython2.7-dev \
    libpython2.7-minimal \
    libpython2.7-stdlib \
    libquadmath0 \
    libssl-dev \
    libtsan0 \
    libxml2 \
    linux-libc-dev \
    python-dev \
    python-minimal \
    python-pkg-resources \
    python-setuptools \
    python-virtualenv \
    python2.7 \
    python2.7-dev \
    python2.7-minimal \
    zlib1g-dev \
  && apt-get clean
RUN a2enmod ssl
RUN a2ensite default-ssl
RUN git clone https://github.com/letsencrypt/letsencrypt
WORKDIR letsencrypt
EXPOSE 80
EXPOSE 443
CMD apache2ctl start && ./letsencrypt-auto --apache
