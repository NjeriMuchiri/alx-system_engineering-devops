# Fixes 500 error in the wordpress file wp-settngs.php

exec {'replace':
  path     => '/usr/local/bin/:/bin/',
  command  => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php'
}
