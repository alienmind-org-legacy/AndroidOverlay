AndroidOverlay
==============

Scripts to easy manage overlays over an android installation. For flash addicts.

==========
These scripts allow ROM customizations during flash time, overlying a folder structure from /sdcard to internal partitions (/system or /data)
r-script to call it at the end:

The overlay script works as follows:
- If /sdcard/overlay folder exists, it will check for system or data subfolders. It will copy them over recently flashed content.
- If /sdcard/overlay/fixperms.sh script exists, it will call that for fixing permissions (this is optional). If not, it will try to autofix some typical issues (/system/app/* and /data/app/* to 644, and /system/etc/init.d/* to 755)
- If /sdcard/overlay/*.tgz or *.tar.gz exist, it will unpack it over / on the device. Please note that the structure of the .tgz file itself must contain /system or /data folders inside.

========
Example sdcard structure:
sdcard/
└── overlay
    ├── data
    │   ├── app
    │   │   └── com.keramidas.TitaniumBackup-1.apk       # For an easy recovery
    │   └── local
    └── system
        ├── app                                          # Some system app
        │   └── Music.apk
        ├── etc
        │   └── init.d
        ├── fonts
        ├── framework
        ├── lib
        └── media
            ├── audio
            │   ├── alarms
            │   ├── notifications
            │   │   └── Facebook.Chat.Pop.mp3            # System ringtones
            │   ├── ringtones
            │   │   └── Game.Of.Thrones.mp3
            │   └── ui
            └── bootanimation.zip                        # Custom bootanimation



========
Some use cases:
- Some apps could be preinstalled only by preparing them on /sdcard/overlay/data/app/*.apk
- Same thing for system apps: put them on /sdcard/overlay/system/app/*.apk
- init.d scripts on /sdcard/overlay/system/etc/init.d/
- bootanimation.zip on /sdcard/overlay/system/media/bootanimation.zip
- Anything you want ... same thing

================
To create a flashable .zip (without the real sdcard overlay, just the bootstrap)
./mkoverlay

================
To upload the overlay files to /sdcard/overlay
./uploadOverlay | sh

================
For integrating it on other ROMS:

Code:
### Overlay script
mount("ext4", "EMMC", "/dev/block/mmcblk0p9", "/system");
package_extract_file("system/bin/overlay.sh", "/tmp/overlay.sh");
set_perm(0, 0, 0777, "/tmp/overlay.sh");
run_program("/tmp/overlay.sh", "backup");
unmount("/system");
### End Overlay


