{
  "type": "vagrant",
  "only": ["qemu"],
  //"only": ["virtualbox-iso", "vmware-iso", "parallels-iso"],
  "compression_level": 9,

  // leave these without the -iso otherwise they will not take
  "override": {
    "qemu": {
      "output": "{{user `vm_name`}}-{{user `version`}}-qemu.box",
      "vagrantfile_template": "Vagrantfile-libvirt"
    },
    /*
    "virtualbox": {
      "output": "{{user `vm_name`}}-{{user `version`}}-virtualbox.box",
      "vagrantfile_template": "Vagrantfile-virtualbox"
    },
    "vmware": {
      "output": "{{user `vm_name`}}-{{user `version`}}-vmware.box",
    },
    "parallels": {
      "output": "{{user `vm_name`}}-{{user `version`}}-parallels.box",
    }
    */
  },
  "keep_input_artifact": false
}
