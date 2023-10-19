# Fixing login whereby user can open a file without error message

exec { 'adding-hard-file-limit-for-holberton-user':
  command => 'sed -i "/holberton hard/s/5/65000/" /etc/security/limits.conf',
  before   => Exec['adding-hard-file-limit-for-holberton-user'],
  path    => '/usr/local/bin/:/bin/'
}

exec { 'adding-soft-file-limit-for-holberton-user':
  command => 'sed -i "/holberton soft/s/4/65000/" /etc/security/limits.conf',
  before   => Exec['adding-soft-file-limit-for-holberton-user'],
  path    => '/usr/local/bin/:/bin/'
}
