    {
      "type": "virtualbox-iso",
      "output_directory": "output-{{ user `vm_name` }}-virtualbox-iso",
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
      "headless": "{{ user `headless` }}",
      "disk_size": "{{user `disk_size`}}",
      "skip_export": "{{user `skip_export`}}",
      "keep_registered": "{{user `keep_registered`}}",

      // VirtualBox Specific
      // -------------------

      "post_shutdown_delay": "1m",
      "virtualbox_version_file": ".vbox_version",
      "guest_additions_path": "VBoxGuestAdditions_{{.Version}}.iso",
      "guest_os_type": "{{ user `virtualbox_guest_os_type` }}",

      "vboxmanage": [
        [
          "modifyvm", "{{.Name}}", "--memory", "{{ user `memory` }}"
        ],
        [
          "modifyvm", "{{.Name}}", "--cpus", "{{ user `cpus` }}"
        ]
        /*[
          "modifyvm", "{{.Name}}",
          "--nic1", "bridged",
          "--bridgeadapter1", "en0"
        ],*/
        /*[
          "modifyvm", "{{.Name}}",
          "--nic2", "nat",
          "--nat-network2", "NatNetwork",
          "--natpf2", "ssh,tcp,127.0.0.1,4567,,22"
        ],*/
        /*[
          "modifyvm", "{{.Name}}",
          "--nic3", "hostonly",
          "--hostonlyadapter3", "vboxnet0",
          "--intnet3", "vboxnet0"
        ],*/
        /*
        [
          "modifyvm", "{{.Name}}",
          "--uart1", "0x3F8", "4"
        ],
        [
          "modifyvm", "{{.Name}}",
          "--uartmode1", "file", "{{template_dir}}/{{user `vm_name`}}-console.log"
        ],
        */
      ],
    }
