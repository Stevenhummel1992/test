base:
  'salt':
    - nettools
    - apache
    - munin-master
    - munin-master-config

  'salt-minion':
    - nettools
    - munin-node
    - munin-node-append
