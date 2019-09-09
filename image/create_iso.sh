#!/bin/bash
set -e

iso_root=$(dirname $0)
iso=foss.iso
iso_dir=${iso_root}/foss

# Sanity checks
if [ ! -e $iso_root/DVD/isolinux ]; then
    echo "You need to mount the CentOS minimal DVD and copy some essentials from it, like:"
    echo mkdir mnt
    echo sudo mount -o loop ~/CentOS-7-x86_64-Minimal-1611.iso mnt
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
if [ ! -f /usr/lib/grub/x86_64-efi/gfxterm_background.mod ];then
    echo "missing packages"
    echo "yum install grub2-efi-x64-modules"
    exit 1
fi

if [ -d ${iso_dir} ]; then
  rm -rf ${iso_dir}
fi
mkdir -p ${iso_dir}
cp -rp ${iso_root}/DVD/* ${iso_dir}

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
if [ -f ${iso_root}/${iso} ];then
    rm -f ${iso_root}/${iso}
fi

# Copy our RPMs to the package list
cp -pf ${iso_root}/../rpms/* ${iso_root}/isolinux/Packages
cp -pf ../files/ids/snort*.rpm ${iso_root}/isolinux/Packages
# Need to rebuild the repo db to include our RPMs
createrepo -g comps.xml ${iso_root}/isolinux/

# copy from CentOS minimal DVD
for i in initrd.img isolinux.bin memtest vesamenu.c32 vmlinuz; do 
    [[ -e ${iso_dir}/isolinux/${i} ]] || cp ${iso_root}/DVD/isolinux/${i} ${iso_dir}/isolinux
done
[[ -e ${iso_dir}/isolinux/LiveOS ]] || cp -r ${iso_root}/DVD/LiveOS ${iso_dir}/isolinux

# EFI 
mkdir -p ${iso_root}/EFI/BOOT/x86_64-efi
cp -f /usr/lib/grub/x86_64-efi/gfxterm_background.mod ${iso_root}/EFI/BOOT/x86_64-efi
cp -f ${iso_root}/EFI/BOOT/grub.cfg ${iso_dir}

# set up efi boot image
dd if=/dev/zero of=${iso_root}/efiboot.img bs=1K count=9440
mkdosfs -F 12 ${iso_root}/efiboot.img
MOUNTPOINT=$(mktemp -d)
mount -o loop ${iso_root}/efiboot.img $MOUNTPOINT
cp -rf ${iso_root}/DVD/EFI ${MOUNTPOINT}
cp -rf ${iso_root}/EFI ${MOUNTPOINT}
umount ${MOUNTPOINT}
rmdir ${MOUNTPOINT}
mv -f ${iso_root}/efiboot.img ${iso_dir}/isolinux

# Convert isolinux.cfg.utf8 to code page 850
/usr/bin/iconv -f utf8 -t CP850 -o ${iso_root}/isolinux/isolinux.cfg ${iso_root}/isolinux/isolinux.cfg.utf8
cp -rp ${iso_root}/isolinux/* ${iso_dir}
cp -rp ${iso_root}/EFI/BOOT/grub.cfg ${iso_dir}
cp -rp ${iso_root}/EFI ${iso_dir}

# Create iso image
/bin/mkisofs -U -A 'FOSS collection' -V 'FOSS' -volset 'FOSS' -J -joliet-long -r -v -T -x ./lost+found -o ${iso_root}/${iso} -b isolinux/isolinux.bin -c isolinux/boot.cat -input-charset utf-8 -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot ${iso_dir}


# Make the iso image hybrid, allows cd and usb installtions
/usr/bin/isohybrid --uefi ${iso_root}/${iso}

/bin/implantisomd5 ${iso_root}/${iso}

# Remove the generated CP850 file
rm ${iso_root}/isolinux/isolinux.cfg
