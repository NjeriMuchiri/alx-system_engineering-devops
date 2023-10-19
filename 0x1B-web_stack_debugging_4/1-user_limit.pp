# Fixing login whereby user can open a file without error message

exec {'replace-2':
  provider => shell,
  command  => 'sudo sed -i "s/nofile hard/5/50000/" /etc/security/limits.conf',
  path     => '/usr/local/bin/:/bin/',
}

exec {'replace-2':
  provider => shell,
  command  => 'sudo sed -i "s/nofile soft/4/50000/" /etc/security/limits.conf',
}
