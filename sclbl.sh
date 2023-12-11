#!/bin/bash

echo -ne "Start install of the Scailable AI manager \n"

accesskey="123-123"
bash -c "$(wget -qO - https://get.sclbl.net)" q

if [[ ${accesskey} =~ ^\{?[A-F0-9a-f]{8}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{4}-[A-F0-9a-f]{12}\}?$ ]]; then
  sleep 1
  /opt/sclbl/etc/init stop
  /opt/sclbl/etc/init start --autoregister ${accesskey}
  echo -ne " * UUID detected: ${accesskey}.\n"
  echo -ne " * Access key entered. Scailable Edge AI Manager pre-registered.\n\n"
else
  echo -ne " * No valid access key detected. Please register the Scailable Edge AI Manager manually.\n\n"
fi

balena-idle