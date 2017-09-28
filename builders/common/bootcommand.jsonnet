      [
        "<esc><wait>",
        "install",
        " auto",
        /*" interface={{user `eth1_mac`}}",*/
        /*" debconf/priority=critical",*/
        /*" DEBCONF_DEBUG=5",*/
        " net.ifnames=0",
        " url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/{{ user `preseed` }}",
        " debian-installer=en_US",
        " locale=en_US",
        " keymap=us",
        " netcfg/get_hostname=subutai",
        " netcfg/get_domain=vm ",
        "<enter>"
      ]
