FROM debian:jessie

RUN apt-get update && apt-get -y install libfontconfig wget adduser openssl ca-certificates

RUN wget http://grafanarel.s3.amazonaws.com/builds/grafana_2.1.0_amd64.deb

RUN dpkg -i grafana_2.1.0_amd64.deb

EXPOSE 3000

VOLUME ["/var/lib/grafana"]
VOLUME ["/var/log/grafana"]
VOLUME ["/etc/grafana"]

WORKDIR /usr/share/grafana

ENTRYPOINT ["/usr/sbin/grafana-server", "--config=/etc/grafana/grafana.ini", "cfg:default.paths.data=/var/lib/grafana", "cfg:default.paths.logs=/var/log/grafana"]
