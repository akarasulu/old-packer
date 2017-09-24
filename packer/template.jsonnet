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
