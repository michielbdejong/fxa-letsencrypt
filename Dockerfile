FROM nginx

MAINTAINER michielbdejong <michiel@mozilla.com>

RUN apt-get update -y && apt-get install -y git && apt-get clean

RUN git clone https://github.com/letsencrypt/letsencrypt \
  && cd letsencrypt \
  && ./letsencrypt-auto --nginx
