FROM alpine:3
RUN apk update \
  && apk add rspamd rspamd-proxy rspamd-utils rspamd-controller nginx \
  && rm -rf /var/cache/apk/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY logging.inc /etc/rspamd/local.d/
COPY worker-normal.inc /etc/rspamd/local.d/
CMD /usr/bin/rspamd -f
