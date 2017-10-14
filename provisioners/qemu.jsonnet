{
  "scripts": [
    "scripts/sudo.sh",
    "scripts/build_time.sh",
    "scripts/authorized_keys.sh",
    "scripts/apt_proxy.sh",
    "scripts/apt.sh",
    "scripts/vbox.sh",
    /*"scripts/syslog.sh",*/
    "scripts/fix-vagrant.sh",
    "scripts/rc_local.sh",
    "scripts/grub.sh",
    "scripts/cleanup.sh",
    ],
  "execute_command":
    "export PROXY_ON='{{user `proxy_on`}}';" +
    "export APT_PROXY_HOST='{{user `apt_proxy_host`}}';" +
    "export APT_PROXY_URL='{{user `apt_proxy_url`}}';" +
    "export BRANCHTAG='{{user `branch_or_tag`}}';" +
    "export DISTRIBUTION='{{user `distribution`}}';" +
    "export DESKTOP='{{user `desktop`}}';" +
    "export SSH_USERNAME='{{user `ssh_name`}}';" +
    "export SSH_PASSWORD='{{user `ssh_pass`}}';" +
    "echo {{user `ssh_pass`}} | sudo -E -S sh '{{ .Path }}'"
}
