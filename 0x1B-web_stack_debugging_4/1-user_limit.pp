# Fixing login whereby user can open a file without error message

exec {'replace-2':
  provider => shell,
  command  => 'sudo sed -i "s/nofile 5/nofile 50000/" /etc/security/limits.conf',
  path     => '/usr/local/bin/:/bin/',
  before   => Exec['replace-2'],
}

exec {'replace-2':
  provider => shell,
  command  => 'sudo sed -i "s/nofile 4/nofile 40000/" /etc/security/limits.conf',
  path     => '/usr/local/bin/:/bin/',
}
