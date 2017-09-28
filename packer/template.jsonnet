{
  builders: [
    import "builders/null.jsonnet",
    import "builders/virtualbox-iso.jsonnet",
    import "builders/parallels-iso.jsonnet",
    import "builders/vmware-iso.jsonnet",
  ],
  "variables": import "variables.jsonnet",
  "provisioners": [
    {
      "type": "file",
      "source": "preseeds/virtualbox-interfaces",
      "destination": "/tmp/virtualbox-interfaces"
    },
    {
      "type": "file",
      "source": "preseeds/fix-vagrant.service",
      "destination": "/tmp/fix-vagrant.service"
    },
    {
      "type": "file",
      "source": "preseeds/fix-vagrant",
      "destination": "/tmp/fix-vagrant"
    },
    {
      "type": "shell",
      "override": {
        "null": import "provisioners/null.jsonnet",
        "virtualbox-iso": import "provisioners/virtualbox-iso.jsonnet",
        "parallels-iso": import "provisioners/parallels-iso.jsonnet",
        "vmware-iso": import "provisioners/vmware-iso.jsonnet",
      },
    },
  ],
  "post-processors": [ [
    import "post-processors/vagrant.jsonnet",
  ] ]
}
