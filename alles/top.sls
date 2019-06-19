base:
  'salt':
#    - muninmaster
#    - muninconf
#    - apache
#    - chown
#    - restart
    - rsyslog
    - rsyslogconf
    - rsyslogrestart

  'ubuntu':
#    - muninnode
#    - muninnodeappend
#    - muninnoderestart
    - rsyslog
    - rsyslogclientappend
    - rsyslogrestart
