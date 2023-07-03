#!/bin/bash
if [ ! -z "$(ipset list | grep ip_blacklist)" ]; then
	ipset destroy ip_blacklist
fi
ipset create ip_blacklist hash:net
# Linode
ipset add ip_blacklist 45.33.80.243/32
ipset add ip_blacklist 45.79.128.0/18
ipset add ip_blacklist 172.104.11.0/26
ipset add ip_blacklist 172.105.128.8/29
# DigitalOcean
ipset add ip_blacklist 45.55.0.0/16
ipset add ip_blacklist 107.170.224.0/19
ipset add ip_blacklist 134.209.0.0/16
ipset add ip_blacklist 139.59.0.0/16
ipset add ip_blacklist 142.93.0.0/16
ipset add ip_blacklist 157.245.192.0/18
ipset add ip_blacklist 159.65.114.73/32
ipset add ip_blacklist 162.243.0.0/16
ipset add ip_blacklist 178.128.0.0/16
ipset add ip_blacklist 192.241.192.0/18
ipset add ip_blacklist 198.199.64.0/18
ipset add ip_blacklist 209.97.152.248/32
# Choopa
ipset add ip_blacklist 139.180.209.51/32
ipset add ip_blacklist 173.199.123.101/32
