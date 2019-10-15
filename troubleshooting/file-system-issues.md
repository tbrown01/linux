# File System Issues

To repair a corrupted Filesystem use the following commands:

Recover from XFS filesystem:   
```
xfs_repair -y /dev/<file_partition>
```

Recover from EXT4 filesystem:  
```
fsck.ext4 -y /dev/<file_partition>
```
