{
  "type": "vagrant",
  "only": ["null"],
  /*"only": ["virtualbox-iso"], "vmware-iso", "parallels-iso"],*/
  "compression_level": 9,

  // leave these without the -iso otherwise they will not take
  "override": {
    "virtualbox": {
      "output": "subutai-{{user `version`}}-virtualbox.box",
    },
    "vmware": {
      "output": "subutai-{{user `version`}}-vmware.box",
    },
    "parallels": {
      "output": "subutai-{{user `version`}}-parallels.box",
    }
  },
  "keep_input_artifact": true
}
