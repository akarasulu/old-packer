{
  "type": "qemu",
  "output_directory": "output-{{ user `vm_name` }}-qemu",
  "vm_name": "{{ user `vm_name` }}",
  "shutdown_command": "echo 'shutdown -P now' > shutdown.sh; echo {{user `ssh_pass`}} |sudo -S sh 'shutdown.sh'",
  "boot_command": import "common/bootcommand.jsonnet",
  "boot_wait": "3s",
  "http_directory": "preseeds",
  "iso_checksum": "{{ user `iso_checksum` }}",
  "iso_checksum_type": "{{ user `iso_checksum_type` }}",
  "iso_urls": [
    "{{ user `iso_path` }}/{{ user `iso_name` }}",
    "{{ user `iso_url` }}"
  ],
  "ssh_username": "{{user `ssh_name`}}",
  "ssh_password": "{{user `ssh_pass`}}",
  "ssh_wait_timeout": "10000s",
  "disk_size": "{{user `disk_size`}}",

  // KVM / QEMU Specific
  // -------------------

  "format": "qcow2",
  "headless": false,
  "accelerator": "kvm",
  "qemuargs": [
    [ "-m", "{{user `memory`}}" ],
    [ "-smp", "cpus={{user `cpus`}},maxcpus=16,cores=4" ]
  ],
  "net_device": "virtio-net",
  "disk_interface": "virtio",
}
