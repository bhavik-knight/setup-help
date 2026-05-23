sudo service apache2 stop
sudo apt-get remove --purge "^apache2.*" -y
sudo apt-get autoremove -y && sudo apt-get autoclean -y
sudo rm -rf $(whereis apache2)

sudo service mysql stop
sudo apt-get remove --purge "^mysql.*" -y
sudo apt-get autoremove -y && sudo apt-get autoclean -y
sudo rm -rf $(whereis mysql)
sudo rm -rf /var/lib/mysql

sudo apt-get remove --purge "phpmyadmin.*" -y
sudo apt-get autoremove -y && sudo apt-get autoclean -y
sudo rm -rf $(whereis phpmyadmin)



sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get install -f

# sudo apt-get install -y \
#     apache2 \
#     php libapache2-mod-php \
#     php-curl php-gd php-json php-mbstring php-xml php-zip php-cli \
#     mysql-server php-mysql \
#     phpmyadmin
