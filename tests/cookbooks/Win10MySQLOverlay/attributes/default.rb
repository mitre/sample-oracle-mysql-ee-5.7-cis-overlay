# Version of MySQL
default['mysql']['version'] = '5.1.73'
default['mysql']['major_version'] = '5.1'

# Location of MySQL installation
default['mysql']['windows']['dir'] = "C:\\MySQL"

# URL for install zip for MySQL 5.1.73
default['mysql']['windows']['url'] = "https://downloads.mysql.com/archives/get/p/23/file/mysql-noinstall-5.1.73-winx64.zip"

# Server Root Password
default['mysql']['server_root_password'] = 'vagrantpassword'

# MySQL Port
default['mysql']['port'] = '3306'

# MySQL Instance Configuration
default['mysql']['windows']['ServerType'] = 'SERVER' # accepted values {DEVELOPMENT | SERVER | DEDICATED}
default['mysql']['windows']['DatabaseType'] = 'MYISAM' # accepted values {MIXED | INNODB | MYISAM}
default['mysql']['windows']['ConnectionUsage'] = 'DSS' # accepted values {DSS | OLTP}

