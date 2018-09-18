afp:
  pkg.installed:
    - pkgs:
      - netatalk
      - libc6-dev 
      - avahi-daemon
      - libnss-mdns

/etc/nsswitch.conf:
  file.replace:
    - pattern: |
        hosts(.*)
    - repl: "hosts:          files mdns4_minimal [NOTFOUND=return] dns mdns4 mdns"
    - append_if_not_found: true