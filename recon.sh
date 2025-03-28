#!/bin/bash

# Usage: ./recon.sh example.com
DOMAIN=$1
DATE=$(date +"%Y-%m-%d")
OUTDIR="output/$DOMAIN"

if [ -z "$DOMAIN" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

mkdir -p "$OUTDIR"

echo "[*] Starting DNS Recon for $DOMAIN..."

# 1. Amass
echo "[*] Running Amass..."
amass enum -d $DOMAIN -o "$OUTDIR/amass.txt"

# 2. dnsrecon
echo "[*] Running dnsrecon..."
dnsrecon -d $DOMAIN -a -n 8.8.8.8 > "$OUTDIR/dnsrecon.txt"

# 3. subfinder
echo "[*] Running Subfinder..."
subfinder -d $DOMAIN -o "$OUTDIR/subfinder.txt"

# 4. dnsenum
echo "[*] Running dnsenum..."
dnsenum $DOMAIN > "$OUTDIR/dnsenum.txt"

# 5. Fierce
echo "[*] Running Fierce..."
fierce -dns $DOMAIN > "$OUTDIR/fierce.txt"

# 6. dnsmap
echo "[*] Running dnsmap..."
dnsmap $DOMAIN > "$OUTDIR/dnsmap.txt"

# 7. Manual Checks (dig, host, nslookup)
echo "[*] Running dig..."
dig any $DOMAIN +noall +answer > "$OUTDIR/dig.txt"

echo "[*] Running host..."
host $DOMAIN > "$OUTDIR/host.txt"

echo "[*] Running nslookup..."
nslookup -type=any $DOMAIN > "$OUTDIR/nslookup.txt"

echo "[*] DNS Recon for $DOMAIN completed. Output saved in $OUTDIR"
