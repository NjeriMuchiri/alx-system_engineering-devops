# Fixes 500 error in the wordpress file wp-settngs.php

exec {'wordpress-fix':
  provider => shell,
  command  => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php'
}
