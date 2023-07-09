#!/bin/bash

echo "Acunetix v15.7 by Pwn3rzs / CyberArsenal"

echo "
You can find us here:
https://t.me/Pwn3rzs
or
https://cyberarsenal.org
Enjoy!"

echo "
Setup:
1) Download Zip File, password is on our post
2) Before installing the tool, add to your hosts file (usually /etc/hosts) at the end: "

sudo echo "

127.0.0.1  erp.acunetix.com
127.0.0.1  erp.acunetix.com.
::1  erp.acunetix.com
::1  erp.acunetix.com.

127.0.0.1  telemetry.invicti.com
127.0.0.1  telemetry.invicti.com.
::1  telemetry.invicti.com
::1  telemetry.invicti.com. " >> /etc/hosts

clear
cat /etc/hosts
sleep 1

echo "3) Now install the tools with sudo : "
#sudo bash acunetix*.sh"

echo -e " 4Onceinstalled letsstop its service with: "
sudo systemctl stop acunetix

echo "5 Lets replace wvsc file: "
sudo cp wvsc /home/acunetix/.acunetix/v_230603143/scanner/wvsc
sudo chown acunetix:acunetix /home/acunetix/.acunetix/v_230603143/scanner/wvsc
sudo chmod +x /home/acunetix/.acunetix/v_230603143/scanner/wvsc

echo "6 Time to add licenses:"
sudo rm /home/acunetix/.acunetix/data/license/* 
echo "(Pay attention to copy and paste right, this can damage your entire OS)"
sudo cp license_info.json /home/acunetix/.acunetix/data/license/
sudo cp wa_data.dat /home/acunetix/.acunetix/data/license/
sudo chown acunetix:acunetix /home/acunetix/.acunetix/data/license/license_info.json
sudo chown acunetix:acunetix /home/acunetix/.acunetix/data/license/wa_data.dat
sudo chmod 444 /home/acunetix/.acunetix/data/license/license_info.json
sudo chmod 444 /home/acunetix/.acunetix/data/license/wa_data.dat
sudo chattr +i /home/acunetix/.acunetix/data/license/license_info.json 
echo "(Pay attention to copy and paste right, this can damage your entirOS)"
sudo chattr +i /home/acunetix/.acunetix/data/license/wa_data.dat

echo "7 Now let's restart acunetix: "

sudo systemctl start acunetix

echo "
8) Now login back to application, and you should be able to use it :)
9) Enjoy!
"
xdg-open https://brs113x:3443/  
