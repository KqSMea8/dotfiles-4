#!/bin/bash

hostname=$(hostname)
ipaddress=$(ifconfig en0 | grep -w inet | awk '{print $2}')
bypassdomains=("*.local" "localhost" "127.0.0.1" "${hostname}" "${ipaddress}")
wifiname=$(networksetup -listallhardwareports | grep -B1 en0 | grep Hardware | awk '{print $NF}')
wifissid=$(networksetup -getairportnetwork en0 | head -1 | awk '{print $NF}')

if [[ "${wifissid}" =~ "network." ]]; then
    CONTEXT=offline
elif [[ "${wifissid}" = "Tencent-OfficeWiFi" ]]; then
    CONTEXT=office
else
    CONTEXT=home
fi

if [ "${CONTEXT}" = "offline" ]; then
    networksetup -setwebproxystate "${wifiname}" off
    networksetup -setsecurewebproxystate "${wifiname}" off
    networksetup -setsocksfirewallproxystate "${wifiname}" off

elif [ "${CONTEXT}" = "office" ]; then
    url="http://txp-01.tencent.com/proxy_ngn.pac?pc=${hostname}&ip=${ipaddress}&ver=5.0.6.120"

    networksetup -setautoproxyurl "${wifiname}" "${url}"
    networksetup -setautoproxystate "${wifiname}" on

    networksetup -setwebproxy "${wifiname}" web-proxy.oa.com 8080
    networksetup -setwebproxystate "${wifiname}" on

    networksetup -setsecurewebproxy "${wifiname}" web-proxy.oa.com 8080
    networksetup -setsecurewebproxystate "${wifiname}" on

    networksetup -setsocksfirewallproxystate "${wifiname}" off

    cat > ~/.config/shell/proxy << EOF
export http_proxy=http://web-proxy.oa.com:8080
export https_proxy=http://web-proxy.oa.com:8080
EOF

elif [ "${CONTEXT}" = "home" ]; then
    networksetup -setwebproxy "${wifiname}" 127.0.0.1 6152
    networksetup -setwebproxystate "${wifiname}" on

    networksetup -setsecurewebproxy "${wifiname}" 127.0.0.1 6152
    networksetup -setsecurewebproxystate "${wifiname}" on

    networksetup -setsocksfirewallproxy "${wifiname}" 127.0.0.1 6153
    networksetup -setsocksfirewallproxystate "${wifiname}" on

    cat > ~/.config/shell/proxy << EOF
export http_proxy=127.0.0.1:6152
export https_proxy=127.0.0.1:6152
EOF

fi

networksetup -setproxybypassdomains "${wifiname}" ${bypassdomains[@]}

# clear USBLAN proxy config
networksetup -setautoproxystate "USBLAN" off
networksetup -setwebproxystate "USBLAN" off
networksetup -setsecurewebproxystate "USBLAN" off
networksetup -setsocksfirewallproxystate "USBLAN" off

# start pac file server
workdir=$(cd $(dirname $0) && pwd)
if ! lsof -nP -i TCP:56666 | grep -i listen > /dev/null; then
    cd "${workdir}"; python -m SimpleHTTPServer 56666 > /dev/null 2>&1 &
fi
