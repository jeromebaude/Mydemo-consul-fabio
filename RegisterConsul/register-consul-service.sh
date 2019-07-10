#!/bin/sh

cat <<EOF > consul.rendered.json
{
  "Name": "$SERVICE_NAME",
  "Tags": [
    "${URL_PREFIX}"
  ],
  "Address": "${POD_IP}",
  "Port": ${PORT},
  "Check": {
    "Method": "GET",
    "HTTP": "http://${POD_IP}:${PORT}",
    "Interval": "10s"
  }
}
EOF

curl \
    --request PUT \
    --data @consul.rendered.json \
    "http://$HOST_IP:8500/v1/agent/service/register"
