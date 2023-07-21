#!/bin/bash
if [ -z "$(ipset list | grep ip_blacklist)" ]; then
	ipset create ip_blacklist hash:net
else
	ipset flush ip_blacklist
fi
# DigitalOcean
ipset add ip_blacklist 45.55.0.0/16
ipset add ip_blacklist 104.236.0.0/16
ipset add ip_blacklist 107.170.224.0/19
ipset add ip_blacklist 128.199.0.0/16
ipset add ip_blacklist 134.209.0.0/16
ipset add ip_blacklist 139.59.0.0/16
ipset add ip_blacklist 142.93.0.0/16
ipset add ip_blacklist 157.245.0.0/16
ipset add ip_blacklist 159.65.114.73/32
ipset add ip_blacklist 162.243.0.0/16
ipset add ip_blacklist 178.128.0.0/16
ipset add ip_blacklist 192.241.192.0/18
ipset add ip_blacklist 198.199.64.0/18
ipset add ip_blacklist 206.189.0.0/16
ipset add ip_blacklist 209.97.152.248/32
# Linode
ipset add ip_blacklist 45.33.80.243/32
ipset add ip_blacklist 45.79.128.0/18
ipset add ip_blacklist 139.162.0.0/16
ipset add ip_blacklist 172.104.0.0/15
ipset add ip_blacklist 192.155.80.0/20
# Choopa
ipset add ip_blacklist 139.180.209.51/32
ipset add ip_blacklist 173.199.123.101/32
# GoDaddy
ipset add ip_blacklist 68.178.164.198/32
# America
ipset add ip_blacklist 167.248.133.32/27
ipset add ip_blacklist 170.64.0.0/16
# Russia
ipset add ip_blacklist 176.113.115.210/31
# Germany
ipset add ip_blacklist 80.94.92.0/24
ipset add ip_blacklist 176.57.184.166/32
ipset add ip_blacklist 176.65.145.0/24
# Poland
ipset add ip_blacklist 141.98.11.0/24
# Korea
ipset add ip_blacklist 203.237.211.101/32
