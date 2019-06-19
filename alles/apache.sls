test-etc-hosts-blockreplace-services:
  file.blockreplace:
    - name: /etc/munin/apache.conf
    - marker_start: "<Directory /var/cache/munin/www"
    - marker_end: "</Location>" 
    - content: |
        #Order allow, deny
        #Allow from localhost 127.0.0.0/8 ::1
        #Options None
        Require all granted
        Options FollowSymLinks SymLinksIfOwnerMatch
        # This file can be used as a .htaccess file, or a part of your apache
        # config file
        # For the .htaccess file option to work the munin www directory
        # (/var/cache/munin/www) must have "AllowOverride all" or something 
        # close to that set.

        <IfModule mod_expires.c>
          ExpiresActive On
          ExpiresDefault M310
        </IfModule>
        </Directory>

        </Directory> 

        # Enables fastcgi for munin-cgi-html if present
        #<Location /munin-cgi>
        #    <IfModule mod_fastcgi.c>
        #        SetHandler fastcgi-script
        #    </IfModule>
        #</Location>

        #<Location /munin-cgi/static>
        #SetHandler None
        #</Location>

        # Enables fastcgi for munin-cgi-graph if present
        ScriptAlias /munin-cgi/munin-cgi-graph /usr/lib/munin/cgi/munin-cgi-graph
        <Location /munin-cgi/munin-cgi-graph>
        #Order allow,deny
        #Allow from localhost 127.0.0.0/8 ::1

        Require all granted
        Options FollowSymLinks SymLinksIfOwnerMatch
        # AuthUserFile /etc/munin/munin-htpasswd
        # AuthName "Munin"
        # AuthType Basic
        # require valid-user
        <IfModule mod_fcgid.c>
            SetHandler fcgid-script
        </IfModule>
        <IfModule !mod_fcgid.c>
        SetHandler cgi-script
        </IfModule>
        </Location>

        ScriptAlias /munin-cgi/munin-cgi-html /usr/lib/munin/cgi/munin-cgi-html
        <Location /munin-cgi/munin-cgi-html>
        #Order allow,deny
        #Allow from localhost 127.0.0.0/8 ::1

        Require all granted
        Options FollowSymLinks SymLinksIfOwnerMatch
        # AuthUserFile /etc/munin/munin-htpasswd
        # AuthName "Munin"
        # AuthType Basic
        # require valid-user
        <IfModule mod_fcgid.c>
            SetHandler fcgid-script
        </IfModule>
        <IfModule !mod_fcgid.c>
            SetHandler cgi-script
        </IfModule>

    - show_changes: True
    - append_if_not_found: True
