FROM ubuntu

MAINTAINER michielbdejong <michiel@mozilla.com>

RUN apt-get update -y && apt-get install -y \
    apache2 \
    git \
    libapache2-mod-nss \
  && apt-get clean
RUN a2enmod ssl
RUN git clone https://github.com/letsencrypt/letsencrypt
WORKDIR letsencrypt
RUN echo Usage: docker run --name proxy -it --net=host fxa-letsencrypt
RUN echo Then exit, and do docker start -d proxy
CMD apache2ctl start && ./letsencrypt-auto --apache
