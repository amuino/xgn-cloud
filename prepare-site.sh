sh -c 'echo "<VirtualHost localhost:80>\n\
   ServerName localhost\n\
   DocumentRoot /home/ubuntu/twimarks/public\n\
   <Directory /home/ubuntu/twimarks/public>\n\
      AllowOverride all\n\
      Options -MultiViews\n\
   </Directory>\n\
</VirtualHost>\n" > /etc/apache2/sites-available/twimarks'

