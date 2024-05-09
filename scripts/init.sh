Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/bin/bash

# Log
echo "==================================================" >> /var/log/user_data_script.log
echo "[INFO] EXE-ON: $(date)" >> /var/log/user_data_script.log

# Update the repositories cache
sudo apt update -y

# Check if Java is installed & install the latest available openjdk if not
if ! command -v java &> /dev/null; then
    echo "[INFO] INSTALLING: openjdk-21-jdk" >> /var/log/user_data_script.log
    sudo apt install -y openjdk-21-jdk
else
    echo "[INFO] openjdk-21-jdk is already installed" >> /var/log/user_data_script.log
fi

# Check if security updates are configured as unattended updates
if dpkg-query -W unattended-upgrades &>/dev/null; then
    echo "" > /etc/apt/apt.conf.d/51unattended-upgrades
    echo "Unattended-Upgrade::Allowed-Origins {" >> /etc/apt/apt.conf.d/51unattended-upgrades
    echo "\"\$${distro_id}:\$${distro_codename}-security\";" >> /etc/apt/apt.conf.d/51unattended-upgrades
    echo "};" >> /etc/apt/apt.conf.d/51unattended-upgrades
else
    echo "[INFO] INSTALLING: unattended-upgrades" >> /var/log/user_data_script.log
    sudo apt install -y unattended-upgrades
    echo "" > /etc/apt/apt.conf.d/51unattended-upgrades
    echo "Unattended-Upgrade::Allowed-Origins {" >> /etc/apt/apt.conf.d/51unattended-upgrades
    echo "\"\$${distro_id}:\$${distro_codename}-security\";" >> /etc/apt/apt.conf.d/51unattended-upgrades
    echo "};" >> /etc/apt/apt.conf.d/51unattended-upgrades
fi

# Check if elastic-agent package is installed
if dpkg-query -W elastic-agent &>/dev/null; then
    echo "[INFO] Elastic Agent is already installed" >> /var/log/user_data_script.log
else
    echo "[INFO] INSTALLING: elastic-agent" >> /var/log/user_data_script.log
    curl -L -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.13.3-amd64.deb
    dpkg -i elastic-agent-8.13.3-amd64.deb
fi
