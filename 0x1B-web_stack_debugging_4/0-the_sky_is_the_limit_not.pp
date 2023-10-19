#Fix problem of high amount of requests into our server

exec {'fix-nginx-server':
  provider => shell,
  command  => 'sudo sed -i "s/15/4096/" /etc/default/nginx',
  before   => Exec['restart'],
  path     => '/usr/local/bin/:/bin/',
  }

exec {'restart':
  provider => shell,
  command  => 'sudo service nginx restart',
  }
