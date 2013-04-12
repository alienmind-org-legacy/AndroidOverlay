mount("ext4", "EMMC", "SYSTEM_DEV", "/system");
package_extract_file("overlay.sh", "/system/bin/overlay.sh");
package_extract_file("overlay_device.conf", "/system/etc/overlay_device.conf");
package_extract_file("99-overlay.sh", "/system/addon.d/99-overlay.sh");
set_perm(0, 0, 0777, "/system/bin/overlay.sh");
run_program("/system/bin/overlay.sh", "");
unmount("/system");
