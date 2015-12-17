# fxa-letsencrypt
nginx-based proxy for self-hosting Mozilla services, using letsencrypt for the certs

## Usage:

* Register your own domain name if you don't have one yet.
* Deploy a server with Docker if you don't have one yet.
* Make sure fxa.yourdomain.com points to the server in DNS.
* Wait for this DNS change to propagate.
* On your server:
````
git clone https://github.com/michielbdejong/fxa-letsencrypt
docker build -t fxa-letsencrypt fxa-letsencrypt/
echo Make sure nothing is running on ports 80 and 443, then:
docker run -e ROOT_DOMAIN=yourdomain.com --net=host fxa-letsencrypt
````
