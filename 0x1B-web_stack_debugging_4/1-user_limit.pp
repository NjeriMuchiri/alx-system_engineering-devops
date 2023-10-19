# Fixing login whereby user can open a file without error message

exec {'replace-2':
  provider => shell,
  command  => 'sudo sed -i "s/holberton hard/5/50000/" /etc/security/limits.conf',
  path     => '/usr/local/bin/:/bin/',
  before   => Exec['replace-2'],
}

exec {'replace-2':
  provider => shell,
  command  => 'sudo sed -i "s/holberton soft/4/50000/" /etc/security/limits.conf',
}
