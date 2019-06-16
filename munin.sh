#Voorbereidingen

sudo apt-get install -y apache2 apache2-utils libcgi-fast-perl libapache2-mod-$

#Installeren van munin
sudo apt-get install -y apache2
sudo apt-get install -y munin


#Aanpassen config file

cd /etc/munin

#Toevogen van de juiste directories

echo "dbdir     /var/lib/munin" >> munin.conf
echo "htmldir   /var/cache/munin/www" >> munin.conf
echo "logdir    /var/log/munin" >> munin.conf
echo "rundir    /var/run/munin" >> munin.conf

#Aanpassen van de naam naar MuninMaster
sed -i -e 's/localhost.localdomain/MuninMaster/g' /etc/munin/munin.conf
