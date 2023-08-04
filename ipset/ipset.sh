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
ipset add ip_blacklist 45.33.0.0/17
ipset add ip_blacklist 45.79.0.0/16
ipset add ip_blacklist 66.175.208.0/20
ipset add ip_blacklist 139.162.0.0/16
ipset add ip_blacklist 172.104.0.0/15
ipset add ip_blacklist 192.155.80.0/20
# Choopa
ipset add ip_blacklist 45.32.202.167/32
ipset add ip_blacklist 139.180.209.51/32
ipset add ip_blacklist 173.199.123.101/32
# GoDaddy
ipset add ip_blacklist 68.178.128.0/17
ipset add ip_blacklist 132.148.76.25/32
# Amazon
ipset add ip_blacklist 3.6.0.0/16
# Hurricane Electric
ipset add ip_blacklist 64.62.197.0/24
# UCloud
ipset add ip_blacklist 106.75.0.0/16
# 阿里云
ipset add ip_blacklist 123.56.155.0/24
# 美国
ipset add ip_blacklist 143.42.59.184/32
ipset add ip_blacklist 162.142.125.0/24
ipset add ip_blacklist 165.232.105.52/24
ipset add ip_blacklist 167.94.0.0/16
ipset add ip_blacklist 167.71.233.223/32
ipset add ip_blacklist 167.172.120.107/32
ipset add ip_blacklist 167.248.133.32/24
ipset add ip_blacklist 170.64.0.0/16
ipset add ip_blacklist 193.142.147.209/32
# 英国
ipset add ip_blacklist 62.204.41.134/32
ipset add ip_blacklist 185.200.118.0/24
# 俄罗斯
ipset add ip_blacklist 62.122.184.3/32
ipset add ip_blacklist 80.66.83.132/32
ipset add ip_blacklist 176.113.115.0/24
# 德国
ipset add ip_blacklist 80.94.92.0/24
ipset add ip_blacklist 176.57.184.166/32
ipset add ip_blacklist 176.65.145.0/24
ipset add ip_blacklist 194.233.172.115/32
# 法国
ipset add ip_blacklist 94.23.96.74/31
# 意大利
ipset add ip_blacklist 193.42.33.230/32
# 加拿大
ipset add ip_blacklist 158.69.165.244/32
ipset add ip_blacklist 198.235.24.0/24
ipset add ip_blacklist 205.210.31.0/24
# 波兰
ipset add ip_blacklist 141.98.11.0/24
ipset add ip_blacklist 185.233.19.0/24
# 荷兰
ipset add ip_blacklist 93.174.95.106/32
ipset add ip_blacklist 185.216.140.186/32
# 韩国
ipset add ip_blacklist 203.237.211.101/32
# 比利时
ipset add ip_blacklist 87.236.176.0/24
# 乌克兰
ipset add ip_blacklist 31.43.185.32/32
# 其他国家
ipset add ip_blacklist 78.128.114.0/24
ipset add ip_blacklist 109.205.213.34/32
ipset add ip_blacklist 185.73.124.50/32
ipset add ip_blacklist 186.4.250.34/32
ipset add ip_blacklist 193.29.13.22/32
# 湖北
ipset add ip_blacklist 113.56.95.80/32
# 辽宁
ipset add ip_blacklist 223.100.159.87/32
# 河北
ipset add ip_blacklist 121.18.180.50/32
# 厦门
ipset add ip_blacklist 121.204.215.24/32
# 广东
ipset add ip_blacklist 113.105.223.74/32
ipset add ip_blacklist 116.6.233.155/32
# 重庆
ipset add ip_blacklist 219.151.147.205/32
# 浙江
ipset add ip_blacklist 36.20.126.147/32
ipset add ip_blacklist 183.136.225.0/26
