mount("ext4", "EMMC", "SYSTEM_DEV", "/system");
package_extract_file("overlay.sh", "/tmp/overlay.sh");
set_perm(0, 0, 0777, "/tmp/overlay.sh");
run_program("/tmp/overlay.sh", "backup");
unmount("/system");
