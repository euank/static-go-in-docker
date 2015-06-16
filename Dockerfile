FROM scratch
MAINTAINER Euan <euank@euank.com>
COPY ./bin/app /app
COPY ./misc/ca-bundle.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["/app"]
