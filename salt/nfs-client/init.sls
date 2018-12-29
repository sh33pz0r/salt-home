{% if grains['os_family'] == 'RedHat' %}
nfs-utils:
  pkg.installed
{% elif grains['os_family'] == 'Debian' %}
nfs-common:
  pkg.installed
{% endif %}

/mnt/nas:
  mount.mounted:
    - device: nas.local.lan:/mnt/nas
    - fstype: nfs
    - opts: vers=4,rsize=65535,wsize=65535,fsc
    - dump: 0
    - pass_num: 0
    - persist: True
    - mkmnt: True

{% for sysopt in ['rmem_default','rmem_max','wmem_default','wmem_max'] %}

{{ sysopt }}:
  sysctl.present:
    - value: 262144

{% endfor %}