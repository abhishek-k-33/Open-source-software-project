#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Course: Open Source Software (OSS NGMC)
# Purpose: Audit key Linux directories for permissions, owner/group, and size.

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "============================================================"
echo "Directory Audit Report"
echo "============================================================"

# Loop through important directories and collect permission/size details.
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS="$(ls -ld "$DIR" | awk '{print $1, $3, $4}')"
        SIZE="$(du -sh "$DIR" 2>/dev/null | cut -f1)"
        echo "$DIR => Permissions/Owner/Group: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system."
    fi
done

echo "------------------------------------------------------------"
echo "Chosen software config directory check (Apache HTTP Server)"
echo "------------------------------------------------------------"

# Apache config path differs by distro family.
if [ -d "/etc/httpd" ]; then
    CONFIG_DIR="/etc/httpd"
elif [ -d "/etc/apache2" ]; then
    CONFIG_DIR="/etc/apache2"
else
    CONFIG_DIR=""
fi

if [ -n "$CONFIG_DIR" ]; then
    CFG_PERMS="$(ls -ld "$CONFIG_DIR" | awk '{print $1, $3, $4}')"
    echo "Config directory found: $CONFIG_DIR"
    echo "Permissions/Owner/Group: $CFG_PERMS"
else
    echo "Apache config directory not found (/etc/httpd or /etc/apache2)."
fi

echo "============================================================"
