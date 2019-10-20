# Create LVM

1.  Format partitions with using **fdisk** or **cfdisk** commands.
2.  Create the physical volume with the **pvcreate** command.
3.  Create the volume group with the **vgcreate** command.
4.  Create the logical volume with the **lvcreate** command.
5.  Create filesystem with **ext4** or **xfs** using **mkfs.ext4** or **mkfs.xfs** commands.

```
pvcreate /dev/sdb1 /dev/sdb2

vgcreate vg_root /dev/sdb1 /dev/sdb2

lvcreate -n lv_volgrp vg_root

mkfs.xfs /dev/vg_root/lv_volgrp  (or) # For xfs filesystems

mkfs.ext4 /dev/vg_root/lv_volgrp      # For ext4 filesystems
```

# Extend LVM

1.  Format partitions with using **fdisk** or **cfdisk** commands.
2.  Create the physical volume with the **pvcreate** command.
3.  Extend the volume group with the **vgextend** command.
4.  Extend the logical volume with the **lvextend** command.
5.  Extend filesystem with **ext4** or **xfs** using **resize2fs** or **xfs_growth** commands.

```
pvcreate /dev/sda3

vgextend vg_root /dev/sda3

lvextend -l +100%FREE /dev/vg_root/lv_root

xfs_growfs /dev/mapper/vg_root/lv_root  (or)  # For xfs filesystems

resize2fs /dev/vg_root/lv_root                # For ext4 filesystems
```
