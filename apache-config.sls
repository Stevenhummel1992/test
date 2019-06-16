/etc/munin/apache24.conf:
  file.append:
    - text: | 
         Alias /munin /var/cache/munin/www
         <Directory /var/cache/munin/www>
         # Require local
         Require all granted
         Options FollowSymLinks SymLinksIfOwnerMatch
         Options None
         </Directory>

         ScriptAlias /munin-cgi/munin-cgi-graph /usr/lib/munin/cgi/munin-cgi-graph
         <Location /munin-cgi/munin-cgi-graph>
         # Require local
         Require all granted
         Options FollowSymLinks SymLinksIfOwnerMatch
         <IfModule mod_fcgid.c>
         SetHandler fcgid-script
         </IfModule>
         <IfModule !mod_fcgid.c>
         SetHandler cgi-script
         </IfModule>
         </Location>
