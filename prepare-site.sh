sh -c 'echo "<VirtualHost *:80>                                        \n\
    ServerAdmin amuino@1uptalent.com                                   \n\
    DocumentRoot /home/ubuntu/production/current/public                \n\
    <Directory /home/ubuntu/production/current/public>                 \n\
        Allow from all                                                 \n\
        Options -MultiViews                                            \n\
    </Directory>                                                       \n\
                                                                       \n\
		# Check for maintenance mode                                       \n\
		<IfModule mod_rewrite.c>                                           \n\
      RewriteEngine On                                                 \n\
      RewriteCond %{DOCUMENT_ROOT}/system/maintenance.html -f          \n\
      RewriteCond %{SCRIPT_FILENAME} !maintenance.html                 \n\
      RewriteCond %{SCRIPT_FILENAME} !^(.+).(gif|png|jpg|css|js|swf)$  \n\
      RewriteRule ^.*$ /system/maintenance.html [L]                    \n\
		</IfModule>                                                        \n\
                                                                       \n\
    ErrorLog /var/log/apache2/production-error.log                     \n\
                                                                       \n\
    # Possible values include: debug, info, notice, warn, error, crit, \n\
    # alert, emerg.                                                    \n\
    LogLevel warn                                                      \n\
                                                                       \n\
    CustomLog /var/log/apache2/production-access.log combined          \n\
</VirtualHost>\n" > /etc/apache2/sites-available/default'

a2ensite default

apt-get -y install imagemagick
