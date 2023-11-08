#!/bin/bash

set -e

DOWNLOAD_URL="https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz"
SHASUM_URL="https://github.com/prometheus/node_exporter/releases/download/v1.6.1/sha256sums.txt"

cd /tmp
wget "$DOWNLOAD_URL"
wget "$SHASUM_URL"

if sha256sum -c sha256sums.txt 2> /dev/null | grep "node_exporter-1.6.1.linux-amd64.tar.gz: OK"; then
  tar xzf node_exporter-1.6.1.linux-amd64.tar.gz
  mv node_exporter-1.6.1.linux-amd64/node_exporter /usr/local/bin/
  chmod 755 /usr/local/bin/node_exporter
else
    echo "SHA256SUM check filed!"
    echo "Please verify that the downloaded file is not corrupted."
    exit 1
fi

sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus

touch /etc/systemd/system/node-exporter.service
cat > /etc/systemd/system/node-exporter.service << EOF
[Unit]
Description=Prometheus node exporter
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now node-exporter
systemctl status node-exporter
