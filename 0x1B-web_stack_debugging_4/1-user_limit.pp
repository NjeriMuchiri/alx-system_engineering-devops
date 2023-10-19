# Fixing login whereby user can open a file without error message

exec { 'increase-hard-file-limit-for-holberton-user':
  command => 'sed -i "/holberton hard/s/5/65000/" /etc/security/limits.conf',
  before   => Exec['increase-hard-file-limit-for-holberton-user'],
  path    => '/usr/local/bin/:/bin/'
}

exec { 'increase-soft-file-limit-for-holberton-user':
  command => 'sed -i "/holberton soft/s/4/65000/" /etc/security/limits.conf',
  before   => Exec['increase-soft-file-limit-for-holberton-user'],
  path    => '/usr/local/bin/:/bin/'
}
