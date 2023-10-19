# Fixing login whereby user can open a file without error message
#Increasing hard file limit for holberton user.

exec { 'increase-hard-file-limit-for-holberton-user':
  command => 'sed -i "/holberton hard/s/5/55000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}

# Increasing soft file limit for Holberton user.
exec { 'increase-soft-file-limit-for-holberton-user':
  command => 'sed -i "/holberton soft/s/4/55000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}
