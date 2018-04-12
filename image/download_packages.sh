#!/bin/bash
# This script will get the list of all needed packages specified in the
# ks disrectory. The script will search for packages in ks/*.packages and
# download them and the dependencies. When download is complete
# will a repository database be created
iso_root=$(dirname $0)
packages="$iso_root/isolinux/Packages"

# Sanity
if [ ! -f /bin/createrepo ];then
    echo "install createrepo"
    echo "yum install createrepo"
fi
if [ ! -d "$packages" ]; then
    mkdir -p "$packages"
else
    # remove packages before adding new
    rm "$packages" -rf
fi

# Check if kickstart directory exist
if [ ! -d "$iso_root/isolinux/ks" ]; then
    echo "Directory $iso_root/isolinux/ks/ is missing, exit"
    exit 1
fi

# Check if isolinux directory exist
if [ ! -d "$iso_root/isolinux" ];then
    echo "Directory $iso_root/isolinux is missing, exit"
    exit 1
fi

# Get a list of all packages needed to build all type installations
needed_packages=$(cat $iso_root/isolinux/ks/*.packages|sort|uniq|tr '\n' ' ')

# Download all packages and the dependencies
/usr/bin/repotrack --arch=x86_64 --download_path=$packages $needed_packages

# repotrack downloads both 32 and 64 bits packages, remove all 32 bits
rm $packages/*.i686.rpm

# Create repo database
createrepo -g comps.xml $iso_root/isolinux/
exit 0
