# Fixes 500 error in the wordpress file wp-settngs.php

exec {'wordpress-fix':
  command  => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  path     => '/usr/local/bin/:/bin/'
}
