  {
    "type": "vmware-iso",
    "output_directory": "output-{{ user `vm_name` }}-vmware-iso",
    "vm_name": "{{ user `vm_name` }}",
    "shutdown_command": "echo 'shutdown -P now' > shutdown.sh; echo {{user `ssh_pass`}} |sudo -S sh 'shutdown.sh'",
    "boot_command": import "common/bootcommand.jsonnet",
    "boot_wait": "10s",
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
    "headless": "{{ user `headless` }}",
    "disk_size": "{{user `disk_size`}}",
    "skip_export": "{{user `skip_export`}}",
    "keep_registered": "{{user `keep_registered`}}",

    // VMWare Specific
    // ---------------

    "tools_upload_flavor": "linux",
    "guest_os_type": "debian8-64",
    "vmx_data": {
      "memsize": "{{user `memory`}}",
      "numvcpus": "{{user `cpus`}}",
    }
  }
