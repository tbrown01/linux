# Troubleshooting Disk Space Issues

There are 2 issues that can cause your Linux system to run out of space.
  - Disk Space
  - Inode Space

## Disk Space
If the RHEL server is running out of disk space, run the following command to find the 50 largest files or directories:
```
du -hax / | sort -rh | head -50
```
To view current disk space:
```
df -h
```
## Inode Space
To view current inode space:
```
df -i
```
Basically an inode is used for each file on the filesystem. So running out of inodes generally means you've got a lot of small files laying around. So the question really becomes, "what directory has a large number of files in it?"
```
find / -xdev -printf '%h\n' | sort | uniq -c | sort -k 1 -n | tail -10
```
This will dump a list of every directory on the filesystem prefixed with the number of files (and subdirectories) in that directory. Thus the directory with the largest number of files will be at the bottom.
