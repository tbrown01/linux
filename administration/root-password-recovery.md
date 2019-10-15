# RHEL 7

1.	At the beginning of the boot process at the GRUB 2 menu, Enter **“e”** key to edit the boot process. 
2.	Go to the kernel line (the line starting with **linux16**), and at the end of the line add **rd.break**.
3.	Press **Ctrl x** to resume the boot process.
4.	Mount the **/sysroort** partition as read/write: 
5.	Execute the **chroot** command on the **/sysroot** partition.
6.  Change the password for root with the **passwd** command.
7.  Create the **/.autorelabel** hidden file.
8.  Reboot
```
rd.break

switch_root:/# mount –o remount,rw /sysroot
switch_root:/# chroot  /sysroot

switch_root:/# password root
switch_root:/# touch /.autorelabel
```


# RHEL 6

1. Reboot the VM and press **“any key”** to enter the menu within 5 seconds. 
2. Press **“e”** to edit the primary vmlinuz entry. 
3. Select the line that begins with **“kernel…”** and press **“e”** to edit. 
4. Press spacebar then **“1”** or **“s”** or “**single”** and press **enter**. 
5. Then press **“b”** to boot. You will now be at the command line prompt.
6. Change root password with the **passwd** command.
7. Reboot

NOTE: You can also use **init=/bin/bash** to access the console if the root password is unknown.
