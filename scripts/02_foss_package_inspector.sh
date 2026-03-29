#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Course: Open Source Software (OSS NGMC)
# Purpose: Check whether a package is installed and print basic metadata.

# Default package is Apache HTTP Server package name for RPM systems.
# You can pass a package name as argument, for example:
# ./02_foss_package_inspector.sh apache2
PACKAGE="${1:-httpd}"

# Detect package manager to choose correct commands.
if command -v rpm >/dev/null 2>&1; then
    PKG_MANAGER="rpm"
elif command -v dpkg >/dev/null 2>&1; then
    PKG_MANAGER="dpkg"
else
    echo "Error: neither rpm nor dpkg was found on this system."
    exit 1
fi

echo "=============================================="
echo "FOSS Package Inspector"
echo "Package      : $PACKAGE"
echo "Pkg Manager  : $PKG_MANAGER"
echo "=============================================="

# Check if package is installed and print metadata.
if [ "$PKG_MANAGER" = "rpm" ]; then
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "$PACKAGE is installed."
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo "$PACKAGE is NOT installed."
    fi
else
    if dpkg -l | grep -E "^ii[[:space:]]+$PACKAGE[[:space:]]" >/dev/null; then
        echo "$PACKAGE is installed."
        dpkg -s "$PACKAGE" | grep -E '^(Version|Maintainer|Description):'
    else
        echo "$PACKAGE is NOT installed."
    fi
fi

echo "----------------------------------------------"
echo "Philosophy note:"

# Case statement to describe packages briefly.
case "$PACKAGE" in
    httpd|apache2)
        echo "Apache: the web server that helped build the open internet."
        ;;
    mysql|mariadb|mariadb-server)
        echo "MySQL/MariaDB: open databases that power applications at global scale."
        ;;
    firefox|firefox-esr)
        echo "Firefox: a community-backed browser defending an open web."
        ;;
    vlc)
        echo "VLC: open multimedia software proving interoperability matters."
        ;;
    git)
        echo "Git: distributed version control built for collaborative development."
        ;;
    python3|python)
        echo "Python: a language advanced by community process and shared tooling."
        ;;
    *)
        echo "This package is part of the wider FOSS ecosystem of shareable tools."
        ;;
esac

echo "=============================================="
