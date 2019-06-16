/etc/munin/munin.conf:
  file.append:
    - text: |
         [muninnode]
             address ^192\.168\.253\.187$
             use_node_name yes

restart munin-node:
 cmd:
 - run
 - name: systemctl restart munin-node

