{
    "vm_name": "subutai-debian9",

    "iso_checksum": "ddd8f6542dae8baf410e90b9ae0fe986",
    "iso_checksum_type": "md5",
    "iso_name": "debian-9.1.0-amd64-netinst.iso",
    "iso_url": "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.1.0-amd64-netinst.iso",

    "preseed" : "jessie.cfg",

    "ssh_name": "subutai",
    "ssh_pass": "subutai",
    "hostname": "subutai",

    "cpus": "2",
    "memory": "10240",
    "disk_size": "65535",

    // VirtualBox Specific Settings
    "headless": "false",
    "virtualbox_guest_os_type": "Ubuntu_64",

    // Null Host Specific Settings
    "null_host": "172.16.10.220",

    // Proxy Settings
    "apt_proxy_url": "http://192.168.88.79:3142/",
    "apt_proxy_host": "192.168.88.79",

    // Desktop and Distribution Settings
    "desktop": "false",
    "distribution": "debian",

    // Debugging
    "keep_registered": "false",
    "skip_export": "true",

    // automate this
    // can be dev, master, branch names or a git release tag for production
    "branch_or_tag": "6.0.1",

    // automate this
    "version": "6.0.1",
}
