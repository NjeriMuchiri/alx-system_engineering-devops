#this installs nginx servers

exec { 'install':
    provider => shell,
    command => 'sudo apt-get -y update;
                sudo apt-get -y install nginx;
                echo "Hello World! | "
                sudo service nginx start'
    }