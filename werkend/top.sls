base:
  'salt':
    - muninmaster
    - muninconf
    - apache
    - chown
    - restart

  'salt-minion':
    - muninnode
    - muninnodeappend
    - muninnode_restart
