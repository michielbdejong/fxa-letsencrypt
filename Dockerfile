FROM bitnami/apache

MAINTAINER michielbdejong <michiel@mozilla.com>

RUN apt-get update -y && apt-get install -y git && apt-get clean

ADD ./vhosts /bitnami/apache/conf/vhosts

RUN git clone https://github.com/letsencrypt/letsencrypt
WORKDIR letsencrypt
RUN echo Usage: docker run -it --net=host fxa-letsencrypt
RUN echo and follow command-line instructions
CMD ./letsencrypt-auto --apache
