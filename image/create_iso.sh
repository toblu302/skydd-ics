#!/bin/bash
set -e

iso_root=$(dirname $0)
iso=$iso_root/foss.iso

# Sanity checks
if [ ! -e $iso_root/DVD/isolinux ]; then
    echo "You need to mount the CentOS minimal DVD and copy some essentials from it, like:"
    echo mkdir mnt
    echo sudo mount -o loop ~gk/CentOS-7-x86_64-Minimal-1611.iso mnt
    echo mkdir DVD
    echo "cp -r mnt/* DVD/"
    exit 1
fi
if [ ! -f /bin/mkisofs ];then
    echo "missing packages"
    echo "yum install mkisofs"
    exit 1
fi
if [ ! -f /usr/bin/isohybrid ];then
    echo "missing packages"
    echo "yum install syslinux"
    exit 1
fi

cnt=`find $iso_root/../docs -name "*html"|wc -l`
if [[ $cnt == 0 ]] && [[ "X$1" != "X1" ]]; then
    echo "Du har inte byggt nagon dokumentation! gor cd ../docs och skriv make"
    echo "..eller kor ./create_iso.sh 1 om du vill strunta i det.."
    exit 1
fi

if [ ! -e $iso_root/../rpms ] && [ "X$1" != "X1" ]; then
    echo "Du har inte byggt våra RPMer, varför ska du då göra en ISO?"
    echo "kör ./create_iso.sh 1 om du vill strunta i det.."
    exit 1;
fi

cnt=`find $iso_root/isolinux/Packages/ -name "*rpm"|wc -l`
if [[ $cnt == 0 ]]; then
    echo "Du har inte lagt till de programvaror som behövs för att kunna bygga imagen"
    echo "Kör ./download_packages.sh först"
    exit 1
fi
if [ -f $iso ];then
    rm -f $iso
fi

# Copy our RPMs to the package list
cp -f $iso_root/../rpms/* $iso_root/isolinux/Packages/
# Need to rebuild the repo db to include our RPMs
createrepo -g comps.xml $iso_root/isolinux/

# copy from CentOS minimal DVD
for i in initrd.img isolinux.bin memtest vesamenu.c32 vmlinuz; do 
    [[ -e isolinux/$i ]] || cp $iso_root/DVD/isolinux/$i $iso_root/isolinux/
done
[[ -e isolinux/LiveOS ]] || cp -r $iso_root/DVD/LiveOS $iso_root/isolinux/

# Convert isolinux.cfg.utf8 to code page 850
/usr/bin/iconv -f utf8 -t CP850 -o $iso_root/isolinux/isolinux.cfg $iso_root/isolinux/isolinux.cfg.utf8

# Create iso image
/bin/mkisofs -input-charset utf-8 -o $iso -b isolinux.bin -c boot.cat -no-emul-boot -V 'FOSS' -boot-load-size 4 -boot-info-table -R -J -v -T $iso_root/isolinux

# Make the iso image hybrid, allows cd and usb installtions
/usr/bin/isohybrid $iso

# Remove the generated CP850 file
rm $iso_root/isolinux/isolinux.cfg
