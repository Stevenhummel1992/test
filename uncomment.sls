uncomment_line:
  file.replace:
    - name: /etc/munin/munin.conf
    - pattern: #dbdir  /var/lib/munin
    - repl: dbdir  /var/lib/munin


