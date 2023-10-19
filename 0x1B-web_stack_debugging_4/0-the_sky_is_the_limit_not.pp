#Fix problem of high amount of requests into our server

exec {'replace':
  provider => shell,
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  before   => Exac['restart'],
  }

exec {'restart':
  provider => shell,
  command  => 'sudo service nginx restart',
  }
